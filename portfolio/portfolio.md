---
layout: page
title: Portfolio
permalink: /portfolio/
---
<div class="container">
    <div class="moveit-section-main portfolio-section-main">
        <div class="row align-items-center justify-content-center">
            <div class="col-12 col-lg-5">
                <h1 class="ros-section-main-title">Portfolio</h1>
                <h2 class="ros-section-sub-title">Some of the biggest and most progressive companies in the world choose PickNik.</h2>
            </div>
            <div class="col-12 col-lg-5 offset-lg-1">
              <img class="moveit-section-main-image" src="/assets/images/ur5-robot.png" alt="UR 5 robot image">
            </div>
        </div>
    </div>
</div>
<div class="container-fluid bg-grey">
  <div class="container block-padding-100">
    <div class="row justify-content-between">
      <div class="col-sm-12">
        <h3 class="block-section__title text-center mb-5">Success stories</h3>
      </div>
      {% assign case-studies = site.case-studies | sort: 'cs_order' %}
      {% for case in case-studies limit:8 %}
        <div class="blog-card-small blog-card-small--portfolio-no-resize">
          <div class="blog-single">
            <a href="{{ case.url }}">
              {% if case.media_type == 'video' %}
              <div class="blog-image-wrapper">
                <iframe style="width:100%;" height="315" src="{{ case.media_link }}" frameborder="0" allowfullscreen></iframe>
              </div>
              {% elsif case.media_type == 'image' %}
              <div class="blog-image-wrapper real-image" style="background-image: url('{{ case.media_link }}');">
              </div>
              {% else %}
              <div class="blog-image-wrapper">
                <img src="/assets/images/default-image.jpg" style="width:100%;">
              </div>
              {% endif %}
              <div class="blog-text-wrapper">
                <p class="blog-company-wrapper"><span>Case study</span>{{ case.company}}</p>
                <h4>{{ case.title | truncate: 50}}</h4>
              </div>
            </a>
          </div>
        </div>
      {% endfor %}
      <div class="portfolio-card--success-story">
        <div class="portfolio-card-single">
          <h2>Be Our Next Success Story</h2>
          <p>Do you have a project or engineering<br>challenge you'd like to discuss?</p>
          <a href="/connect/" class="btn btn-white mt-4 text-uppercase text-center">Say hello</a>
        </div>
      </div>
    </div>
    <div class="others-case-studies">
      <span class="btn btn-portfolio btn-case-studies">Show me more case studies</span>
      <div class="row justify-content-between others-case-studies__cards hide">
        {% for case in site.case-studies offset:8 %}
          <div class="blog-card-small blog-card-small--portfolio-no-resize">
            <div class="blog-single">
              <a href="{{ case.url }}">
                {% if case.media_type == 'video' %}
                <div class="blog-image-wrapper">
                  <iframe style="width:100%;" height="315" src="{{ case.media_link }}" frameborder="0" allowfullscreen></iframe>
                </div>
                {% elsif case.media_type == 'image' %}
                <div class="blog-image-wrapper real-image" style="background-image: url('{{ case.media_link }}');">
                </div>
                {% else %}
                <div class="blog-image-wrapper">
                  <img src="/assets/images/default-image.jpg" style="width:100%;">
                </div>
                {% endif %}
                <div class="blog-text-wrapper">
                  <p class="blog-company-wrapper"><span>Case study</span>{{ case.company}}</p>
                  <h4>{{ case.title | truncate: 50}}</h4>
                </div>
              </a>
            </div>
          </div>
        {% endfor %}
        </div>
    </div>
  </div>
