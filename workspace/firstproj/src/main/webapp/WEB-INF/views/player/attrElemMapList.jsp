<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/player/common.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/player/attrElemMapList.js"></script>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/common/paging.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
<script>
</script>
<div class="container">
<form id="listFrm" name="listFrm" method="post">
<!-- paging에 필요한 파라미터 -->
<input type="hidden" id="pageNo" name="pageNo" value="${pagedResult.pageNo}" /> 
<input type="hidden" id="totalListCnt" name="totalListCnt" value="${pagedResult.totalListCnt}" /> 
<input type="hidden" id="totalPageCnt" name="totalPageCnt" value="${pagedResult.totalPageCnt}" /> 
<input type="hidden" id="startPageNo" name="startPageNo" value="${pagedResult.startPageNo}" /> 
<input type="hidden" id="pageSize" name="pageSize" value="${pagedResult.pageSize}" />


<input type="hidden" id="selectedAttrElemId" 	name="selectedAttrElemId" />
<input type="hidden" id="selectedAttrId" 		name="selectedAttrId" />
<input type="hidden" id="selectedCatId" 		name="selectedCatId" />

	<div class="form-group">
		<div class="row">
			<div class="col-md-10">
			<input type="hidden" 	id="searchCondition" name="searchCondition" value="userName"/>
			<input type="text" 		id="searchText" 	 name="searchText" 		class="form-control"/>	
			</div>
			<div class="col-md-2">	
			<input type="button" onclick="javascript: goSearch();" class="btn btn-default" value="검색"/>
			</div>
		</div>
		
		
		
		<div class="row"  style="padding-top: 10px; ">
			<div class="col-md-4">
				<!-- 첫번째 카테고리 -->
				<select id="cat1" name="cat1" onchange="javascript:setChildCategory();" class="form-control">
					<option value="-1">카테고리를 선택해 주세요.</option>
					<c:forEach var="cat" items="${catList}">
					<option value="${cat.catId}">${cat.categoryNameStr}</option>	
					</c:forEach>
				</select>
			</div>
			<div class="col-md-4">
				<!-- 두번째 카테고리 -->
				<select id="cat2" name="cat2" onchange="javascript:setAttrList();" class="form-control">
					<option value="-1">카테고리를 선택해 주세요.</option>
				</select>
			</div>
			<div class="col-md-4"></div>	
		</div>
		<div class="row" style="padding-top: 10px; padding-left : 30px; padding-right: 30px;">
			<!--속성 & 속성 항목들에 대한 체크박스 리스트 -->
			<div id="attrElemList" style="background-color: #efefef;">
			</div>
		</div>

	</div>
	
	
	<div class="table-responsive" id="listDiv">
		총 게시글 :  ${pagedResult.totalListCnt } 개
		<table class="table table-hover">
			<tr>
				<td></td>
				<td>Category</td>
				<td>Attribute</td>
				<td>Attribute's Element</td>
				<td>User Name</td>
				<td>Mapping Date</td>
			</tr>
		
		<c:forEach var="list" items="${pagedResult.list}">
			<tr>
				<td></td>
				<td>${list.categoryNameStr}</td>
				<td>${list.attrNameStr}</td>
				<td>${list.attrElemNameStr}</td>
				<td>${list.userName}</td>
				<td>${list.createDate}</td>
			</tr>
			
		</c:forEach>
		</table>
	</div>
	<!-- paging area -->                                                
	<c:set var="totalListCnt" value="${pagedResult.totalListCnt}"/>
	<c:set var="totalPageCnt" value="${pagedResult.totalPageCnt}"/>
	                                                                                                      
	<c:import url="/common/paging">
		<c:param value="${totalPageCnt}"            name="totalPageCnt"/>
	    <c:param value="${pagedResult.pageNo}"      name="pageNo"/>
	    <c:param value="${pagedResult.startPageNo}" name="startPageNo"/>
	    <c:param value="${pagedResult.endPageNo}"   name="endPageNo"/>   
	</c:import>                                                                                                      

</form>
</div>