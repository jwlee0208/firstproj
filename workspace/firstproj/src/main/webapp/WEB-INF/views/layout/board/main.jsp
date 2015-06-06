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
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/ui.menu.js"></script> --%>

</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
</body>

</html>