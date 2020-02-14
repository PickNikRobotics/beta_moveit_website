---
author: Henning Kayser
comments: false
date: 2020-02-14
layout: post
title: MoveIt 2 Beta Release Announcement
media_type: image
media_link: /assets/images/blog_posts/moveit-2-logo-dark.png
description: Popular motion planning software now available on ROS 2
categories:
- MoveIt
- ROS 2
---

[line]: /assets/images/blog_posts/line.png

<div style="text-align:center"><img src="/assets/images/blog_posts/moveit-2-logo-dark.png" alt="MTC"></div>
<br>

<b>Big news! <a href="https://github.com/ros-planning/moveit2" target="_blank">MoveIt 2 Beta</a> has been launched today thanks to a big effort from the PickNik Robotics' team, Yu Yan (Intel), Robert Haschke and other MoveIt maintainers. This is a big step forward in providing next generation open source robotics. MoveIt 2 will enable many compelling advantages over its predecessor, namely faster, more reactive planning through realtime control of robot arms. The new platform version will enable more reliable robot behaviors, based on industry feedback.</b>

### Feature List

Over the last months we’ve been working very hard to migrate a major part of MoveIt to ROS 2. Listed below are all ported packages that will be available for the release (subitems indicate ported libraries in only partially ported packages):

* moveit_core
* moveit_ros_planning
* moveit_planners_ompl
* moveit_planning_interface
  * moveit_cpp
  * moveit_common_planning_interface_objects
* moveit_kinematics
  * kdl_kinematics_plugin
  * lma_kinematics_plugin
  * srv_kinematics_plugin
* moveit_ros_visualization
  * robot_state_rviz_plugin
  * planning_scene_rviz_plugin
  * rviz_plugin_render_tools
* moveit_plugins
  * moveit_simple_controller_manager
* occupancy_map_monitor


With the ported packages the feature list of MoveIt 2 Beta covers pretty much all core functionalities that MoveIt provides, such as motion planning, collision checking, trajectory execution, IK and visualization in RViz.

Unfortunately, there are still some packages that have not been ported yet due to lack of funding. The high-level interfaces MoveGroup and MoveGroupInterface won’t be ready for the release, just as the dependent MotionPlanningDisplay and MoveItSetupAssistant. You can find a complete list of the migration progress in this <a href="https://docs.google.com/spreadsheets/d/1aPb3hNP213iPHQIYgcnCYh9cGFUlZmi_06E_9iTSsOI/edit?usp=sharing" target="_blank">spreadsheet</a>. Please contact PickNik if you are interested in funding or otherwise supporting the full migration of MoveIt to ROS 2.

**Demo and Beta Testing**

We will provide a <a href="https://github.com/ros-planning/moveit2/pull/166" target="_blank">MoveItCpp demo setup</a> with example code that runs a simulated Panda robot. We welcome you to play around with and try to break it as much as possible. As a Beta tester you are invited to reproduce the demo with other robot setups as well while documenting and filing any issues you find. Ideally, you would provide PR’s with according fixes as well ;-).

![line]

**Accelerate Your Robotics Development |**
About [PickNik](https://picknik.ai/):  Robots are complex systems that require a wide breadth of expert knowledge spanning multiple disciplines, making robotics development extremely difficult and costly. Since 2015, PickNik’s mission has been to address this technical challenge while dramatically reducing development time for advanced robotic applications. To achieve this, PickNik supports and collaborates with the worldwide open source robotics movement, providing companies with cutting edge research and barrier-free open source software.

PickNik is rooted with a strong background in robotics theory combined with applied software experience to provide unique solutions. Robotics companies including Google, Amazon, Kindred, and many others are partnering with PickNik to develop robotic applications to address the toughest issues through software consulting, custom development, and other initiatives. By working together, we can accomplish far more than by working alone.

If you would like more information please contact [hello@picknik.ai](mailto:hello@picknik.ai)
