---
date: 2021-04-19 00:00:00 -0700
layout: post
author: Dr. John Stechschulte
comments: false
title: How does PickNik integrate AI perception and manipulation?
media_type: image
media_link: "/assets/images/blog_posts/2021-04-20-AI.png"
description: John Stechschulte on how to integrate AI
categories:
- ROS
- Robotics
- Vision
---

We've often worked with companies to integrate object detection frameworks with manipulation. Typically, they take on collecting training data and training the network, and we are responsible for going from bounding boxes (at 30 fps) to motion plans, including 3-d localization and tracking of objects of interest. Please see the ROS [vision_msgs](https://github.com/ros-perception/vision_msgs) README for example interfaces of different NN predictions.

**How do PickNik’s clients work with AI training and development?**

Currently, we see a lot of companies focused on integrating various state-of-the-art tools into their particular domain. Rather than developing a new AI system from scratch, they are looking to adopt an existing tool to their application. One-piece we have contributed is the statistical machinery for tracking moving objects.

**How would PickNik coordinate such a project?**

Data collection, selecting and training an architecture, and integrating the output with motion planning.
PickNik has the extensive experienced with integrating the output with motion planning. We also have experience with selecting and training neural nets. While PickNik does not provide dataset generation or labeling but work with groups who use simulations to generate large initial training datasets to bootstrap AI training.

**How would PickNik work to create an industry AI standard?**

See our blog post on using [deep learning grasp libraries into MoveIt](https://moveit.ros.org/deep%20learning/grasping/moveit/3d%20perception/2020/09/28/grasp-deep-learning.html)
