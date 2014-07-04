<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>	  
<!DOCTYPE HTML>
<html ng-app="store">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<!-- bootstrap -->
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-theme.min.css">
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>

<!-- angular js -->
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/angular.min.js"></script>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/angular/test/test11.js"></script>

<style>
	.ng-pristine.ng-valid 	{ border-color : #fa787e }
	.ng-pristine.ng-invalid { border-color : gray }
	.ng-dirty.ng-valid 	  	{ border-color : #78fa89 }
	.ng-dirty.ng-invalid 	{ border-color : gray }
</style>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
</head>
<body ng-controller="StoreController as store" >
	<div class="list-group">
		<div class="list-group-item" ng-repeat="product in store.products">
			<!-- page include -->
			<product-title></product-title>
			<!-- page include -->
			<product-images></product-images>

			<section ng-init="tab = 1" ng-controller="PanelController as panel">
				<ul class="nav nav-pills">
					<li ng-class="{ active:panel.isSelected(1) }"><a href ng-click="panel.selectTab(1)">상세</a></li>
					<li ng-class="{ active:panel.isSelected(2) }"><a href ng-click="panel.selectTab(2)">특징</a></li>
					<li ng-class="{ active:panel.isSelected(3) }"><a href ng-click="panel.selectTab(3)">리뷰</a></li>
				</ul>
				<!-- page include -->
				<div class="panel" ng-show="panel.isSelected(1)" product-description></div>
				<!-- page include -->
				<div class="panel" ng-show="panel.isSelected(2)" product-specification></div>
				<div class="panel" ng-show="panel.isSelected(3)">
					<h4>리뷰</h4>
					<blockquote ng-repeat="review in product.reviews">
						<b>별 : {{review.stars}}</b>
						{{review.comment}}
						<cite class="clearfix">by : {{review.author}}</cite>
					</blockquote>
					<form name="reviewForm" ng-controller="ReviewController as reviewCtrl" ng-submit="reviewForm.$valid && reviewCtrl.addReview(product)" novalidate>
						<!-- page include -->
						<product-review></product-review>
					</form>
				</div>
			</section>

		</div>
	</div>
</body>
</html>
