<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<!-- <meta charset="UTF-8"> -->
<!-- <meta http-equiv="X-UA-Compatible" 	content="IE=Edge" /> -->
<!-- <meta name="viewport" 				content="width=device-width, initial-scale=1"> -->
<!-- <meta name="title" 					content="Developer's Blog"/> -->
<!-- <meta name="author" 				content="Lee Jinwon"/> -->
<!-- <meta name="description" 			content="Welcome to enter here. Here is developer's blog"/> -->
<!-- <meta name="robots" 				content="index,follow" />  -->
<!-- <meta name="keywords" 				content="blog, baseball, link, player, profile"/> -->

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/common/paging.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/articleList.js"></script>
<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/pagination.css">
</head>
<body>
<!-- <div class="container"> -->
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
	<input type="hidden" id="boardId" 			name="boardId" value="${boardInfo.boardId}"/>


	<input type="hidden" id="userId"  			name="userId"  value="${userId}"/>

	<!-- 검색 영역 -->	
	<div class="form-group" role="search">
		<div class="">
			<input type="hidden" 	id="searchCondition" name="searchCondition" value="titleNcontent" 	/>
			<input type="text" 		id="searchText" 	 name="searchText" 		class="form-control" placeholder="검색어를 입력해 주세요." value="${boardArticleDto.searchText}" />		
		</div>
	</div>
	
	<c:set var="list" value="${boardList}" />	
	<div class="table-responsive" id="listDiv" role="main">
		<!-- paging에 필요한 파라미터 -->
		<input type="hidden" id="pageNo" 		name="pageNo" 		value="${pagedResult.pageNo}" /> 
		<input type="hidden" id="totalListCnt" 	name="totalListCnt" value="${pagedResult.totalListCnt}" /> 
		<input type="hidden" id="totalPageCnt" 	name="totalPageCnt" value="${pagedResult.totalPageCnt}" /> 
		<input type="hidden" id="startPageNo" 	name="startPageNo" 	value="${pagedResult.startPageNo}" /> 
		<input type="hidden" id="pageSize" 		name="pageSize" 	value="${pagedResult.pageSize}" />

		<table style="width: 100%;" class="table table-hover">
			<colgroup>
				<col width="10%" />
				<col width="65%" />
				<col width="15%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th>게시글 번호</th>
					<th>제목</th>
					<th>작성일자</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${null ne pagedResult.list && pagedResult.list.size() > 0}">
						<c:forEach var="content" items="${pagedResult.list}">
							<tr>
								<td>${content.articleId}</td>	
								<td onclick="javascript:goView('${content.articleId}');">${content.title}</td>
								<td>${fn:substring(content.createDate, 0, 10)}</td>
								<td>${content.authorNm}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" style="text-align: center; min-height: 400px;">작성된 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
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
<!-- </div> -->
</body>
</html>