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

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/player/common2.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/player/playerPortal.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/pagination.css">

<style>
.ui-autocomplete .highlight {
			font-weight : bold;
			color : red;
			text-decoration: underline;
}
		
.table-responsive .table.table-hover tr td {vertical-align : middle; }
		
		
.position {
	  float: right;
	  font-size: 18px;
	  margin-top: -5px;
	  margin-right: -5px;
}
</style>
</head>
<body>
<form id="listFrm" name="listFrm" method="post">
	<div class="container">
	
		<input type="hidden" id="selectedAttrElemId" 	name="selectedAttrElemId" />
		<input type="hidden" id="selectedAttrId" 		name="selectedAttrId" />
		<input type="hidden" id="selectedCatId" 		name="selectedCatId" />
		<input type="hidden" id="page"					name="page"	/>
		<c:set var="target" value=""/>
		<c:if test="${searchPlayerInfo.categoryInfo.parentCatId eq 1}"><c:set var="target" value="Player"/></c:if>
		<c:if test="${searchPlayerInfo.categoryInfo.parentCatId eq 5}"><c:set var="target" value="Team"/></c:if>
		<h1 id="btn-groups" class="page-header">${target}s&nbsp;&nbsp;&nbsp;<small>${target} List</small></h1>
		<div class="form-group">
	
			<div class="row" role="search">
				<input type="hidden" 	id="searchCondition" 	name="searchCondition" value="userName"/>
				<input type="hidden" 	id="searchText" 		name="searchText" />
				<input type="text" 		id="searchTextStr" 		name="searchTextStr" class="form-control ui-autocomplete-input" placeholder="<tag:message code='text.request.insert.search.keyword'/>"/>
				<input type="hidden"	id="parentCatId"		name="categoryInfo.parentCatId" value="${searchPlayerInfo.categoryInfo.parentCatId}"/>	
			</div>
			<!-- 			
			<div class="row"  style="padding-top: 10px;">
					첫번째 카테고리
					<select id="parentCatId" name="categoryInfo.parentCatId" onchange="javascript:setChildCategory();" class="form-control">
						<option value="-1"><tag:message code="text.select.1step.category"/></option>
						<c:forEach var="cat" items="${catList}">
						<option value="${cat.catId}">${cat.categoryNameStr}</option>	
						</c:forEach>
					</select>
			</div>
			-->
			<div class="row"  style="padding-top: 10px;">
					<!-- 두번째 카테고리 -->
					<select id="catId" name="categoryInfo.catId" onchange="javascript:setAttrList();" class="form-control">
						<option value="-1"><tag:message code="text.select.2step.category"/></option>
					</select>
			</div>
			<div class="col-md-4"></div>	
			
			<div class="row" style=" padding-top: 20px;">
				<!--속성 & 속성 항목들에 대한 체크박스 리스트 -->
				<div id="attrElemList" style="background-color: #efefef;"></div>
			</div>
			
			<div class="row" style="padding-top : 10px; padding-left : 30px; padding-right: 30px;" id="cntPerCatList">
				<c:choose>	
					<c:when test="${perCategoryCntList eq null }"></c:when>			
					<c:otherwise>
						<c:forEach var="cntInfo" items="${perCategoryCntList}">
							<c:if test="${cntInfo.catId1 ne null}">
					<div>${cntInfo.catNm1} / ${cntInfo.catNm2}<span style="color: #red" onclick="javascript:searchAttrList(${cntInfo.catId2});">(${cntInfo.searchCntPerCat})</span></div>	
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="listDiv" role="main"></div>	
		<c:if test="${isLogon && !isRegisted}">
			<div class="btn-group btn-group-justified" style="padding-bottom: 20px;">
				<div class="btn-group">
					<input type="button" class="btn btn-default pull-right" value="프로필쓰기" name="goToRegist" />
				</div>
			</div>		
		</c:if>
		</div>	
	</div>
</form>
</body>
</html>