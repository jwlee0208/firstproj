<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/common-editor.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/prohibite/write.js"></script>

</head>
<body>
	<form id="writeFrm" name="writeFrm" method="post" role="form">
	
	<input type="hidden" id="createUserId" name="createUserId" value="jwlee"/>
	<input type="hidden" id="createUserNm" name="createUserNm" value="jinwon"/>
	<div class="wrap">
		<h3>금칙어 추가</h3>
		<div class="writeArea">
			<table class="table table-condensed">
				<colgroup><col width="10%"/><col width="90%"/></colgroup>
				<tbody>
					<tr>
						<th><fieldset class="form-group">금칙어</fieldset></th>
						<td><div class="input-group"><input type="text" class="form-control" id="prohibitedWordStr" name="prohibitedWordStr"/></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btnArea list-group-item">
			<input type="button" class="btn btn-primary pull-right" id="saveToWrite" value="저장"/>
			<input type="button" class="btn" id="cancelToWrite" value="취소"/>
		</div>
	</div>
	</form>
</body>
</html>