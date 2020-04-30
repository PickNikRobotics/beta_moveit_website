---
author: Mark Moll
comments: false
date: 2020-03-10
layout: post
title: Guide to Improving Average Pick Time
media_type: image
media_link: /assets/images/blog_posts/improve_pick_time/image.jpg
description: Observations on Planning, Grasping & Optimization
categories:
- MoveIt
- ROS
---

[line]: /assets/images/blog_posts/line.png

### Introduction

There has been considerable debate and research for improving average pick time, both academically and commercially. Different approaches are often specialized for particular use cases, while others are more adaptive for broad use cases. Certainly, there are many factors that influence the average pick time, including motion planning time, grasp planning time, and execution time. It is hard to completely disentangle these factors.

Below, we briefly discuss how to:
- Leverage different motion planning approaches
- Choose a particular grasp planner
- Avoid over-optimizing low level components in favor of big picture issue
- Tightly integrate motion, grasp, and high level planning
- Address the difficulties of benchmarking
- Leverage experience based-planning for more determinism

### Motion Planning Approaches

The two main classes of motion planning approaches that are available in MoveIt at the moment are:
- Sampling-based planning methods [1][2] (through the OMPL-based pipeline)
- Trajectory optimization methods (CHOMP [3], STOMP [4], and (soon) TrajOpt [5])

These two classes give very different performance guarantees. The former is probabilistically complete (meaning that the probability of finding a solution goes to 1 as time goes to infinity). In other words, if a feasible solution exists, it will eventually be found. There are variants of sampling-based planners that can provide asymptotic (near-)optimality. For some algorithms optimality has only been proven for path length, while others seem fairly agnostic regarding the path cost function. The solutions of these algorithms converge to the globally optimal path over time (or within a constant factor in the case of near-optimal). Convergence tends to be slow, though. In MoveIt, path planning is decoupled from the time parametrization (i.e., trajectory generation), so at least with the OMPL planning pipeline within MoveIt you cannot directly optimize over time.

Trajectory optimization methods are typically very fast. This may be due in part because of certain implementation choices. They often rely on a signed distance field. If it is possible to precompute this, then online planning can be very fast. Although the theory behind these algorithms allows different trajectory parametrizations, in practice the trajectory search space is typically based on having a fixed number of waypoints whose position is varied to optimize the overall path. While encoding arbitrary trajectory cost functions (that balance speed, smoothness, clearance, etc.) is possible, in practice the implementation tricks used make it difficult to change the default one. These algorithms usually perform local optimization. Global optimality is possible by repeatedly running these algorithms with different initial seed trajectories. An important limitation of these algorithms is that they usually convert hard constraints (such as collision avoidance) into soft constraints (it simply costs more to move through an obstacle than around it). This can lead to surprising results. The “optimal” path can be infeasible, simply because the cost of moving through a large thin obstacle is much smaller than going around it. It does not take very contrived scenarios to make trajectory optimization methods fail.

The ideal planning pipeline would never return infeasible plans and would be able to produce better plans the more time you give it. Below are some empirical observations that can help in fine-tuning a planning pipeline:

- While convergence of asymptotically optimal planners in OMPL is slow, it turns out that an algorithm called Anytime Path Simplification [6] converges significantly faster. This meta algorithm repeatedly runs multiple feasible planners to produce a ranked list of plans. It applies path simplification and path hybridization (i.e., grafting good partial paths together) [7] to produce a path that is better than any individual solution path.
- One approach that may be able to give you the best aspects of sampling-based planners and optimization approaches is by simply using both in sequence:
	- First, produce a feasible plan. When using Anytime Path Simplification, this may already be close to optimal.
	- Optionally, run OMPL’s path simplification if it was not already performed, in order to make the next step faster.
	- Run trajectory optimization starting from a feasible solution. As mentioned before, an optimizer can turn a feasible solution into an infeasible one if the cost for doing so is lower, but in that case we could fall back on the initial feasible path.
