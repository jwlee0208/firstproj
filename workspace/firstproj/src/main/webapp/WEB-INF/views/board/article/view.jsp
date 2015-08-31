<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<style>
#myCarousel .thumbnail {
	margin-bottom: 0;
}
.carousel-control.left, .carousel-control.right {
	background-image:none !important;
}
.carousel-control {
	color:#fff;
	top:40%;
	color:#428BCA;
	bottom:auto;
	padding-top:4px;
	width:30px;
	height:30px;
	text-shadow:none;
	opacity:1;
}
.carousel-control:hover {
	color: #d9534f;
}
.carousel-control.left, .carousel-control.right {
	background-image:none !important;
}
.carousel-control.right {
	left:auto;
	right:-32px;
}
.carousel-control.left {
	right:auto;
	left:-32px;
}
.carousel-indicators {
	bottom:-30px;
}
.carousel-indicators li {
	border-radius:0;
	width:10px;
	height:10px;
	background:#ccc;
	border:1px solid #ccc;
}
.carousel-indicators .active {
	width:12px;
	height:12px;
	background:#3276b1;
	border-color:#3276b1;
}

</style>
</head>
<body>

<!-- <div class="container"> -->

<div>
	<form id="viewFrm" name="viewForm" method="post" role="form">
	<input type="hidden" id="selectedArticleId" 	name="selectedArticleId" 	value="${contentInfo.articleId}"/>
	<input type="hidden" id="boardId" 				name="boardId" 				value="${contentInfo.boardId}"/>
	<input type="hidden" id="prevArticleId" 		name="prevArticleId" 		value="${prevContentInfo.articleId}"/>
	<input type="hidden" id="nextArticleId" 		name="nextArticleId" 		value="${nextContentInfo.articleId}"/>

	<h1 id="btn-groups" class="page-header">Article</h1>
	<c:set var="boardName" value=""/>
	<ol class="breadcrumb">
	  <li><a href="javascript:;" onclick="javascript:goHome();">Home</a></li>
	  <li><a href="#" 			 onclick="javascript:goList();">Board</a></li>
	  <li>
	  	  <a href="javascript:;">
<c:if test="${!empty boardList}">
	<c:forEach var="boardInfo" items="${boardList}">
		<c:if test="${boardId eq boardInfo.boardId}"><c:set var="boardName" value="${boardInfo.boardName}"/>${boardName}</c:if>
												
	</c:forEach>
