<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/articleView.js"></script>
<div class="container">
	<form id="viewFrm" name="viewForm" method="post">
	<input type="hidden" id="selectedArticleId" 	name="selectedArticleId" value="${contentInfo.articleId }"/>
	<input type="hidden" id="boardId" 				name="boardId" 				value="${contentInfo.boardId}"/>
	<input type="hidden" id="prevArticleId" 		name="prevArticleId" 		value="${prevContentInfo.articleId}"/>
	<input type="hidden" id="nextArticleId" 		name="nextArticleId" 		value="${nextContentInfo.articleId}"/>

	<h1 id="btn-groups" class="page-header">Article</h1>
	
	<ol class="breadcrumb">
	  <li><a href="javascript:;" onclick="javascript:goHome();">Home</a></li>
	  <li>
	  	  <a href="javascript:;">
			<c:if test="${boardId eq 1}">자유게시판</c:if>
			<c:if test="${boardId eq 2}">Q&A</c:if>
			<c:if test="${boardId eq 3}">기타게시판</c:if>	
		  </a>		  
	  </li>
	  <li class="active">Article</li>
	</ol>		

		<div class="panel panel-default">	
			<div class="panel-heading">
				<h4 class="panel-title">${contentInfo.title}</h4>
			</div>
			<div class="panel-body" style="min-height: 300px;">
				${contentInfo.content}

							<c:if test="${contentInfo.filePath ne null && contentInfo.filePath ne ''}">	
								<div class="thumbImg unset" style="padding-top : 20px; ">
								썸네일 : 
									<ul class="media-list">					
										<li class="media">
											<a class="pull-left" href="javascript:;">
												
													<img data-src="holder.js/64x64" src="${pageContext.request.contextPath}${contentInfo.filePath}" 
														 alt="" class="media-object" onerror="this.src='${pageContext.request.contextPath}/img/no_image.png'"  
														 onclick="javascript:goView('${contentInfo.articleId}');" 
														 data-toggle="modal" data-target="#myModal" 
														 width="64px" height="64px"/>
											</a>
											 <div class="media-body" onclick="javascript:goView('${contentInfo.articleId}');">
											 	<p>파일명 : ${contentInfo.originalFileName}</p>
											 	
											 </div>
										</li>							
									</ul>	
								</div>										
							</c:if>
			


			</div>	
			
			
<!-- 			<div class="panel-footer"> -->
<!-- 				<ul class="pager"> -->
<%-- 					<c:if test="${prevContentInfo.articleId ne null}"> --%>
<!-- 					<li><a href="javascript:void(0);" id="previous">Previous</a></li> -->
<%-- 					</c:if> --%>
<%-- 					<c:if test="${nextContentInfo.articleId ne null}"> --%>
<!-- 					<li><a href="javascript:void(0);" id="next">Next</a></li>	 -->
<%-- 					</c:if> --%>
<!-- 				</ul>			 -->
<!-- 			</div> -->
		</div>


		<div class="btn-group btn-group-justified" style="padding-bottom : 20px;">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="goToList" value="목록"/>
			</div>
			<c:if test="${prevContentInfo.articleId ne null}">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="previous" value="Previous"/>			
			</div>
			</c:if>
			<c:if test="${nextContentInfo.articleId ne null}">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="next" value="Next"/>		
			</div>
			</c:if>
			<div class="btn-group">
				<input type="button" class="btn btn-default pull-right" id="goToModify" value="수정"/>
			</div>			
			<div class="btn-group">
				<input type="button" class="btn btn-default pull-right" id="goToDelete" value="삭제"/>
			</div>			

		</div>
	</form>
</div>