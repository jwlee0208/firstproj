<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" 	content="IE=Edge" />
<meta http-equiv="Pragma" 			content="no-cache">
<meta http-equiv="expires" 			content="-1" >
<meta name="description" content="JW">
<meta name="keywords" content="JW">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="/img/common/favicon.ico">
<title>LinkedNest - Link Between Player With Club</title>
<%@ include file="/WEB-INF/views/common/include.jsp"%>
</head>
<body>
	<div class="container-fluid">
	<tiles:insertAttribute name="body"/>
	</div>
	<tiles:insertAttribute name="footer"/>
</body>
</html>