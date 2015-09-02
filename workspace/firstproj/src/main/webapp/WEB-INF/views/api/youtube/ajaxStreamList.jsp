<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:choose>
<c:when test="${!empty streamList}">
	<c:set var="streamListSize" value="${fn:length(streamList)}"/>
	<c:forEach var="streamInfo" items="${streamList}" varStatus="index">
	<div class="embed-responsive embed-responsive-16by9">
		<h4>title : <small>${streamInfo.snippet.title}</small></h4>
		<iframe width="420" height="315" src="http://www.youtube.com/embed/${streamInfo.id.videoId}?autoplay=0"></iframe>
	</div>
	</c:forEach>
</c:when>
<c:otherwise>
	<script>
		hideDiv('stream');
	</script>
</c:otherwise>
</c:choose>