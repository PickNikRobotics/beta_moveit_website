---
date: 2021-02-18 00:00:00 -0700
layout: post
author: Tyler Weaver
comments: false
title: Cloud Repo Hosting and Continuous Integration
media_type: image
media_link: "/assets/images/blog_posts/2021-02-17-DevOpsRos.png"
description: PickNik’s experience and review of cloud based repository hosting and continuous integration tools part of the DevOps for ROS project part 1
categories:
- ROS2
- MoveIt2
- DevOps
---

We at PickNik are in a unique position, having had the experience of developing dozens of ROS projects with various DevOps toolchains. Often when we start with a new client we get asked about what tooling we like. This is the first in a three-part series of posts that reviews and summarizes various options, discussing what we have found to work the best and why. This first post will look at cloud-based repository hosting and continuous integration tools. The second post will explore self or privately hosted repository housing and continuous integrations solutions, for projects that have security requirements that don't allow them to use cloud tooling. The third and final post will dive into project management tools for ROS projects.


# Code Repository

The web-interface and server for the git repo are important because it is where the actual work product is stored and where much of the collaboration happens. Here is a short-list of features we expect this system to have:



*   Easy to use code review interface.
*   CI tooling as a first-class feature.
*   Command-line interface to streamline interacting with pull requests.
*   Tight integration with project management tooling.


### [GitHub](https://github.com/features)

GitHub is the most popular choice for hosting source repositories and for good reason. It is the most supported and has tight integrations with the tooling developed and maintained by the ROS community, providing a first-class experience. Some of the things GitHub does that makes it the default solution are:



