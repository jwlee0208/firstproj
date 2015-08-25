<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/articleList.js"></script>
<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/pagination.css">
</head>
<body>

	<div class="page-header">
	  <h1>BOARD&nbsp;&nbsp;<small>${boardInfo.boardName}</small></h1>
	</div>	
	
	<ol class="breadcrumb">
	  <li><a href="#" onclick="javascript:goHome();">Home</a></li>
	  <li><a>${boardInfo.boardCategoryName} Board</a></li>
	  <li class="secondBranch active">${boardInfo.boardName}</li>
	</ol>		
	
	<form id="boardFrm" name="boardFrm" method="post">
	
	<!-- 리스트에서 선택된 게시글 아이디 -->
	<input type="hidden" id="selectedArticleId" name="selectedArticleId" />
	<input type="hidden" id="boardId" name="boardId" value="${boardId}"/>
	
	<!-- 검색 영역 -->	
	<div class="form-group" role="search">		
		<div>
			<input type="hidden" 	id="searchCondition" name="searchCondition" value="titleNcontent"/>
			<input type="text" 		id="searchText" 	 name="searchText" 		class="form-control" placeholder="검색어를 입력해 주세요." value="${boardArticleDto.searchText}" />		
		</div>
	</div>	
	
	<c:set var="list" value="${boardList}" />
	<div class="table-responsive" id="listDiv">
		<!-- paging에 필요한 파라미터 -->
		<input type="hidden" id="pageNo" 		name="pageNo" 		value="${pagedResult.pageNo}" /> 
		<input type="hidden" id="totalListCnt" 	name="totalListCnt" value="${pagedResult.totalListCnt}" /> 
		<input type="hidden" id="totalPageCnt" 	name="totalPageCnt" value="${pagedResult.totalPageCnt}" /> 
		<input type="hidden" id="startPageNo"	name="startPageNo" 	value="${pagedResult.startPageNo}" /> 
		<input type="hidden" id="pageSize" 		name="pageSize" 	value="${pagedResult.pageSize}" />
		
		<ul class="media-list">
<c:choose>
	<c:when test="${null ne pagedResult.list && pagedResult.list.size() > 0}">
		<c:forEach var="content" items="${pagedResult.list}">
		
			<li class="media">
				<a class="pull-left" href="javascript:;">
			<c:choose>
				<c:when test="${content.filePath ne null && content.filePath ne ''}"><img data-src="holder.js/64x64" src="http://jwlee0208.cdn3.cafe24.com/${content.filePath}" alt="" class="media-object" onerror="this.src='${pageContext.request.contextPath}/img/no_image.png'"  onclick="javascript:goView('${content.articleId}');" data-toggle="modal" data-target="#myModal" width="64px" height="64px"/></c:when>
				<c:otherwise><img data-src="holder.js/64x64" src="${pageContext.request.contextPath}/img/no_image.png" 	 alt="" class="media-object" onclick="javascript:goView('${content.articleId}');" data-toggle="modal" data-target="#myModal" width="64px" height="64px"/></c:otherwise>
			</c:choose>									
				</a>
				 <div class="media-body" onclick="javascript:goView('${content.articleId}');">
				 	<h4 class="media-heading"><small>${fn:substring(content.createDate, 0, 10)}</small>&nbsp;&nbsp;&nbsp;${content.title}</h4>
				 	<p>${fn:substring(content.contentText, 0, 50)}</p>
				 </div>
			</li>
		</c:forEach>
	</c:when>
	<c:otherwise>
			<li class="media" style="text-align: center; min-height: 400px;">	
				<h4 class="media-heading">등록된 내용이 없습니다.</h4>
			</li>			
	</c:otherwise>
</c:choose>						
		</ul>
	</div>
	</form>
	<!-- paging area -->                                                
	<c:set var="totalListCnt" value="${pagedResult.totalListCnt}"/>
	<c:set var="totalPageCnt" value="${pagedResult.totalPageCnt}"/>
	                                                                                                      
	<c:import url="/common/paging">
		<c:param value="${totalPageCnt}"            name="totalPageCnt"/>
	    <c:param value="${pagedResult.pageNo}"      name="pageNo"/>
	    <c:param value="${pagedResult.startPageNo}" name="startPageNo"/>
	    <c:param value="${pagedResult.endPageNo}"   name="endPageNo"/>   
	</c:import>                                                                                                      

	<div class="btn-group btn-group-justified" style="padding-bottom: 20px;">
		<div class="btn-group">
			<input type="submit" class="btn btn-default pull-right" value="글쓰기" name="goToWrite" />
		</div>
	</div>	
</body>
</html>	