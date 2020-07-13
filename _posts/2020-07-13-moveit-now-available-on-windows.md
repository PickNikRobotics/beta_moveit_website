---
layout: post
author: Dave Coleman, PhD
comments: false
date: 2020-07-13 00:00:00 -0600
title: MoveIt now available on Windows
media_type: image
media_link: "/assets/images/blog_posts/2020-07-13-ros-windows.png"
description: Thanks to recent work by Microsoft's Windows IoT team, in collaboration
  with PickNik Robotics, preliminary support for Windows 10 IoT is now available for
  MoveIt 1.
categories:
- ROS
- MoveIt
- Windows
- Microsoft

---
## **Program your robotic arms while avoiding Linux entirely.**

One of the original objectives of the Robot Operating System middleware is to provide a cross platform and cross language communication standard for various brands of robot hardware and software. While ROS has done a tremendous job of improving collaboration between robotics researchers and connecting various manufacturers of sensors and actuators, support for multiple operating systems has been a much more difficult journey.

Because of the overhead of supporting Linux, Windows, and macOS for open source volunteers, development of ROS has primarily been on Ubuntu Linux. This makes sense given Linux's free, open source nature and ubiquity in running the world's cloud infrastructure. However, many end user developers and roboticists prefer to run Windows or macOS on their desktops and laptops.

Thanks to recent work by [Sean Yen](https://github.com/seanyen) and [Lior Lustgarten](https://github.com/lilustga), in collaboration with PickNik Robotics, preliminary support for [Microsoft Windows 10 IoT](https://www.microsoft.com/en-us/WindowsForBusiness/windows-iot) is now available for MoveIt 1. The Windows IoT team at Microsoft has been [leading the way to supporting all of ROS for Windows](https://www.therobotreport.com/ros-for-windows-microsoft-robotics/), continuing Microsoft's new commitment to open source communities.

Future work includes hardening the MoveIt 1 build for Windows by having more users test and help improve the software. Beyond that, we look forward to adding Windows support for MoveIt 2, built on ROS 2. This should be easier given that ROS 2 has been built from the ground up to support all three major operating systems, being careful not to overly optimize design decisions for Ubuntu as happened in ROS 1.

Currently binary and source install instructions for Windows 10 IoT are now available on the [MoveIt website install page](https://moveit.ros.org/install/). The binary installation leverages the Chocolatey package manager, and the source install leverages ROS's catkin build tool.

## **Useful Links**

* [MoveIt Binary Install Instructions for Windows](https://moveit.ros.org/install/)
* [MoveIt Source Build Instructions for Windows](https://moveit.ros.org/install/source-windows/)
* [ROS Build Instructions for Windows](http://wiki.ros.org/Installation/Windows)