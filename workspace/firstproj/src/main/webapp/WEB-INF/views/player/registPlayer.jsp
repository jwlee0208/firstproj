<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- bootstrap -->
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-theme.min.css">
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>

<!-- editor -->
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/common-editor.js"></script>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
<div class="container">
	
	<input type="hidden" id="prevPage" name="prevPage" value="${prevPage}"/>
	<c:set var="categoryAttrElemList" value="${playerDetailInfo.categoryAttrElemList}"/>
	<c:if test="${categoryAttrElemList ne null or categoryAttrElemList ne ''}">
		<c:forEach var="attrElemInfo" items="${playerDetailInfo.categoryAttrElemList}">
			<input type="hidden" name="attrElemName" 	value="${attrElemInfo.attrElemName}"/>
			<input type="hidden" name="attrElemId" 		value="${attrElemInfo.attrElemId}"/>
		</c:forEach>	
	</c:if>
	
	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form"  enctype="multipart/form-data">
	<c:if test="${!empty playerDetailInfo}">
		<input type="hidden" id="playerInfoId" name="playerInfoDto.playerInfoId" value="${playerDetailInfo.playerInfoId}"/>
	</c:if>	
 		<h1 id="btn-groups" class="page-header">Player Regist</h1>
		
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">User ID</label>
			<div class="col-sm-10">
				${sessionInfo.userId}
				<input type="hidden" id="playerInfoDto.userDto.userId" name="playerInfoDto.userDto.userId" value="${sessionInfo.userId}"/>
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">User Name</label>
			<div class="col-sm-10">
				${sessionInfo.userNm}
				<input type="hidden" id="playerInfoDto.userDto.userNm" name="playerInfoDto.userDto.userNm" value="${sessionInfo.userNm}"/>
			</div>
		</div>


		<div class="form-group">
			<label for="profileImg" class="col-sm-2 control-label">Profile Image Upload</label>
			<div class="col-sm-10">
<c:choose>
	<c:when test="${playerDetailInfo ne null && playerDetailInfo ne ''}">
		<c:if test="${playerDetailInfo.profileImgFilePath ne null && playerDetailInfo.profileImgFilePath ne ''}">	
		
		<div class="thumbImg unset">
			<ul class="media-list">					
				<li class="media">
					<a class="pull-left" href="javascript:;">
			<img data-src="holder.js/300x300" src="http://jwlee0208.cdn3.cafe24.com/${playerDetailInfo.profileImgFilePath}" class="img-thumbnail" />
			<input type="hidden" id="filePath" 			name="playerInfoDto.profileImgFilePath" 		value="${playerDetailInfo.profileImgFilePath}"/>
			<input type="hidden" id="originalFileName" 	name="playerInfoDto.profileImgName" 			value="${playerDetailInfo.profileImgName}"/>
					</a>
					<div class="media-body">
						<p>파일명 : ${playerDetailInfo.profileImgName}</p>
					</div>	
					<input type="button" class="btn btn-default" value="삭제" onclick="javascript:delThumbImage('set');"/>
				</li>
			</ul>
		</div>	
		</c:if>
		<div class="thumbImg set">
			<input type="file" id="profileImg" name="playerInfoDto.profileImg">
		</div>
	</c:when>
	<c:otherwise>
			<input type="file" id="profileImg" name="playerInfoDto.profileImg">
	</c:otherwise>
</c:choose>		
			</div>
		</div>


		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">You are Player?</label>
			<div class="col-sm-10">
				<input type="hidden" id="catNm1" name="playerInfoDto.catNm1" />
				<select id="catId1" name="playerInfoDto.catId1" class="form-control" onchange="javascript:setChildCategory();">
					<option value="-1">Select Category.</option>
				<c:forEach var="catInfo" items="${firstDepthCatList}">
					<option value="${catInfo.catId}" <c:if test="${playerDetailInfo.catId1 eq catInfo.catId}">selected</c:if>>${catInfo.catName}</option>
				</c:forEach>
				</select>
