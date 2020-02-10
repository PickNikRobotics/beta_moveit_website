---
author: RobColeman
comments: false
date: 2019-05-31
layout: post
title: Announcing MoveIt 2 Alpha Release
media_type: image
media_link: /assets/images/blog_posts/2019_05_31_moveit2_alpha.jpg
description: The ROS 2 port MoveIt2's Alpha is here with the help of Acutronic Robotics in collaboration with PickNik
categories:
- MoveIt
- ROS
---

**Status of the port to ROS 2**

We're happy to see there has been a lot progress made in creating MoveIt 2 since the project began in February. Acutronic Robotics dedicated a large engineering effort in collaboration with PickNik Robotics and the MoveIt maintainers to make this possible.

The goal of this effort was to move fast in creating a <i>minimum viable product</i> port. This MVP is not to be mistaken for a complete port and much of the work has yet to get merged upstream to the ros-planning organization. At the time of writing, the MoveIt 2 Alpha release is capable of planning simple joint-space problems.

<iframe width="560" height="315" src="https://www.youtube.com/embed/XKz6BIlM-E8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Motivated by this progress and to align with the release of ROS 2 Dashing Diademata, Acutronic Robotics is proud to announce the alpha release of MoveIt 2.

**MoveIt 2 Alpha Release**

This release delivers the following
* ROS 2 distro: Dashing Diademata
* OS support: Ubuntu 18.04 and Mac OS X 10.14 (<a href="https://github.com/AcutronicRobotics/moveit2/issues/80" target="_blank">minor OS X issues</a> remain)
* <a href="https://github.com/acutronicrobotics/moveit2#install-and-test-moveit-2" target="_blank">Preliminary instructions</a> on how to install and test Acutronic's work by source
* <a href="https://github.com/acutronicrobotics/moveit_ci" target="_blank">CI infrastructure</a> for MoveIt 2 and ROS 2
* Capability to plan to joint-space goals

**ROS Packages Ported**

Acutronic Robotics has put significant resources into porting the following packages into their fork.  These changes will be making their way through code review to be merged upstream as part of this release:

**MoveIt 2 Packages:**

* moveit_core
* moveit_fake_controller_manager
* moveit_planners_ompl
* moveit_resources
* moveit_ros_perception
* moveit_ros_planning
* moveit_msgs
* moveit_resources

**External Dependencies**

* <a href="https://github.com/AcutronicRobotics/geometry2/tree/master" target="_blank">geometry2</a>
* <a href="https://github.com/AcutronicRobotics/geometric_shapes/tree/ros2" target="_blank">geometric_shapes</a>
* <a href="https://github.com/AcutronicRobotics/eigen_stl_containers/tree/ros2" target="_blank">eigen_stl_containers</a>
* <a href="https://github.com/AcutronicRobotics/object_recognition_msgs/tree/master" target="_blank">object_recognition_msgs</a>
* <a href="https://github.com/AcutronicRobotics/octomap_msgs/tree/ros2" target="_blank">octomap_msgs</a>
* <a href="https://github.com/AcutronicRobotics/random_numbers/tree/ros2" target="_blank">random_numbers</a>
* <a href="https://github.com/AcutronicRobotics/srdfdom/tree/ros2" target="_blank">srdfdom</a>
* <a href="https://github.com/AcutronicRobotics/urdf_parser_py/tree/ros2" target="_blank">urdf_parser_py</a>
* <a href="https://github.com/AcutronicRobotics/octomap/tree/ros2" target="_blank">octomap</a>

**Known Issues**

At the time of writing, the following known issues have been identified and apply to the ROS 2 target distro (Dashing Diademata) creating conflicts with this release:

* ROS 2 actions not compiling in OpenSplice [<a href="https://github.com/ros2/rosidl_typesupport_opensplice/issues/30" target="_blank">1</a>] [<a href="https://github.com/ADLINK-IST/opensplice/issues/92" target="_blank">2</a>]
* <a href="https://github.com/docker/for-mac/issues/3350" target="_blank">Docker port mapping issue</a> affects the launch of the demonstrator from the Docker image.
* <a href="https://github.com/ros2/rviz/issues/385" target="_blank">Issues with rviz2 in OS X</a>
* Issues with Qt5 in OS X
