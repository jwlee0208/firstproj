<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML>
<!--[if IE 7 ]>		 <html class="no-js ie ie7 lte7 lte8 lte9" lang="ko-KR"> <![endif]-->
<!--[if IE 8 ]>		 <html class="no-js ie ie8 lte8 lte9" lang="ko-KR"> <![endif]-->
<!--[if IE 9 ]>		 <html class="no-js ie ie9 lte9>" lang="ko-KR"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="ko-KR"> <!--<![endif]-->
<head>
<link rel="apple-touch-icon" 		sizes="57x57" 	href="/img/common/apple-icon-57x57.png">
<link rel="apple-touch-icon" 		sizes="60x60" 	href="/img/common/apple-icon-60x60.png">
<link rel="apple-touch-icon" 		sizes="72x72" 	href="/img/common/apple-icon-72x72.png">
<link rel="apple-touch-icon" 		sizes="76x76" 	href="/img/common/apple-icon-76x76.png">
<link rel="apple-touch-icon" 		sizes="114x114" href="/img/common/apple-icon-114x114.png">
<link rel="apple-touch-icon" 		sizes="120x120" href="/img/common/apple-icon-120x120.png">
<link rel="apple-touch-icon" 		sizes="144x144" href="/img/common/apple-icon-144x144.png">
<link rel="apple-touch-icon" 		sizes="152x152" href="/img/common/apple-icon-152x152.png">
<link rel="apple-touch-icon" 		sizes="180x180" href="/img/common/apple-icon-180x180.png">
<link rel="icon" type="image/png" 	sizes="192x192" href="/img/common/android-icon-192x192.png">
<link rel="icon" type="image/png" 	sizes="32x32" 	href="/img/common/favicon-32x32.png">
<link rel="icon" type="image/png" 	sizes="96x96" 	href="/img/common/favicon-96x96.png">
<link rel="icon" type="image/png" 	sizes="16x16" 	href="/img/common/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/img/common/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<title>::: Config :::</title>
<%@ include file="/WEB-INF/views/common/include.jsp"%>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/config/config.js"></script>
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/css/offcanvas.min.css">
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="menu"/>
	<div class="container" role="application">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9" role="main">			
				<tiles:insertAttribute name="body"/>
					
			</div>
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="complementary">	
				<tiles:insertAttribute name="quickConfigList"/>
			</div>	
		</div>
	</div>
	<tiles:insertAttribute name="footer"/>		
</body>

</html>