<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/common/paging.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/player/common.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/player/playerList.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/pagination.css">
<style>.ui-autocomplete .highlight { font-weight : bold; color : red; text-decoration: underline;}		.table-responsive .table.table-hover tr td {vertical-align : middle; }.position { float: right; font-size: 18px; margin-top: -5px; margin-right: -5px;}</style>
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
			<input type="hidden" 	id="searchCondition" name="searchCondition" value="userName"/>
			<input type="text" 		id="searchText" 	 name="searchText" 		class="form-control ui-autocomplete-input" placeholder="Try to search using keywords. And push enter key."/>	
		</div>		
		<div class="row"  style="padding-top: 10px; ">
				<!-- 첫번째 카테고리 -->
				<select id="cat1" name="cat1" onchange="javascript:setChildCategory();" class="form-control">
					<option value="-1">카테고리를 선택해 주세요.</option>
					<c:forEach var="cat" items="${catList}">
					<option value="${cat.catId}">${cat.categoryNameStr}</option>	
					</c:forEach>
				</select>
		</div>
		<div class="row"  style="padding-top: 10px; ">
				<!-- 두번째 카테고리 -->
				<select id="cat2" name="cat2" onchange="javascript:setAttrList();" class="form-control">
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
		
	
		<div class="row">
			<div class="table-responsive" id="listDiv">	
				<c:forEach var="list" items="${pagedResult.list}">
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<span class="label <c:choose><c:when test="${list.catNm2 eq 'hitter'}">label-success</c:when><c:when test="${list.catNm2 eq 'pitcher'}">label-info</c:when><c:otherwise>label-warning</c:otherwise></c:choose> position">${list.catNm2Str}</span>
					<c:choose>
						<c:when test="${list.profileImgFilePath ne null && list.profileImgFilePath ne ''}">
							<img src="${pageContext.request.contextPath}${list.profileImgFilePath}" 
								 data-src="holder.js/400x400" alt="image" class="img-rounded" 
								 onerror="this.src='${pageContext.request.contextPath}/img/no_image.png'"  
								 onclick="javascript:goDetail('${list.userInfo.userId}');" 
								 data-toggle="modal" data-target="#myModal" 
								 style="padding-top:10px; cursor:pointer;"/>
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/img/no_image.png" 
								 data-src="holder.js/400x400" alt="image" class="img-rounded" 
								 onclick="javascript:goDetail('${list.userInfo.userId}');" 
								 data-toggle="modal" data-target="#myModal" 
								 style="padding-top:10px; cursor:pointer;"/>
						</c:otherwise>
					</c:choose>					
							
							<div class="caption" style="cursor:pointer;">
								<h3><span onclick="javascript:goDetail('${list.userInfo.userId}');" data-toggle="modal" data-target="#myModal">${list.userInfo.userNm}</span></h3>
								<p class="content_${index.count}" style="text-overflow:ellipsis; overflow:hidden;">
									<div class="row"><div class="col-xs-6">Type</div><div class="col-xs-6">${list.catNm1Str}</div></div>
									<div class="row"><div class="col-xs-6">Position</div><div class="col-xs-6">${list.catNm2Str}</div></div>
								</p>
								<p>
									<span class="btn btn-info" 		role="button" onclick="javascript:goDetail('${list.userInfo.userId}');" data-toggle="modal" data-target="#myModal">Detail View</span>
									<span class="btn btn-primary" 	role="button" onclick="javascript:goDetail('${list.userInfo.userId}');" data-toggle="modal" data-target="#myModal">LIKE</span>
								</p>
							</div>	
						</div>	
					</div>
				</c:forEach>
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
		
		<c:if test="${!isRegisted}">
			<div class="btn-group btn-group-justified" style="padding-bottom: 20px;">
				<div class="btn-group">
					<input type="button" class="btn btn-default pull-right" value="프로필쓰기" name="goToRegist" />
				</div>
			</div>		
		</c:if>
		</div>
	</div>	
</form>
</div>
<script>
$(function() {
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#searchText" ).autocomplete({
//       source: availableTags
		source : function(request, response){
			searchArea.autoComplete();
// 			$.ajax({
// 				url : '/player/autoComplete.json',
// 				data : $("#listFrm").serialize(),
// 				dataType : 'json',
// 				method : 'post',
// 				success : function (data) {
// 					var searchResult = data.searchResult;
// 					console.log(searchResult);
// 					response(searchResult);
// 				}
// 			});
		}
    }).data("ui-autocomplete")._renderItem = function(ul, item) {
		var $a = $("<a></a>").text(item.label);
		searchArea.highlightText(this.term, $a);
		return $("<li></li>").append($a).appendTo(ul);
	};
    
  });
  
  
// autoComplete highlight 
// REf.] http://salman-w.blogspot.kr/2013/12/jquery-ui-autocomplete-examples.html?m=1#example-2
// function highlightText(text, $node) {
// 	var searchText = $.trim(text).toLowerCase(), currentNode = $node.get(0).firstChild, matchIndex, newTextNode, newSpanNode;
// 	while ((matchIndex = currentNode.data.toLowerCase().indexOf(searchText)) >= 0) {
// 		newTextNode = currentNode.splitText(matchIndex);
// 		currentNode = newTextNode.splitText(searchText.length);
// 		newSpanNode = document.createElement("span");
// 		newSpanNode.className = "highlight";
// 		currentNode.parentNode.insertBefore(newSpanNode, currentNode);
// 		newSpanNode.appendChild(newTextNode);
// 	}
// }

function goDetail(userId){
	
	var frm = $("#listFrm");
	frm.attr("action", "/player/playerDetailView?userId=" + userId);
	frm.attr("method", "post");
	frm.submit();
}

var searchArea = {
	autoComplete : function(){
		$.ajax({
			url : '/player/autoComplete.json',
			data : $("#listFrm").serialize(),
			dataType : 'json',
			method : 'post',
			success : function (data) {
				var searchResult = data.searchResult;
				console.log(searchResult);
				response(searchResult);
			}
		});
	},
	highlightText : function(text, $node)  {
		var searchText = $.trim(text).toLowerCase(), currentNode = $node.get(0).firstChild, matchIndex, newTextNode, newSpanNode;
		while ((matchIndex = currentNode.data.toLowerCase().indexOf(searchText)) >= 0) {
			newTextNode = currentNode.splitText(matchIndex);
			currentNode = newTextNode.splitText(searchText.length);
			newSpanNode = document.createElement("span");
			newSpanNode.className = "highlight";
			currentNode.parentNode.insertBefore(newSpanNode, currentNode);
			newSpanNode.appendChild(newTextNode);
		}
	}
}

</script>