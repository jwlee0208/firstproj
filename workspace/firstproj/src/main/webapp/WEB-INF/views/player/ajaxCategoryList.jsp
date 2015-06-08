<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
	
	<c:set var="selectName" value=""/>
	<c:choose>
		<c:when test="${pageType eq 'regist'}">
			<c:set var="selectName" value="playerInfoDto.catId2"/>
		</c:when>
		<c:otherwise>
			<c:set var="selectName" value="catId2"/>
		</c:otherwise>
	</c:choose>
	 


	<input type="hidden" id="catNm2" name="playerInfoDto.catNm2" />
	
	
	
	<select id="catId2" name="${selectName}" class="form-control" onchange="javascript:setAttrList();">
		<option value="-1">Select Category</option>
		<c:if test="${childCatList != null && childCatList.size() > 0}">
			<c:forEach var="childCatInfo" items="${childCatList}">
		<option value="${childCatInfo.catId}" <c:if test="${childCatInfo.catId eq selectedCategoryId}">selected</c:if>>${childCatInfo.categoryNameStr}</option>
			</c:forEach>
		</c:if>			
	</select>
	
<script>
$().ready(function(){
	if($("#catId2").val() > -1){
		setAttrList();
	}
});
</script>