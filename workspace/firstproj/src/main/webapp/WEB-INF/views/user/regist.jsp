<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
</head>
<body>
<div class="container">
	
	
	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form">
		<h1 id="btn-groups" class="page-header">Regist</h1>
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">사용자 아이디</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="userId" name="userId"/>
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">사용자 이름</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="userNm" name="userNm" style="ime-mode: active"/>
			</div>
		</div>
		
		<div class="form-group">
			<label for="passwd" class="col-sm-2 control-label">패스워드</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="passwd" name="passwd" minlength="8" maxlength="15"/>
			</div>
		</div>

		<div class="form-group">
			<label for="passwdChk" class="col-sm-2 control-label">패스워드 체크</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="passwdChk" name="passwdChk" minlength="8" maxlength="15"/>
			</div>
		</div>

		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">E-mail</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" id="email" name="email"/>
			</div>
		</div>

		<div class="form-group">
			<label for="phoneNo" class="col-sm-2 control-label">핸드폰 번호</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="phoneNo" name="phoneNo"/>
			</div>
		</div>
		
		<div class="btn-group btn-group-justified" style="padding-top : 20px; padding-bottom : 20px;">
			<div class="btn-group">
				<input type="button" class="btn btn-default" value="취소">
			</div>
			<div class="btn-group">
				<input type="button" class="btn btn-default pull-right" value="저장" id="registBtn">
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

		$("#registBtn").on("click", function(){
			var isValid = $("form").valid();

			if(isValid){
				$.ajax({
					url : '/user/regist.json',
					data : $("#actionFrm").serialize(),
					dataType : 'json',
					method : 'post',
					success : function(data){
						console.log("result : " + data.resultCode + ", " + data.resultMsg);
					},
					error : function(data){

					}
				});
			}
		});		
	});

	$("form").validate({
		rules: {
			userId: {
				required 	: true,
				minlength 	: 8,
				maxlength 	: 15
			},
			userNm: {
				required 	: true,
				minlength 	: 2,
				maxlength 	: 10
			},
			passwd: {
				required 	: true,
				minlength 	: 8,
				maxlength 	: 15
			},
			passwdChk: {
				required 	: true,
				minlength 	: 8,
				maxlength 	: 15,
				equalTo 	: "#passwd"				
			},
			email : {
				email : true
			},
			phoneNo : {
				number : true
			}
		},
		messages : {
			userId : {
				required 	: "사용자 아이디 입력은 필수 입니다.",
				minlength 	: "길이는 최소 8자 이상이어야 합니다.",
				maxlength 	: "길이는 최대 15자까지 허용합니다."				
			},
			userNm : {
				required 	: "사용자 이름 입력은 필수 입니다.",
				minlength 	: "길이는 최소 2자 이상이어야 합니다.",
				maxlength 	: "길이는 최대 10자까지 허용합니다."
			},
			passwd : {
				required 	: "패스워드를 입력해 주세요.",
				minlength 	: "길이는 최소 8자 이상이어야 합니다.",
				maxlength 	: "길이는 최대 15자까지 허용합니다."									
			},
			passwdChk: {
				required  	: "패스워드를 한번 더 입력해 주세요.",
				minlength 	: "길이는 최소 8자 이상이어야 합니다.",
				maxlength 	: "길이는 최대 15자까지 허용합니다.",
				equalTo 	: "위의 패스워드와 동일해야 합니다."				
			},			
			email : {
				email : "이메일 형식에 맞게 입력해 주셔야 합니다."
			},
			phoneNo : {
				number : "숫자만 입력이 가능합니다."
			} 
		}
	});
});



</script>
</html>