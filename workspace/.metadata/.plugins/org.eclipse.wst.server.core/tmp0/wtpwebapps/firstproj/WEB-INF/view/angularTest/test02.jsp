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

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/angular/test/test02.js"></script>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
</head>
<body>
	<h1>Product Info</h1>
	<div ng-controller="StoreController as store">
		<table width="100%">
			<colgroup><col width="30%"/><col width="70%"/></colgroup>
			<tr>
				<td>Product</td>
				<td>Price</td>
			</tr>
			<tr>
				<td><em>{{store.product.name}}</em></td>
				<td><em>{{store.product.price}}</em></td>
			</tr>
		</table>
	</div>
</body>
</html>
