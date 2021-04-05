---
author: Dr. Dave Coleman
comments: false
date: 2018-10-25
layout: post
slug: gsoc-motion-planning-support
title: Google Summer Of Code Project Improvements to Motion Planning Support
media_type: image
media_link: /assets/images/chomp_1.png
redirect_from:
  - /moveit!/ros/2018/10/25/gsoc-motion-planning-support.html
description: Updates for motion planners in MoveIt
categories:
  - MoveIt
  - ROS
---

[<img src="{{ site.url }}/assets/images/cover.png" width="500" style="margin-right:20px"/>]({{ site.url }}/assets/images/cover.png)

Submitted by: Raghavender Sahdev, York University

One of this year's Google Summer of Code Projects (GSoC) was the project, “Adding motion planning support for motion planners in MoveIt”. This project, with coordination with PickNik Robotics, Open Source Robotics Foundation (OSRF), Dave Coleman, and Mark Moll, has been developed for the purpose of improving and extending the currently existing planners in MoveIt. An existing concept of planning adapters in MoveIt was used to have a pipeline of two planners running sequentially to provide robust solutions.

Prior to summer 2018, MoveIt only had a single stable motion planning library as its core motion planner, i.e. OMPL. As a part of this GSoC project, motion planning support was extended by making other motion planners (CHOMP) more stable and porting STOMP also to be a part of the MoveIt motion planners family. The MoveIt part of STOMP was ported from the <a href="https://github.com/ros-industrial/industrial_moveit" target="_blank">ros-industrial/industrial_moveit</a> repository into the <a href="https://github.com/ros-planning/moveit/tree/kinetic-devel/moveit_planners" target="_blank">moveit/motion planners</a>. Furthermore, the benchmarking package was made to work with other motion planners in addition to OMPL and its <a href="https://ros-planning.github.io/moveit_tutorials/doc/benchmarking/benchmarking_tutorial.html" target="_blank">tutorials</a> were added. This package provides user the option to visualize quantitatively different parameters (time taken, trajectory length, solved status, etc.) for different motion planners (OMPL, CHOMP, STOMP) in a common environment (with/without obstacles) and make a decision on which planner the user might want to use.

The concept of Planning Request Adapters was used to implement the usage of multiple planning algorithms to be used together in MoveIt. This enables the user to use motion planning algorithms in a pipeline to produce better trajectories in different situations. For instance the user could specify a start and a goal location in RViz and then 2 motion planners could be run in a sequence like OMPL followed by CHOMP implying the usage of a CHOMP Optimization planning adapter. So OMPL would produce an initial motion plan which is then used as an initial trajectory guess for CHOMP to further optimize. Likewise, other motion planning pipelines that are possible by using the Planning Request Adapters concept in MoveIt include: (i) CHOMP + STOMP, (ii) OMPL + STOMP; (iii) STOMP + CHOMP; (iv) OMPL + CHOMP. The first 2 of these involve using the STOMP Smoothing Planning Request Adapter and the later two use the CHOMP Optimization Adapter. The way these planning request adapters can be used is straightforward and is documented in the <a href="https://github.com/ros-planning/moveit_tutorials/blob/kinetic-devel/doc/planning_adapters/planning_adapters_tutorial.rst" target="_blank">Planning Request Adapters tutorials page</a> in <a href="https://github.com/ros-planning/moveit_tutorials" target="_blank">moveit_tutorials</a> repository.

