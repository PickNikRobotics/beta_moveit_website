---
author: Stephen Brawner
comments: false
date: 2019-06-12
layout: post
title: Announcing SolidWorks to URDF Exporter 1.5
media_type: image
media_link: /assets/images/blog_posts/2019_06_12_solidworks.png
description: It is my pleasure to announce that we’ve made a huge update to the SolidWorks URDF Exporter. A big thank you is due to Verb Surgical for inspiring and supporting the work and also to the team at PickNik Consulting.
categories:
- MoveIt
- ROS
---

*Written and cross-posted on Discourse by Stephen Brawner*

It is my pleasure to announce that we’ve made a huge update to the SolidWorks URDF Exporter.
A big thank you is due to [Verb Surgical](https://www.verbsurgical.com/) for inspiring and supporting the work and also to the team at [PickNik Consulting](https://picknik.ai/).

<img src="/assets/images/blog_posts/2019_06_12_solidworks.png" alt="Announcing SolidWorks to URDF Exporter 1.5">

**From Verb Surgical:**

*“The original ROS SolidWorks URDF Exporter has been a vital tool for many robotics teams to close the loop on mechanical design and software control,
and Verb Surgical is no different."*

*“We saw a few things we can do to make it much easier for us to close the gap between mechanical design and software controls,
and decided to improve the exporter by adding several important features to facilitate exporting from large SolidWorks assemblies,
and we are happy to share the tool back with the community!”*

These new features identified by Verb are included in over 61 new merged Pull Requests. Some of the biggest:

* All custom inputs you add to your URDF configuration are now saved internally. No longer will you have to re-input joint limits or other hand-entered items.
* Optionally export the URDF without creating meshes. Have some meshes that you already like? Now you can just quickly update the URDF with a handy new button!
* Import/Export from a CSV file: For some larger robot models, it’s not practical to track all properties in the SolidWorks model.
 Now you can import specific properties, like existing meshes, mass/inertia properties or joint information from a CSV file.
* Unit and integration testing: New tests will help ensure that new code is validated against existing SW model examples.
* Tons of bug fixes!


We’ve also taken this opportunity to migrate from BitBucket to [Github](https://github.com/ros/solidworks_urdf_exporter) hosted under the ROS organization.

Please see the [wiki](http://wiki.ros.org/sw_urdf_exporter) for a download link and more information.
