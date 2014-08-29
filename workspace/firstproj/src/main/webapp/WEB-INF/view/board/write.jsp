<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/common-editor.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/board/write.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/board/common.js"></script>

</head>
<body>
	<form id="writeFrm" name="writeFrm" method="post" role="form" enctype="multipart/form-data">
	
	<input type="hidden" id="authorId" name="authorId" value="jwlee"/>
	<input type="hidden" id="authorNm" name="authorNm" value="jinwon"/>
	<div class="wrap">
	<h1 id="btn-groups" class="page-header">Write Content</h1>
	
	<ol class="breadcrumb">
	  <li><a href="#" onclick="javascript:goHome();">Home</a></li>
<!-- 		  <li>게시판</li> -->
	  <li>
	  	<a href="javascript:;"> 
			<c:if test="${boardId eq 1}">자유게시판</c:if>
			<c:if test="${boardId eq 2}">Q&A</c:if>
			<c:if test="${boardId eq 3}">기타게시판</c:if>	
		</a>		  
	  </li>
	  <li class="active">글 작성</li>
	</ol>
		<div class="writeArea list-group-item">
			<table class="table table-condensed">
				<colgroup><col width="10%"/><col width="90%"/></colgroup>
				<tbody>
					<tr>
						<th><div class="form-group">카테고리</div></th>
						<td>
							<div class="form-group">
								<select class="form-control" id="boardId" name="boardId">
									<option <c:if test='${boardId eq 0}'>selected</c:if> value="0">-선택-</option>
									<option <c:if test="${boardId eq 1}">selected</c:if> value="1">자유게시판</option>
									<option <c:if test="${boardId eq 2}">selected</c:if> value="2">Q&A</option>
									<option <c:if test="${boardId eq 3}">selected</c:if> value="3">기타</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th><div class="form-group">제목</div></th>
						<td><div class="form-group"><input type="text" class="form-control" id="title" name="title"/></div></td>
					</tr>
					<tr>
						<th><div class="form-group">내용</div></th>
						<td><div class="form-group"><textarea class="form-control tinymce" id="content" name="content" ></textarea></div></td>				
					</tr>
					<tr>
						<td><div class="form-group">썸네일 업로드</div></td>
						<td><div class="form-group"><input type="file" id="thumbImg" name="thumbImg"></div></td><!--  accept="image/x-png, image/gif, image/jpeg, image/jpg" -->
					</tr>
				</tbody>
			</table>
		</div>
<!-- 		<div class="btnArea list-group-item"> -->
<!-- 			<input type="button" class="btn btn-primary pull-right" id="saveToWrite" value="저장"/> -->
<!-- 			<input type="button" class="btn" id="cancelToWrite" value="취소"/> -->
<!-- 		</div> -->
		
		<div class="btn-group btn-group-justified" style="padding-top : 20px; padding-bottom : 20px;">
			<div class="btn-group">
				<input type="button" class="btn btn-default" id="cancelToWrite" value="취소"/>           
		    </div>
		    <div class="btn-group">
<!-- 				 <input type="button" class="btn btn-default pull-right" id="saveToWrite" value="저장"/> -->
				 <button class="btn btn-default pull-right" id="saveToWrite" onclick="javascript:save();">저장</button>
		    </div> 
		</div>
		
	</div>
	</form>
</body>
</html>