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
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
<script>
// 	function getOnlyText(text, index){
		
// 	}
</script>
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
	<input type="hidden" id="boardId" 			name="boardId" 				value="${boardId}"/>
	
	<c:set var="list" value="${boardList}" />
	<div class="table-responsive" id="listDiv">
		<!-- paging에 필요한 파라미터 -->
		<input type="hidden" id="pageNo" 		name="pageNo" 		value="${pagedResult.pageNo}" /> 
		<input type="hidden" id="totalListCnt" 	name="totalListCnt" value="${pagedResult.totalListCnt}" /> 
		<input type="hidden" id="totalPageCnt" 	name="totalPageCnt" value="${pagedResult.totalPageCnt}" /> 
		<input type="hidden" id="startPageNo" 	name="startPageNo" 	value="${pagedResult.startPageNo}" /> 
		<input type="hidden" id="pageSize" 		name="pageSize" 	value="${pagedResult.pageSize}" />

		
		
		
			
<c:choose>
	<c:when test="${null ne pagedResult.articleList && pagedResult.articleList.size() > 0}">
		<c:forEach var="content" items="${pagedResult.articleList}" varStatus="index">		
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					
			<c:choose>
				<c:when test="${content.filePath ne null && content.filePath ne ''}"><img data-src="holder.js/233x101" src="${pageContext.request.contextPath}${content.filePath}" alt="" class="img-thumbnail" onerror="this.src='${pageContext.request.contextPath}/img/no_image.png'"  onclick="javascript:goArticleView('${content.articleId}');" onedata-toggle="modal" data-target="#myModal" width="400px" height="200px"/></c:when>
				<c:otherwise><img data-src="holder.js/233x101" src="${pageContext.request.contextPath}/img/no_image.png" 	 alt="" class="img-thumbnail" onclick="javascript:goArticleView('${content.articleId}');" data-toggle="modal" data-target="#myModal" width="400px" height="200px"/></c:otherwise>
			</c:choose>					
					
					<div class="caption">
						<h3><span onclick="javascript:goArticleView('${content.articleId}');" data-toggle="modal" data-target="#myModal">${content.title}</span></h3>
						<p class="content_${index.count}" style="text-overflow:ellipsis; overflow:hidden;">
							<c:if test="${content.content eq null || content.content eq ''}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;11</c:if>
							<c:if test="${content.content ne null && content.content ne ''}">
								<span onclick="javascript:goArticleView('${content.articleId}');" data-toggle="modal" data-target="#myModal">${fn:substring(content.contentText, 0, 31)}...</span>
							</c:if>
						</p>
						<p><span class="btn btn-default" role="button" onclick="javascript:goArticleView('${content.articleId}');" data-toggle="modal" data-target="#myModal">상세보기</span></p>
					</div>

				</div>	
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
						
						작성된 내용이 없습니다.
						
	</c:otherwise>
</c:choose>
		</div>
<!-- 		<table style="width: 100%;" class="table table-hover"> -->
<%-- 			<colgroup> --%>
<%-- 				<col width="10%" /> --%>
<%-- 				<col width="10%" /> --%>
<%-- 				<col width="60%" /> --%>
<%-- 				<col width="10%" /> --%>
<%-- 				<col width="10%" /> --%>
<%-- 			</colgroup> --%>
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th class="text-center">게시글 아이디</th> -->
<!-- 					<th class="text-center">이미지</th> -->
<!-- 					<th>제목</th> -->
<!-- 					<th class="text-center">작성일자</th> -->
<!-- 					<th class="text-center">작성자</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${null ne pagedResult.articleList && pagedResult.articleList.size() > 0}"> --%>
<%-- 						<c:forEach var="content" items="${pagedResult.articleList}"> --%>
<!-- 							<tr> -->
<%-- 								<td class="text-center">${content.articleId}</td>	 --%>
<!-- 								<td> -->
<%-- <c:choose> --%>
<%-- <c:when test="${content.filePath != null && content.filePath != ''}"> --%>
<%-- 				<img src="${pageContext.request.contextPath}${content.filePath}" alt="" class="img-thumbnail"/> --%>
<%-- </c:when> --%>
<%-- <c:otherwise> --%>
<%-- 				<img src="${pageContext.request.contextPath}/img/no_image.png" alt="" /> --%>
<%-- </c:otherwise> --%>
<%-- </c:choose> --%>
<!-- 								</td>								 -->
<%-- 								<td onclick="javascript:goView('${content.articleId}');"> --%>
<%-- 									${content.title} --%>
<%-- 									<h3><small>${fn:substring(content.content, 0, 100)}</small></h3>	 --%>
<!-- 								</td> -->
<%-- 								<td class="text-center">${fn:substring(content.createDate, 0, 10)}</td> --%>
<%-- 								<td class="text-center">${content.authorNm}</td> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<tr class="list-group-item"> -->
<!-- 							<td colspan="5">작성된 내용이 없습니다.</td> -->
<!-- 						</tr> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<!-- 			</tbody> -->
<!-- 		</table> -->
	
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

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="width : 700px;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body" style="height : 500px; overflow-y:scroll; word-wrap:break-word; "></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


</body>
<script>
$().ready(function(){
	$("img").each(function(index){
		$(this).error(function(){
			$(this).attr("src", "${pageContext.request.contextPath}/img/no_image.png");
		});	
	});
});
	
function goArticleView(articleId){
	$.ajax({
		url : '/board/view.page',
		data : {selectedArticleId : articleId},
		dataType : 'html',
		success : function(data){
			$('.modal-title').html(($(data).find(".panel-title").html()));
			$('.modal-body').html(($(data).find(".panel-body").html()));
		}
	});
}	
</script>
</html>