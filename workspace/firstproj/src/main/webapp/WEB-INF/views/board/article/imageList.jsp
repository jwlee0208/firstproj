<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/articleList.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
<script>
// 	function getOnlyText(text, index){
		
// 	}
</script>
<c:set var="boardName" value=""/>
<c:if test="${boardId eq 1}"><c:set var="boardName" value="자유게시판"/></c:if>
<c:if test="${boardId eq 2}"><c:set var="boardName" value="Q&A"/></c:if>
<c:if test="${boardId eq 3}"><c:set var="boardName" value="기타게시판"/></c:if>	
<div class="container">
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
	<input type="hidden" id="boardId" 			name="boardId" 				value="${boardId}"/>
	
	<!-- 검색 영역 -->	
	<div class="form-group">
		
		<div class="col-sm-10">
			<input type="hidden" 	id="searchCondition" name="searchCondition" value="titleNcontent"/>
			<input type="text" 		id="searchText" 	 name="searchText" 		class="form-control"/>		
		</div>
		<div class="btn-group">
			<input type="button" onclick="javascript: goSearch();" class="btn btn-default" value="검색"/>
		</div>
	</div>	
	
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
				<c:when test="${content.filePath ne null && content.filePath ne ''}"><img data-src="holder.js/233x101" src="${pageContext.request.contextPath}${content.filePath}" alt="" class="img-thumbnail" onerror="this.src='${pageContext.request.contextPath}/img/no_image.png'"  onclick="javascript:goArticleView('${content.articleId}');" data-toggle="modal" data-target="#myModal" width="400px" height="200px"/></c:when>
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
</div>
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
		url : '/board/article/view.page',
		data : {selectedArticleId : articleId},
		dataType : 'html',
		success : function(data){
			$('.modal-title').html(($(data).find(".panel-title").html()));
			$('.modal-body').html(($(data).find(".panel-body").html()));
		}
	});
}	
</script>