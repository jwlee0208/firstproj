<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<section>
				<ul class="nav nav-pills">
					<li ng-class="{ active:panels.isSelected(1) }"><a href ng-click="panels.selectTab(1)">상세</a></li>
					<li ng-class="{ active:panels.isSelected(2) }"><a href ng-click="panels.selectTab(2)">특징</a></li>
					<li ng-class="{ active:panels.isSelected(3) }"><a href ng-click="panels.selectTab(3)">리뷰</a></li>
				</ul>
				<!-- page include -->
				<div class="panel" ng-show="panels.isSelected(1)" product-description></div>
				<!-- page include -->
				<div class="panel" ng-show="panels.isSelected(2)" product-specification></div>
				<div class="panel" ng-show="panels.isSelected(3)">
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