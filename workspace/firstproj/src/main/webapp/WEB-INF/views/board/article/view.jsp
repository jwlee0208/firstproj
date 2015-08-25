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
<!-- <meta charset="UTF-8"> -->
<!-- <meta http-equiv="X-UA-Compatible" 	content="IE=Edge" /> -->
<!-- <meta name="viewport" 				content="width=device-width, initial-scale=1"> -->
<%-- <meta name="title" 					content=<c:out value="${contentInfo.title}"/>/> --%>
<%-- <meta name="author" 				content="${contentInfo.authorNm}"/> --%>
<%-- <meta name="description" 			content="<c:out value='${content}'/>"/> --%>
<!-- <meta name="robots" 				content="index,follow" />  -->
<!-- <meta name="keywords" 				content="blog, baseball, link, player, profile"/> -->

<!-- <meta property="fb:app_id" 			content="413877918810589" /> -->
<!-- <meta property="og:type" 			content="website" /> -->
<%-- <meta property="og:title" 			content=<c:out value="${contentInfo.title}"/> /> --%>
<%-- <meta property="og:url" 			content="http://jwlee0208.cafe24.com/board/article/view/${contentInfo.articleId}" /> --%>
<%-- <meta property="og:description" 	content="<c:out value='${content}'/>" /> --%>
<%-- <meta property="og:image" 			content="http://jwlee0208.cdn3.cafe24.com${contentInfo.filePath}" /> --%>

<!-- <meta name="google-site-verification" 	content="7UeiOduowaVDwAs8XpEDd9CCnyDQr6I2npw9k8guOCc" /> -->

<!-- <meta http-equiv="Pragma" 				content="no-cache"> -->
<!-- <meta http-equiv="expires" 				content="-1" > -->


<title><c:out value="${contentInfo.title}"/></title>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/articleView.js"></script>
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
	
	<ol class="breadcrumb">
	  <li><a href="javascript:;" onclick="javascript:goHome();">Home</a></li>
	  <li><a href="#" 			 onclick="javascript:goList();">Board</a></li>
	  <li>
	  	  <a href="javascript:;">
<c:if test="${!empty boardList}">
	<c:forEach var="boardInfo" items="${boardList}">
		<c:if test="${boardId eq boardInfo.boardId}">${boardInfo.boardName}</c:if>										
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
				<div class="embed-responsive embed-responsive-16by9">
					<c:set var="slideshareLinkInfos" value="${contentInfo.slideshareLinkInfos}"/>
					
					<c:if test="${!empty slideshareLinkInfos}">
						<c:forEach var="slideshareLinkInfo" items="${slideshareLinkInfos}">
							<c:out value="${slideshareLinkInfo.slideshareLinkUrl}" escapeXml="false"/><br/>
						</c:forEach>
					</c:if>				
				</div>
				
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
			
			

				<div class="row" style="float: left; padding-left:10px;">
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
		// Initiate Meta Tag's Data
		initMetaData();
		
		// Check out noImage
		chkNoImage();

		$("iframe").addClass("embed-responsive-item");
	});
	function initMetaData(){
		/*
		$("head meta[name=title]").attr("content", '${contentInfo.title}');	
		$("head meta[name=description]").attr("content", '<c:out value="${content}"/>');
		$("head meta[name=author]").attr("content", '${contentInfo.authorNm}');
		$("title").text('${contentInfo.title}');
		*/
		$("#meta_title").attr("content", '${contentInfo.title}');	
		$("#meta_desc").attr("content", '<c:out value="${content}"/>');
		$("#meta_author").attr("content", '${contentInfo.authorNm}');
		$("title").text('${contentInfo.title}');
		
	}
	function chkNoImage(){
		$("div img").addClass("media-object");
		$("div img").attr("width", "95%");
		$("div img").off("error");
		$("div img").on("error", function(){
			$(this).attr("src", '${pageContext.request.contextPath}/img/no_image.png');
		});
	}
</script>

</html>