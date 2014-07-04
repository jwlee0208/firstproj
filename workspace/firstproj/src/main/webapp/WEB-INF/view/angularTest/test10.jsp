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

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/angular/test/test10.js"></script>

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
			<h1>{{product.name}}</h1>
			<h2>{{product.price | currency}}</h2>
			<img ng-src="{{product.images[0].big}}"/><img ng-src="{{product.images[0].small}}"/>
			<img ng-src="{{product.images[1].big}}"/><img ng-src="{{product.images[1].small}}"/>

			<section ng-init="tab = 1" ng-controller="PanelController as panel">
				<ul class="nav nav-pills">
					<li ng-class="{ active:panel.isSelected(1) }"><a href ng-click="panel.selectTab(1)">상세</a></li>
					<li ng-class="{ active:panel.isSelected(2) }"><a href ng-click="panel.selectTab(2)">특징</a></li>
					<li ng-class="{ active:panel.isSelected(3) }"><a href ng-click="panel.selectTab(3)">리뷰</a></li>
				</ul>
				<div class="panel" ng-show="panel.isSelected(1)">
					<h4>상세</h4>
					<p>{{product.description}}</p>
				</div>
				<div class="panel" ng-show="panel.isSelected(2)">
					<h4>특징</h4>
					<p>{{product.specification}}</p>
				</div>
				<div class="panel" ng-show="panel.isSelected(3)">
					<h4>리뷰</h4>
					<blockquote ng-repeat="review in product.reviews">
						<b>별 : {{review.stars}}</b>
						{{review.comment}}
						<cite class="clearfix">by : {{review.author}}</cite>
					</blockquote>
					<form name="reviewForm" ng-controller="ReviewController as reviewCtrl" ng-submit="reviewForm.$valid && reviewCtrl.addReview(product)" novalidate>
						<blockquote>
							<b>별 : {{reviewCtrl.review.stars}}</b>
							{{reviewCtrl.review.comment}}
							<cite class="clearfix">by : {{reviewCtrl.review.author}}</cite>
						</blockquote>
						<h4>Submit a review</h4>
						<fieldset class="form-group">
							<select class="form-control" 
									ng-options="stars for stars in [5,4,3,2,1]" 
									title="Stars" 
									ng-model="reviewCtrl.review.stars"
									required>
								<option value="">Rate the product</option>
								<option value="1">1 Star</option>
								<option value="2">2 Stars</option>
								<option value="3">3 Stars</option>
								<option value="4">4 Stars</option>
								<option value="5">5 Stars</option>
							</select>						
						</fieldset>
						<fieldset class="form-group">
							<textarea class="form-control" placeholder="리뷰를 입력해 주세요." title="Review" ng-model="reviewCtrl.review.comment" class="ng-pristine ng-valid" required></textarea>
						</fieldset>
						<fieldset class="form-group">
							<!-- Source before typing, with valid email  -->	
							<input type="email" class="form-control" placeholder="이메일을 입력해 주세요." ng-model="reviewCtrl.review.author" name="author" class="ng-pristine ng-valid" required/>
							<!-- Source after typing, with invalid email  -->
<!-- 							<input type="email" class="form-control" placeholder="이메일을 입력해 주세요." ng-model="reviewCtrl.review" name="author" class="ng-dirty ng-invalid" required/> -->
							<div>ReviewForm is {{reviewForm.$valid}}</div>
						</fieldset>				
						<fieldset class="form-group">
							<input type="submit" value="Submit Review" class="btn btn-primary pull-right"/>	
						</fieldset>	
					</form>
				</div>
			</section>

		</div>
	</div>
</body>
</html>
