---
author: Andy Zelenak, PhD, Controls Engineer
comments: false
date: 2020-05-12 01:00:00 -0600
layout: post
title: 'Solutions for Trajectory Smoothing: TrackSuite and Reflexxes'
media_type: image
media_link: "/assets/images/blog_posts/2020 05 04 Application_field_automotive.jpg"
description: Smoothed trajectories reduce vibration and increase lifespan of manipulators
categories:
- smoothing
- jerk-free
- trajectory

---
Popular motion planning frameworks like MoveIt usually produce waypoints that are irregularly spaced and likely don’t obey the velocity, acceleration, or jerk limits of the robot. Before a trajectory from MoveIt can be sent to the robot controller, it usually passes through a time parameterization algorithm. These algorithms smooth the trajectory while ensuring that enough waypoints are available to match the robot control frequency.

MoveIt provides several open-source algorithms to perform this time parameterization. The newest, preferred method is known as _Time Optimal Trajectory Generation (TOTG)_. One drawback that all of the open-source algorithms have in common is that they do not obey the jerk limits of the robot. To create a smooth, jerk-limited trajectory, it is necessary to use a proprietary algorithm.

_Why is a jerk-limited trajectory important?_

Jerk is the derivative of acceleration. By limiting jerk, there is less shock on the actuators of the robot, down time for maintenance can be reduced, and the lifespan of the robot can be extended. Oftentimes, vibration is noticeably reduced. For all of these reasons, most industrial robots require jerk-limited trajectories. Trajectory smoothing can also help in other applications, such as in attenuating the tremors of a surgeon’s hand before it is transmitted to a surgical robot.

_What are your options?_

For many years, Reflexxes was the best software to provide jerk-limited smoothing of robot motion. Reflexxes Type IV was acquired by Google in 2013 and it is no longer commercially available. However, we compare against it as a performance benchmark.

Reflexxes is a time-optimal, bang-bang jerk controller. It reaches the target position as fast as possible while obeying all jerk/acceleration/velocity limits. While the time optimality of Reflexxes is a nice characteristic, its bang-bang application of jerk yields trajectories that are harsher than necessary. Reflexxes usually sets jerk to the minimum or to the maximum. For Reflexxes, there is no in-between.

Now, there is an alternative. [TrackSuite](https://picknik.ai/products/tracksuite/), the new suite of motion smoothing products from PickNik Robotics, perform similarly. An important difference is that the TrackSuite algorithms are not bang-bang controllers -- they only apply as much jerk as necessary to reach the target position on time. Usually, TrackSuite will produce smoother trajectories than Reflexxes (and never worse). Like Reflexxes, TrackSuite can operate very fast, processing on the order of thousands of trajectories per second, with each trajectory being hundreds of waypoints long. This is fast enough for almost all modern robots. PickNik expects trajectory durations from TrackSuite to be within 10% of optimal.

The following graphs are a comparison of a trajectory smoothed with Reflexxes Type II to a trajectory smoothed with TrackSuite. Note how Reflexxes accelerates at maximum, arriving at the target destination early. Then it waits. The TrackSuite-smoothed trajectory arrives right on time (t=1.25s) and in a smooth fashion.

![](https://lh3.googleusercontent.com/rNDqJlY9uodyDu2v92IHz1Z0UReEkh8OeMgPEWKzg9r2awZOzETDf_LZ-PKReIqTWFFj45sX-itgQ8wPDju5vvqEQXnnygS9pGMJpMSd3suMr1yJ11GFVw6pHpfw-gcmmJB7ULpr "Fig. 1 - Reflexxes ramps velocity up as quickly as possible." =473x355)

Fig. 1 - Reflexxes ramps velocity up as quickly as possible.

![](https://lh6.googleusercontent.com/pAWQy9WnyhxK2LQR9h-tLaFQNov3W_pjbhrwhooCqxsfn84kxfK0Ah0PK6yH_1CnbRQhgoZ818nmfXcM8GJJJWLlk_4CkbNEgjI1AOv0p5w7jUn2RElfS9DBj8JzXG5WJSh9sNt5 "Fig. 2 - The Reflexxes trajectory arrives early." =494x371)

Fig. 2 - The Reflexxes trajectory arrives early.

!\[line\]

**_About_** [**_TrackSuite_**](https://picknik.ai/products/tracksuite/)

PickNik’s TrackSuite (consisting of its TrackPose and TrackJoint robotic libraries) guarantees your robots’ motions are safer and more predictable, with jerk-limited kinematics and reduced joint fatigue and hardware wear & tear. [TrackSuite](https://picknik.ai/products/tracksuite/) ensures your robots’ behavior achieves nearly time-optimal trajectories while still prolonging the life of your hardware via smoother operation. Complementing these pre-built solutions are a range of PickNik consulting services, integrating and optimizing trajectories for minimum material stress with maximum effectiveness and hardware longevity. Contact PickNik to schedule a TrackSuite trial — and discover how custom trajectory interpolation and management can increase the effectiveness and productivity of your robotics applications today.

If you would like more information please contact us via [https://picknik.ai/connect/](https://picknik.ai/connect/ "https://picknik.ai/connect/")