</div>
<div class="container block-padding-100">
    <div class="row align-items-center justify-content-between text-center">
        <div class="col-sm-12">
            <h3 class="block-section__title">Our Clients</h3>
        </div>
        <div class="col-sm-12">
          <img class="our-works-logos" src="/assets/images/google-logo.png" alt="Google logo">
          <img class="our-works-logos" src="/assets/images/our-clients/kindred.png" alt="Kindred logo">
          <img class="our-works-logos" src="/assets/images/our-clients/vicarious.png" alt="Vicarious logo">
          <img class="our-works-logos" src="/assets/images/our-clients/carbon.png" alt="Carbon Robotics logo">
          <img class="our-works-logos" src="/assets/images/our-clients/franka-logo.png" alt="Franka Emika logo">
          <img class="our-works-logos" src="/assets/images/our-clients/sesto.png" alt="Sesto Robotics logo">
          <img class="our-works-logos" src="/assets/images/our-clients/houston.png" alt="Houston Mechatronics logo">
          <img class="our-works-logos" src="/assets/images/our-clients/Tethers-Unlimited.png" alt="Tethers Unlimited logo">
          <img class="our-works-logos" src="/assets/images/nasa-logo.png" alt="NASA logo">
          <img class="our-works-logos" src="/assets/images/our-clients/iunu.png" alt="IUNU logo">
          <img class="our-works-logos" src="/assets/images/our-clients/rtr.png" alt="Realtime Robotics logo">
          <img class="our-works-logos" src="/assets/images/our-clients/rr-logo.png" alt="Rapyuta Robotics logo">
          <img class="our-works-logos" src="/assets/images/our-clients/tormach.png" alt="Tormach logo">
          <img class="our-works-logos" src="/assets/images/our-clients/numurus.png" alt="Numurus logo">
          <img class="our-works-logos" src="/assets/images/our-clients/amazon.png" alt="Amazon logo">
          <img class="our-works-logos" src="/assets/images/our-clients/tomahawk.png" alt="Tomahawk Robotics logo">
          <img class="our-works-logos" src="/assets/images/our-clients/skyline.png" alt="Skyline Robotics logo">
          <img class="our-works-logos" src="/assets/images/our-clients/acutronic.png" alt="Acutronic Robotics logo">
          <img class="our-works-logos" src="/assets/images/our-clients/dusty-robotics.png" alt="Dusty Robotics logo">
          <img class="our-works-logos" src="/assets/images/plusone-logo.jpg" alt="Plus One logo">
          <img class="our-works-logos" src="/assets/images/our-clients/aeolus.png" alt="Aeolus logo">
          <img class="our-works-logos" src="/assets/images/our-clients/creator.png" alt="Creator logo">
          <img class="our-works-logos" src="/assets/images/our-clients/hello-robot-logo.png" alt="Hello Robot logo">
          <img class="our-works-logos" src="/assets/images/our-clients/stratom.png" alt="Stratom logo">
          <img class="our-works-logos" src="/assets/images/our-clients/appliedlogix.png" alt="AppliedLogix logo">
          <img class="our-works-logos" src="/assets/images/our-clients/bastian.png" alt="Bastian logo">
          <img class="our-works-logos" src="/assets/images/our-clients/thorlabs.png" alt="Thorlabs logo">
          <img class="our-works-logos" src="/assets/images/our-clients/maxar.png" alt="Maxar logo">
          <img class="our-works-logos" src="/assets/images/our-clients/SSInnovations.png" alt="SS Innovations logo">
          <img class="our-works-logos" src="/assets/images/our-clients/samsung.png" alt="Samsung logo">
          <img class="our-works-logos" src="/assets/images/our-clients/re.png" alt="RE2 Robotics logo">
          <img class="our-works-logos" src="/assets/images/our-clients/omni-logo.png" alt="Omni Robotics logo">
          <img class="our-works-logos" src="/assets/images/our-clients/simple-homes-logo.svg" alt="Simple Homes logo">
          <img class="our-works-logos" src="/assets/images/our-clients/hyundai-logo.svg" alt="Hyundai logo">
          <!-- <img class="our-works-logos" src="/assets/images/our-clients/beyond-logo.png" alt="Beyond Imagination logo"> -->
        </div>
    </div>
</div>
<div class="container-fluid bg-grey">
  <div class="container block-padding-100">
      <div class="row align-items-center justify-content-center text-center">
          <div class="col-sm-12 mb-3">
            <h3 class="block-section__title mb-5" id="partners">Our Partners</h3>
          </div>
          <div class="open-source-organizations">
            <a href="https://motive.ai/" target="_blank">
              <img src="/assets/images/motive-icon.png" alt="Motive Mechatronics" />
            </a>
            <h4>Motive</h4>
            <p>Partner in building custom robot arm hardware</p>
          </div>
          <div class="open-source-organizations">
            <a href="https://www.openrobotics.org/" target="_blank">
              <img src="/assets/images/open-robotics-logo.png" alt="Open Robotics logo" />
            </a>
            <h4>Open Robotics</h4>
            <p>Leaders of the ROS robotics SDK and Gazebo simulation projects</p>
          </div>
          <div class="open-source-organizations">
            <a href="https://www.intel.com/" target="_blank">
              <img src="/assets/images/our-clients/intel-logo.svg" alt="Intel logo" />
            </a>
            <h4>Intel</h4>
            <p>Open source partner in developing MoveIt and MoveIt Calibration</p>
          </div>
          <div class="open-source-organizations">
            <a href="https://appliedlogix.com/" target="_blank">
              <img src="/assets/images/our-clients/appliedlogix.png" alt="AppliedLogix logo"/>
            </a>
            <h4>AppliedLogix</h4>
            <p>Partner in building complex electronics and embedded systems</p>
          </div>
          <div class="open-source-organizations">
            <a href="https://hello-robot.com/" target="_blank">
              <img src="/assets/images/hello-robot-partner.png" alt="Hello Robotics logo"/>
            </a>
            <h4>Hello Robot</h4>
            <p>PickNik is an integration partner of Hello's Stretch R1 mobile manipulator</p>
          </div>
          <!-- <div class="col-sm-12 col-md-6 col-lg-4">
            <div class="open-source-organizations">
              <img src="/assets/images/logo.jpg" alt="Picknik logo" />
              <h4>Autoware Foundation</h4>
              <p>Develops autonomous cars and<br/>self-driving mobility using ROS</p>
            </div>
          </div> -->
      </div>
  </div>
</div>
<div class="container-fluid open-source-support-bg">
  <div class="container block-padding-80">
    <div class="row align-items-center justify-content-center">
      <div class="col-12 col-lg-8">
        <div class="moveit-section text-center">
          <h2 class="moveit-section__title text-white">Interested in partnering with us? </h2>
          <div class="moveit-section__content text-white">
            <a href="/connect/" class="btn btn-white mt-4 text-uppercase text-center">Contact us</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
