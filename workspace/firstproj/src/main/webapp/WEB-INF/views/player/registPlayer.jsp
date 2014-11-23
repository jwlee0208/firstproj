<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/jquery/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/jquery/js/jquery-validate.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/jquery/js/jquery.form.min.js"></script>

<!-- bootstrap -->
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-theme.min.css">
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
<%-- <link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-combined.min.css"> --%>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>

<!-- editor -->
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/common-editor.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
</head>
<body>
<div class="container">
	
	<input type="hidden" id="prevPage" name="prevPage" value="${prevPage}"/>
	
	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form">
		<h1 id="btn-groups" class="page-header">Player Regist</h1>
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">User ID</label>
			<div class="col-sm-10">
				${sessionInfo.userId}
				<input type="hidden" id="playerInfoDto.userDto.userId" name="playerInfoDto.userDto.userId" value="${session.userId}"/>
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">User Name</label>
			<div class="col-sm-10">
				${sessionInfo.userNm}
				<input type="hidden" id="playerInfoDto.userDto.userNm" name="playerInfoDto.userDto.userNm" value="${session.userNm}"/>
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">You are Player?</label>
			<div class="col-sm-10">
				<input type="hidden" id="catNm1" name="playerInfoDto.catNm1" />
				<select id="catId1" name="playerInfoDto.catId1" class="form-control" onchange="javascript:setChildCategory();">
					<option value="-1">Select Category.</option>
				<c:forEach var="catInfo" items="${firstDepthCatList}">
					<option value="${catInfo.catId}">${catInfo.catName}</option>
				</c:forEach>
				</select>
<!-- 				<input type="email" class="form-control" id="email" name="email"/><span id="emailErr" class="errorMsg" style="display: none;"></span> -->
			</div>
		</div>

		<div class="form-group">
			<label for="phoneNo" class="col-sm-2 control-label">Your Position is : </label>
			<div class="col-sm-10">
				<input type="hidden" id="catNm2" name="playerInfoDto.catNm2" />
				<select id="catId2" name="playerInfoDto.catId2" class="form-control" onchange="javascript:setAttrList();">
					<option value="-1">Select Category</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="phoneNo" class="col-sm-2 control-label">Choice Detail Type</label>
			<div class="col-sm-10" id="attrElemList">
			
			</div>
		</div>

		
		<div class="form-group">
			<label for="linkUrl" class="col-sm-2 control-label">Link To Your Play Stream Url</label>
			<div class="col-sm-10">
				<input type="text" id="linkUrl" name="playerVideoLinkList[0].linkUrl" class="form-control"/>
			</div>
		</div>
		

		<div class="form-group">
			<label for="introduce" class="col-sm-2 control-label">Introduce Yourself!</label>
			<div class="col-sm-10">
				<textarea class="form-control tinymce" id="introduce" name="playerInfoDto.introduce"></textarea>
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
				<input type="button" class="btn btn-default pull-right" value="Regist" id="registBtn">
			</div>					
		</div>
	</form>
</div>
</body>
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
	
	$("#registBtn").on("click", function(){
		var isValid = $("form").valid();

		if(isValid){

			var introduce = tinyMCE.get('introduce').getContent();
			$("#introduce").val(introduce);

			
			$.ajax({
				url : '/player/registPlayerAction.json',
				data : $("#actionFrm").serialize(),
				dataType : 'json',
				method : 'post',
				success : function(data){
					var result = data.result;
					var msg = data.msg;
					
					
					if(result == 'ok'){
						location.href = "/player/playerList.page";
					}else{
						alert(msg);
						return;
					}
				},
				error : function(data){

				}
			});
		}
	});		
});


function setChildCategory(){
	var catId = $("#catId1").val();
	$("#catNm1").val($("#catId1 option:selected").text());
	$.ajax({
		url : '/player/childCategoryList.json',
		data : {parentCatId : catId},
		method : 'post',
		dateType : 'json',
		success : function(data){

			var childCatList = data.childCatList;
			var childCatListLength = childCatList.length;
			
			if(childCatListLength > 0){
				for(var i = 0 ; i < childCatListLength ; i++){
					$("#catId2").append("<option value=\""+ childCatList[i].catId +"\">" + childCatList[i].categoryNameStr + "</option>");
				}
			}else{
				$("#catId2 option").remove();
				$("#catId2").append("<option value=\"\">카테고리를 선택해 주세요.</option>");
			}

			$("#selectedCatId").val(catId);
// 			initAttrElement();
			$("#attrElemList").html('');
		}
	});	
}

function setAttrList(){
	var catId = $("#catId2").val();
	$("#catNm2").val($("#catId2 option:selected").text());
	searchAttrList(catId);
}

function searchAttrList(catId){
// 	initAttrElement();
	$.ajax({
		url : '/player/attrElementList.json',
		data : {catId : catId, searchText : $("#searchText").val()},
		method : 'post',
		dateType : 'json',
		success : function(data){

			if(data != null){
				var attrElementList = data.attrElementList;

				if(attrElementList != null){
					var attrElementListLength = attrElementList.length;
					
					console.log("attrElementListLength ; " + attrElementListLength);
										
					var innerHtml = "<div style=\"padding-top: 10px;padding-left: 10px;padding-bottom: 10px;\">";
					for(var i = 0 ; i < attrElementListLength ; i++){
						
						var categoryAttrElemList = attrElementList[i].categoryAttrElemList;
						var attrId = attrElementList[i].attrId;
						innerHtml += "<div>[" + attrId +"] " + attrElementList[i].attrNameStr + "<span>"; 

						console.log('categoryAttrElemListELngth : ' + categoryAttrElemList.length);
						var categoryAttrElemListLength = categoryAttrElemList.length; 
						if(categoryAttrElemListLength > 0){
							innerHtml += "<div class=\"row\">";
							innerHtml += "<input type=\"hidden\" id=\"attrElemMapList["+i+"].attrId"+ attrId +"\" name=\"attrElemMapList["+i+"].attrId\" value=\"" + attrId + "\" />";

							for(var j = 0; j < categoryAttrElemListLength ; j++){
								var catAttrElemObj = categoryAttrElemList[j];
								
								innerHtml += "<div class=\"col-md-2\">";
								innerHtml += "<input type=\"radio\" id=\"attrElemMapList["+i+"].attrElemId"+ catAttrElemObj.attrElemId +"\" name=\"attrElemMapList["+i+"].attrElemId\" value=\"" + catAttrElemObj.attrElemId + "\" />" + catAttrElemObj.attrElemNameStr
								innerHtml += "</div>";
									
							}
							innerHtml += "</div>";
						}
						
						innerHtml += "</span></div>";
					}
					
					innerHtml += "</div>";
					console.log("innerHtml : " + innerHtml);

					$("#attrElemList").html(innerHtml);
					
				}
			}
		}				
	});
}

</script>
</html>