*   Refined code review interface
*   Built-in CI system supported by [industrial_ci](https://github.com/ros-industrial/industrial_ci) for ROS projects
*   [Command-line interface](https://cli.github.com/) for checking out code in pull requests
*   [Issue tracking and project management](https://github.com/features/project-management/)
*   Integration with code coverage reporting: [codecov.io](https://about.codecov.io/), [coveralls](https://coveralls.io/)
*   [Package repository for releases](https://github.com/features/packages)
*   Project wiki maintained in a git repo per project
*   Used by the larger ROS community
*   Team-based permissions management
*   Enterprise authentication integrations
*   [VS Code Integration](https://code.visualstudio.com/docs/editor/GitHub)

An often overlooked feature is the command-line interface for checking out PRs. Because code-reviews are the primary way we collaborate over changes, being able to easily see the status of various PRs and checkout changes from other contributors right from the command line is awesome.  Install and see examples of use here: [https://cli.github.com/](https://cli.github.com/)

Lastly, there’s the cost. The option that includes cloud CI ($21 user/month) is a very good value compared to the alternatives when you consider how many tools are integrated and the unique features you can’t get otherwise.


### [Gitlab](https://about.gitlab.com/)

Gitlab has a cloud solution that we’ve used on several projects. Like GitHub it has an integrated ci system that is supported by [industrial_ci](https://github.com/ros-industrial/industrial_ci) for ROS projects. The main pain in using Gitlab compared to GitHub is that the interfaces are less refined and the CI system is more difficult to use. There is no command-line interface for PRs. Because a relatively small number of ROS projects are hosted on Gitlab it is less supported and lacks many of the niceties of GitHub.


### [Bitbucket](https://bitbucket.org/product)

This is an Atlassian GitHub clone that integrates with the polarizing project management tool, Jira.  Once again, the [industrial_ci](https://github.com/ros-industrial/industrial_ci) system supports Bitbucket. However, it is one of the least used systems and therefore will require more work to configure and maintain. Bitbucket has a much less refined UI without the support for keyboard-driven workflows. Bitbucket’s integration approach is to offer plugins and APIs that integrate with other tools (such as Jira) as opposed to GitHub’s approach of being a single tool that does it all. The problem with this approach is that the complete state of the project is split between multiple tools. This adds confusion and tedious copy-pasting between Jira and Bitbucket when the integrations fall short. Bitbucket is a poor alternative to GitHub. The price is cheap per-user/month however it lacks many of the features of Github.


### [Gerrit](https://www.gerritcodereview.com/)

This is a tool that was developed at Google. It has one of the best interfaces for code reviews.  However, there is no inexpensive way to configure and host it. One big downside is there is no integrated CI solution so you will be required to use it with an external CI system. We’ve used it with Jenkins before, however, there are no easy ready-made CI configurations for ROS projects. This one will require the most time spent on maintenance and configuration.


## Comparison chart


![Image of Comparison chart](/assets/images/blog_posts/2021-02-17-code-repo-chart-color.png)


# Continuous Integration

CI is really important to speed up high-quality development. With CI we are testing that the code has these qualities in each PR before it can be reviewed and/or accepted:



*   Conforms to the style guide (clang-format, black)
*   Passes static analysis linters (clang-tidy, flake8, pep257)
*   Has correct license notices (copyright check)
*   Builds in a clean environment (dependencies are specified correctly and code builds)
*   Passes tests (gtest, pytest)
*   Has acceptable code coverage

The ROS community has developed tooling (colcon, ament, industrial_ci) built on top of high-quality testing frameworks (gtest, pytest, clang, ctest, lcov, etc.) to make linting, testing, and code coverage reporting a first-class feature.

Another important aspect of how we use CI is [industrial_ci](https://github.com/ros-industrial/industrial_ci). It is a CI configuration for ROS projects that makes it simple to configure and use CI to test potential changes on various CI platforms.  With the exception of Jenkins all of the CI systems listed below are supported by industrial_ci.


### [GitHub Actions](https://github.com/features/actions)

[industrial_ci](https://github.com/ros-industrial/industrial_ci) is already compatible with GitHub Actions and is simple to set up and maintain.  GitHub Actions offers the most first-class CI solution for small and medium-sized ROS projects. It is supported by the industrial_ci project and is trivial to configure and use for ROS-based projects.


### [Travis](https://travis-ci.com/)

Travis is the tool we currently use for MoveIt. In the past, they offered the best CI solution for open-source projects on GitHub and are supported by [industrial_ci](https://github.com/ros-industrial/industrial_ci). We are currently working on migrating MoveIt off Travis due to recent changes to their policy with regard to OSS projects.


### [CircleCI](https://circleci.com/)

CircleCI is currently the industry leader in CI for the most advanced features for large projects. The [Navigation2 project](https://github.com/ros-planning/navigation2) has transitioned to CircleCI and we are actively working to move MoveIt2 onto CircleCI. The advanced features that benefit large projects introduce an amount of complexity that GitHub Actions does not have. CircleCI also has an on-premise install solution. For large complex projects, CircleCI is the clear winner.


### [Gitlab CI](https://docs.gitlab.com/ee/ci/)

Gitlab CI is supported by [industrial_ci](https://github.com/ros-industrial/industrial_ci). We use this on one of our larger client projects. The CI system has been considerable work to configure and maintain.


### [Jenkins](https://www.jenkins.io/)

Jenkins is a relatively mature CI system that is open source. To use Jenkins we’d need to maintain an installation of it somewhere like AWS. We have used it on client projects that were not ROS projects and where the client had a team that configured and maintained the Jenkins install. The official buildfarm for ROS uses Jenkins, however, this configuration is not easily reusable. Many official ROS repos were using Travis for CI in addition to the Jenkins buildfarm and are now being migrated to GitHub Actions. The major downsides to Jenkins are the maintenance cost, the dated UI, and the cost of adapting ROS CI workflows.


## Comparison Chart

![Image of Comparison chart](/assets/images/blog_posts/2021-02-17-int-chart-color.png)


# Conclusion

We at PickNik have had the opportunity to use all these tools with various development teams due to the nature of our business.  As a result, we are able to see how each one works well and where they fall short. In our experience, GitHub provides the best experience for the development team, the lowest time cost for repos hosting and continuous integration, the most up-to-date view of the project for project managers, and is best supported by existing tooling for ROS projects.  We use GitHub for all of our internal development, for our open source work, and the primary way we collaborate on customer projects.
