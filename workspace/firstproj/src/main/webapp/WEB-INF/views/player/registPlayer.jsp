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
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-combined.min.css">
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
</head>
<body>
<div class="container">
	
	<input type="hidden" id="prevPage" name="prevPage" value="${prevPage}"/>
	
	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form">
		<h1 id="btn-groups" class="page-header">Player Regist</h1>
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">사용자 아이디</label>
			<div class="col-sm-10">
				${sessionInfo.userId}
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">사용자 이름</label>
			<div class="col-sm-10">
				${sessionInfo.userNm}
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">선수 OR Not?!</label>
			<div class="col-sm-10">
			
				<select id="cat1" name="cat1" class="form-control" onchange="javascript:setChildCategory();">
					<option value="-1">카테고리를 선택해 주세요.</option>
				<c:forEach var="catInfo" items="${firstDepthCatList}">
					<option value="${catInfo.catId}">${catInfo.catName }</option>
				</c:forEach>
				</select>
<!-- 				<input type="email" class="form-control" id="email" name="email"/><span id="emailErr" class="errorMsg" style="display: none;"></span> -->
			</div>
		</div>

		<div class="form-group">
			<label for="phoneNo" class="col-sm-2 control-label">Position?!</label>
			<div class="col-sm-10">
				<select id="cat2" name="cat2" class="form-control" onchange="javascript:setAttrList();">
					<option value="-1">카테고리를 선택해 주세요.</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="phoneNo" class="col-sm-2 control-label">세부 타입 구분</label>
			<div class="col-sm-10" id="attrElemList">
			
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
				$.ajax({
// 					url : '/user/regist.json',
					url : '/user/registAction',
					data : $("#actionFrm").serialize(),
					dataType : 'json',
					method : 'post',
					success : function(data){
// 						console.log("result : " + data.resultCode + ", " + data.resultMsg);
// 						console.log("result : " + data.status + ", " + data.result + ', ' + data.result.length);
						var status = data.status;
						
						if(status == 'REGIST_0000'){
							location.href = $("#prevPage").val();
						}else{
							var result = data.result;
							var length = result.length;
							if(result != null && length > 0){

								for(var i = 0 ; i < length ; i++){
//	 								console.log(result[i].field + ", " + result[i].defaultMessage +", " + result[i].code);
									$("#" + result[i].field+"Err").html(result[i].defaultMessage);
									$("#" + result[i].field+"Err").show();
								}
							}
						}
						
					},
					error : function(data){

					}
				});
			}
		});		
	});


	$("input[type=text]").on("click", function(e){
		$("#" +e.target.id + "Err").hide();
		$("#" +e.target.id + "Err").html('');
	});
// 	$("form").validate({
// 		rules: {
// 			userId: {
// 				required 	: true,
// 				minlength 	: 8,
// 				maxlength 	: 15
// 			},
// 			userNm: {
// 				required 	: true,
// 				minlength 	: 2,
// 				maxlength 	: 10
// 			},
// 			passwd: {
// 				required 	: true,
// 				minlength 	: 8,
// 				maxlength 	: 15
// 			},
// 			passwdChk: {
// 				required 	: true,
// 				minlength 	: 8,
// 				maxlength 	: 15,
// 				equalTo 	: "#passwd"				
// 			},
// 			email : {
// 				email : true
// 			},
// 			phoneNo : {
// 				number : true
// 			}
// 		},
// 		messages : {
// 			userId : {
// 				required 	: "사용자 아이디 입력은 필수 입니다.",
// 				minlength 	: "길이는 최소 8자 이상이어야 합니다.",
// 				maxlength 	: "길이는 최대 15자까지 허용합니다."				
// 			},
// 			userNm : {
// 				required 	: "사용자 이름 입력은 필수 입니다.",
// 				minlength 	: "길이는 최소 2자 이상이어야 합니다.",
// 				maxlength 	: "길이는 최대 10자까지 허용합니다."
// 			},
// 			passwd : {
// 				required 	: "패스워드를 입력해 주세요.",
// 				minlength 	: "길이는 최소 8자 이상이어야 합니다.",
// 				maxlength 	: "길이는 최대 15자까지 허용합니다."									
// 			},
// 			passwdChk: {
// 				required  	: "패스워드를 한번 더 입력해 주세요.",
// 				minlength 	: "길이는 최소 8자 이상이어야 합니다.",
// 				maxlength 	: "길이는 최대 15자까지 허용합니다.",
// 				equalTo 	: "위의 패스워드와 동일해야 합니다."				
// 			},			
// 			email : {
// 				email : "이메일 형식에 맞게 입력해 주셔야 합니다."
// 			},
// 			phoneNo : {
// 				number : "숫자만 입력이 가능합니다."
// 			} 
// 		}
// 	});
});