<!-- 				<input type="email" class="form-control" id="email" name="email"/><span id="emailErr" class="errorMsg" style="display: none;"></span> -->
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">Your Position is : </label>
			<div class="col-sm-10" id="cat2Div">
				<input type="hidden" id="catNm2" name="playerInfoDto.catNm2" />
				<select id="catId2" name="playerInfoDto.catId2" class="form-control" onchange="javascript:setAttrList();">
					<option value="-1">Select Category</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">Choice Detail Type</label>
			<div class="col-sm-10" id="attrElemList"></div>
		</div>

		
		<div class="form-group">
			<label for="linkUrl" class="col-sm-2 control-label">Link To Your Play Stream Url</label>
			<div class="col-sm-10">
				<input type="text" id="linkUrl" name="playerVideoLinkList[0].linkUrl" class="form-control" value="<c:out value='${playerDetailInfo.playerVideoLinkList[0].linkUrl}'/>"/>
			</div>
		</div>
		

		<div class="form-group">
			<label for="introduce" class="col-sm-2 control-label">Introduce Yourself!</label>
			<div class="col-sm-10">
				<textarea class="form-control tinymce" id="introduce" name="playerInfoDto.introduce">${playerDetailInfo.introduce}</textarea>
			</div>
		</div>

		<div class="btn-group btn-group-justified" style="padding-top : 20px; padding-bottom : 20px;">
			<div class="btn-group">
				<input type="button" class="btn btn-default" value="Home" id="homeBtn">
			</div>
			<div class="btn-group">
				<input type="button" class="btn btn-default" value="Cancel" id="cancelBtn">
			</div>
			<div class="btn-group">
		<c:choose>
			<c:when test="${playerDetailInfo ne null && playerDetailInfo ne ''}">
				<input type="button" class="btn btn-default pull-right" value="Modify" id="modifyBtn">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn btn-default pull-right" value="Regist" id="registBtn">
			</c:otherwise>
		</c:choose>		
				
			</div>					
		</div>
	</form>
	
