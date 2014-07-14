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
	<input type="hidden" id="selectedBoardId" name="selectedBoardId"/>
	<input type="hidden" id="boardCategory" name="boardCategory" 	value="${contentInfo.boardCategory}"/>
	<input type="hidden" id="prevBoardId" 	name="prevBoardId" 		value="${prevContentInfo.boardId}"/>
	<input type="hidden" id="nextBoardId" 	name="nextBoardId" 		value="${nextContentInfo.boardId}"/>
	<div class="container">
		<div class="panel panel-primary">	
			<div class="panel-heading">
				<h4 class="panel-title">${contentInfo.title}</h4>
			</div>
			<div class="panel-body">
				${contentInfo.content}
			</div>	
			<div class="panel-footer">
				<ul class="pager">
					<c:if test="${prevContentInfo.boardId ne null}">
					<li><a href="javascript:void(0);" id="previous">Previous</a></li>
					</c:if>
					<c:if test="${nextContentInfo.boardId ne null}">
					<li><a href="javascript:void(0);" id="next">Next</a></li>	
					</c:if>
				</ul>
			
				<input type="button" class="btn btn-primary pull-right" id="goToModify" value="수정"/>
				<input type="button" class="btn" id="goToList" value="목록"/>	
			</div>
		</div>
	</div>
	</form>
</body>
</html>