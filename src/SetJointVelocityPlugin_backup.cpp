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
      double Rad2Deg = 180/M_PI;
      double rotor1_deg = 0;
      double rotor2_deg = 0;
      double rotor3_deg = 0;
      double rotor4_deg = 0;

      std::string namespace_;

    //public: SetJointVelocityPlugin() :
    //  nh_("uuav_rotate")
    //{
    //}

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
        //this->updateConnection = event::Events::ConnectWorldUpdateBegin(
        //std::bind(&SetJointVelocityPlugin::Update, this, std::placeholders::_1));
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
        double vel = 1.0;
        ROS_INFO_STREAM("lalalila: " << req.degree);
        //int pos = this->model->GetJoint("right_front_joint")->Position();
        //ROS_INFO_STREAM("the position of the joint: " << this->model->GetJoint("right_front_joint")->Position());
        ROS_INFO_STREAM("lala:" << (this->model->GetJoint("right_front_joint")->Position() * Rad2Deg - req.degree));
        while(1) //(abs(this->model->GetJoint("right_front_joint")->Position() - req.degree)) >= 0.05
        {
          rotor1_deg = abs(req.degree - this->model->GetJoint("right_front_joint")->Position() * Rad2Deg);
          rotor2_deg = abs(req.degree - this->model->GetJoint("right_back_joint")->Position() * Rad2Deg);
          rotor3_deg = abs(req.degree - this->model->GetJoint("left_front_joint")->Position() * Rad2Deg);
          rotor4_deg = abs(req.degree - this->model->GetJoint("left_back_joint")->Position() * Rad2Deg);
          
          while(rotor1_deg >= 300.0)
            rotor1_deg = rotor1_deg - 360;
          
          while(rotor2_deg >= 300.0)
            rotor2_deg = rotor2_deg - 360;
          
          while(rotor3_deg >= 300.0)
            rotor3_deg = rotor3_deg - 360;
          
          while(rotor4_deg >= 300.0)
            rotor4_deg = rotor4_deg - 360;

          //ROS_INFO_STREAM("rotor1:" << this->model->GetJoint("right_front_joint")->Position()*Rad2Deg);
          //ROS_INFO_STREAM("rotor2:" << this->model->GetJoint("right_back_joint")->Position()*Rad2Deg);
          //ROS_INFO_STREAM("rotor3:" << this->model->GetJoint("left_front_joint")->Position()*Rad2Deg);
          //ROS_INFO_STREAM("rotor4:" << this->model->GetJoint("left_back_joint")->Position()*Rad2Deg);
          //ROS_INFO_STREAM("desired_degree:" << req.degree);

          /*
          if(rotor1_deg > 15 && rotor2_deg > 15 && rotor3_deg > 15 && rotor4_deg > 15)
          {
            vel = 1.0;
          }
          else if(rotor1_deg <= 8 || rotor2_deg <= 8 || rotor3_deg <= 8 || rotor4_deg <= 8)
          {
            vel = 0.06;
          }
          this->model->GetJoint("right_front_joint")->SetParam("vel", 0, -vel); 
          this->model->GetJoint("right_back_joint")->SetParam("vel", 0, +vel); 
          this->model->GetJoint("left_front_joint")->SetParam("vel", 0, -vel); 
          this->model->GetJoint("left_back_joint")->SetParam("vel", 0, +vel); 
          
          if(rotor1_deg <= 0.2 || rotor2_deg <= 0.2 || rotor3_deg <= 0.2 || rotor4_deg <= 0.2)
          {
          this->model->GetJoint("right_front_joint")->SetParam("vel",0, 0); 
          this->model->GetJoint("right_back_joint")->SetParam("vel", 0, 0); 
          this->model->GetJoint("left_front_joint")->SetParam("vel", 0, 0); 
          this->model->GetJoint("left_back_joint")->SetParam("vel", 0, 0); 
            break;
          }
          */
          //if(rotor1_deg > 15 && rotor2_deg > 15 && rotor3_deg > 15 && rotor4_deg > 15)
          //{
           // vel = 1.0;
           // this->model->GetJoint("right_front_joint")->SetParam("vel", 0, -vel); 
           // this->model->GetJoint("right_back_joint")->SetParam("vel", 0, +vel); 
           // this->model->GetJoint("left_front_joint")->SetParam("vel", 0, -vel); 
           // this->model->GetJoint("left_back_joint")->SetParam("vel", 0, +vel); 
          //}
          //else if(rotor1_deg <= 8 || rotor2_deg <= 8 || rotor3_deg <= 8 || rotor4_deg <= 8)
          //{
            vel = this->model->GetJoint("right_front_joint")->Position() * Rad2Deg - req.degree;
            this->model->GetJoint("right_front_joint")->SetParam("vel", 0, -0.01 * vel); 

            vel = this->model->GetJoint("right_back_joint")->Position() * Rad2Deg - req.degree;
            this->model->GetJoint("right_back_joint")->SetParam("vel", 0, -0.01 * vel); 
            
            vel = this->model->GetJoint("left_front_joint")->Position() * Rad2Deg - req.degree;
            this->model->GetJoint("left_front_joint")->SetParam("vel", 0, -0.01 * vel); 
            
            vel = this->model->GetJoint("left_back_joint")->Position() * Rad2Deg - req.degree;
            this->model->GetJoint("left_back_joint")->SetParam("vel", 0, -0.01 * vel); 
          //}
        }
        /*
        this->model->GetJoint("right_front_joint")->SetPosition(0,req.degree);   //this will generate infinite force
        this->model->GetJoint("right_back_joint")->SetPosition(0,req.degree);
        this->model->GetJoint("left_front_joint")->SetPosition(0,req.degree);
        this->model->GetJoint("left_back_joint")->SetPosition(0,req.degree);
        */
        return true;

    }
    
    //public: virtual void quit(int sig)
    //{
    //  ros::shutdown();
    //}
    
    

