<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML>
<!--[if IE 7 ]>		 <html class="no-js ie ie7 lte7 lte8 lte9" lang="ko-KR"> <![endif]-->
<!--[if IE 8 ]>		 <html class="no-js ie ie8 lte8 lte9" lang="ko-KR"> <![endif]-->
<!--[if IE 9 ]>		 <html class="no-js ie ie9 lte9>" lang="ko-KR"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="ko-KR"> <!--<![endif]-->
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" 		content="IE=Edge" />
<meta http-equiv="Pragma" 				content="no-cache">
<meta http-equiv="expires" 				content="-1" >
<meta name="viewport" 					content="width=device-width, initial-scale=1">
<link rel="icon" href="/img/common/favicon.ico">
<title>LinkedNest - Link Between Player With Club</title>

<%@ include file="/WEB-INF/views/common/include.jsp"%>

</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="menu"/>
	
	<div class="container" role="main">
		<tiles:insertAttribute name="body"/>
	</div>	
	<tiles:insertAttribute name="footer"/>
</body>

</html>