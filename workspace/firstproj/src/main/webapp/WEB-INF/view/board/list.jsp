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
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<!-- bootstrap -->
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-theme.min.css">
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	
	<c:set var="list" value="${boardList}"/>
	<table style="width:100%;">
		<colgroup><col width="33%"/><col width="33%"/><col width="34%"/></colgroup>
		<tr>
			<th><fieldset class="form-group">제목</fieldset></th>
			<th><fieldset class="form-group">내용</fieldset></th>
			<th><fieldset class="form-group">작성자</fieldset></th>
		</tr>	
		<tbody>
	<c:choose>
		<c:when test="${null ne list && list.size() > 0}">
			<c:forEach var="content" items="${list}">
				<tr>
					<td><fieldset class="form-group">${content.title}</fieldset></td>
					<td><fieldset class="form-group">${content.content}</fieldset></td>
					<td><fieldset class="form-group">${content.authorNm}</fieldset></td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
				<tr class="list-group-item">
					<td colspan="3"><fieldset class="form-group">작성된 내용이 없습니다.</fieldset></td>
				</tr>
		</c:otherwise>
	</c:choose>
	</tbody>
	</table>
</body>
</html>