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
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/view.js"></script>
</head>
<body>
	<form id="viewFrm" name="viewForm" method="post">
	<input type="hidden" id="selectedArticleId" 	name="selectedArticleId"/>
	<input type="hidden" id="boardId" 				name="boardId" 				value="${contentInfo.boardId}"/>
	<input type="hidden" id="prevArticleId" 		name="prevArticleId" 		value="${prevContentInfo.articleId}"/>
	<input type="hidden" id="nextArticleId" 		name="nextArticleId" 		value="${nextContentInfo.articleId}"/>

	<h1 id="btn-groups" class="page-header">Article</h1>
	
	<ol class="breadcrumb">
	  <li><a href="javascript:;" onclick="javascript:goHome();">Home</a></li>
	  <li>
	  	  <a href="javascript:;">
			<c:if test="${boardId eq 1}">자유게시판</c:if>
			<c:if test="${boardId eq 2}">Q&A</c:if>
			<c:if test="${boardId eq 3}">기타게시판</c:if>	
		  </a>		  
	  </li>
	  <li class="active">Article</li>
	</ol>		

		<div class="panel panel-default">	
			<div class="panel-heading">
				<h4 class="panel-title">${contentInfo.title}</h4>
			</div>
			<div class="panel-body" style="min-height: 300px;">
				${contentInfo.content}
			</div>	
<!-- 			<div class="panel-footer"> -->
<!-- 				<ul class="pager"> -->
<%-- 					<c:if test="${prevContentInfo.articleId ne null}"> --%>
<!-- 					<li><a href="javascript:void(0);" id="previous">Previous</a></li> -->
<%-- 					</c:if> --%>
<%-- 					<c:if test="${nextContentInfo.articleId ne null}"> --%>
<!-- 					<li><a href="javascript:void(0);" id="next">Next</a></li>	 -->
<%-- 					</c:if> --%>
<!-- 				</ul>			 -->
<!-- 			</div> -->
		</div>


		<div class="btn-group btn-group-justified" style="padding-bottom : 20px;">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="goToList" value="목록"/>
			</div>
			<c:if test="${prevContentInfo.articleId ne null}">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="previous" value="Previous"/>			
			</div>
			</c:if>
			<c:if test="${nextContentInfo.articleId ne null}">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="next" value="Next"/>		
			</div>
			</c:if>
			<div class="btn-group">
				<input type="button" class="btn btn-default pull-right" id="goToModify" value="수정"/>
			</div>			
		</div>
	</form>
</body>
</html>