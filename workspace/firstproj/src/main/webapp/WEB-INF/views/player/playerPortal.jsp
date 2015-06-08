<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/player/common2.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/player/playerPortal.js"></script>
<script type="text/javascript" 	src="${pageContext.request.contextPath}/lib/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/jquery/jquery-ui.min.css">
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

<div class="container">
<form id="listFrm" name="listFrm" method="post">


	<!-- paging에 필요한 파라미터 -->
<%-- 	<input 	type="text" id="page" 			name="page" 		value="${searchPlayerInfo.page}" />  --%>
<%-- 	<input 	type="text" id="pageSize" 		name="pageSize" 	value="${searchPlayerInfo.pageSize}" /> --%>
		
		
	<input type="hidden" id="selectedAttrElemId" 	name="selectedAttrElemId" />
	<input type="hidden" id="selectedAttrId" 		name="selectedAttrId" />
	<input type="hidden" id="selectedCatId" 		name="selectedCatId" />

	<div class="form-group">
		<div class="row">
			<input type="hidden" 	id="searchCondition" name="searchCondition" value="userName"/>
			<input type="text" 		id="searchText" 	 name="searchText" 		class="form-control ui-autocomplete-input" placeholder="Try to search using keywords. And push enter key."/>	
		</div>
		
		
		
		<div class="row"  style="padding-top: 10px; ">
				<!-- 첫번째 카테고리 -->
				<select id="cat1" name="categoryInfo.parentCatId" onchange="javascript:setChildCategory();" class="form-control">
					<option value="-1">카테고리를 선택해 주세요.</option>
					<c:forEach var="cat" items="${catList}">
					<option value="${cat.catId}">${cat.categoryNameStr}</option>	
					</c:forEach>
				</select>
		</div>
		<div class="row"  style="padding-top: 10px; ">
				<!-- 두번째 카테고리 -->
				<select id="cat2" name="categoryInfo.catId" onchange="javascript:setAttrList();" class="form-control">
					<option value="-1">카테고리를 선택해 주세요.</option>
				</select>
			</div>
			<div class="col-md-4"></div>	
		</div>
		<div class="row">
			<!--속성 & 속성 항목들에 대한 체크박스 리스트 -->
			<div id="attrElemList" style="background-color: #efefef;">
			</div>
		</div>
		
		<div class="row" style="padding-top : 10px; padding-left : 30px; padding-right: 30px;" id="cntPerCatList">
			<c:choose>	
			<c:when test="${perCategoryCntList eq null }">
						
			</c:when>			
			<c:otherwise>
				
				<c:forEach var="cntInfo" items="${perCategoryCntList}">
					<c:if test="${cntInfo.catId1 ne null}">
				<div>${cntInfo.catNm1} / ${cntInfo.catNm2}<span style="color: #red" onclick="javascript:searchAttrList(${cntInfo.catId2});">(${cntInfo.searchCntPerCat})</span></div>	
					</c:if>
				</c:forEach>
			</c:otherwise>
			</c:choose>
		
		</div>
	</div>
</form>		
	<div id="listDiv">
	
	

	</div>	
</div>