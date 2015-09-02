<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:choose>
<c:when test="${!empty slideList}">
	<div class="embed-responsive embed-responsive-16by9">
	<c:set var="slideListSize" value="${fn:length(slideList)}"/>
<%-- 	<c:set var="expandedYn" value="true"/> --%>
	<c:forEach var="slideInfo" items="${slideList}" varStatus="index">
		
		<h4>title : <small>${slideInfo.title}</small></h4>
		<c:out value="${slideInfo.embed}" escapeXml="false"/>
		<c:if test="${slideListSize > 1}">
<c:if test="${index.count eq 1}">
<!-- 		<input type="button" id="seeMoreSlideBtn" class="btn btn-success" value="See More Slides"/>	 -->
		<div id="slideListDiv" >
</c:if>
<%-- <c:if test="${index.count > 1}"> --%>
<%-- 		<c:set var="expandedYn" value="false"/> --%>
<%-- </c:if> --%>
		</c:if>
		<c:if test="${slideListSize > 1 && index.count eq slideListSize}">
		</div>	
		</c:if>
	</c:forEach>
	</div>
</c:when>
<c:otherwise>
	<script>
		hideDiv('slide');
	</script>
</c:otherwise>
</c:choose>
<script>
// $(function(){
// 	$("#seeMoreSlideBtn").click(function(){
// 		if($("#slideListDiv").hasClass("in")){
// 			$("#seeMoreSlideBtn").val("See More Slides");
// 		}else{
// 			$("#seeMoreSlideBtn").val("Hide Slides");
// 		}

// 		$(".collapse").collapse("toggle");
	
// 	});
// });
</script>