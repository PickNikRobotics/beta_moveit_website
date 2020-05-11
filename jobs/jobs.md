---
layout: page
title: Jobs
permalink: /jobs/
---
<div class="container">
    <div class="jobs-section-main">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-4">
                <h1 class="jobs-section-main-title">Work at Picknik</h1>
                <span class="jobs-section-main-title--small">Cutting edge. Dynamic. Robotics.</span>
            </div>
            <div class="col-12 col-lg-6">
                <p>
                    Tackle some of the toughest problems in a rapidly growing industry. Implement cutting edge robotic algorithms to solve important problems. See your contributions used worldwide in the open source robotics community. We leverage open source to deliver custom software solutions to our clients that take advantage of the latest algorithms, research, and techniques.
                </p>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid bg-grey">
    <div class="container">
        <div class="jobs-card-wrapper">
            <div class="jobs-card-single">
                <div class="col-12 col-xl-7">
                    <div class="img-wrapper">
                        <img src="../assets/images/team-new.jpg" alt="teamPic">
                    </div>
                </div>
                <div class="col-12 col-xl-5">
                    <div class="jobs-card-single-content">
                        <h3>We Value Our Team</h3>
                        <p>We are building a team of world-class professionals. Work-life balance is a key value for us. We work hard and smart. We believe in flexibility, freedom, internal mentorship, and the ability to work from anywhere. We take the initiative to do it right and believe in continuous improvement.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row align-items-center justify-content-center text-center">
            <div class="col-sm-12">
                <h3 class="block-section__title">Perks</h3>
            </div>
            <div class="col-sm-12 jobs-perks-wrapper">
                <div class="row">
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="jobs-perks">
                            <div class="img-wrapper">
                                <img src="../assets/images/workspace-icon-2.png" class="perksIcon">
                            </div>
                            <h5>Dream Workspaces</h5>
                            <span class="subTitle">Enjoy standing desks, multiple monitors, toy dinosaurs... whatever you need to be happy at work.</span>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="jobs-perks">
                            <div class="img-wrapper">
                                <img src="../assets/images/lunch-icon-2.png" class="perksIcon">
                            </div>
                            <h5>Free Lunch</h5>
                            <span class="subTitle">We have weekly team lunches and plenty of healthy snacks.</span>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="jobs-perks">
                            <div class="img-wrapper">
                                <img src="../assets/images/bus-bike-icon-2.png" class="perksIcon">
                            </div>
                            <h5>Bus/Bike To Work</h5>
                            <span class="subTitle">Our office is next to the downtown bus station (pass included!) and many bike paths.</span>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="jobs-perks">
                            <div class="img-wrapper">
                                <img src="../assets/images/vacation-icon-2.png" class="perksIcon">
                            </div>
                            <h5>Flexible Vacation Policy</h5>
                            <span class="subTitle">We're flexible with time off and working remotely.</span>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="jobs-perks">
                            <div class="img-wrapper">
                                <img src="../assets/images/sun-icon-2.png" class="perksIcon">
                            </div>
                            <h5>Health & 401k</h5>
                            <span class="subTitle">Boulder is the <a href="https://www.businessinsider.com/the-25-healthiest-cities-in-america-2016-7">Healthiest City In America</a> but we still offer all the standard benefits, like health + dental insurance and a 401k plan.</span>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="jobs-perks">
                            <div class="img-wrapper">
                                <img src="../assets/images/location-icon-2.png" class="perksIcon">
                            </div>
                            <h5>Location</h5>
                            <span class="subTitle">Boulder's location in the foothills of the Rockies gives you easy access to all your favorite outdoor activities.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="collapses-wrapper">
        <h3 class="collapses__title">Open Positions</h3>
        <div id="accordion" class="no-border-bottom">
        <script src='https://www.workable.com/assets/embed.js' type='text/javascript'></script>
        <script type='text/javascript' charset='utf-8'>
                whr(document).ready(function(){
                        whr_embed(340394, {detail: 'descriptions', base: 'jobs', zoom: 'state', grouping: 'none'});
                });
                // Open job in a new tab
                $(document).on('click', 'li.whr-item a', function(e) {
                e.preventDefault();
                window.open(this.href, '_blank');
                });
                $(document).ready(checkContainer);
                function checkContainer () {
                  if($('div.whr-description').is(':visible')){ //if the container is visible on the page
                    // Enable accordian
                    var divs = $('div.whr-description').hide()
                    var h2s=$('h3.whr-title').click(function () {
                                h2s.not(this).removeClass('active')
                                $(this).toggleClass('active')
                                divs.not($(this).next().next()).slideUp()
                                $(this).next().next().slideToggle()
                                return false; //Prevent the browser jump to the link anchor
                            });
                    // Add apply now button
                    var whr_items = document.getElementsByClassName('whr-item')
                    for(var whr_item of whr_items)
                    {
                        var whr_desc = whr_item.getElementsByClassName('whr-description')[0]
                        var node = document.createElement("a");
                        node.target = "_blank"
                        node.className = "btn"
                        node.href = whr_item.getElementsByTagName('a')[0].href
                        node.text = "APPLY NOW"
                        whr_desc.appendChild(node)
                        var job_place_node = document.createElement("div");
                        job_place_node.className = "jobs-card-place"
                        job_place_node.textContent = whr_item.getElementsByClassName('whr-location')[0].innerText
                        whr_desc.prepend(job_place_node)
                        whr_item.getElementsByClassName('whr-location')[0].remove()
                    }
                    // Remove unnecessary br tags
                    var whr_items = document.getElementsByClassName('whr-item')
                    for(var whr_item of whr_items)
                    {
                        var whr_desc = whr_item.getElementsByClassName('whr-description')[0]
                        var br_tags = whr_desc.getElementsByTagName('br')
                        for(var br_tag_index = br_tags.length - 1; br_tag_index >= 0; br_tag_index--)
                        {
                            br_tags[br_tag_index].remove()
                        }
                    }
                  } else {
                    setTimeout(checkContainer, 50); //wait 50 ms, then try again
                  }
                }
        </script>
        <div id="whr_embed_hook"></div>
        </div>
    </div>
</div>
