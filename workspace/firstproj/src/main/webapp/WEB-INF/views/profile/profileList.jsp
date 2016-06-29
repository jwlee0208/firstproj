<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"	%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" 	content="IE=Edge" />
<meta name="viewport" 				content="width=device-width, initial-scale=1">
<meta name="title" 					content="Player List"/>
<meta name="author" 				content="Lee Jinwon"/>
<meta name="description" 			content="Checkout Future's MVP"/>
<meta name="robots" 				content="index,follow" /> 
<meta name="keywords" 				content="blog, baseball, link, player, profile"/>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/profile/profileList.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/profile/profileView.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/pagination.css">
<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/profileList.css">
</head>
<body>
<form id="listFrm" name="listFrm" method="post">
	<div class="container">
	
		<input type="hidden" id="selectedAttrElemId" 	name="selectedAttrElemId" />
		<input type="hidden" id="selectedAttrId" 		name="selectedAttrId" />
		<input type="hidden" id="selectedCatId" 		name="selectedCatId" />
		<input type="hidden" id="page"					name="page"	/>
		<input type="hidden" id="profileType"			name="profileType" 	value="${profileType}"/>
		<c:set var="type" value=""/>
		<c:choose>
			<c:when test="${profileType eq 1}">
				<c:set var="type" value="Player"/>
			</c:when>
			<c:when test="${profileType eq 2}">
				<c:set var="type" value="Coach"/>
			</c:when>
			<c:otherwise>
				<c:set var="type" value="Team"/>
			</c:otherwise>
		</c:choose>
		<h1 id="btn-groups" class="page-header">${type}&nbsp;&nbsp;<small>Profile List</small></h1>
		<div class="form-group">
	
			<div class="form-group" role="search">	
				<input type="hidden" 	id="searchCondition" 	name="searchCondition" value="name"/>
				<input type="hidden" 	id="searchText" 		name="searchText" />
				<input type="text" 		id="searchTextStr" 		name="searchTextStr" class="form-control ui-autocomplete-input" placeholder="<tag:message code='text.request.insert.search.keyword'/>"/>
			</div>
			
			<div class="form-group">
				<div id="areaList" style="background-color: #efefef;">
				
				</div>
			</div>
			
			<div class="form-group">
				<!--속성 & 속성 항목들에 대한 체크박스 리스트 -->
				<div id="attrElemList" style="background-color: #efefef;">
<c:choose>
	<c:when test="${!empty attrElementList}">
		<!-- attribute Info Settion -->
		<c:set var="prevAttrId" value="0"/>
		
		<c:set var="attrId" 			  		value=""/>
		<c:set var="categoryAttrElemList" 		value=""/>
		<c:set var="categoryAttrElemListLength" value="0"/>
		<!-- //attribute Info Settion -->
		
<%-- 		<c:forEach var="profileAttrElementInfo" items="${attrElementList}" varStatus="index"> --%>
		
<%-- 			<c:set var="profileAttrId" 				value="${profileAttrElementInfo.profileAttrId}"/> --%>
<%-- 			<c:set var="profileAttrElemList" 		value="${profileAttrElementInfo.profileAttrElementList}"/> --%>
<%-- 			<c:set var="profileAttrElemListLength"  value="${profileAttrElemList.size()}"/> --%>
		
<%-- 			<c:if test="${prevAttrId eq 0 || (prefAttrId != 0 && profileAttrId > prevAttrId)}"> --%>
		
<%-- 					<div id="${profileAttrId}" onclick="javascript:attrFilterList(${profileAttrId});" style="font-weight:bold;">${profileAttrElementInfo.profileAttrName}</div> --%>
		
<%-- 			</c:if> --%>
			
<%-- 			<c:if test="${profileAttrElemListLength > 0}"> --%>
<%-- 					<input type="hidden" id="attrElemMapList[${index.count-1}].attrId${profileAttrId}" name="attrElemMapList[${index.count-1}].attrId" value="${profileAttrId}" /> --%>
			
<%-- 				<c:forEach var="profileAttrElemInfo" items="${profileAttrElemList}"> --%>
<!-- 					<span class="label label-default">				 -->
<%-- 						<input type="checkbox" id="attrElemMapList[${index.count-1}].attrElemId${ProfileAttrElemInfo.profileAttrElementId}" name="attrElemMapList[${index.count-1}].attrElemId" value="${profileAttrElemInfo.profileAttrElementId}" class="attrElemRadio"/>${profileAttrElemInfo.profileAttrElementName} --%>
<!-- 					</span> -->
<%-- 				</c:forEach> --%>
			
<%-- 			</c:if>	 --%>
		
<%-- 			<c:set var="prevAttrId" value="${attrId}"/> --%>
<%-- 		</c:forEach> --%>
	</c:when>
	<c:otherwise>
				<div style="text-align:center">등록된 카테고리가 없습니다.</div>
	</c:otherwise>
</c:choose>			
				</div>
			</div>
			<!-- list area -->
			<div id="listDiv" role="main"></div>
			<!-- // list area -->
				
		<c:if test="${isLogon && !isRegisted}">
			<div class="btn-group btn-group-justified" style="padding-bottom: 20px;">
				<div class="btn-group">
					<input type="button" class="btn btn-default pull-right" value="프로필쓰기" name="goToRegist" />
				</div>
			</div>		
		</c:if>
		</div>	
	</div>
	<!-- modal popup area -->
	<c:import url="/common/modalPopup"/>
	<!-- // modal popup area -->	
</form>
</body>
<script>
$("input[name=attrElemId]").each(function(){
	var selectedAttrElemId = this;
	$(".attrElemRadio").each(function(){
		var attrElemId = this;
		if($(attrElemId).val() == $(selectedAttrElemId).val()){
			$(attrElemId).attr("checked", true);
		}
	});
});

//리스트 페이징을 위한 메서드
function ajaxPagination(page){
    var newPage = isEmpty(page) ? "1" : page;
    $("input[name=page]").val(newPage);

    loadProfileList();
}    

function isEmpty(val){
	var result = false;
	
	if(val == '' || val == null || val == 'undefined'){
		result = true;
	}
	return result;
	
}

</script>
</html>