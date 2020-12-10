---
date: 2020-12-10 14:36:35 -0700
layout: post
author: Dr. Andy Zelenak
comments: false
title: Fast Visual Servoing with MoveIt
media_type: image
media_link: "/assets/images/blog_posts/2020-12-10-catch_arm.gif"
description: Hints for fast and safe reactive control with MoveIt.
categories:
- Visual Servoing
- MoveIt

---
This white paper is oriented toward the power users who need fast, reactive motion from a ROS manipulator. Prior to 2019, reactive motion was really difficult in ROS, and those who needed it most wrote their own solutions. However, PickNik has been working to make it easier. In the words of PickNik CEO Dave Coleman, reactive motion is now “a first class citizen” in the MoveIt ecosystem.

There are tons of reasons why MoveIt users require reactive motion control. For example, PickNik works with companies in the agricultural sector who pick produce from a moving tractor. The pick pose is guided by a vision system, and the MoveIt Servo package “closes the loop” to make the pick. At the end of the day, the client’s profit is heavily dependent on a fast cycle time and an accurate pick, so PickNik focuses heavily on achieving their target metrics.

This paper offers a few tips so you can achieve fast and accurate motion, too. Common pitfalls are discussed, including underactuation and PID controller tuning.

![Tractor Robot](/assets/images/blog_posts/2020-12-10-tractor_robot.png "Tractor Robot")

## **A High Speed Picking Task**

Let’s study the scenario of pick/place of, say, a delicious piece of candy from a conveyor belt. A vision system provides the candy pose at a relatively slow rate (perhaps 10 Hz). Typically, we make a rough extrapolation of the candy pose into the future and execute a large joint motion to approach it. PickNik recommends the MoveItCpp interface for planning and executing this large approach motion -- MoveItCpp will reduce the latency associated with ROS messages while planning around obstacles and joint limits. However, the planning pipeline triggered by MoveItCpp takes a few hundred milliseconds to complete, thus we reserve it for large motions like this.

## **Pose Tracking with MoveIt Servo**

Once the end effector is much closer to the target pose we switch to MoveIt Servo. Servo is appropriate for small motions when the robot starts from a known “good” configuration -- far from joint limits and obstacles. As the vision system streams an updated target pose, MoveIt Servo uses four PID controllers to track the target. There is a nice, simple example [here](https://github.com/ros-planning/moveit/blob/master/moveit_ros/moveit_servo/src/cpp_interface_example/pose_tracking_example.cpp).

#### Why four PID controllers?

The pick pose has six components (x,y,z, roll, pitch, yaw), so why four PID controllers? It’s because an angle-axis representation is used. The first three PID controllers regulate x/y/z translation and the fourth controls the rate of rotation (with orientation being internally converted to axis/angle format).

#### Tuning the PID controllers

Here’s a safe procedure for PID tuning. It avoids the overshoot from other tuning methods -- we don’t want to break the robot. Translation is usually tuned separately from orientation and all three translational dimensions have identical parameters (usually).

* Begin with a small proportional gain (smallKp) and set Ki=Kd= 0.
* Increase Kp until the motion is as fast as desired, or until undesirable oscillations begin.
* You may notice that the initial motion is very fast but the motion becomes much slower as the arm approaches the target pose. Add a small bit of integral gain to help the arm converge faster. As a conservative first guess, set Ki equal to 1% of Kp. (Ki= 0.01 * Kp)
* A small amount of integral gain is also desirable to eliminate steady-state error.
* Unless very aggressive, fast motions are required, derivative gain likely is not needed. It can help reduce overshoot.
* For advanced applications where fast motion is required and overshoot is acceptable, we suggest the automated [Ziegler-Nichols](https://en.wikipedia.org/wiki/PID_controller#Ziegler%E2%80%93Nichols_method) tuning method. PickNik Robotics has a script for automated Ziegler-Nichols tuning, so we may be able to help with this.

Here are a few additional rules of thumb:

* If you notice excessive oscillations, a gain (or several gains) is too high. Reduce the gain.
* Kp is usually much larger than Ki and Kd.
* Kp, Ki, and Kd should have the same sign, all positive or all negative.

#### Examples of well-tuned gains and poorly-tuned gains

At first glance, these parameter sets seem reasonable:

* `Kp = 1, Ki= 0.1, Kd= 0`
* `Kp = 12, Ki= 1, Kd= 1`

These parameter sets are unusual/suspicious. They might be useful in some edge cases but generally indicate bad tuning:

* `Kp = 12, Ki= -1, Kd= -1`	Suspicious because all gains should have the same sign.
* `Kp = 0.3, Ki= 1, Kd= 1`	Suspicious because proportional gain should be greater than integral and derivative gains.
* `Kp = 12, Ki= 0, Kd= 0`	Suspicious because a bit of integral gain is desirable to improve convergence and eliminate steady-state error.

#### What if my robot is over-actuated or under-actuated?

Of course, MoveIt Servo handles over-actuated manipulators. The more degrees of freedom relative to the task at hand, the better! Typically, no extra tuning is needed to use MoveIt Servo with over-actuated robots. In the future, we are interested in adding more features to exploit the nullspace of over-actuated manipulators.

If the robot is under-actuated, Servo provides the option to drop a degree of control. This often allows the manipulator to continue very close to its intended path without the scary, jerky motion associated with singularities. We call this feature “drift dimensions” and the service interface to apply a drift dimension is documented [here](https://github.com/ros-planning/moveit_msgs/blob/master/srv/ChangeDriftDimensions.srv).

By the way, Servo includes singularity handling to decelerate safely in the neighborhood of singularities. There will not be any of the jerky motion that is typically associated with singularities. The degree of deceleration is easily configurable.

## **Interruption**

If the robot has a vacuum end effector or a force sensor, we are likely to run Servo forward until a vacuum or force threshold is triggered. Or we might need to abort motion because an error occurs or the user requests it. For this type of scenario, MoveIt Servo provides a convenient interruption method:

    	tracker.stopMotion();

## **Return Home**

Target candy in hand, it is time for the robot to return home. Another MoveItCpp plan/execution cycle brings it back.

## **More Advanced Capabilities**

This outline glossed over all kinds of details. As you know, with robotics, the devil is in the details. Contact PickNik Robotics if you need help with advanced pick/place functionality, such as reducing pick time even further. We have all kinds of tricks up our sleeves, from custom controller tuning to delay compensation to multithreading. We can help you achieve your manipulation goals!