This combination of planning and optimization was demonstrated to be very effective [8].

### Grasping & Inverse Kinematics

Choosing a particular grasp can make the planning problem easier or harder. In the worst case, a grasp may have a feasible inverse kinematics (IK) solution, but may still not be reachable from the current configuration of the manipulator, while another grasp might admit a feasible solution path. Some motion/grasp plans are more likely to cause execution failures than others. It is also important to keep in mind that a fast planning algorithm will likely not produce the plan that is fastest to execute. Planning time is often much smaller than execution time, so it may be worth it to spend some extra time during planning to find high-quality paths and grasps that minimize the probability of execution failure and minimize average execution time.

Grasping an object is often broken down into several steps: computing a grasp pose, computing an IK solution for that pose, planning a free space motion to a pre-grasp pose and a Cartesian motion from the pre-grasp to the grasp motion. Grasp failures can occur if the robot is forced to move through singularities using a Cartesian motion. Finding a feasible IK solution that also admits a feasible approach motion and a feasible free space motion can be challenging. This is also an area where using MTC can help: it should be able to automatically discover feasible grasps (although heuristics can still be useful).

### Task and Motion Planning

Task planning is concerned with determining a sequence of actions that achieves some high-level goal (e.g., a sequence of sequence of pick and place actions to empty a tote), while motion planning is concerned with finding the low-level motions of each joint that result in a given action. Often task and motion planning problems are solved hierarchically: first, compute a task plan; next, compute a motion plan for each action. This can be inefficient or even incomplete (i.e., failing to find a solution when one exists). The MoveIt Task Constructor (MTC) [9] is a step towards integrating task and motion planning.

### Benchmarking Different Approaches

We are big proponents of using the benchmarking infrastructure in OMPL [10] and MoveIt for characterizing overall performance. That infrastructure is not limited to just planning times. All kinds of performance metrics can be logged. The main idea is to characterize performance statistically across many different environments and approaches. The logging data is converted into a database with tables for (1) different experimental setups (e.g., different arrangements of boxes), (2) planning/grasping approaches, and (3) performance metrics for runs of a particular approach in a particular setup. For randomized planners (or in case of sensor/actuation uncertainty), each combination of environment and planning/grasping approach needs to be repeated several times to get a better idea of the range of outcomes.The results can then be aggregated and visualized via <a href="http://plannerarena.org/" target="_blank">Planner Arena</a> or a custom visualization / dashboard that queries the database of aggregated benchmark data.

### Experience-Based Planning

Ideally, the overall planning system should be able to exploit information from previous motion planning problems for any new problem, especially if the environment changes very little. This is in fact the insight that led us to create the Bolt planning framework [11]. The benefits of using prior experience are greatest for motions that involve many degrees of freedom in tight spaces or subject to complex constraints (or both), but even for free-space motion planning Bolt can lead to performance improvements. Bolt is currently a research prototype that we are working on commercializing. Contact us if you are interested in using a Bolt-like framework with your robot.

### Conclusion

Optimizing a pick and place pipeline involves many components that often interact with each other in non-trivial ways. PickNik takes a comprehensive approach to help clients improve the performance of their system. By leveraging PickNik’s experience and open source robotics software, clients can quickly reach their desired performance targets.

![line]

