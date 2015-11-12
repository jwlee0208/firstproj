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
		<h1 id="btn-groups" class="page-header">Flickr Image Selector&nbsp;<small>Usable your flickr's images</small></h1>
		<div style="padding:10px 10px 10px 10px;" class="row">
			<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="Insert Search Keyword." value="${searchKeyword}"/>
		</div>
		<div style="padding:10px 10px 10px 10px;" class="row">
			<input type="text" class="form-control" id="userId" name="userId" placeholder="Insert Your Flickr's UserId" value="${userId}"/>
		</div>	
		<hr/>
<!-- 		<input type="file" name="imageFile" id="imageFile" class="form-control" accept="image/*"/> -->
<!-- 		<input type="button" class="btn btn-default" name="uploadBtn" id="uploadBtn" value="파일 업로드" onclick="fileUploadFlickr()"/> -->
<c:choose>
<c:when test="${!empty photoList}">

	<c:forEach var="relatedPhoto" items="${photoList}" varStatus="index">
		<c:if test="${index.count % 4 eq 1}">
			<div class="row" style="margin: 0 0px 5px 0px;">
		</c:if>	
				<div class="col-xs-6 col-sm-3 well">
					<a href="javascript:;" data-flickr-embed="true" title="${relatedPhoto.title}" alt="choice picture if you want to add." id="${relatedPhoto.largeUrl}">
						<img src="${relatedPhoto.smallUrl}" alt="${relatedPhoto.title}" class="img-thumbnail" title="${relatedPhoto.title}" >
					</a>						
					<input type="button" class="btn btn-info btn-block img${index.count}" onclick="javascript:imgAdd('${relatedPhoto.largeUrl}',${index.count});" style="float:right; padding-top: 3px;" value="select" />
				</div>
		<c:if test="${index.count % 4 eq 0}">
			</div>
		</c:if>	
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


// //ajax error check
// $(document).ajaxError(function(event, request){
//    if(request.status==500)
//       alert("파일 업로드를 실패하였습니다. \n업로드할 파일을 확인하세요.(파일 최대용량: 20MB)");
//    	  return;
//    }
// );

// //파일전송 후 콜백 함수
// function FileuploadCallback(data, state){
	
// // 	console.log('data : ' + data + ", state : " + state);
	
//    if (data=="error"){
//       alert("파일전송중 에러 발생!!");
//       return false;
//    } else if (data == "fileSizeError") {
// 	  alert("파일용량은 20MB 이하 이어야 합니다.");
// 	  return false;
//    } else if (data == "fileExtensionError") {
// 	   alert("이미지 파일을 업로드 하셔야 합니다.\n(업로드 가능한 확장자: jpg, jpeg, gif, png, bmp)");
// 	   return false;
//    }
   
// }

// $(function(){
//    //비동기 파일 전송
//    var frm=$('#actionFrm'); 
//    frm.ajaxForm(FileuploadCallback); 
//    frm.submit(function(){
// 	   return false;
//    }); 
// });

// // 파일업로드 이벤트
// function fileUploadFlickr(){
// 	var imageFile = $.trim($("#imageFile").val());
//    if(!imageFile){
//       alert("파일을 선택하세요.");
//       $("#imageFile").focus();
//       return;
//    }
 
//    //파일전송
//    var frm = $('#actionFrm'); 
//    frm.attr("action","imageUploadActionToFlickr");
//    frm.attr("method","post");
//    frm.submit(); 
// }



</script>
</html>