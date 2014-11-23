<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1 id="btn-groups" class="page-header">Player Detail Info.</h1>
<!-- 	<ol class="breadcrumb"> -->
<!-- 	  <li><a href="javascript:;" onclick="javascript:goHome();">Home</a></li> -->
<!-- 	  <li> -->
<!-- 	  	  <a href="javascript:;"> -->
<%-- 			<c:if test="${boardId eq 1}">자유게시판</c:if> --%>
<%-- 			<c:if test="${boardId eq 2}">Q&A</c:if> --%>
<%-- 			<c:if test="${boardId eq 3}">기타게시판</c:if>	 --%>
<!-- 		  </a>		   -->
<!-- 	  </li> -->
<!-- 	  <li class="active">Article</li> -->
<!-- 	</ol>		 -->

	${userInfo.userNm}
</div>

</body>
</html>