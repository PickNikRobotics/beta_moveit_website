---
layout: blog
author: John Stechschulte, PhD, Perception Scientist
comments: false
date: 2020-08-14T00:00:00.000-06:00
title: New MoveIt Calibration Capabilities from Intel
media_type: image
media_link: "/assets/images/blog_posts/2020-08-14-img_20200803_115929.jpg"
description: Hand-eye calibration capability is now available in the new MoveIt Calibration
  package
categories:
- Camera calibration
- Hand-eye calibration
- MoveIt

---
MoveIt can now help your robot see it, too, thanks to the new MoveIt Calibration package. Many robotic applications depend on vision to perceive the world and plan robot motions. But without knowing where the camera is in relation to the robot, any spatial information extracted from the camera is useless. Extrinsic calibration is the process to determine the camera's pose, and MoveIt Calibration provides a straightforward, GUI-driven process for extrinsic camera calibration, whether the camera is stationary in the scene or attached to the robot end-effector.

![](https://lh4.googleusercontent.com/XFv1WxVcJmoQllT01GEZO5KFFhROVKGnVPoI88bChw3jGvUJRM5JkH3gpR1M0lhqKLQ4E07Zroq2k6JQQT4Y_grnSFCpY27Q-ZO6Tg_-Tgdojact4E5j-roLqs3jol93-eMBgsu9 =498x663)

Besides a robotic arm and a camera, the only other equipment required to use MoveIt Calibration is a calibration target. MoveIt Calibration can generate a target image that can be printed and mounted on a flat surface. Measurement of the target's size is necessary, although the target's location and orientation do not need to be measured--instead, several observations of the target allow the calibration to be computed independent of the target's precise location.

When calibrating a camera attached to one of the robot links, which is known as "eye-in-hand" calibration, the target is placed statically in the scene, allowing for easy computation of the camera motion. The dataset required for calibration consists of the camera-to-target transform paired with the base-link-to-end-effector transform. At least five pose pairs are necessary to compute a calibration, and typically the calibration gets more accurate as more pose pairs are collected up to about 15 pairs. MoveIt Calibration provides automatic planning of new calibration poses, or manual collection of pose pair samples if the user wants to plan and execute poses in a different manner.

Calibrating a camera that is stationary in the scene, called "eye-to-hand" calibration, proceeds similarly to eye-in-hand calibration. The camera and the calibration target are merely swapped--now that the camera's pose is static in the base link frame, the target must be put in the end-effector frame. Often, this simply means gripping the target with the end-effector.

For more information on the mathematical methods used in MoveIt Calibration to solve for a calibration, see [Daniilidis, 1999](https://scholar.google.com/scholar?cluster=11338617350721919587&hl=en&as_sdt=0,6), [Park and Martin, 1994](https://scholar.google.com/scholar?cluster=2140351150276060817&hl=en&as_sdt=0,6), and [Tsai and Lenz, 1989](https://scholar.google.com/scholar?cluster=18168502493509261348&hl=en&as_sdt=0,6).

**![](https://lh5.googleusercontent.com/LgRU0ke-g2qIbcxwObJc9dSNnaKIGOJLTy0cYJx_aLQK-rQK9uITdH69Nad_BEAnMWi9T41WJdNdStKSHPxATFmlKY0rSwo3E904WXndOXA7Al2Sr8WF9w8SIEsVFxSUDszfDRX_ =672x896)**

If you have a camera and a robot arm, MoveIt Calibration can help you use them together. For more information, check out [http://github.com/ros-planning/moveit_calibration,](http://github.com/ros-planning/moveit_calibration, "http://github.com/ros-planning/moveit_calibration,") and the [MoveIt Calibration tutorial](https://github.com/JStech/moveit_tutorials/blob/new-calibration-tutorial/doc/hand_eye_calibration/hand_eye_calibration_tutorial.rst). See it, move it, do it.

![](/assets/images/blog_posts/line.png)

**Acclerate Your Robotics Development**

About [PickNik](https://picknik.ai/): Robots are complex systems that require a wide breadth of expert knowledge spanning multiple disciplines, making robotics development extremely difficult and costly. Since 2015, PickNik’s mission has been to address this technical challenge while dramatically reducing development time for advanced robotic applications. To achieve this, PickNik supports and collaborates with the worldwide open source robotics movement, providing companies with cutting edge research and barrier-free open source software.

PickNik is rooted with a strong background in robotics theory combined with applied software experience to provide unique solutions. Robotics companies including Google, Amazon, Kindred, and many others are partnering with PickNik to develop robotic applications to address the toughest issues through software consulting, custom development, and other initiatives. By working together, we can accomplish far more than by working alone.

If you would like more information please contact us at [https://picknik.ai/connect/](https://picknik.ai/connect/ "https://picknik.ai/connect/")