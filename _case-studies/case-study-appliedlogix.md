---
layout: caseStudy
company: AppliedLogix
title: Rapid Autonomous Produce Harvesting
permalink: /case-study-appliedlogix/
media_type: image
media_link: /assets/images/case_studies/appliedlogix-main.png
cs_order: 1
---
*Vision, navigation, and motion planning come together to deliver core capability of an agricultural robot platform.*


**Situation**

Harvesting produce is a dull, dirty job, ripe for automation. AppliedLogix is building an agriculture solution to automate picking of certain produce. For such a system to be profitable, it is necessary to strictly control component costs while simultaneously achieving a high pick rate. The overall system is necessarily complex, incorporating multiple robotic arms, cameras, other sensors, and autonomous navigation.

AppliedLogix has ample experience building complex electronics and software systems. Their staff of 32 senior engineers have developed & productized hundreds of high-end products. Their track-record of success is built upon their commitment to drive each and every one of their client's projects with uncommon expertise, teamwork, commitment, and passion.


**Problem**

While there are many engineering challenges, the core problem of an agricultural robot is the identification of produce to be picked, planning, and then executing the arm motions necessary to pick the correct targets.

AppliedLogix was well-equipped to execute the system engineering of the robotic platform, but they lacked the robotics manipulation software expertise that was needed to achieve the required capabilities and pick times. The AppliedLogix team had prior experience with deep learning and they were quick to train a neural network to identify the produce to be picked. However, they were less experienced with the robotic perception techniques necessary to place that information in the environment, so that a robot could act on it. AppliedLogix was also challenged with supporting multiple client projects in-parallel, all competing for their internal resources. At that point in time they reached-out to PickNik to help them fill in their resource and critical expertise gaps to keep the Harvester project moving ahead.


**Solution**

AppliedLogix selected the PickNik Robotics team and together the combined team moved forward with co-developing the platform. PickNik tailored existing open source solutions, in particular MoveIt, to quickly deliver the core motion planning capabilities of the produce harvesting system. The system uses inputs from the wrist-mounted camera and the vehicle odometry to drive closed-loop motion planning using a new library in MoveIt called MoveIt Servo. 

PickNik's expertise with camera calibration was essential to making the cameras useful. Furthermore, PickNik’s ability to specify and apply the appropriate geometric transformations (something that is part and parcel of robotics work), was a critical element in reducing the pick cycle times.

The software was developed and tested on commercially available robotic arms, so that significant progress could be made before the first custom hardware was available. Test platforms were built at both PickNik and AppliedLogix to simulate the full system. As a result, PickNik was able to rapidly develop the core software and test it locally, while also delivering robustness to hardware changes.

On the robotic arm hardware side, PickNik leveraged their network to recommend a robotic arm hardware partner to develop a custom arm for AppliedLogix. 


**Outcome**

PickNik leveraged a myriad of open source robotics software to quickly stand up a complex manipulation and perception picking system for AppliedLogix. They developed the software reliability infrastructure to ensure smooth collaboration between multiple teams in different locations. AppliedLogix and PickNik were able to demonstrate the core functionality of the agricultural robot system in under a year of co-development.
