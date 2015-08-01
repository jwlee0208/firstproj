<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="expires" content="-1" >
<link rel="icon" href="/img/common/favicon.ico">
<title>LinkedNest - Link Between Player With Club</title>

<%@ include file="/WEB-INF/views/common/include.jsp"%>

</head>
<body>
	<tiles:insertAttribute name="header"/>
	
	<tiles:insertAttribute name="menu"/>
	
	<div class="container-fluid" role="application">
		<tiles:insertAttribute name="body"/>
	</div>	
	<tiles:insertAttribute name="footer"/>
</body>

</html>