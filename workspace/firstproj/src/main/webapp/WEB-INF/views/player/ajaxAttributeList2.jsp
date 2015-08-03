<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<div style="padding-top: 10px;padding-left: 10px;padding-bottom: 10px; background-color: black; text-align: center;">
Filtering Detail Information
</div>
<div style="padding-top: 10px;padding-left: 10px;padding-bottom: 10px;">
<c:choose>
	<c:when test="${!empty attrElementList}">
		<!-- attribute Info Settion -->
		<c:set var="prevAttrId" value="0"/>
		
		<c:set var="attrId" 			  		value=""/>
		<c:set var="categoryAttrElemList" 		value=""/>
		<c:set var="categoryAttrElemListLength" value="0"/>
		<!-- //attribute Info Settion -->
		
		<c:forEach var="attrElementInfo" items="${attrElementList}" varStatus="index">
		
		<c:set var="attrId" 					value="${attrElementInfo.attrId}"/>
		<c:set var="categoryAttrElemList" 		value="${attrElementInfo.categoryAttrElemList}"/>
		<c:set var="categoryAttrElemListLength" value="${categoryAttrElemList.size()}"/>
		
		<c:if test="${prevAttrId eq 0 || (prefAttrId != 0 && attrId > prevAttrId)}">
		<div id="${attrId}" onclick="javascript:attrFilterList(${attrId});" style="font-weight:bold;">${attrElementInfo.attrNameStr}</div>
		</c:if>
		
		<c:if test="${categoryAttrElemListLength > 0}">
				<input type="hidden" id="attrElemMapList[${index.count-1}].attrId${attrId}" name="attrElemMapList[${index.count-1}].attrId" value="${attrId}" />
			<c:forEach var="categoryAttrElemInfo" items="${categoryAttrElemList}">
				<label class="checkbox-inline">				
					<input type="checkbox" id="attrElemMapList[${index.count-1}].attrElemId${categoryAttrElemInfo.attrElemId}" name="attrElemMapList[${index.count-1}].attrElemId" value="${categoryAttrElemInfo.attrElemId}" class="attrElemRadio"/>${categoryAttrElemInfo.attrElemNameStr}
				</label>
			</c:forEach>
		</c:if>
	
	
		<c:set var="prevAttrId" value="${attrId}"/>
<%-- 		<c:if test="${attrId eq prevAttrId}"> --%>
<!-- 		</div> -->
<%-- 		</c:if> --%>
		</c:forEach>
	</c:when>
	<c:otherwise>
	<div style="text-align:center">등록된 카테고리가 없습니다.</div>
	</c:otherwise>
</c:choose>
</div>
<script>
// $().ready(function(){
$(function(){	
	$("input[name=attrElemId]").each(function(){
		var selectedAttrElemId = this;
		$(".attrElemRadio").each(function(){
			var attrElemId = this;
			if($(attrElemId).val() == $(selectedAttrElemId).val()){
				$(attrElemId).attr("checked", true);
			}
		});
	});
});
</script>