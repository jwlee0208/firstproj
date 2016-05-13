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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/angular.min.js"></script>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/angular/test/test12.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/angular/test/product.js"></script>



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

			<product-panels></product-panels>
		</div>
	</div>
</body>
</html>