**Accelerate Your Robotics Development |**
About [PickNik](https://picknik.ai/): Robots are complex systems that require a wide breadth of expert knowledge spanning multiple disciplines, making robotics development extremely difficult and costly. Since 2015, PickNik’s mission has been to address this technical challenge while dramatically reducing development time for advanced robotic applications. To achieve this, PickNik supports and collaborates with the worldwide open source robotics movement, providing companies with cutting edge research and barrier-free open source software.

PickNik is rooted with a strong background in robotics theory combined with applied software experience to provide unique solutions. Robotics companies including Google, Amazon, Kindred, and many others are partnering with PickNik to develop robotic applications to address the toughest issues through software consulting, custom development, and other initiatives. By working together,  we can accomplish far more than by working alone.

If you would like more information please contact us at [https://picknik.ai/connect/](https://picknik.ai/connect/)

### References

[1]	M. Elbanhawi and M. Simic, “Sampling-based robot motion planning: A review,” IEEE Access, vol. 2, pp. 56–77, 2014, doi: 10.1109/ACCESS.2014.2302442. <https://scholar.colorado.edu/downloads/j96020909>

[2]	I. A. Şucan, M. Moll, and L. E. Kavraki, “The Open Motion Planning Library,” IEEE Robot. Autom. Mag., vol. 19, no. 4, pp. 72–82, Dec. 2012, doi: [10.1109/MRA.2012.2205651](https://dx.doi.org/10.1109/MRA.2012.2205651).

[3]	M. Zucker et al., “CHOMP: Covariant Hamiltonian optimization for motion planning,” Int. J. Robot. Res., vol. 32, no. 9–10, pp. 1164–1193, 2013, doi: [10.1177/0278364913488805](https://dx.doi.org/10.1177/0278364913488805).

[4]	M. Kalakrishnan, S. Chitta, E. Theodorou, P. Pastor, and S. Schaal, “STOMP: Stochastic trajectory optimization for motion planning,” in IEEE intl. conf. on robotics and automation, 2011, pp. 4569–4574, doi: [10.1109/ICRA.2011.5980280](https://dx.doi.org/10.1109/ICRA.2011.5980280).

[5]	J. Schulman et al., “Motion planning with sequential convex optimization and convex collision checking,” Int. J. Robot. Res., vol. 33, no. 9, pp. 1251–1270, 2014, doi: [10.1177/0278364914528132](https://dx.doi.org/10.1177/0278364914528132).

[6]	R. Luna, I. A. Şucan, M. Moll, and L. E. Kavraki, “Anytime solution optimization for sampling-based motion planning,” in IEEE intl. conf. on robotics and automation, 2013, pp. 5053–5059, doi: [10.1109/ICRA.2013.6631301](https://dx.doi.org/10.1109/ICRA.2013.6631301).

[7]	B. Raveh, A. Enosh, and D. Halperin, “A little more, a lot better: improving path quality by a path-merging algorithm,” IEEE Trans Robot., vol. 27, no. 2, pp. 365–371, Apr. 2011, doi: [10.1109/TRO.2010.2098622](https://dx.doi.org/10.1109/TRO.2010.2098622).

[8]	B. Willey, “Combining sampling and optimizing in robotic path planning,” Department of Computer Science, Rice University, Houston, Texas, 2018. <https://brycewilley.xyz/assets/willey-ms-thesis.pdf>

[9]	M. Görner, R. Haschke, H. Ritter, and J. Zhang, “MoveIt! Task constructor for task-level motion planning,” in IEEE Intl. Conf. on Robotics and Automation, 2019, pp. 190–196, doi: [10.1109/ICRA.2019.8793898](https://dx.doi.org/10.1109/ICRA.2019.8793898).

[10]	M. Moll, I. A. Şucan, and L. E. Kavraki, “Benchmarking motion planning algorithms: an extensible infrastructure for analysis and visualization,” IEEE Robot. Autom. Mag. Spec. Issue Replicable Meas. Robot. Res., vol. 22, no. 3, pp. 96–102, Sep. 2015, doi: [10.1109/MRA.2015.2448276](https://dx.doi.org/10.1109/MRA.2015.2448276).

[11]	D. Coleman, “Methods for improving motion planning using experience,” University of Colorado Boulder, 2016. <https://scholar.colorado.edu/downloads/j96020909>

[12] <a href="https://www.bastiansolutions.com/solutions/service/industrial-robotics/industrial-robotic-solutions/vision-guided-robotics/goods-to-robot/" target="_blank">Image source</a>
