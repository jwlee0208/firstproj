<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag" %>    
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


	$( "input" ).keypress(function( event ) {
		  if ( event.which == 13 ) {
			  event.preventDefault();
			  loginAction();
		  }
	});

	
	$("#userId").focus();
// 	$("input:blank").css("background-color", "#efefef");					
});




$(function(){
	$("input[name=signinSubmit]").on("click", function(){
		loginAction();
	});
	
	$(".alert.alert-danger").hide();
});

function loginAction(){
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
					location.href = $("#prevPage").val();
						//"/home.page";
				}else{
					$(".alert.alert-danger").text(data.resultMsg);
					$(".alert.alert-danger").fadeIn(2000, function(){
						
					});
					
					$(".alert.alert-danger").fadeOut(2000, function(){						
						
					});
// 					$(".alert.alert-danger").text('');
					$("#passwd").focus();
					return;
				}
			},
			error : function(data){
	console.log('error');
			}
		});
	}
}
</script>
<div class="container">

	<div class="loginWrap" style="padding-top : 170px; padding-left : 200px; padding-right : 200px; ">
	    <div class="loginArea">
		<form class="form-horizontal" id="loginForm" name="loginForm" method="post">
			
			<input type="hidden" id="prevPage" name="prevPage" value="${prevPage}"/>
			
			<h1 id="btn-groups" class="page-header"><tag:message code="signin"/></h1>
		
			<div class="form-group">
				<label for="userId" class="col-sm-2 control-label"><tag:message code="userid"/></label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="userId" name="userId" />
				</div>
			</div>
			<div class="form-group">
				<label for="passwd" class="col-sm-2 control-label"><tag:message code="passwd"/></label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="passwd" name="passwd" />
				</div>
			</div>
			<div class="alert alert-danger"></div>
			<div class="btn-group btn-group-justified">
				<div class="btn-group">
			      <input type="button" class="btn btn-primary" name="signinSubmit" value="<tag:message code="signin"/>">
			    </div> 
			</div>
		</form>
		</div>
	</div>	
</div>
