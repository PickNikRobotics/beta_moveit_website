---
author: henningkayser
comments: false
date: 2019-03-08
layout: post
title: Announcing MoveIt 1.0 and a Master Branch
media_type: image
media_link: /assets/images/moveit_1_release.png
redirect_from:
  - /moveit!/ros/2019/03/08/announcing-the-moveit-1-release.html
description: MoveIt has been in beta since 2013 (6 years), but today we're excited to announce MoveIt is all grown up. We are releasing MoveIt 1.0 for ROS Melodic.
categories:
- MoveIt
- ROS
---

MoveIt has been in beta since 2013 (6 years), but today we're excited to announce MoveIt is all grown up.
We are releasing MoveIt 1.0 for ROS Melodic.

What does this mean for you? The MoveIt maintainer team is moving towards clearer release schedules with better understood API breakage rational.
Notably, we are now doing all our development in a master branch rather than the melodic-devel branch, etc.
This will allow us to add exciting new features, even if it means we have to break API in certain areas and refactor the code to support new motion planning paradigms.
See Dave Coleman's <a href="https://discourse.ros.org/t/open-letter-to-moveit-community/6779" target="_blank">Open Letter To MoveIt Community</a> for more reasoning.

It also allows us to break ground on MoveIt 2.0, which will provide support for the exciting ROS 2.0 framework.
The port of MoveIt to ROS 2 has already begun, as described in <a href="https://moveit.ros.org/moveit!/ros/2019/03/01/announcing-the-moveit-2-port.html" target="_blank">this recent blog post</a>.
For a full roadmap of MoveIt versioning, see the <a href="https://discourse.ros.org/t/versioning-roadmap-moveit-1-0-release-plan/7437" target="_blank">MoveIt 1.0 release plan</a>.

**What's New In MoveIt 1.0?**

There have been lots of new features being added to MoveIt the past year that we're really excited about.
Beyond features, a ton of code cleanup has occurred (clang-tidy, catkin lint) and we have a lot more code coverage.
For more info, see <a href="https://github.com/ros-planning/moveit/blob/master/MIGRATION.md" target="_blank">Migration Notes</a>.

Highlights of changes:

* <a href="https://github.com/ros-planning/moveit/pull/1321" target="_blank">KDL Inverse Kinematic speedups</a>
* <a href="https://github.com/ros-planning/moveit/pull/1051" target="_blank">Improved support for Gazebo</a>
* <a href="https://github.com/ros-planning/moveit/pull/994" target="_blank">Improved integration with ROS Control</a>
* <a href="https://github.com/ros-planning/moveit/pull/1012" target="_blank">CHOMP planning adapter for optimizing result of other planners</a>
* <a href="https://github.com/ros-planning/moveit/pull/869" target="_blank">Interpolation and motion validation consistency with OMPL</a>
* <a href="https://github.com/ros-planning/moveit/pull/1293" target="_blank">Improved quality of Cartesian paths</a>
* <a href="https://github.com/ros-planning/moveit/pull/1253" target="_blank">Tool to generate constraint approximation databases</a>
* <a href="https://github.com/ros-planning/moveit/pull/1298" target="_blank">Improved iterative spline parameterization</a>
* <a href="https://github.com/ros-planning/moveit/pull/1320" target="_blank">IKFast</a> and <a href="https://github.com/ros-planning/moveit/pull/1318" target="_blank">LMA IK</a> improvements
* <a href="https://github.com/ros-planning/moveit/pull/1316" target="_blank">FCL shape cache thread-local for speedup</a>
* <a href="https://github.com/ros-planning/moveit/pull/853" target="_blank">Iterative cubic spline algorithm</a>
* <a href="https://github.com/ros-planning/moveit/pull/992" target="_blank">Improved benchmarking</a>
* <a href="https://github.com/ros-planning/moveit/pull/1096" target="_blank">Computation speedups with Eigen::Isometry3d</a>
* <a href="https://github.com/ros-planning/moveit/pull/830" target="_blank">Migration to TF2</a>
* <a href="https://github.com/ros-planning/moveit/pull/1054" target="_blank">Improved Python 3 support</a>
* <a href="https://github.com/ros-planning/moveit/pull/805" target="_blank">Constrained Cartesian planning using moveit commander</a>
* <a href="https://github.com/ros-planning/moveit/pull/1347" target="_blank">Allow multiple eefs per planning group</a>
* <a href="https://github.com/ros-planning/moveit/pull/1156" target="_blank">Support for fcl 0.6</a>
* <a href="https://github.com/ros-planning/moveit/pull/1238" target="_blank">CartesianPath planning check box</a>
* <a href="https://github.com/ros-planning/moveit/pull/1198" target="_blank">Improved Rviz motion planning plugin</a>
* <a href="https://github.com/ros-planning/moveit/pull/835" target="_blank">Add namespace capabilities to moveit_commander</a>
* <a href="https://github.com/ros-planning/moveit/pull/1239" target="_blank">Command line utility tool to print planning scene info</a>
* <a href="https://github.com/ros-planning/moveit/pull/1254" target="_blank">Remove TinyXML-based API</a>
* <a href="https://github.com/ros-planning/moveit/pull/1099" target="_blank">Added locale support</a>

**Thanks to all our contributors!**

MoveIt is a vibrant open source community with a rapidly improving codebase.
Our <a href="https://moveit.ros.org/about/" target="_blank">maintainer team</a> is awesome, particularly Robert Haschke and Michael Görner, both hailing from Germany.

We've had 158 contributors to date that have made MoveIt 1.0 possible.
We've come a long way from the early days of MoveIt at Willow Garage.
MoveIt is now a huge international effort with contributors from research labs and companies around the world.
See our <a href="https://moveit.ros.org/moveit!/ros/2017/06/20/videoMontage2017.html" target="_blank">2017 montage</a> for some of the impressive applications using MoveIt.

Under [PickNik Robotics](https://picknik.ai/)'s guidance, we're encouraging more people to get involved --  including you!
Our third year of <a href="https://moveit.ros.org/moveit!/ros/2018/11/20/wordlmoveitdayreport3.html" target="_blank">World MoveIt Day</a> had approximately 310 participants from 13 locations around the globe.
Together with Open Robotics, PickNik sponsored three Google Summer of Code students to <a href="https://moveit.ros.org/moveit!/ros/2018/05/08/google-summer-of-code.html" target="_blank">work on MoveIt</a> last summer.
We've also put in a ton of effort making MoveIt easier to use, from the <a href="https://moveit.ros.org/moveit!/ros/2018/10/23/gsoc-2018-setup-assistant-v2.html" target="_blank">MoveIt Setup Assistant 2.0</a> to <a href="https://github.com/ros-planning/moveit_tutorials/pull/166" target="_blank">new tutorials using the Franka Emika Panda robot</a>.

We hope MoveIt 1.0 continues to support the worldwide open source robotics effort and the ideals of ROS.
