<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/common-editor.js"></script>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/board/write.js"></script>

</head>
<body>
	<form id="writeFrm" name="writeFrm" method="post">
	
	<input type="hidden" id="authorId" name="authorId" value="jwlee"/>
	<input type="hidden" id="authorNm" name="authorNm" value="jinwon"/>
	<div class="list-group">
		<h3>글 작성</h3>
		<div class="writeArea list-group-item">
			<table style="width:100%">
				<colgroup><col width="10%"/><col width="90%"/></colgroup>
				<tbody>
					<tr>
						<th><fieldset class="form-group">카테고리</fieldset></th>
						<td>
							<fieldset class="form-group">
								<select class="form-control" id="boardCategory" name="boardCategory">
									<option value="0">-선택-</option>
									<option value="1">자유게시판</option>
									<option value="2">Q&A</option>
									<option value="3">기타</option>
								</select>
							</fieldset>
						</td>
					</tr>
					<tr>
						<th><fieldset class="form-group">제목</fieldset></th>
						<td><fieldset class="form-group"><input type="text" class="form-control" id="title" name="title"/></fieldset></td>
					</tr>
					<tr>
						<th><fieldset class="form-group">내용</fieldset></th>
						<td><fieldset class="form-group"><textarea class="form-control tinymce" id="content" name="content" ></textarea></fieldset></td>				
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btnArea list-group-item">
<!-- 			<fieldset class="form-group"><input type="submit" value="취소" class="btn" name="cancelToWrite"/><input type="submit" value="저장" class="btn btn-primary pull-right" name="saveToWrite"/></fieldset> -->
			<input type="button" class="btn btn-primary pull-right" id="saveToWrite" value="저장"/>
			<input type="button" class="btn" id="cancelToWrite" value="취소"/>
		</div>
	</div>
	</form>
</body>
</html>