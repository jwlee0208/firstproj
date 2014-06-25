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

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/angular/test/test06.js"></script>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
</head>
<body ng-controller="StoreController as store" >
	<div class="list-group">
		<div class="list-group-item" ng-repeat="product in store.products">
			<h1>{{product.name}}</h1>
			<h2>{{product.price | currency}}</h2>
			<img ng-src="{{product.images[0].big}}"/><img ng-src="{{product.images[0].small}}"/>
			<img ng-src="{{product.images[1].big}}"/><img ng-src="{{product.images[1].small}}"/>

			<section ng-init="tab = 1">
				<ul class="nav nav-pills">
					<li ng-class="{ active:tab === 1 }"><a href ng-click="tab = 1">상세</a></li>
					<li ng-class="{ active:tab === 2 }"><a href ng-click="tab = 2">특징</a></li>
					<li ng-class="{ active:tab === 3 }"><a href ng-click="tab = 3">리뷰</a></li>
				</ul>
			</section>
			<div class="panel" ng-show="tab===1">
				<h4>상세</h4>
				<p>{{product.description}}</p>
			</div>
			<div class="panel" ng-show="tab===2">
				<h4>특징</h4>
				<p>{{product.specification}}</p>
			</div>
			<div class="panel" ng-show="tab===3">
				<h4>리뷰</h4>
				<p>{{product.review}}</p>
			</div>

		</div>
	</div>
</body>
</html>
