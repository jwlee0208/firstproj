<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<div style="padding-top: 10px;padding-left: 10px;padding-bottom: 10px;">
<c:choose>
	<c:when test="${attrElementList != null && attrElementList.size() > 0}">
		<c:set var="attrId" value=""/>
		<c:set var="categoryAttrElemList" value=""/>
		<c:set var="categoryAttrElemListLength" value="0"/>
		<c:forEach var="attrElementInfo" items="${attrElementList}" varStatus="index">
		<c:set var="categoryAttrElemList" value="${attrElementInfo.categoryAttrElemList}"/>
		<c:set var="categoryAttrElemListLength" value="${categoryAttrElemList.size()}"/>

		<c:set var="attrId" value="${attrElementInfo.attrId}"/>
	<div><h4><span class="label label-default">[${attrId}]${attrElementInfo.attrNameStr}</span></h4>
		<span>	
		<c:if test="${categoryAttrElemListLength > 0}">
			<div class="row">
				<input type="hidden" id="attrElemMapList[${index.count-1}].attrId${attrId}" name="attrElemMapList[${index.count-1}].attrId" value="${attrId}" />
			<c:forEach var="categoryAttrElemInfo" items="${categoryAttrElemList}">
				<div class="col-md-2">				
					<input type="radio" id="attrElemMapList[${index.count-1}].attrElemId${categoryAttrElemInfo.attrElemId}" name="attrElemMapList[${index.count-1}].attrElemId" value="${categoryAttrElemInfo.attrElemId}" class="attrElemRadio"/>${categoryAttrElemInfo.attrElemNameStr}
				</div>
			</c:forEach>
			</div>
		</c:if>
		</span>
	</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
	
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