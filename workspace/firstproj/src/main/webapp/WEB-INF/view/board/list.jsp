<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/list.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
</head>
<body>
	<h3 class="sub-header">글 목록</h3>
	<form id="boardFrm" name="boardFrm" method="post">
	
	<!-- 리스트에서 선택된 게시글 아이디 -->
	<input type="hidden" id="selectedBoardId" name="selectedBoardId" />
	<input type="hidden" id="boardCategory" name="boardCategory" value="${boardCategory}"/>
	
	<c:set var="list" value="${boardList}" />
	<div class="table-responsive" id="listDiv">
		<!-- paging에 필요한 파라미터 -->
		<input type="hidden" id="pageNo" name="pageNo" value="${pagedResult.pageNo}" /> 
		<input type="hidden" id="totalListCnt" name="totalListCnt" value="${pagedResult.totalListCnt}" /> 
		<input type="hidden" id="totalPageCnt" name="totalPageCnt" value="${pagedResult.totalPageCnt}" /> 
		<input type="hidden" id="startPageNo" name="startPageNo" value="${pagedResult.startPageNo}" /> 
		<input type="hidden" id="pageSize" name="pageSize" value="${pagedResult.pageSize}" />

		<table style="width: 100%;" class="table table-striped">
			<colgroup>
				<col width="10%" />
				<col width="50%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th>게시글 아이디</th>
					<th>제목</th>
					<th>작성일자</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${null ne pagedResult.articleList && pagedResult.articleList.size() > 0}">
						<c:forEach var="content" items="${pagedResult.articleList}">
							<tr>
								<td>${content.boardId}</td>	
								<td onclick="javascript:goView('${content.boardId}');">${content.title}</td>
								<td>${content.createDate}</td>
								<td>${content.authorNm}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="list-group-item">
							<td colspan="3">작성된 내용이 없습니다.</td>
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


	<fieldset class="form-group">
		<input type="submit" class="btn btn-primary pull-right" value="글쓰기" name="goToWrite" />
	</fieldset>
</body>
</html>