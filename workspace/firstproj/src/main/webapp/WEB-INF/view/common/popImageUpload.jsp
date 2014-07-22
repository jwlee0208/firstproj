<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fileupload.css"/>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/jquery/js/jquery.form.min.js"></script>


<!-- design -->
<div id="image_upload" class="fileinput fileinput-new" data-provides="fileinput">
	<form id="imageForm" action="popImgUpload" method="post" enctype="multipart/form-data" role="form">
	<input type="hidden" name="folderId" id="folderId" value="" />
	<input type="hidden" name="job" id="job" value="" />	
			<h1 class="blind">이미지 등록</h1><input type="button" class="btn btn-default" value="닫기" onclick="window.close()"/>
		<div class="content">
			<!-- 미리보기 -->
			<div id="imageUploadList" class="fileinput-new thumbnail">
				<img src="${pageContext.request.contextPath}/img/no_image.png" alt="" />
			</div>
			<!-- 업로드 -->	
			<div class="upload_bx clear">
				<!-- 파일명 출력 -->
				<input type="file" name="imageFile" id="imageFile" />
				<input type="button" class="btn btn-default btn-file" name="uploadBtn" id="uploadBtn" value="파일 업로드" onclick="fileUpload()"/>
				<p class="help-block">최대 20M까지 등록할 수 있습니다.</p>
			</div>
		</div>
		<div id="btn_footerList" style="display:none">
				<footer class="footer btn_bx border0">
					<button type="button" class="btn">삭제</button>
					<button type="button" class="btn red">사용</button>
				</footer>
		</div>
	</form>
</div>
<!-- design -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fileUpload/image.js"></script>