A video description of different Motion Planners, planning adapters and benchmarking motion planners can be viewed [here](https://youtu.be/I18VnECGTr0).

The project aimed at providing additional support for Motion Planners in MoveIt. The following points illustrate the contributions of this GSoC effort.

### 1. Added support for CHOMP in MoveIt and MoveIt tutorials

In the initial phase of the project, MoveIt tutorials were followed to get an understanding of the MoveIt code base and tutorials structure. CHOMP motion planner’s code base was specifically studied and several open Github issues were addressed. The links for the pull requests for CHOMP can be seen below:

- <a href="https://github.com/ros-planning/moveit_tutorials/pull/173" target="_blank">moveit_tutorials PR#173</a>: Addition of CHOMP Tutorials and scripts for testing motion planners with obstacles
- <a href="https://github.com/ros-planning/moveit/pull/960" target="_blank">MoveIt PR#960</a>: Clean up of CHOMP code and addition of new Trajectory initialization methods for CHOMP
- <a href="https://github.com/ros-planning/moveit/pull/987" target="_blank">MoveIt PR#987</a>: Addition of Failure Recovery options for CHOMP
- <a href="https://github.com/ros-planning/panda_moveit_config/pull/10" target="_blank">Panda_moveit_config PR#10</a>: Added documentation in tutorial subsection on 3 new parameters in the chomp_planning.yaml file.

Open Github issues looked into / addressed:

- <a href="https://github.com/ros-planning/moveit/issues/305" target="_blank">MoveIt Issue #305</a>: Chomp not avoiding obstacles
- <a href="https://github.com/ros-planning/moveit/issues/702" target="_blank">MoveIt Issue #702</a>: Adding official support for CHOMP
- <a href="https://github.com/ros-planning/moveit/issues/822" target="_blank">MoveIt Issue #822</a>: Goal states violate joint-limits
- <a href="https://github.com/ros-planning/moveit/pull/899" target="_blank">MoveIt Issue #899</a>: CHOMP fix goal state check

### 2. Added support for STOMP in MoveIt and MoveIt tutorials

In this phase, STOMP support was added to make it work as a core motion planning algorithm in MoveIt and it was placed alongside other motion planners in MoveIt. Its tutorials were also added to MoveIt tutorials repository. The pull requests (PRs) for the same can be viewed below:

- <a href="https://github.com/ros-industrial/industrial_moveit/pull/76" target="_blank">Industrial_moveit PR#76</a>: Fixing compilation issue of STOMP and removal of MoveIt part of STOMP from the ROS-industrial repository
- <a href="https://github.com/ros-planning/moveit/pull/965" target="_blank">MoveIt PR#965</a>: Porting STOMP motion planner into MoveIt from Industrial MoveIt repository
- <a href="https://github.com/ros-planning/moveit_tutorials/pull/185" target="_blank">Moveit_tutorials PR#185</a>: Addition of STOMP Tutorial for STOMP motion planner in MoveIt tutorials
- <a href="https://github.com/ros-planning/panda_moveit_config/pull/5" target="_blank">Panda_moveit_config PR#5</a>: Addition of STOMP related planning files

[<img src="{{ site.url }}/assets/images/stomp_1.png" width="500" style="margin-right:20px"/>]({{ site.url }}/assets/images/stomp_1.png)
<br/>Figure 1: Motion Plan obtained from STOMP In the presence of obstacles

Github issues addressed / looked into:
<a href="https://github.com/ros-industrial/industrial_moveit/issues/70" target="_blank">industrial_moveit Issue#70</a>: Compiling STOMP successfully

### 3. Benchmarking and Planning Adapters

[<img src="{{ site.url }}/assets/images/ompl_1.png" width="500" style="margin-right:20px"/>]({{ site.url }}/assets/images/ompl_1.png)
<br/>Figure 2: Motion Plan obtained from OMPL In the presence of obstacles

In this phase, the benchmarking code was made to work with different Motion Planning Algorithms like CHOMP, STOMP, and OMPL. Planning Request adapters were written for CHOMP and STOMP so they can be used as post-processor planners for the output obtained from other planners.

[<img src="{{ site.url }}/assets/images/planners_benchmark.png" width="500" style="margin-right:20px"/>]({{ site.url }}/assets/images/planners_benchmark.png)
<br/>Figure 3: This image shows the benchmarking results for 5 different planning algorithms available in MoveIt The parameter time is shown for the planners, other benchmarking parameters can also be selected for viewing for each of the planners.

**Benchmarking results below:**

Sample environments (with obstacles) are available in MoveIt for testing motion planners with single and multiple obstacles present in the scene. These environments can be loaded from moveit_tutorials package by running:

- rosrun moveit_tutorials collision_scene_example.py sparse (Figure 4) OR
- rosrun moveit_tutorials collision_scene_example.py cluttered (Figure 5)

[<img src="{{ site.url }}/assets/images/single_obstacle.png" width="500" style="margin-right:20px"/>]({{ site.url }}/assets/images/single_obstacle.png)
<br/>Figure 4. Simple Environment (Collision Scene example) with a single obstacle.

[<img src="{{ site.url }}/assets/images/multiple_obstacle.png" width="500" style="margin-right:20px"/>]({{ site.url }}/assets/images/multiple_obstacle.png)
<br/>Figure 5. Complex Environment (Collision Scene example) with multiple obstacles.

The Pull Requests for the same can be seen below:

- <a href="https://github.com/ros-planning/moveit/pull/992" target="_blank">Moveit PR#992</a>: Benchmarking different Motion Planners (CHOMP, STOMP, OMPL)
- <a href="https://github.com/ros-planning/moveit_tutorials/pull/195" target="_blank">Moveit_tutorials PR#195</a>: Added content to Benchmarking tutorials to run benchmarking against different motion planners
- <a href="https://github.com/ros-planning/moveit/pull/1012" target="_blank">Moveit PR#1012</a>: Addition of CHOMP Planning Adapter for use as a post-processing algorithm with other motion planners
- <a href="https://github.com/ros-planning/moveit_tutorials/pull/204" target="_blank">Moveit_tutorials PR#204</a>: Added tutorial on using OMPL as a pre-processor for CHOMP
- <a href="https://github.com/ros-planning/moveit_tutorials/pull/220" target="_blank">Moveit_tutorials PR#220</a>: Added a tutorial page for the usage and benefits of using planning adapters with existing motion planners in MoveIt to produce more robust trajectories under different situations
- <a href="https://github.com/ros-industrial/industrial_moveit/pull/78" target="_blank">Ros_industrial PR#78</a>: Addition of the requirements (trajectory initialization) for STOMP Smoothing Adapter tutorial into MoveIt package
- <a href="https://github.com/ros-planning/moveit/pull/1081" target="_blank">Moveit PR#1081</a>: Addition of STOMP Smoothing Adapter for ues as a post-processing algorithm with other motion planners

### Outcomes

The outcomes of this GSoC effort were the following:

- CHOMP: <a href="https://github.com/ros-planning/moveit_tutorials/pull/173" target="_blank">PR#173</a>, <a href="https://github.com/ros-planning/moveit/pull/960" target="_blank">PR#960</a>, <a href="https://github.com/ros-planning/moveit/pull/987" target="_blank">PR#987</a>, <a href="https://github.com/ros-planning/panda_moveit_config/pull/10" target="_blank">PR#10</a>.
- STOMP: <a href="https://github.com/ros-industrial/industrial_moveit/pull/76" target="_blank">PR#76</a>, <a href="https://github.com/ros-planning/moveit/pull/965" target="_blank">PR#965</a>, <a href="https://github.com/ros-planning/moveit_tutorials/pull/185" target="_blank">PR#185</a>, <a href="https://github.com/ros-planning/panda_moveit_config/pull/5" target="_blank">PR#5</a>
- Benchmarking: <a href="https://github.com/ros-planning/moveit/pull/992" target="_blank">PR#992</a>, <a href="https://github.com/ros-planning/moveit_tutorials/pull/195" target="_blank">PR#195</a>
- Planning Adapters: <a href="https://github.com/ros-planning/moveit/pull/1012" target="_blank">PR#1012</a>, <a href="https://github.com/ros-planning/moveit_tutorials/pull/204" target="_blank">PR#204</a>, <a href="https://github.com/ros-planning/moveit_tutorials/pull/220" target="_blank">PR#220</a>, <a href="https://github.com/ros-planning/moveit/pull/1081" target="_blank">PR#1081</a>, <a href="https://github.com/ros-industrial/industrial_moveit/pull/78" target="_blank">PR#78</a>
