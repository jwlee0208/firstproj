<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>진원's Web</title>
<%@ include file="/WEB-INF/view/common/include.jsp"%>
</head>
<body>
<%-- 	<tiles:insertAttribute name="body"/>	 --%>
	<tiles:insertDefinition name=".pop"/>
</body>
</html>