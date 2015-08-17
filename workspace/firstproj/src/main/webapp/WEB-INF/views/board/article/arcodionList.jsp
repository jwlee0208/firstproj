<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" 	content="IE=Edge" />
<meta name="viewport" 				content="width=device-width, initial-scale=1">
<meta name="title" 					content="Developer's Blog"/>
<meta name="author" 				content="Lee Jinwon"/>
<meta name="description" 			content="Welcome to enter here. Here is developer's blog"/>
<meta name="robots" 				content="index,follow" /> 
<meta name="keywords" 				content="blog, baseball, link, player, profile"/>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/common/paging.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/articleList.js"></script>
<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/pagination.css">
</head>
<body>
	<div class="blog-header">
	  <h1>BOARD&nbsp;&nbsp;<small>ALL</small></h1>
	</div>	
	
	<ol class="breadcrumb">
	  <li><a href="#" onclick="javascript:goHome();">Home</a></li>
	  <li><a>Board</a></li>
	  <li class="secondBranch active">ALL</li>
	</ol>		
	
	<form id="boardFrm" name="boardFrm" method="post">
	
	<!-- 리스트에서 선택된 게시글 아이디 -->
<!-- 	<input type="hidden" id="selectedArticleId" name="selectedArticleId" /> -->
<%-- 	<input type="hidden" id="boardId" name="boardId" value="${boardInfo.boardId}"/> --%>

	<!-- 검색 영역 -->	
	<div class="form-group" role="search">
		<div class="">
			<input type="hidden" 	id="searchCondition" name="searchCondition" value="titleNcontent" 	/>
			<input type="text" 		id="searchText" 	 name="searchText" 		class="form-control" placeholder="검색어를 입력해 주세요." value="${boardArticleDto.searchText}" />		
		</div>
	</div>
	
	<c:set var="list" value="${boardList}" />	
	<div id="listDiv" role="main">
		<!-- paging에 필요한 파라미터 -->
		<input type="hidden" id="pageNo" 		name="pageNo" 		value="${pagedResult.pageNo}" /> 
		<input type="hidden" id="totalListCnt" 	name="totalListCnt" value="${pagedResult.totalListCnt}" /> 
		<input type="hidden" id="totalPageCnt" 	name="totalPageCnt" value="${pagedResult.totalPageCnt}" /> 
		<input type="hidden" id="startPageNo" 	name="startPageNo" 	value="${pagedResult.startPageNo}" /> 
		<input type="hidden" id="pageSize" 		name="pageSize" 	value="${pagedResult.pageSize}" />
		<div class="panel-group" id="accordion">
				<c:choose>
					<c:when test="${null ne pagedResult.list && pagedResult.list.size() > 0}">
						<c:forEach var="contentInfo" items="${pagedResult.list}" varStatus="index">
		
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse${index.count}"><c:out value="${contentInfo.title}"/> </a>
					</h4>
				</div>
				<div id="collapse${index.count}" class="collapse in">
					<div class="panel-body">
						<p style="color:#999; text-align:right;">${fn:substring(contentInfo.createDate, 0, 10)} by <a href="#">${contentInfo.authorNm}</a></p>
						${contentInfo.content} <br/><br/>
						<div class="row" style="float: right; padding-right:10px;">
							<div class="btn btn-success" title="${contentInfo.boardCategoryName} > ${contentInfo.boardName}">${contentInfo.boardCategoryName} > ${contentInfo.boardName}</div>
							<div class="btn btn-primary" onclick="share('fb', '${contentInfo.articleId}');" title="Sharing Article To Facebook">f</div>
						</div>
						
					</div>
				</div>
			</div>					
						</c:forEach>
					</c:when>
					<c:otherwise>
		
							<div style="text-align: center;">작성된 내용이 없습니다.</div>
						
					</c:otherwise>
				</c:choose>
		</div>				
	</div>
	</form>
	<!-- paging area -->                                                
	<c:set var="totalListCnt" value="${pagedResult.totalListCnt}"/>
	<c:set var="totalPageCnt" value="${pagedResult.totalPageCnt}"/>
	                                                                                                      
	<jsp:include page="../../common/paging.jsp" flush="false">
	    <jsp:param value="${totalPageCnt}"            name="totalPageCnt"/>
	    <jsp:param value="${pagedResult.pageNo}"      name="pageNo"/>
	    <jsp:param value="${pagedResult.startPageNo}" name="startPageNo"/>
	    <jsp:param value="${pagedResult.endPageNo}"   name="endPageNo"/>   
	</jsp:include>


<!-- 	<div class="btn-group btn-group-justified" style="padding-bottom: 20px;"> -->
<!-- 		<div class="btn-group"> -->
<!-- 			<input type="submit" class="btn btn-default pull-right" value="글쓰기" name="goToWrite" /> -->
<!-- 		</div> -->
<!-- 	</div>	 -->
</body>
<script>
$(document).ready(function() {
	$("div img").addClass("media-object");
	$("div img").attr("width", "100%");
	$("div img").off("error");
	$("div img").on("error", function(){
		$(this).attr("src", '${pageContext.request.contextPath}/img/no_image.png');
	});

	$(".panel-title").each(function(){
		if($(this).hasClass("collapsed")){
			$(this).children("a").text("∨ " + $(this).children("a").text());
		}else{
			$(this).children("a").text("∧ " + $(this).children("a").text());
		}
	});
		
	$(".panel-title").click(function(){
		if($($(this).children("a").attr("href")).height() > 0){
			$(this).children("a").text($(this).children("a").text().replace("∧ ", "∨ "));
		}else{
			$(this).children("a").text($(this).children("a").text().replace("∨ ", "∧ "));
				
		}
// 		if($($(this).children("a").attr("href")).attr("height")){
// 			$(this).children("a").text($(this).children("a").text().replace(" > 열기", " > 닫기"));
// 		}else{
// 			$(this).children("a").text($(this).children("a").text().replace(" > 닫기", " > 열기"));
// 		}	
	});
});
</script>
</html>