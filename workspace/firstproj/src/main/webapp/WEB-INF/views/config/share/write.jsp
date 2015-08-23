<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::: Configuration Share Info. :::</title>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/common-editor.js"></script>

</head>
<body>
<div class="container">
	<div class="page-header">
 	  <h1>Configuration&nbsp;&nbsp;&nbsp;<small>My Share Profile</small></h1>
	</div>	
	
	<ol class="breadcrumb">
	  <li><a>configuration</a></li>
	  <li><a>share</a></li>
	  <li><a>configuration Share Info.</a></li>
	</ol>		

	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form">
		<input type="hidden" id="shareId" name="shareId" value="${shareInfo.shareId}"/>
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">My Share Name</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="shareName" name="shareName" value='<c:out value="${shareInfo.shareName}"/>'/><span id="shareNameErr" class="errorMsg" style="display: none;"></span>
			</div>
		</div>
	
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">Share Menu Type</label>
			<div class="col-sm-10">
				<label class="radio-inline"><input type="radio" id="shareType" name="shareType" value='<c:out value="${shareInfo.shareType}"/>'/></label><span style="width : 30px; height : 20px; background-color : #efefef; padding: 3px 3px 3px 3px;">회색</span>
				<label class="radio-inline"><input type="radio" id="shareType" name="shareType" value='<c:out value="${shareInfo.shareType}"/>'/></label><span style="width : 30px; height : 20px; background-color : #e74c3c; padding: 3px 3px 3px 3px; color: white;">빨강색</span>
				<label class="radio-inline"><input type="radio" id="shareType" name="shareType" value='<c:out value="${shareInfo.shareType}"/>'/></label><span style="width : 30px; height : 20px; background-color : #2ecc71; padding: 3px 3px 3px 3px; color: white;">녹색</span>
				<label class="radio-inline"><input type="radio" id="shareType" name="shareType" value='<c:out value="${shareInfo.shareType}"/>'/></label><span style="width : 30px; height : 20px; background-color : #9b59b6; padding: 3px 3px 3px 3px; color: white;">보라색</span>
				<label class="radio-inline"><input type="radio" id="shareType" name="shareType" value='<c:out value="${shareInfo.shareType}"/>'/></label><span style="width : 30px; height : 20px; background-color : #e67e22; padding: 3px 3px 3px 3px; color: white;">주황색</span>
			</div>
		</div>	
	
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">Introduce</label>
			<div class="col-sm-10">
				<textarea class="form-control tinymce" id="introduce" name="introduce"><c:out value="${shareInfo.introduce}"/></textarea>
				<span id="introduceErr" class="errorMsg" style="display: none;"></span>
			</div>
		</div>	
	
	
	
	</form>
</div>	
</body>
</html>