<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/articleList.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
</head>
<body>
<c:set var="boardName" value=""/>
<c:if test="${boardId eq 1}"><c:set var="boardName" value="자유게시판"/></c:if>
<c:if test="${boardId eq 2}"><c:set var="boardName" value="Q&A"/></c:if>
<c:if test="${boardId eq 3}"><c:set var="boardName" value="기타게시판"/></c:if>	

	<div class="page-header">
	  <h1>BOARD&nbsp;&nbsp;<small>${boardName}</small></h1>
	</div>	
	
	<ol class="breadcrumb">
	  <li><a href="#" onclick="javascript:goHome();">Home</a></li>
	  <li><a>Board</a></li>
	  <li class="secondBranch active">${boardName}</li>
	</ol>		
	
	
<!-- 	<h3 class="sub-header">글 목록</h3> -->
	<form id="boardFrm" name="boardFrm" method="post">
	
	<!-- 리스트에서 선택된 게시글 아이디 -->
	<input type="hidden" id="selectedArticleId" name="selectedArticleId" />
	<input type="hidden" id="boardId" name="boardId" value="${boardId}"/>
	
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
	<c:when test="${null ne pagedResult.articleList && pagedResult.articleList.size() > 0}">
		<c:forEach var="content" items="${pagedResult.articleList}">
		
			<li class="media">
				<a class="pull-left" href="javascript:;">
			<c:choose>
				<c:when test="${content.filePath ne null && content.filePath ne ''}"><img data-src="holder.js/64x64" src="${pageContext.request.contextPath}${content.filePath}" alt="" class="media-object" onerror="this.src='${pageContext.request.contextPath}/img/no_image.png'"  onclick="javascript:goView('${content.articleId}');" data-toggle="modal" data-target="#myModal" width="64px" height="64px"/></c:when>
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
			<li class="media">	
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
	                                                                                                      
	<jsp:include page="../../common/paging.jsp" flush="false">
	    <jsp:param value="${totalPageCnt}"            name="totalPageCnt"/>
	    <jsp:param value="${pagedResult.pageNo}"      name="pageNo"/>
	    <jsp:param value="${pagedResult.startPageNo}" name="startPageNo"/>
	    <jsp:param value="${pagedResult.endPageNo}"   name="endPageNo"/>   
	</jsp:include>


<!-- 	<fieldset class="form-group"> -->
		<div class="btn-group btn-group-justified" style="padding-bottom: 20px;">
			<div class="btn-group">

				<input type="submit" class="btn btn-default pull-right" value="글쓰기" name="goToWrite" />
			</div>
		</div>	
<!-- 	</fieldset> -->
</body>
</html>