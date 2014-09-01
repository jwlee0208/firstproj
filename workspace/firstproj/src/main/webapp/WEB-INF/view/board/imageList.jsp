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
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/list.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
</head>
<body>
	<h1 id="btn-groups" class="page-header">Board</h1>
	
	<ol class="breadcrumb">
	  <li><a href="#" onclick="javascript:goHome();">Home</a></li>
<!-- 		  <li>게시판</li> -->
	  <li class="secondBranch active">
			<c:if test="${boardId eq 1}">자유게시판</c:if>
			<c:if test="${boardId eq 2}">Q&A</c:if>
			<c:if test="${boardId eq 3}">기타게시판</c:if>		  
	  </li>
	</ol>		
	
			
	
	
<!-- 	<h3 class="sub-header">글 목록</h3> -->
	<form id="boardFrm" name="boardFrm" method="post">
	
	<!-- 리스트에서 선택된 게시글 아이디 -->
	<input type="hidden" id="selectedArticleId" name="selectedArticleId" />
	<input type="hidden" id="boardId" name="boardId" value="${boardId}"/>
	
	<c:set var="list" value="${boardList}" />
	<div class="table-responsive" id="listDiv">
		<!-- paging에 필요한 파라미터 -->
		<input type="hidden" id="pageNo" name="pageNo" value="${pagedResult.pageNo}" /> 
		<input type="hidden" id="totalListCnt" name="totalListCnt" value="${pagedResult.totalListCnt}" /> 
		<input type="hidden" id="totalPageCnt" name="totalPageCnt" value="${pagedResult.totalPageCnt}" /> 
		<input type="hidden" id="startPageNo" name="startPageNo" value="${pagedResult.startPageNo}" /> 
		<input type="hidden" id="pageSize" name="pageSize" value="${pagedResult.pageSize}" />

		<table style="width: 100%;" class="table table-hover">
			<colgroup>
				<col width="10%" />
				<col width="10%" />
				<col width="60%" />
				<col width="10%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th class="text-center">게시글 아이디</th>
					<th class="text-center">이미지</th>
					<th>제목</th>
					<th class="text-center">작성일자</th>
					<th class="text-center">작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${null ne pagedResult.articleList && pagedResult.articleList.size() > 0}">
						<c:forEach var="content" items="${pagedResult.articleList}">
							<tr>
								<td class="text-center">${content.articleId}</td>	
								<td>
<c:choose>
<c:when test="${content.filePath != null && content.filePath != ''}">
				<img src="${pageContext.request.contextPath}${content.filePath}" alt="" class="img-thumbnail"/>
</c:when>
<c:otherwise>
				<img src="${pageContext.request.contextPath}/img/no_image.png" alt="" />
</c:otherwise>
</c:choose>
								</td>								
								<td onclick="javascript:goView('${content.articleId}');">
									${content.title}
									<h3><small>${fn:substring(content.content, 0, 100)}</small></h3>	
								</td>
								<td class="text-center">${fn:substring(content.createDate, 0, 10)}</td>
								<td class="text-center">${content.authorNm}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="list-group-item">
							<td colspan="5">작성된 내용이 없습니다.</td>
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
	                                                                                                      
	<jsp:include page="./paging.jsp" flush="false">
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