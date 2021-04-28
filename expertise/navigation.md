---
layout: caseStudy
company:
title: Robotic Navigation
description: Navigation the Killer App that Launched ROS
permalink: /navigation/
media_type: image
media_link: /assets/images/navigation-1.jpeg
cs_order: 7
---
Navigating around an environment is the core problem in mobile robotics. In the early days of Willow Garage and the creation of the Robot Operating System (aka ROS), navigation was central to advancing ROS from just another robotics middleware to the de facto standard for building complex applications.

*   **Flexible Input/Output** - While the PR2 was the featured use case of ROS Navigation, the fact that the same code could be [run on multiple platforms with vastly different capabilities](https://www.youtube.com/watch?v=mKmqgVUbQQM){:target="_blank"} lead to dozens of robot platforms adapting the code. You could easily swap out the input sensors as the hardware dictated. Sonar could replace the laser scanner. When the Kinect came out, those could easily be fed into the navigation algorithm. Likewise, as long as your robot's drivers could take a standard command, the output of the navigation could be adapted for multiple platforms.
*   **Extensible Algorithms** - The original navigation system shipped with some basic planners which worked in many cases, but not all. If you wanted to customize the behavior, you simply needed to write a new planner that adapted a standard C++ interface, and it could be plugged into the rest of the system.
*   **Open Source** - Releasing the code open source means that innovation continues outside of private clients and gives back to the robot community. PickNik works with our clients to determine how much of the work we're performing will be kept private or open. This enables the ROS and MoveIt platforms to maintain their value and prevent future vendor lock-in. 


***"Consider it one small step or a roll, actually for a robot, one not giant, but significant step for robotics."*** [John Markoff, NYTimes](https://www.nytimes.com/2009/06/09/science/09robot.html){:target="_blank"}

<br />

<div class="row justify-content-center">
    <a href="/docs/PickNik_ROS_Navigation_Whitepaper.pdf" class="btn">
    Download our Whitepaper On Navigation
    </a>
</div>

<br />
<br />


### Top Open Source Navigation Packages:

*   ROS 1 Navigation Stack (Originating from Willow Garage)
*   ROS 2 Nav (Originating from Intel)


### What's included in a typical navigation software?

*   Global Planner
*   Simultaneous Localization and Mapping (SLAM)
*   Local Planner


### Types of Robot Mobility Hardware
*   Wheeled
*   Legged
*   Aquatic
*   Aerial


<div class="row justify-content-center">
    <a href="/connect" class="btn">
    Contact PickNik for ROS Navigation Consulting
    </a>
</div>
