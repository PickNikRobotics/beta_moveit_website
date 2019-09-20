---
layout: post
title: Realtime Robotics - Real Work, Real Fast in the Real World
permalink: /case-study-rtr/
---
*PickNik and Realtime team up to create MoveIt planning plugin for Rapidplan.*

<img src="/assets/images/franka-cs.png">

**INTRODUCTION**

Boston-area startup [Realtime Robotics](https://rtr.ai) believes the trade-off between speed, safety and structure is the single-biggest factor holding automation back today. Realtime provides a number of products and solutions to allow robots to move safely and seamlessly at speed, in unstructured and uncaged environments.

![Image](/assets/images/case_studies/real_time_robotics/blog_image.jpg)

**CHALLENGE**

Realtime Robotics’ solution, RapidPlan, allows for continuous collision-free motion planning. Realtime collaborated with PickNik to create a full native MoveIt integration plugin, which joined the two different methodologies.

![Gif](/assets/images/case_studies/real_time_robotics/image1.gif)

**SOLUTION**

[PickNik Robotics](https://picknik.ai) implemented a planning plugin for MoveIt that allows running Rapidplan using the familiar planner interface.

To allow seamless integration with existing robot setups, PickNik Robotics implemented a RapidPlan motion planning plugin for MoveIt. The plugin should offer the full planning and collision checking capabilities via the common motion planning interface. 

The plugin supports converting the collision objects in the planning scene to an occupancy voxel grid that can be processed by RapidPlan. Conversions of these types naturally come with a computational overhead that can reduce the planning rate. Other steps like converting motion planning requests, goal constraints, and processing the solution path also play into this. When using point clouds, the plugin can produce solutions with a rate of up to 700 hz which is more than appropriate for most real-time planning applications.

![Image2](/assets/images/case_studies/real_time_robotics/image2.png)

The collaboration with [Realtime Robotics](https://rtr.ai) has shown that MoveIt is adaptable to new planning methodologies. Reliable real-time planning and collision checking are long expected key features required by modern robot applications and also a driving factor for the development of [ROS 2.0](https://index.ros.org/doc/ros2/). The project reflects the importance of online-planning capabilities in current MoveIt versions and the implementation of [MoveIt 2](https://moveit.ros.org/moveit!/ros/2019/03/01/announcing-the-moveit-2-port.html).

**ABOUT**

Realtime Robotics is enabling robotics and automation to reach its full potential through a combination of vastly improved basic sensorimotor capabilities, ease of programming and design, and safe human-robot collaboration. Realtime Robotics, Inc.’s responsive motion planning eliminates a huge challenge on the evolutionary path for robots and autonomous vehicles: the constraining trade-off between speed and safety. Its innovative products, RapidPlan and RapidSense, harness next-generation computer processors and software that make it possible for robots and autonomous vehicles to evaluate alternative scenarios and choose the optimal path to avoid collisions – all within milliseconds.  
 
The company was founded in 2016, by Duke University professors Dan Sorin, George Konidaris, and top researchers Sean Murray and Will Floyd-Jones, based on groundbreaking DARPA-funded research in motion planning. Based in Boston, the company’s early investors include Sparx Group Co., Ltd., Toyota AI, and Scrum Ventures. More information about Realtime Robotics, its technology and the business benefits it offers can be found on the company’s website: [https://rtr.ai](https://rtr.ai).

**Relevant Links**

* Realtime’s Video Library [https://vimeo.com/realtimerobotics](https://vimeo.com/realtimerobotics)
* Website [https://rtr.ai/](https://rtr.ai/) 
