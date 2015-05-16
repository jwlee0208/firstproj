<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
	<input type="hidden" id="catNm2" name="playerInfoDto.catNm2" />
	<select id="catId2" name="playerInfoDto.catId2" class="form-control" onchange="javascript:setAttrList();">
		<option value="-1">Select Category</option>
		<c:if test="${childCatList != null && childCatList.size() > 0}">
			<c:forEach var="childCatInfo" items="${childCatList}">
		<option value="${childCatInfo.catId}">${childCatInfo.categoryNameStr}</option>
			</c:forEach>
		</c:if>			
	</select>