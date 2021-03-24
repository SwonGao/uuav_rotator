cmake_minimum_required(VERSION 2.6)
project(setvelplugin)


find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  sensor_msgs
  geometry_msgs
  tf
  message_generation
)
find_package(gazebo REQUIRED)
include_directories(include ${catkin_INCLUDE_DIRS} ${PCL_INCLUDE_DIRS} ${GAZEBO_INCLUDE_DIRS})
link_directories(${GAZEBO_LIBRARY_DIRS})
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GAZEBO_CXX_FLAGS}")

add_service_files(
  FILES
  rotate.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
)
catkin_package(CATKIN_DEPENDS message_runtime)


add_library(SetJointVelocityPlugin SHARED src/SetJointVelocityPlugin.cpp)
target_link_libraries(SetJointVelocityPlugin ${GAZEBO_LIBRARIES})

