<!DOCTYPE html>
<html ng-app="website">
<head>
    <meta charset="utf-8">
    <title>AngularJS Animate Slider</title>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slideshow.css">
</head>

<body ng-controller="MainCtrl">

<div class="container slider">
    <img ng-repeat="slide in slides" class="slide slide-animation nonDraggableImage"
         ng-swipe-right="nextSlide()" ng-swipe-left="prevSlide()"
         ng-hide="!isCurrentSlideIndex($index)" ng-src="{{slide.image}}">

    <a class="arrow prev" href="#" ng-click="nextSlide()"></a>
    <a class="arrow next" href="#" ng-click="prevSlide()"></a>
    <nav class="nav-slide">
        <div class="wrapper">
            <ul class="dots">
                <li class="dot" ng-repeat="slide in slides">
                    <a href="#" ng-class="{'active':isCurrentSlideIndex($index)}"
                       ng-click="setCurrentSlideIndex($index);">{{slide.description}}</a></li>
            </ul>
        </div>
    </nav>
</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-animate.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-touch.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.10.3/TweenMax.min.js"></script>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/angular/slide/slideshow.js"></script>

</body>
</html>
