<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flickr Image Popup</title>
</head>
<body>
<form id="actionFrm" name="actionFrm" method="post">
	<div class="container">
		<h1 id="btn-groups" class="page-header">Flickr Image</h1>
		<div style="padding:10px 10px 10px 10px;" class="row">
			<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="Insert Search Keyword." value="${searchKeyword}"/>
		</div>
		<div style="padding:10px 10px 10px 10px;" class="row">
			<input type="text" class="form-control" id="userId" name="userId" placeholder="Insert Your Flickr's UserId" value="${userId}"/>
		</div>	
		<hr/>
<c:choose>
<c:when test="${!empty photoList}">

	<c:forEach var="relatedPhoto" items="${photoList}" varStatus="index">
<!-- 		<div class="well" style="padding:10px 10px 10px 10px;"> -->
		<c:if test="${index.count % 4 eq 1}">
			<div class="row" style="margin: 0 0px 5px 0px;">
		</c:if>	
				<div class="col-xs-6 col-sm-3 well">
					<a href="javascript:;" data-flickr-embed="true" title="${relatedPhoto.title}" alt="choice picture if you want to add." id="${relatedPhoto.largeUrl}">
						<img src="${relatedPhoto.smallUrl}" alt="${relatedPhoto.title}" class="img-thumbnail" title="${relatedPhoto.title}" >
					</a>						
					<input type="button" class="btn btn-info btn-block img${index.count}" onclick="javascript:imgAdd('${relatedPhoto.largeUrl}',${index.count});" style="float:right; padding-top: 3px;" value="select" />
<%-- 					<a href="javascript:;" data-flickr-embed="true" title="${relatedPhoto.title}" alt="choice picture if you want to add." id="${relatedPhoto.largeUrl}"> --%>
<%-- 					   <img src="${relatedPhoto.smallUrl}" alt="${relatedPhoto.title}" class="img-thumbnail" title="${relatedPhoto.title}" > --%>
<!-- 					</a> -->
				</div>
<!-- 				<div class="col-xs-6">  -->
<%-- 					<input type="button" class="btn btn-info img${index.count}" onclick="javascript:imgAdd('${relatedPhoto.largeUrl}',${index.count});" style="float:right; " value="select" /> --%>
<!-- 				</div>   -->
		<c:if test="${index.count % 4 eq 0}">
			</div>
		</c:if>	
<!-- 		</div> -->
	</c:forEach>		
		
</c:when>
<c:otherwise>
	<div class="row" style="text-align:center;">
		There is no searched images.
	</div>
</c:otherwise>
</c:choose>
</div>
</form>
</body>
<script>
function imgAdd(fileUrl, count) {
	opener.editorImgSelectorComplete(fileUrl);
	$(".img"+count).val("selected");
	$(".img"+count).removeClass("btn-info");
	$(".img"+count).addClass("btn-danger");
}

$(function(){
	$("input[name=searchKeyword],input[name=userId]").keypress(function(event){
		if(event.which == 13){
			event.preventDefault();
			var frm = $("#actionFrm");
			frm.attr("action", location.pathname);
			frm.attr("method", "post");
			frm.submit();
		}
	});
});
</script>
</html>