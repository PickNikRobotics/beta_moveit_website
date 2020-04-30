---
author: Andy Zelenak, PhD, Controls Engineer
comments: false
date: 2020-02-06
layout: post
title: Advances in Realtime Robot Control in ROS
media_type: image
media_link: /assets/images/blog_posts/realtime_control/track_joint.png
description: Robots are branching out from warehouses
categories:
- MoveIt
- ROS
---

[//]: # (Image References)
[boston_dynamics_img]: /assets/images/blog_posts/realtime_control/boston_dynamics.jpeg
[robonaut_img]: /assets/images/blog_posts/realtime_control/robonaut.jpg

You may have noticed the “diffusion” trend in robotics. If not, you will soon:

Robots are branching out from warehouses and assembly lines and becoming more common in our homes and neighborhoods. There are many examples, from surgery robots to hobbyist drones. Walmart is using autonomous floor-cleaning robots and Amazon is planning to release an Alexa-powered home robot<sup><a href="https://techcrunch.com/2019/07/12/amazon-reportedly-ramps-development-on-alexa-powered-home-robot-on-wheels/" target="_blank">1</a></sup>. Boston Dynamics is now selling four-legged Spot “dogs” to its first commercial customers<sup><a href="https://www.bostondynamics.com/spot" target="_blank">2</a></sup>. Many companies are betting that healthcare robotics will become very popular due to aging populations around the globe.

To become useful, all of these examples must overcome the cluttered, chaotic environment of the real world. That has required massive improvements in sensor technology, battery design, and task planning. Another enabling technology is realtime control. If you have ever seen an (extremely impressive) video of a Boston Dynamics robot opening a door or lifting a package, you have seen a prime example of realtime control.

![boston_dynamics_img]

Since most of our work at PickNik Robotics involves manipulators, this post focuses on realtime control in the context of robot arms.

By the narrow dictionary definition, realtime control means that a robot can react in a predictable time frame<sup><a href="https://www.sciencedirect.com/topics/engineering/real-time-control-system" target="_blank">3</a></sup>. At a practical level, a modern roboticist expects much more when he hears that a robot is capable of realtime control. It implies an ability to react quickly and to handle uncertainty well. For a pick/place robot, that might mean that a robot reacts quickly to a vision sensor to grasp a moving part from a conveyor belt. For a contact task, that might mean that a robot is able to guide a part into place with force data, despite misaligned holes. To see these assembly robots in action, it’s almost like robots are starting to emulate the sense of touch. Some of the largest robot manufacturers sell this sense of touch as an add-on package to their robots<sup><a href="https://www.britishplastics.co.uk/machinery/fanuc-extends-range-of-selective-compliance-assembly-robots/" target="_blank">4</a></sup><sup>,</sup><sup><a href="https://www.motoman.com/en-us/applications/assembly#ForceSensing" target="_blank">5</a></sup>.

Roboticists refer to this sense of touch by several terms including compliance, force feedback, or admittance. Compliance was popularized by NASA<sup><a href="https://ntrs.nasa.gov/search.jsp?R=19870058523" target="_blank">6</a></sup> and MIT<sup><a href="https://ieeexplore.ieee.org/abstract/document/1087854" target="_blank">7</a></sup> researchers in the mid-1980’s. These early robots didn’t have adequate computational power to implement compliance very well, but hardware and computation has gotten much better since then. Actuators are stiffer and more accurate. To cite two of the most difficult control cases, modern humanoid and surgical robots operate at control rates in the thousands-of-Hertz range. If you need to react quickly to sensed forces or visual commands, PickNik knows how to write efficient control software and make the most of whatever robot hardware you have available.

In the world of open-source software, there are several realtime control options (and more every month). It is especially great to leverage these options if you’re a small company with a limited budget. For many years, OROCOS was the primary choice. OROCOS is a modular C++ framework that focused on hard realtime control, and it is possible to install OROCOS with ROS1. In fact, the Robonaut, which NASA deployed to the International Space Station, ran OROCOS alongside ROS1. The controls component of OROCOS is generally regarded as more powerful but less user-friendly and less flexible than ROS1. For example, it likely would not provide easy sensor integration like ROS1 does.

![robonaut_img]

Several ROS1 packages have emerged recently which make hard realtime control possible with ROS1. Since the ROS1 message system itself isn’t realtime, this generally requires careful multithreading. There is a realtime Cartesian planner as well as a choice of two impedance libraries or plugins. These packages have been used for tasks such as visual servoing and interaction with valves, door handles, etc.

PickNik helped with the development of the Realtime Robotics ROS package. This amazing project uses add-on FPGAs to do full motion planning at a very fast rate (up to 700 Hz). Unlike the packages mentioned above, collision avoidance and joint limits are included in the planning. This is possible because FPGAs can be “tuned” to provide very high performance for this specific task. Unfortunately, the FPGAs are expensive.

Version two of ROS (ROS2) will be much better-suited to realtime control, and PickNik is working to take advantage of that. Some variants of the ROS2 DDS message system will be deterministic, meaning the messages will arrive reliably. This is essential. Other features of ROS2 will help with speed<sup><a href="https://design.ros2.org/articles/realtime_background.html" target="_blank">8</a></sup>:

- Zero-copy message transport
- Better memory management

Many of PickNik Robotics’ employees are maintainers or contributors to the MoveIt project, the most popular manipulator planning project in the world. We have made sure the MoveIt roadmap includes these goals that will bring better realtime control to MoveIt:

- Port to ROS2
- Reactive, closed-loop control to sensor input
- Realtime Octomap updates for collision avoidance
- Local planner (IK-based, field-based) operating at 300 Hz
- Zero-memory copy integration to controllers

PickNik is very excited about this transformational time in robotics, and better realtime control will be a major focus as we move ROS forward.