/*

    public: void Update(const common::UpdateInfo &_info)
      {
        if (update_num == 0)
        {
          // Joint velocity instantaneously without applying forces
          //this->model->GetJoint("right_up_joint")->SetVelocity(0, 1.0);

          // Joint velocity using joint motors
          this->model->GetJoint("right_front_joint")->SetParam("fmax", 0, 100.0);
          this->model->GetJoint("right_front_joint")->SetParam("vel", 0, -1.0);
          this->model->GetJoint("right_back_joint")->SetParam("fmax", 0, 100.0);
          this->model->GetJoint("right_back_joint")->SetParam("vel", 0, 1.0);
          this->model->GetJoint("left_front_joint")->SetParam("fmax", 0, 100.0);
          this->model->GetJoint("left_front_joint")->SetParam("vel", 0, -1.0);
          this->model->GetJoint("left_back_joint")->SetParam("fmax", 0, 100.0);
          this->model->GetJoint("left_back_joint")->SetParam("vel", 0, 1.0);
          // Joint velocity using PID controller
          this->jointController.reset(new physics::JointController(
                this->model));
          this->jointController->AddJoint(model->GetJoint("purple_joint"));
          std::string name = model->GetJoint("purple_joint")->GetScopedName();
          this->jointController->SetVelocityPID(name, common::PID(100, 0, 0));
          this->jointController->SetVelocityTarget(name, 1.0);
        }
        else if (update_num < 200)
        {
          // Must update PID controllers so they apply forces
          this->jointController->Update();
        }
        else if (update_num == 400)
        {
          // Joint motors are disabled by setting max force to zero
          this->model->GetJoint("left_up_joint")->SetParam("vel", 0, 0.0);
        }
        update_num++;
      }
*/
    /// \brief a pointer to the model this plugin was loaded by
    public: physics::ModelPtr model;
    /// \brief object for callback connection
    public: event::ConnectionPtr updateConnection;
    /// \brief number of updates received
    public: int update_num = 0;
  };

  GZ_REGISTER_MODEL_PLUGIN(SetJointVelocityPlugin)
}
