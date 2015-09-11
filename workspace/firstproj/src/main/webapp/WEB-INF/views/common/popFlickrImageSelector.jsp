<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
<c:when test="${!empty photoList}">
	<div class="container-fluid">
	<c:forEach var="relatedPhoto" items="${photoList}" varStatus="index">
		<div class="well" style="padding:0 10px 0 10px;">
			<div class="row">
					<div class="col-xs-6">
					  <a href="javascript:;" data-flickr-embed="true" title="${relatedPhoto.title}" alt="choice picture if you want to add." id="${relatedPhoto.largeUrl}">
					    <img src="${relatedPhoto.smallUrl}" alt="${relatedPhoto.title}" class="img-thumbnail" title="${relatedPhoto.title}" >
					  </a>
					</div>
					<div class="col-xs-6"> 
					  <input type="button" class="btn btn-info" value="select" onclick="javascript:imgAdd('${relatedPhoto.largeUrl}');" style="float:right; "/>
					</div>  
			</div>
		</div>
	</c:forEach>		
	</div>	
</c:when>
<c:otherwise>

</c:otherwise>
</c:choose>
</body>
<script>
function imgAdd(fileUrl) {
	opener.editorImgSelectorComplete(fileUrl);
}

</script>
</html>