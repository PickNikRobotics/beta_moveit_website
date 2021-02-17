---
date: 2021-02-09 00:00:00 -0700
layout: post
author: Dr. Dave Coleman
comments: false
title: PickNik teams up with Universal Robots to create the official ROS2 driver
media_type: image
media_link: "/assets/images/blog_posts/2021-02-09-ur-arms.jpg"
description: PickNik, UR, and FZI work together to develop the first official ROS 2 drivers for the UR e-series of robots.
categories:
- ROS2
- MoveIt2
- ROS2_control

---
PickNik is proud to announce it is collaborating with [Universal Robots](https://www.universal-robots.com/) and [FZI](https://www.fzi.de/en/home/) in developing the official ROS 2 driver for the UR series of robots. Universal Robotics is highly regarded as the manufacturer of the first commercially viable collaborative robot and the largest by market share. Universal Robots are also very popular in the ROS community as their UR3e, UR5e, UR10e and UR16e series are well known for a friendly, intuitive user interface and flexible control modalities.

PickNik is pursuing the development of the UR ROS 2 driver as a test platform for [ros2_control](https://github.com/ros-controls/ros2_control), the popular control framework in ROS that is in the final stages of porting to ROS 2. PickNik is also leveraging their in-house UR5s to further test and integrate the motion planning framework [MoveIt](https://moveit.ros.org/) to ROS 2. As a member of the [ROS 2 Technical Steering Committee](https://index.ros.org/doc/ros2/Governance/), PickNik is hoping these hardware demos with MoveIt 2, ROS 2, and UR robots will speed up the transition to the more industrial and hardened ROS 2 middleware.

The new driver is based on the original [Universal_Robots_ROS_Driver](https://github.com/UniversalRobots/Universal_Robots_ROS_Driver) for ROS 1 and will be fairly similar. However, it will take advantage of new ROS 2 features including component nodes and zero-memory copy integration with ros_control. From a performance perspective, the major benefit is decreased latency. The [new ROS package is currently only in alpha](https://github.com/PickNikRobotics/Universal_Robots_ROS2_Driver/tree/develop) and provides config files for just the UR5e. We encourage the open source community to start submitting patches and bug reports as needed. Launch and config files for the other models and additional functionality such as end-effector I/O and force/torque data streaming will be coming soon!
