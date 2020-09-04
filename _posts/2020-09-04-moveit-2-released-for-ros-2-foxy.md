---
layout: post
author: Henning Kayser, MoveIt 2 Development Lead
comments: false
date: 2020-09-04 00:00:00 -0600
title: MoveIt 2 is out of Beta!
media_type: image
media_link: "/assets/images/blog_posts/2020-09-04-move-it-foxy-1-a.png"
description: ''
categories:
- ros2
- foxy release
- moveit2

---
We are proud to announce the first non-beta release of MoveIt 2, for ROS 2 Foxy Fitzroy. _MoveIt 2 Foxy_ is a major milestone for the MoveIt project as we are now feature complete with MoveIt 1. We believe this achievement will enable the next generation of complex dexterous manipulation applications, beyond the impact it has already had over the past 10 years.

The focus of MoveIt 2 is on realtime performance, particularly provided by ROS 2's native realtime support via DDS. The latest feature on this front is _MoveIt Servo_ a closed-loop, Jacobian-based planner that can avoid collision objects in realtime. The latest version of Servo (previously _Jog Arm)_ uses ROS 2 composable nodes and greatly improved test coverage: see [the MoveIt Servo tutorials](https://github.com/ros-planning/moveit2/blob/main/moveit_ros/moveit_servo/doc/running_the_demos.md).

![Alt Text](https://github.com/AdamPettinger/moveit2/raw/gsoc-final_work/moveit_ros/moveit_servo/doc/Images/Servo_Teleop_Demo.gif)

## **Release Notes**

We have ported the following MoveIt 1 packages to ROS 2:

* moveit_ros_planning
* moveit_ros_benchmarks
* moveit_ros_move_group
* moveit_ros_planning_interface
* moveit_ros_robot_interaction
* moveit_ros_visualization
* moveit_ros_occoupancy_map_monitor
* moveit_ros_servo
* moveit_core
* moveit_kinematics
* moveit_planners_ompl
* moveit_fake_controller_manager
* moveit_simple_controller_manager
* moveit_msgs
* geometric_shapes
* srdfdom
* random_numbers

The following packages are still remaining to be ported:

* moveit_ros_perception
* moveit_ros_warehouse
* moveit_collision_detection_bullet
* moveit_planners_trajopt
* moveit_setup_assistant

The following packages have been deprecated from ROS 1 for various reasons:

* moveit_ros_manipulation
* moveit_experimental
* moveit_planners_sbpl
* moveit_planners_chomp
* moveit_robot_interface
* moveit_ros_control_interface
* moveit_controller_manager_example

One other note: in response to the ROS community's [migration away from using a 'master' branch](https://github.com/ros-planning/moveit/issues/2213) in favor of 'main', MoveIt 2 has now adopted our primary development branch being named 'main' as well.

## **Multi-Platform Support**

![Ubuntu 10.10 Vs Windows 7 Vs Mac OS X 10.6 (Snow Leopard)](https://cdn1.expertreviews.co.uk/sites/expertreviews/files/styles/er_main_wide/public/images/dir_286/er_photo_143431.png?itok=9eFGmRN1)

We are also happy to report that MoveIt 2 now builds on [Microsoft Windows](https://github.com/ros-planning/moveit2/pull/238) (thanks to contributions from the Microsoft Edge Robotics Team) and [macOS](https://github.com/ros-planning/moveit2/pull/271) (thanks to Mark Moll), in addition to many Linux variants.

## **Getting Started**

To jump in, we have prepared several example applications and launch configurations for testing [MoveItCpp](https://github.com/ros-planning/moveit2/tree/main/moveit_demo_nodes/run_moveit_cpp), [MoveGroup](https://github.com/ros-planning/moveit2/tree/main/moveit_demo_nodes/run_move_group) and [MoveIt Servo](https://github.com/ros-planning/moveit2/blob/main/moveit_ros/moveit_servo/doc/running_the_demos.md). Full tutorials are yet to be ported from MoveIt 1, but due to their similarity are still largely applicable. We know it takes forever to get things running if you are new to ROS2, so we’ve prepared an LXD container that provides you with a precompiled MoveIt 2 workspace that allows you to run all demos right away Check out [these instructions](https://docs.google.com/document/d/15TJ8U9vk6NBaOUkObfPLFdjzut-JsJsb__H-0mbethE/edit?usp=sharing).

## **Thanks**

Sponsoring organization PickNik Robotics has led this effort, in collaboration with Intel, Open Robotics, SwRI, and students from Google Summer of Code. In addition, grant funding has been provided by the ROSin project, part of EU Horizons 2020.

We at PickNik Robotics hope many benefit from MoveIt 2 and encourage everyone to contribute to its adoption and continued improvement. We would like to thank all of the MoveIt community members and contributors who have made this release a success, and welcome all to [get involved](https://moveit.ros.org/about/get_involved/) with the project.

![Home – ROSIN](https://www.rosin-project.eu/wp-content/uploads/2017/03/Logo_ROSIN_CMYK-Website.png)

The port to ROS 2 is supported by ROSIN - ROS-Industrial Quality-Assured Robot Software Components. More information: [rosin-project.eu](http://rosin-project.eu/)

![Flag of Europe - Wikipedia](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/255px-Flag_of_Europe.svg.png)

This project has received funding from the European Union’s Horizon 2020 research and innovation programme under grant agreement no. 732287.