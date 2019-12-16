# picknik.ai

The website https://picknik.ai/

[![Build Status](https://travis-ci.com/PickNikRobotics/picknik.ai.svg?token=o9hPQnr2kShM9ckDs6J8&branch=master)](https://travis-ci.com/PickNikRobotics/picknik.ai)

The website is hosted on **Github Pages** using Markdown format. The master branch is ``gh-pages`` as required by Github, and changes made to that branch become immediately available online.

## Build Locally on Ubuntu

Will install Ruby, Jekyll, build the website, and server the website on localhost:

    ./build_locally.sh

### Run Travis Tests Locally

Will check all links are valid, etc:

    ./build_locally.sh travis

### Contribution Checklist

Ensure your contributions / pull requests are high quality by following this best practice list:

- Does the page correctly use h1, h2, h3 tags?
- Are all images compressed properly? Checkout [TinyPNG](https://tinypng.com/)
- Do all images have Alt tags? This greatly helps SEO.
- Are new pages (except blog posts) being added to the sitemap?
- All external links off picknik.ai should open in a new window ``target="_blank"``