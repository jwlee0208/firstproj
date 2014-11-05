<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/common/paging.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">

<script>
	function setChildCategory(){
		var catId = $("#cat1").val();
		$.ajax({
			url : '/player/childCategoryList.json',
			data : {parentCatId : catId},
			method : 'post',
			dateType : 'json',
			success : function(data){

				var childCatList = data.childCatList;
				var childCatListLength = childCatList.length;
				
				if(childCatListLength > 0){
					for(var i = 0 ; i < childCatListLength ; i++){
						$("#cat2").append("<option value=\""+ childCatList[i].catId +"\">" + childCatList[i].categoryNameStr + "</option>");
					}
				}else{
					$("#cat2 option").remove();
					$("#cat2").append("<option value=\"\">카테고리를 선택해 주세요.</option>");
				}

				$("#selectedCatId").val(catId);
				$("#selectedAttrElemId").val('');
				$("#attrElemList").html('');
				goPage(1);
			}
		});	
	}

	function setAttrList(){
		var catId = $("#cat2").val();
		
		$.ajax({
			url : '/player/attrElementList.json',
			data : {catId : catId},
			method : 'post',
			dateType : 'json',
			success : function(data){

				if(data != null){
					var attrElementList = data.attrElementList;

					if(attrElementList != null){
						var attrElementListLength = attrElementList.length;
						var prevAttrId = 0;
						var innerHtml = "<div style=\"padding-top: 10px;padding-left: 10px;padding-bottom: 10px;\">";
						for(var i = 0 ; i < attrElementListLength ; i++){
							console.log(attrElementList[i].attrElemName + ", " + attrElementList[i] + ", " + attrElementList[i].attrName);

							var attrId = attrElementList[i].attrId;

							if(prevAttrId == 0 || (prevAttrId != 0 && attrId > prevAttrId)){
								innerHtml += "<div id=\"" + attrId +"\" onclick=\"javascript:attrFilterList(" + attrId + ");\" style=\"font-weight:bold;\">" + attrElementList[i].attrNameStr + "</div>";
							}

							innerHtml += "<label class=\"checkbox-inline\"><input type=\"checkbox\" id=\"attrElem_" + attrElementList[i].attrElemId +"\" " + " name=\"" + attrElementList[i].attrElemId + "\" class=\"attrElemChkBox\" value=\"" + attrElementList[i].attrElemId + "\"/>" + attrElementList[i].attrElemNameStr + "</label>";

							prevAttrId = attrId;
						}
						innerHtml += "</div>";
						$("#attrElemList").html(innerHtml);
						// 각 체크박스에  onclick 이벤트 설정
						$(".attrElemChkBox").attr("onclick", "javascript:attrElemFilterList();");

						$("#selectedCatId").val(catId);

						goPage(1);
						
					}
				}
			}				
		});
	}
	function attrFilterList(attrId){
		$("#selectedAttrId").val(attrId);
		goPage(1);
		
	} 
	
	function attrElemFilterList(){
		var attrElemIds = "";
		
		$.each($(".attrElemChkBox"), function(index, value){

			if($(this).is(":checked")){
				attrElemIds += $(this).val();
				attrElemIds += ",";	
			}	
			
		});
		if(attrElemIds != ""){
			attrElemIds += "end";
		}
		
		attrElemIds = attrElemIds.replace(/,end/g,"");

		$("#selectedAttrElemId").val(attrElemIds);
				
		goPage(1);
	}

	// 페이지 이동
	function goPage(pageNo) {
		$("#pageNo").val(pageNo);
		
		$.ajax({
			async : false,
			type : 'POST',
			dataType : 'html',
			url : '/player/playerList.page',
			data : $("#listFrm").serialize(),
			processData : true,
			cache : false,
			success : function(data) {

				if (data != null && data != undefined) {
					var listDiv = $(data).find("#listDiv").html();
					var pageDiv = $(data).find("#pageDiv").html();

					$("#listDiv").html(listDiv);
					$("#pageDiv").html(pageDiv);
				}else{
					$("#listDiv").html("");
					$("#pageDiv").html("");
				}
			}
		});
	}

</script>

<div class="container">
<form 	id="listFrm" name="listFrm" method="post">
<!-- paging에 필요한 파라미터 -->
<input 	type="hidden" id="pageNo" 			name="pageNo" 		value="${pagedResult.pageNo}" /> 
<input 	type="hidden" id="totalListCnt" 	name="totalListCnt" value="${pagedResult.totalListCnt}" /> 
<input 	type="hidden" id="totalPageCnt" 	name="totalPageCnt" value="${pagedResult.totalPageCnt}" /> 
<input 	type="hidden" id="startPageNo" 		name="startPageNo" 	value="${pagedResult.startPageNo}" /> 
<input 	type="hidden" id="pageSize" 		name="pageSize" 	value="${pagedResult.pageSize}" />


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
				<td>선수</td>
				<td>구분1</td>
				<td>구분2</td>
			</tr>
		
		<c:forEach var="list" items="${pagedResult.list}">
			<tr>
				<td></td>
				<td>${list.userNm}(${list.userId})</td>
				<td>${list.catNm1}</td>
				<td>${list.catNm2}</td>
			</tr>
			
		</c:forEach>
		</table>
	</div>
	<!-- paging area -->                                                
	<c:set var="totalListCnt" value="${pagedResult.totalListCnt}"/>
	<c:set var="totalPageCnt" value="${pagedResult.totalPageCnt}"/>
	                                                                                                      
	<jsp:include page="../common/paging.jsp" flush="false">
	    <jsp:param value="${totalPageCnt}"            name="totalPageCnt"/>
	    <jsp:param value="${pagedResult.pageNo}"      name="pageNo"/>
	    <jsp:param value="${pagedResult.startPageNo}" name="startPageNo"/>
	    <jsp:param value="${pagedResult.endPageNo}"   name="endPageNo"/>   
	</jsp:include>

</form>
</div>