<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link rel="icon" href="/img/common/favicon.ico">
<title>Let's Try Out</title>
<%@ include file="/WEB-INF/views/common/include.jsp"%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/offcanvas.css">
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="menu"/>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9" role="main">			
				<tiles:insertAttribute name="body"/>
			</div>
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="complementary">	
				<tiles:insertAttribute name="quickBoardList"/>
			</div>	
		</div>
	</div>	

	<tiles:insertAttribute name="footer"/>
</body>

</html>