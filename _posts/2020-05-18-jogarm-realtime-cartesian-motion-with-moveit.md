---
layout: post
author: 'Andy Zelenak, PhD, Controls Engineer '
comments: false
date: 2020-05-18 00:00:00 -0600
title: 'JogArm: Realtime Cartesian Motion with MoveIt'
media_type: video
media_link: ''
description: A MoveIt controller that plans Cartesian motions in realtime, ideal for
  visual servoing and teleoperation.
categories:
- control
- realtime
- moveit

---
There are many types of motion control for arms, and MoveIt has traditionally excelled at more complex global motion planning tasks. However a missing feature in MoveIt has been reactive control - until now. The Jog Arm package is a lightweight controller that plans Cartesian motions very fast. It is ideal for visual servoing, compliance, and teleoperation applications that typically require a robot velocity to be adjusted at frequencies of hundreds of Hertz or more. Control of humanoid robots is even more demanding, with some modern humanoids requiring control loops to execute in the thousands of Hertz range.

ROS1 users are probably familiar with the plan/execute functionality of MoveIt. While the motion planning action server is great, it isn’t fast enough for tasks that require a realtime control loop. While the control loop of MoveIt global planners are typically at several hertz, the inner control loop of jog_arm is capable of operating at 10,000 Hz or more. At PickNik we have been using it in a speed-critical visual servoing application for the past few months. It was a great opportunity to harden the package and contribute a few other improvements.

We realize people want to use the package in many different ways and on different hardware platforms. To be more flexible, the following features are easily configurable:

* Compatibility with velocity and position ros_controllers.
* Optional collision detection
* Examples of usage with common user input devices (XBox controllers, joysticks, etc)
* A low-pass filter, to smooth outgoing commands to varying degrees
* Singularity avoidance
* Redundancy resolution

The ROS1 version of the package uses multithreading to make fast realtime control possible, and safe, with ROS1 messages. ROS2 is inherently more well-suited to fast control rates, and an upcoming Google Summer of Code project aims to port the package to ROS2. A few more upgrades are targeted for the ROS2 port as well, including:

* More extensive unit testing
* Support for parallel-chain manipulators
* More options for singularity avoidance

The work originates as part of Andy Zelenak's Post-Doc research at UTA's Nuclear Robotics Group.

To get started in ROS1 now, a tutorial is [available in the MoveIt Tutorials](https://ros-planning.github.io/moveit_tutorials/doc/arm_jogging/arm_jogging_tutorial.html).