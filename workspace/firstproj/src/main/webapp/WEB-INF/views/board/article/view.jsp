<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<c:set var="content" value="${fn:escapeXml(contentInfo.contentText)}"/>
<c:choose>
	<c:when test="${content ne null && content ne ''}">
		<c:set var="content" value="${fn:escapeXml(content)}"/>
		<c:if test="${fn:length(content) > 50}">
			<c:set var="content" value="${fn:substring(content, 0, 50)}"/>	
		</c:if>
	</c:when>
	<c:otherwise>
		<c:set var="content" value="n/a"/>
	</c:otherwise>
</c:choose>

<title><c:out value="${contentInfo.title}"/></title>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/articleView.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/image_slider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal.css">
</head>
<body>

<div>
	<form id="viewFrm" name="viewForm" method="post" role="form">
	<input type="hidden" id="selectedArticleId" 	name="selectedArticleId" 	value="${contentInfo.articleId}"/>
	<input type="hidden" id="boardId" 				name="boardId" 				value="${contentInfo.boardId}"/>
	<input type="hidden" id="prevArticleId" 		name="prevArticleId" 		value="${prevContentInfo.articleId}"/>
	<input type="hidden" id="nextArticleId" 		name="nextArticleId" 		value="${nextContentInfo.articleId}"/>
	<!-- flickr / slideshare /etc,.'s search keyword parameter -->
	<input type="hidden" id="keyword" 				name="keyword" 				value="${contentInfo.title}"/>
<!-- <div class="container"> -->
<c:if test="${contentInfo.boardId eq 15}">
	<%@ include file="/WEB-INF/views/common/registPlayer.jsp"%>	
</c:if>	
	<h1 id="btn-groups" class="page-header"><tag:message code='text.article'/></h1>
	<c:set var="boardName" value=""/>
	<ol class="breadcrumb">
	  <li><a href="javascript:;" onclick="javascript:goMyShare('${shareInfo.userId}');"><tag:message code='text.home'/></a></li>
	  <li><a href="javascript:;" onclick="javascript:goList('${contentInfo.boardId}');"><tag:message code='text.board'/></a></li>
	  <li>
<c:if test="${!empty boardList}">
	<c:forEach var="boardInfo" items="${boardList}">
		<c:if test="${boardId eq boardInfo.boardId}">
			<c:set var="boardName" value="${boardInfo.boardName}"/>
			<a href="javascript:;" onclick="javascript:goList('${boardId}');">${boardName}</a>
		</c:if>									  
	</c:forEach>
