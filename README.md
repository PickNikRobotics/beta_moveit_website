# picknik.ai

The website https://picknik.ai/

[![Build Status](https://travis-ci.com/PickNikRobotics/picknik.ai.svg?token=o9hPQnr2kShM9ckDs6J8&branch=master)](https://travis-ci.com/PickNikRobotics/picknik.ai)

The website is hosted on **Github Pages** using Markdown format. The master branch is ``gh-pages`` as required by Github, and changes made to that branch become immediately available online.

## Images

Please compress images before loading to repo, we recommend [https://tinypng.com/](https://tinypng.com/). High resolution images from professional photographers will kill load times.

## YouTube Videos

Please use https://www.youtube-nocookie.com/ instead of  https://www.youtube.com/. Explanation [here](https://github.com/ros-planning/moveit.ros.org/issues/232).

## Build Locally on Ubuntu

Will install Ruby, Jekyll, build the website, and server the website on localhost:

    ./build_locally.sh

If the dependencies are already installed (you've already run the previous command before locally):

    ./build_locally.sh noinstall

If Jekyll is for some reason still running in the background, kill to prevent port conflicts:

   pkill -9 -f jekyll

### Run Travis Tests Locally

Will check all links are valid, etc:

    ./build_locally.sh travis

## Using The Test Server

We currently have one test server at beta01.picknik.ai. We could add more if needed.

### Setup

Add git remote:

    git remote add beta01 git@github.com:PickNikRobotics/beta01.picknik.ai.git

### Usage

For a particular feature branch:

    git push beta01 FEATURE_BRANCH:master -f

Then go to repo settings:

    https://github.com/PickNikRobotics/beta01.picknik.ai/settings

And change the 'Custom Domain' back to the non-live website:

    beta01.picknik.ai

And click Save. Now wait a minute and refresh.

## Contribution Checklist

Ensure your contributions / pull requests are high quality by following this best practice list:

- Does the page correctly use h1, h2, h3 tags?
- Is the title tag 30-60 characters?  This greatly helps SEO.
- Is the meta description unique?  This greatly helps SEO.
- Are all images compressed properly? Checkout [TinyPNG](https://tinypng.com/)
- Do all images have Alt tags? This greatly helps SEO.
- Are new pages (except blog posts) being added to the sitemap?
- All external links off picknik.ai should open in a new window ``target="_blank"``
- Adding a hypertext reference to Vimeo will make HTML-Proofer fails, a workaround is to use an inline frame (`iframe` tag) for embedding the video in the page [Example](https://github.com/PickNikRobotics/picknik.ai/blame/master/_posts/2019-12-20-moveit-grasps.md#L29)
- Each markdown page should have a unique description [example](https://github.com/PickNikRobotics/picknik.ai/blame/master/_posts/2019-12-20-moveit-grasps.md#L9)
