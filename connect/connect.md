---
layout: page
title: Connect
permalink: /connect/
---

<div class="intro" id="intro">
        <div class="introCol1D">
            <script src='https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCZXCRwRpwuj2OyFK-6UryZhGy21RpOnb4'></script>
            <div style='overflow:hidden;height:500px;width:100%;'>
                <div id='gmap_canvas' style='height:450px;width:100%;'></div>
                <style>
                    #gmap_canvas img {
                        max-width: none!important;
                        background: none!important
                    }
                </style>
            </div> <a href='https://embedmaps.org/'>&nbsp;</a>
            <script type='text/javascript' src='https://embedmaps.com/google-maps-authorization/script.js?id=e253f669ba1ffff4e12c837c99aa6f3efd873ce0'></script>
            <script type='text/javascript'>
                function init_map() {
                    var myOptions = {
                        zoom: 4,
                        center: new google.maps.LatLng(40.01768, -105.279576),
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
                    marker = new google.maps.Marker({
                        map: map,
                        position: new google.maps.LatLng(40.01768, -105.279576)
                    });
                    google.maps.event.addListener(marker, 'click', function() {
                        infowindow.open(map, marker);
                    });
                    infowindow.open(map, marker);
                }
                google.maps.event.addDomListener(window, 'load', init_map);
            </script>
        </div>
        <div class="introCol2C">
            <div class="introPadding">
                <div class="introTitle">CONNECT</div>
                <div class="line"></div>
                <div class="introSubText2">
                    Let us know how we can help. Request a free consultation today:
                </div>
                <img class="connectIcon" src="../images/connect-mail.jpg">
                <a class="connectText" href="mailto:hello@picknik.ai">hello@picknik.ai</a>
                <div class="connectMarg"></div>
                <img class="connectIcon" src="../images/connect-github.png">
                <a class="connectText" target="_blank" href="https://github.com/PickNikRobotics/">GitHub</a>
                <div class="connectMarg"></div>
                <img class="connectIcon" src="../images/connect-phone.jpg">
                <div class="connectText2">720.513.2221</div>
                <div class="connectMarg"></div>
                <img class="connectIcon" src="../images/connect-twitter.jpg">
                <a class="connectText" target="_blank" href="https://twitter.com/PickNikRobotics">@PickNikRobotics</a>
                <div class="connectMarg"></div>
                <img class="connectIcon" src="../images/connect-linkedin.png">
                <a class="connectText" target="_blank" href="https://www.linkedin.com/company/16217177/">LinkedIn</a>
                <div class="connectMarg"></div>
                <img class="connectIcon" src="../images/office-icon.png">
                <a class="connectText" target="_blank" href="https://maps.google.com/?q=1942 Broadway, Suite 314 Boulder, Colorado 80302">
                    <span id="addressText1">1942 Broadway, Suite 314</span> <br>
                    <span id="addressText2">Boulder, Colorado 80302</span></a>
                <div class="connectMarg"></div>
            </div>
        </div>
    </div>
