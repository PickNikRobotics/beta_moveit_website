---
date: 2021-04-22 00:00:00 -0700
layout: post
author: Dr. David Lu
comments: false
title: Hello Robot and PickNik Collaboration
media_type: image
media_link: "/assets/images/blog_posts/2021-04-22-hello-robot-1.png"
description: PickNik and Hello Robot work together to integrate MoveIt 2’s capabilities with Hello Robot’s mobile manipulator, Stretch.
categories:
- ROS
- PickNik
- Hello Robot
---

We’re excited to announce that PickNik and [Hello Robot](https://hello-robot.com) have come together to create full support for [ROS 2](https://docs.ros.org/en/foxy/index.html) and [MoveIt 2](https://github.com/ros-planning/moveit2) for the Stretch mobile manipulator. Both PickNik and Hello Robot are firm believers in the benefits of open source.

<br>
<div class="row justify-content-center">
<iframe src="https://giphy.com/embed/iWGGMovjJdHZkt2coI" width="480" height="270" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>
</div>
<br>

 All of the software for Stretch, from low-level drivers to high-level planning software are available as open source. Through our collaboration we have added support for whole-body motion planning for differential drive mobile robots to MoveIt 2. This makes planning coordinated arm, torso, and base motions as easy as planning for anything else in MoveIt 2. This new functionality is available not just for Stretch, but for any other mobile manipulator with a differential drive base.

## Up Next: ##

In the coming month, we will develop a Stretch-based MoveIt tutorial and demos that show off how different MoveIt 2 capabilities can be used with Stretch. After that, we will work on improved Gazebo support, minimizing the gap between simulation and hardware execution as much as possible. We will also work on making it easy to swap end effectors.