</c:if>		  
	  </li>
	  <li class="active"><tag:message code='text.article'/></li>
	</ol>		

		<div class="panel panel-default" role="main">	
					
			<div class="panel-heading">
				<h4 class="panel-title" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"><c:out value="${contentInfo.title}"/></h4>
			</div>
		
			<div class="panel-body" style="padding-left: 15px;">
				<p style="text-align: right;"><a href="http://linkednest.net/share/${contentInfo.shareInfo.userId}/view/${contentInfo.articleId}" target="_blank">http://linkednest.net/share/${contentInfo.shareInfo.userId}/view/${contentInfo.articleId}</a></p>
				<p style="color:#999; text-align:right;">${fn:substring(contentInfo.createDate, 0, 10)} by <a href="#">${contentInfo.authorNm}</a></p>
				<div style="min-height: 400px; white-space: normal; white-break: break-all;"><c:out value="${contentInfo.content}" escapeXml="false"/></div>
				<!-- slideshare iframe area -->
				<div class="embed-responsive embed-responsive-16by9">
					<c:set var="slideshareLinkInfos" value="${contentInfo.slideshareLinkInfos}"/>
					
					<c:if test="${!empty slideshareLinkInfos}">
					<c:if test="${slideshareLinkInfos[0].slideId ne 0}">
					<h3>Ref.] Slide&nbsp;<small>in SlideShare</small></h3>
					</c:if>
						<c:forEach var="slideshareLinkInfo" items="${slideshareLinkInfos}">
							<c:out value="${slideshareLinkInfo.slideshareLinkUrl}" escapeXml="false"/><br/>
						</c:forEach>
					</c:if>				
				</div>
				<div class="row" style="float: left; padding-left:10px;">
					<div class="btn btn-success" title="${contentInfo.boardCategoryName} > ${contentInfo.boardName}" onclick="javascript:goMyShare('${contentInfo.shareInfo.userId}');">${contentInfo.shareInfo.shareName}</div>			
				</div>				
				<div class="row" style="float: right; padding-right:10px;">
					<div class="btn btn-primary" title="Sharing Article To Facebook"	onclick="javascript:share('fb', '${contentInfo.articleId}', '', '${contentInfo.shareInfo.userId}');" >f</div>
					<div class="btn btn-info" 	 title="Sharing Article To Twitter" 	onclick="javascript:share('tw', '${contentInfo.articleId}', '${contentInfo.title}', '${contentInfo.shareInfo.userId}');" >t</div>
				</div>
				
			</div>	
			<div class="panel-footer">
			<c:if test="${contentInfo.filePath ne null && contentInfo.filePath ne ''}">	
				<div class="thumbImg unset" style="padding-top : 20px; ">
					<span class="glyphicon glyphicon-picture" aria-hidden="true"></span> 
					<ul class="media-list">					
						<li class="media">
							<a class="pull-left" href="javascript:;">
								<img data-src="holder.js/64x64" src="http://jwlee0208.cdn3.cafe24.com/${contentInfo.filePath}" 
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
			<c:if test="${contentInfo.filePath eq null || contentInfo.filePath eq ''}">
				&nbsp;
			</c:if>
			</div>
		</div>
		
		<div class="btn-group btn-group-justified" style="padding-bottom : 20px;">
			<c:if test="${userInfo ne null && userInfo.userId eq contentInfo.authorId}">
			<div class="btn-group" role="button">
				<input type="button" class="btn btn-default pull-right" id="goToModify" value="<tag:message code="common.modify"/>"/>
			</div>			
			<div class="btn-group" role="button">
				<input type="button" class="btn btn-default pull-right" id="goToDelete" value="<tag:message code="common.delete"/>"/>
			</div>			
			</c:if>
		</div>
		
		<div class="btn-group btn-group-justified" style="padding: 0 15px 20px 15px;">
			<c:if test="${nextContentInfo.articleId ne null}">
			<div class="row">
				<input type="button" class="btn btn-link btn-block btn-lg" id="next" style="text-align:left; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" value="[Next]&nbsp;${nextContentInfo.title}"/>
			</div>
			</c:if>
			<c:if test="${prevContentInfo.articleId ne null}">
			<div class="row">
				<input type="button" class="btn btn-link btn-block btn-lg" id="previous" style="text-align:left; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" value="[Prev]&nbsp;${prevContentInfo.title}"/>
			</div>
			</c:if>		
		</div>
			
		<div class="btn-group btn-group-justified" style="padding-bottom : 20px;">
			<div class="btn-group" role="button">
				<input type="button" class="btn btn-default btn-block" id="goToList" value="<tag:message code="common.list"/>"/>
			</div>
		</div>

		<div class="btn-group btn-group-justified" style="padding-bottom : 20px;">
			<div class="btn-group" role="button" id="streamDiv">
				<!-- Trigger the modal with a button -->
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#youtubeList">Related Streams</button>
			</div>	
			<div class="btn-group" role="button" id="slideDiv">
				<!-- Trigger the modal with a button -->
				<button type="button" class="btn btn-info" data-toggle="modal" data-target="#slideList">Related Slides</button>
			</div>
			<div class="btn-group" role="button" id="photoDiv">
				<!-- Trigger the modal with a button -->
		    	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#photoList">Related Photos</button>
		    </div>	
		</div>

		  
		  
		
		  <!-- Modal -->
		  <div class="modal fade" id="youtubeList" role="dialog">
		    <div class="modal-dialog modal-lg">
		      <div class="modal-content">
		        <div class="modal-header modal-header-danger">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Related Streams&nbsp;<small>in Youtube</small></h4>
		        </div>
		        <div class="modal-body">
		          <div id="youtubeListDiv"></div>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
		  
		
		  <!-- Modal -->
		  <div class="modal fade" id="slideList" role="dialog">
		    <div class="modal-dialog modal-lg">
		      <div class="modal-content">
		        <div class="modal-header modal-header-info">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Related Slides&nbsp;<small>in Slideshare</small></h4>
		        </div>
		        <div class="modal-body">
		          <div id="slideshareListDiv"></div>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>

		
		  <!-- Modal -->
		  <div class="modal fade" id="photoList" role="dialog">
		    <div class="modal-dialog modal-lg">
		      <div class="modal-content">
		        <div class="modal-header modal-header-primary">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Related Photos&nbsp;<small>in Flickr</small></h4>
		        </div>
		        <div class="modal-body">
		          <div id="flickrImageListDiv"></div>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		  </div>
		  	
	</form>
</div>
</body>
<script>
	$(document).on("ready", function(){
		
		// Check out noImage
		chkNoImage();

		$("iframe").addClass("embed-responsive-item");

		$.ajaxSetup({ scriptCharset: "utf-8" , contentType: "application/json; charset=utf-8"});
		
		// load to flickr image list 
		$("#flickrImageListDiv").load("/api/flickr/photoList", $("#viewFrm").serialize());

		// load to slideshare list
		$("#slideshareListDiv").load("/api/slideshare/slideList", $("#viewFrm").serialize());

		// load to youtube list
		$("#youtubeListDiv").load("/api/youtube/streamList", $("#viewFrm").serialize());

		$("#registPlayer").click(function(){
			location.href = "/player/write";	
		});	
	});

	function chkNoImage(){
		$("div img").addClass("media-object");
		$("div img").attr("width", "95%");
		$("div img").removeAttr("height");
		$("div img").off("error");
		$("div img").on("error", function(){
			$(this).attr("src", '${pageContext.request.contextPath}/img/no_image.png');
		});
	}

	function hideDiv(type){
		$("#"+type+"Div").hide();
	}
</script>

</html>