</c:if>		  
		  </a>		  
	  </li>
	  <li class="active">Article</li>
	</ol>		

		<div class="panel panel-primary" role="main">	
					
			<div class="panel-heading">
				<h4 class="panel-title"><c:out value="${contentInfo.title}"/></h4>
			</div>
		
			<div class="panel-body">
				<p style="color:#999; text-align:right;">${fn:substring(contentInfo.createDate, 0, 10)} by <a href="#">${contentInfo.authorNm}</a></p>
				<div style="min-height: 400px;"><c:out value="${contentInfo.content}" escapeXml="false"/></div>
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
				
				
				
				
				
				
			<c:if test="${!empty photoList}">
				<h3>Related Images&nbsp;<small>in Flickr</small></h3>
				<div class="row" style="padding:0 10px 0 10px;">
					<div class="well">
						<div id="myCarousel" class="carousel slide">
							<div class="carousel-inner" style="padding-bottom: 20px;">
								<c:set var="photoListSize" value="${fn:length(photoList)}"/>
								<c:set var="loopIdx" value="${0}"/>
								<c:forEach var="relatedPhoto" items="${photoList}" varStatus="index">
									<c:set var="loopIdx" value="${index.count}"/>
									
									<c:if test="${(loopIdx % 4) eq 1}">
									<c:choose>
										<c:when test="${loopIdx eq 1}">
								<div class="item active">		
										</c:when>
										<c:otherwise>
								<div class="item">				
										</c:otherwise>
									</c:choose>			
									<div class="row">			
									</c:if>
										<div class="col-xs-6 col-md-3">
										  <a href="${relatedPhoto.largeUrl}" class="thumbnail" data-flickr-embed="true" target="_blank" title="${relatedPhoto.title}">
										    <img src="${relatedPhoto.thumbnailUrl}" alt="${relatedPhoto.title}" class="img-responsive" title="${relatedPhoto.title}">
										  </a>
										</div>
				  					<c:if test="${(loopIdx % 4) eq 0 || loopIdx eq photoListSize}">
				  					</div>
				  				</div>		
				  					</c:if>		
								</c:forEach> 
							</div>
							<c:if test="${photoListSize > 4}">
							<a class="left carousel-control" href="#myCarousel" data-slide="prev"><c:out value="<"/></a>
				            <a class="right carousel-control" href="#myCarousel" data-slide="next"><c:out value=">"/></a>
				            <c:set var="indicatorCnt" value="${photoListSize/4}"/>
					            <c:if test="${indicatorCnt > 0}">
			                <ol class="carousel-indicators" style="padding:0 0 10px 0;">
								<c:forEach var="indicator" begin="0" end="${indicatorCnt}" varStatus="index">
			                    <li data-target="#myCarousel" data-slide-to="${index.count - 1}" <c:if test="${index.count eq 1}">class="active"</c:if>></li>
								</c:forEach>												            
			                </ol>                
					            </c:if>		            
				            </c:if>					
						</div>			
					</div>				
				</div>
			</c:if>
			
			
			<c:if test="${!empty slideList}">
				<h3>Related Slides&nbsp;<small>in Slideshare</small></h3>
				<div class="embed-responsive embed-responsive-16by9">
				<c:set var="slideListSize" value="${fn:length(slideList)}"/>
				<c:set var="expandedYn" value="true"/>
				<c:forEach var="slideInfo" items="${slideList}" varStatus="index">
					
					<h4>title : <small>${slideInfo.title}</small></h4>
					<c:out value="${slideInfo.embed}" escapeXml="false"/>
					<c:if test="${slideListSize > 1}">
						<c:if test="${index.count eq 1}">
					<input type="button" id="seeMoreSlideBtn" class="btn btn-success" value="See More Slides"/>	
					<div class="collapse" id="slideListDiv" >
						</c:if>
						<c:if test="${index.count > 1}">
					<c:set var="expandedYn" value="false"/>
						</c:if>
					</c:if>
					<c:if test="${slideListSize > 1 && index.count eq slideListSize}">
					</div>	
					</c:if>
				</c:forEach>
				</div>
			</c:if>
				
			<c:if test="${contentInfo.filePath ne null && contentInfo.filePath ne ''}">	
				<div class="thumbImg unset" style="padding-top : 20px; ">
					썸네일 : 
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
			
			

				<div class="row" style="float: left; padding-left:10px; padding-top:20px;">
					<div class="btn btn-success" title="${contentInfo.boardCategoryName} > ${contentInfo.boardName}">${contentInfo.boardCategoryName} > ${contentInfo.boardName}</div><br/>
				</div>			
				<div class="row" style="float: right; padding-right:10px;">
					<div class="btn btn-primary" title="Sharing Article To Facebook" 	onclick="javascript:share('fb', '${contentInfo.articleId}', '');" >f</div>
					<div class="btn btn-info" 	 title="Sharing Article To Twitter" 	onclick="javascript:share('tw', '${contentInfo.articleId}', '${contentInfo.title}');" >t</div>					
				</div>
			</div>	
		</div>


		<div class="btn-group btn-group-justified" style="padding-bottom : 20px;">
			<div class="btn-group" role="button">
				<input type="button" class="btn btn-default" id="goToList" value="목록"/>
			</div>
			<c:if test="${prevContentInfo.articleId ne null}">
			<div class="btn-group" role="button">
				<input type="button" class="btn btn-default" id="previous" value="Previous"/>			
			</div>
			</c:if>
			<c:if test="${nextContentInfo.articleId ne null}">
			<div class="btn-group" role="button">
				<input type="button" class="btn btn-default" id="next" value="Next"/>		
			</div>
			</c:if>
			<c:if test="${userInfo ne null && userInfo.userId eq contentInfo.authorId}">
			<div class="btn-group" role="button">
				<input type="button" class="btn btn-default pull-right" id="goToModify" value="수정"/>
			</div>			
			<div class="btn-group" role="button">
				<input type="button" class="btn btn-default pull-right" id="goToDelete" value="삭제"/>
			</div>			
			</c:if>
		</div>
	</form>
</div>
</body>
<script>
	$(document).on("ready", function(){
		
		// Check out noImage
		chkNoImage();

		$("iframe").addClass("embed-responsive-item");
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

	$(function(){
		$("#seeMoreSlideBtn").click(function(){
			if($("#slideListDiv").hasClass("in")){
				$("#seeMoreSlideBtn").val("See More Slides");
			}else{
				$("#seeMoreSlideBtn").val("Hide Slides");
			}

			$(".collapse").collapse("toggle");
					
		});
	});
</script>

</html>