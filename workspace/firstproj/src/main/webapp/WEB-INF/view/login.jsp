<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script>
$(document).on("ready", function() {

	$("#loginForm").validate({
		rules : {
			userId : {required : true},
			passwd : {required : true}
		},
		messages : {
			userId : {required : '아이디를 입력해 주세요.'},
			passwd : {required : '패스워드를 입력해 주세요.'}
		}	
	});
// 	$("input:blank").css("background-color", "#efefef");
});




$(function(){
	$("input[name=signinSubmit]").on("click", function(){

		var isvalid = $("#loginForm").valid();

		if(isvalid){
			$.ajax({
				url : "/loginProcess.json",
				data : $("#loginForm").serialize(),
				dataType : "json",
				method : "post",
				success : function(data){

					var code = data.resultCode;
					if(code == 'LOGIN_0000'){
						location.href="/home.page";
					}else{
						alert(data.resultMsg);
						$("#passwd").focus();
						return;
					}
				},
				error : function(data){
		console.log('error');
				}
			});
		}		
	});
});
</script>
</head>
<body>
	<form class="form-horizontal" id="loginForm" name="loginForm" method="post">
	<h1 id="btn-groups" class="page-header">Sign in</h1>
	
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">아이디</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="userId" name="userId" />
			</div>
		</div>
		<div class="form-group">
			<label for="passwd" class="col-sm-2 control-label">패스워드</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="passwd" name="passwd" />
			</div>
		</div>
		<div class="btn-group btn-group-justified">
			<div class="btn-group">
		      <input type="button" class="btn btn-default" name="signinSubmit" value="Sign in">
		    </div> 
		</div>
	</form>
</body>
</html>