function setChildCategory(){
	var catId = $("#cat1").val();
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
					$("#cat2").append("<option value=\""+ childCatList[i].catId +"\">" + childCatList[i].categoryNameStr + "</option>");
				}
			}else{
				$("#cat2 option").remove();
				$("#cat2").append("<option value=\"\">카테고리를 선택해 주세요.</option>");
			}

			$("#selectedCatId").val(catId);
// 			initAttrElement();
			$("#attrElemList").html('');
		}
	});	
}

function setAttrList(){
	var catId = $("#cat2").val();
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
										
// 					var prevAttrId = 0;
					var innerHtml = "<div style=\"padding-top: 10px;padding-left: 10px;padding-bottom: 10px;\">";
					for(var i = 0 ; i < attrElementListLength ; i++){
						
						var categoryAttrElemList = attrElementList[i].categoryAttrElemList;

						innerHtml += "<div>[" + attrElementList[i].attrId +"] " + attrElementList[i].attrNameStr + "<span>"; 

						console.log('categoryAttrElemListELngth : ' + categoryAttrElemList.length);
						var categoryAttrElemListLength = categoryAttrElemList.length; 
						if(categoryAttrElemListLength > 0){
							for(var j = 0; j < categoryAttrElemListLength ; j++){
								var catAttrElemObj = categoryAttrElemList[j];
								
								innerHtml += "<div>";
								innerHtml += "<input type=\"radio\" id=\"attr_" + catAttrElemObj.attrElemId + "\"" + "name=attr_" + catAttrElemObj.attrElemId +"\" value=\"" + catAttrElemObj.attrElemId + "\" />" + catAttrElemObj.attrElemNameStr
								innerHtml += "</div>";
									
							}
						}
						
						innerHtml += "</span></div>";
//							console.log(attrElementList[i].attrElemName + ", " + attrElementList[i] + ", " + attrElementList[i].attrName);

// 						var attrId = attrElementList[i].attrId;

// 						if(prevAttrId == 0 || (prevAttrId != 0 && attrId > prevAttrId)){
// 							innerHtml += "<div id=\"" + attrId +"\" onclick=\"javascript:attrFilterList(" + attrId + ");\" style=\"font-weight:bold;\">" + attrElementList[i].attrNameStr + "</div>";
// 						}

// 						innerHtml += "<label class=\"checkbox-inline\"><input type=\"checkbox\" id=\"attrElem_" + attrElementList[i].attrElemId +"\" " + " name=\"" + attrElementList[i].attrElemId + "\" class=\"attrElemChkBox\" value=\"" + attrElementList[i].attrElemId + "\"/>" + attrElementList[i].attrElemNameStr + "</label>";

// 						prevAttrId = attrId;
					}
					
					innerHtml += "</div>";
					console.log("innerHtml : " + innerHtml);

					$("#attrElemList").html(innerHtml);
					// 각 체크박스에  onclick 이벤트 설정
// 					$(".attrElemChkBox").attr("onclick", "javascript:attrElemFilterList();");

// 					$("#selectedCatId").val(catId);

// 					goPage(1);
					
				}
			}
		}				
	});
}

</script>
</html>