</div>
<script>
$().ready(function() {
	
	var numberRegExg = /[0-9]/gi;
	var unNumberRegExg = /[^0-9]/gi;
	var koreanRegExg 	= /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var specialCharRegExg 	= /[~!@\#$%^&*\()\-=+_']/gi;

	$("input[type=text]").on("click", function(e){
		$("#" +e.target.id + "Err").hide();
		$("#" +e.target.id + "Err").html('');
	});
	
	$("form").validate({
		rules: {
			catId1: {
				required 	: true
			},
			catId2: {
				required 	: true
			},
			linkUrl: {
				url 		: true
			}
		},
		messages : {
			catId1 : {
				required 	: "You must select You are a player or not! :)"
			},
			catId2 : {
				required 	: "You must select You are a hitter or pitcher! :)"
			},			
			linkUrl : {
				url 		: "You must inserting correct link url. check out data."
			} 
		}
	});
	
	if($("#catId1").val() > -1){
		setChildCategory();
	}	
	
	var className = ($(".thumbImg").hasClass("unset")) ? "unset" : "set";
	
	toggleThumbImage(className);

});

$(function(){
	$("#phoneNo").on("keyup", function(){
		$(this).val($(this).val().replace(unNumberRegExg,""));
	});
	$("#userNm").on("keyup", function(){
		$(this).val($(this).val()
						   .replace(numberRegExg, "")
						   .replace(specialCharRegExg, ""));
	});
	$("#userId").on("keyup", function(){
		$(this).val($(this).val()
						   .replace(koreanRegExg, "")
						   .replace(specialCharRegExg, ""));
	});

	$("#homeBtn").on("click", function(){
		history.go(-1);
	});

	$("#cancelBtn").on("click", function(){
		history.go(0);
	});
	
	
	//ajax error check
	$(document).ajaxError(function(event, request){
	   if(request.status==500)
	      alert("등록에 실패하였습니다. \n업로드할 파일을 확인하세요.(파일 최대용량: 20MB)");
	   	  return;
	   }
	);

	//파일전송 후 콜백 함수
	function FileuploadCallback(data, state){

	   if (data=="error"){
	      alert("파일전송중 에러 발생!!");
	      return false;
	   } else if (data == "fileSizeError") {
		  alert("파일용량은 20MB 이하 이어야 합니다.");
		  return false;
	   } else if (data == "fileExtensionError") {
		   alert("이미지 파일을 업로드 하셔야 합니다.\n(업로드 가능한 확장자: jpg, jpeg, gif, png, bmp)");
		   return false;
	   } else if (data == "fileWidthHeightError") {
		   alert("업로드 가능한 이미지 사이즈는 314 * 166 입니다.");
		   return false;
	   }
	   alert("정상적으로 등록 되었습니다.");
	   // 정상 등록 후 목록 화면으로 이동.
	   location.href = "/player/playerPortal";

	}
	
	
	
	$("#registBtn").on("click", function(){
		var isValid = $("form").valid();

		if(isValid){

			var introduce = tinyMCE.get('introduce').getContent();
			$("#introduce").val(introduce);

			var profileImg = $.trim($("#profileImg").val());
// alert("profileImg.length : " + profileImg.length);
			if(profileImg.length == 0){
				$.ajax({
					url : '/player/registPlayerAction',
					data : $("#actionFrm").serialize(),
					dataType : 'json',
					method : 'post',
					success : function(data){
						var result = data.result;
						var msg = data.msg;
						
						
						if(result == 'ok'){
							location.href = "/player/playerPortal";
						}else{
							alert(msg);
							return;
						}
					},
					error : function(data){

					}
				});				
			}else{
				// 썸네일 파일 업로드 할 때 저장
				var frm = $("#actionFrm");
				frm.attr("action", '/player/registPlayerAction');
				frm.attr("method", "post");
				frm.ajaxForm(FileuploadCallback); 
				frm.submit(); 				
			}
	
			
		}
	});		


	$("#modifyBtn").on("click", function(){
		var isValid = $("form").valid();

		if(isValid){

			var introduce = tinyMCE.get('introduce').getContent();
			$("#introduce").val(introduce);

			var profileImg = $.trim($("#profileImg").val());
// alert("profileImg.length : " + profileImg.length +", " + $("input[name=profileImgFilePath]").val());
			if(profileImg.length == 0){
				$.ajax({
					url : '/player/modifyPlayerAction',
					data : $("#actionFrm").serialize(),
					dataType : 'json',
					method : 'post',
					success : function(data){
						var result = data.result;
						var msg = data.msg;
						
						
						if(result == 'ok'){
							location.href = "/player/playerPortal";
						}else{
							alert(msg);
							return;
						}
					},
					error : function(data){

					}
				});				
			}else{
				// 썸네일 파일 업로드 할 때 저장
				var frm = $("#actionFrm");
				frm.attr("action", '/player/modifyPlayerAction');
				frm.attr("method", "post");
				frm.ajaxForm(FileuploadCallback); 
				frm.submit(); 				
			}
	
			
		}
	});		


});


function setChildCategory(){
	var catId = $("#catId1").val();
	// 수정(modify) 모드일 경우 사용하는 파라미터
	var selectedCategoryId = -1;
	if('${playerDetailInfo.catId2}' != ''){
		selectedCategoryId = '${playerDetailInfo.catId2}';
	}
	
	$("#catNm1").val($("#catId1 option:selected").text());
	$("#cat2Div").load('/player/ajaxChildCategoryList', {parentCatId : catId, selectedCategoryId : selectedCategoryId}, function(){
		$("#selectedCatId").val(catId);
		$("#attrElemList").html('');		
	});
}

function setAttrList(){
	var catId = $("#catId2").val();
	$("#catNm2").val($("#catId2 option:selected").text());
	searchAttrList(catId);
}

function searchAttrList(catId){
	$("#attrElemList").load("/player/ajaxAttrElementList", {catId : catId, searchText : $("#searchText").val()}, function(){
		
	});
}

function delThumbImage(){
	$(".unset").remove();
	toggleThumbImage("set");
}

function toggleThumbImage(className){
	$(".thumbImg").hide();
	$("." + className).show();
}

</script>