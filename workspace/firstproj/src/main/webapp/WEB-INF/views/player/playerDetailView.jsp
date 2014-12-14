<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<form id="viewFrm" name="viewFrm" method="post" class="form-horizontal" role="form">
		<input type="hidden" id="playerInfoId" name="playerInfoId" value="${playerDetailInfo.playerInfoId}"/>
		<h1 id="btn-groups" class="page-header">Player Info.</h1>
		<div class="form-group">
			<label for="profileImgFilePath" class="col-sm-2 control-label">Profile Image</label>
			<div class="col-sm-10"><img data-src="holder.js/128x128" src="${playerDetailInfo.profileImgFilePath}"/></div>
		</div>
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">User ID</label>
			<div class="col-sm-10">${playerDetailInfo.userInfo.userId}</div>
		</div>
		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">User Name</label>
			<div class="col-sm-10">${playerDetailInfo.userInfo.userNm}</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">You are Player?</label>
			<div class="col-sm-10">${playerDetailInfo.catNm1}</div>
		</div>
		<div class="form-group">
			<label for="phoneNo" class="col-sm-2 control-label">Your Position is : </label>
			<div class="col-sm-10">${playerDetailInfo.catNm2}</div>
		</div>
		<div class="form-group">
			<label for="phoneNo" class="col-sm-2 control-label">Choice Detail Type</label>
			<div class="col-sm-10" id="attrElemList">
			<c:set var="categoryAttrElemList" value="${playerDetailInfo.categoryAttrElemList}"/>
			<c:if test="${categoryAttrElemList ne null or categoryAttrElemList ne ''}">
				<c:forEach var="attrElemInfo" items="${playerDetailInfo.categoryAttrElemList}">
				${attrElemInfo.attrElemName}<br/>
				</c:forEach>	
			</c:if>
			</div>
		</div>

		
		<div class="form-group">
			<label for="linkUrl" class="col-sm-2 control-label">Link To Your Play Stream Url</label>
			<div class="col-sm-10">
			<c:set var="playerVideoLinkList" value="${playerDetailInfo.playerVideoLinkList}"/>
			
			<c:if test="${playerVideoLinkList ne '' or playerVideoLinkList ne null}">
				<c:forEach var="playerVideoLinkInfo" items="playerVideoLinkList" varStatus="idx">
					${palyerVideoLinkInfo.linkUrl}<br/>
				</c:forEach>
			</c:if>
			</div>
		</div>
		

		<div class="form-group">
			<label for="introduce" class="col-sm-2 control-label">Introduce Yourself!</label>
			<div class="col-sm-10">
				${playerDetailInfo.introduce}
			</div>
		</div>

		<div class="btn-group btn-group-justified" style="padding-top : 20px; padding-bottom : 20px;">
			<div class="btn-group">
				<input type="button" class="btn btn-default" value="List" id="listBtn">
			</div>
			<c:if test="${myInfo ne null && myInfo.userId eq playerDetailInfo.userInfo.userId}">
			<div class="btn-group">
				<input type="button" class="btn btn-default" value="Delete" id="deleteBtn">
			</div>
			
			<div class="btn-group">
				<input type="button" class="btn btn-default pull-right" value="Modify" id="modifyBtn">
			</div>					
			</c:if>
		</div>
	</form>
</div>

</body>
<script>
$(function(){

	$("#deleteBtn").on("click", function(){
		
		if(confirm('Do you delete this information?')){
			$.ajax({
				url : '/player/deletePlayerInfo.json',
				data : $("#viewFrm").serialize(),
				dataType : 'json',
				method : 'post',
				success : function(data){
					console.log(data);
					
					var result = data.result;
					if(result == 'ok'){
						location.href = "/player/playerList.page";
					}
					
				}				
			});	
		}
	});
	
	$("#listBtn").on("click", function(){
		location.href = "/player/playerList.page";	
	});
	
	$("#modifyBtn").on("click", function(){
		alert('not ready to sesrvice');
	});
});
</script>
</html>