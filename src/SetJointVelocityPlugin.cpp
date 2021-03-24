/*
 * Copyright (C) 2017 Open Source Robotics Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
*/
#include "ros/ros.h"
#include "math.h"
#include <gazebo/gazebo.hh>
#include <gazebo/physics/Joint.hh>
//#include <gazebo/physics/JointController.hh>
#include <gazebo/physics/Model.hh>
#include <gazebo/physics/PhysicsTypes.hh>
#include <setvelplugin/rotate.h>
#include <setvelplugin/rotateRequest.h>
#include <setvelplugin/rotateResponse.h>
namespace gazebo
{
  //////////////////////////////////////////////////
  /// \brief Sets velocity on a link or joint
  class SetJointVelocityPlugin : public ModelPlugin
  {
    public: 
      //physics::JointControllerPtr jointController;
      ros::NodeHandle nh_;
      //transport::NodePtr nh_;
      ros::ServiceServer uuav_rotate_service_;
      ros::Timer uuav_rotate_timer;
      double Rad2Deg = 180/M_PI;
      double rotor1_deg = 0;
      double rotor2_deg = 0;
      double rotor3_deg = 0;
      double rotor4_deg = 0;

      std::string namespace_;
      setvelplugin::rotate::Request Req;
    public: SetJointVelocityPlugin() :
      nh_("uuav_rotate")
    {
    }

    // Destructor
    public: ~SetJointVelocityPlugin()
    {
    }

    public: virtual void Load(physics::ModelPtr _model, sdf::ElementPtr _sdf)
      {
        //ros::init();
        if (!ros::isInitialized())
        {
          ROS_FATAL_STREAM("A ROS node for Gazebo has not been initialized, unable to load plugin. "
            << "Load the Gazebo system plugin 'libgazebo_ros_api_plugin.so' in the gazebo_ros package)");
          return;
        }
        //signal(SIGINT, quit);
        this->model = _model;
        this->updateConnection = event::Events::ConnectWorldUpdateBegin(
        std::bind(&SetJointVelocityPlugin::Update, this, std::placeholders::_1));
        Req.degree = 0.0;
        this->uuav_rotate_service_ = this->nh_.advertiseService("rotate", &SetJointVelocityPlugin::uuav_rotate_callback, this);
        //this->uuav_rotate_degree_sub_ = this->nh_.subscribe;

        this->model->GetJoint("right_front_joint")->SetParam("fmax", 0, 100.0);
        this->model->GetJoint("right_back_joint")->SetParam("fmax", 0, 100.0);
        this->model->GetJoint("left_front_joint")->SetParam("fmax", 0, 100.0);
        this->model->GetJoint("left_back_joint")->SetParam("fmax", 0, 100.0);
        ROS_INFO("uuav_rotate node initialized.");
      }

    public: bool uuav_rotate_callback(setvelplugin::rotate::Request &req, setvelplugin::rotate::Response &res)
    {
      Req.degree = req.degree;
      //int pos = this->model->GetJoint("right_front_joint")->Position();
      //ROS_INFO_STREAM("the position of the joint: " << this->model->GetJoint("right_front_joint")->Position());
      return true; 
    }


    public: void Update(const common::UpdateInfo &_info)
      {
        //ROS_INFO_STREAM("lalalila: " << Req.degree);

        double vel = 0.0;

        vel = this->model->GetJoint("right_front_joint")->Position() * Rad2Deg - Req.degree;
        this->model->GetJoint("right_front_joint")->SetParam("vel", 0, -0.01 * vel); 

        vel = this->model->GetJoint("right_back_joint")->Position() * Rad2Deg - Req.degree;
        this->model->GetJoint("right_back_joint")->SetParam("vel", 0, -0.01 * vel); 
        
        vel = this->model->GetJoint("left_front_joint")->Position() * Rad2Deg - Req.degree;
        this->model->GetJoint("left_front_joint")->SetParam("vel", 0, -0.01 * vel); 
        
        vel = this->model->GetJoint("left_back_joint")->Position() * Rad2Deg - Req.degree;
        this->model->GetJoint("left_back_joint")->SetParam("vel", 0, -0.01 * vel); 
      }


    /// \brief a pointer to the model this plugin was loaded by
    public: physics::ModelPtr model;
    /// \brief object for callback connection
    public: event::ConnectionPtr updateConnection;
    /// \brief number of updates received
    public: int update_num = 0;
  };

  GZ_REGISTER_MODEL_PLUGIN(SetJointVelocityPlugin)
}
