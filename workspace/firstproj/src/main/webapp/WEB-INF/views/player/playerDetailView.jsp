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
<%-- <script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/jquery/js/jquery-1.11.1.min.js"></script> --%>
<%-- <script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/jquery/js/jquery-validate.min.js"></script> --%>
<%-- <script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/jquery/js/jquery.form.min.js"></script> --%>

<!-- bootstrap -->
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-theme.min.css">
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
<%-- <link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-combined.min.css"> --%>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
<style type="text/css">
	.form-group .col-sm-10 {vertical-align : middle;}
</style>
</head>
<body>
<div class="container">
	<form id="viewFrm" name="viewFrm" method="post" class="form-horizontal" role="form">
		<input type="hidden" id="playerInfoId" name="playerInfoId" value="${playerDetailInfo.playerInfoId}"/>
		<h1 id="btn-groups" class="page-header">Player Information</h1>
		<div class="form-group">
			<label for="profileImgFilePath" class="col-sm-4">Profile Image</label>
			<div class="col-sm-8"><img data-src="holder.js/200x200" src="${pageContext.request.contextPath}${playerDetailInfo.profileImgFilePath}" class="img-thumbnail" width="200px" height="200px" /></div>
		</div>
<!-- 		<div class="form-group"> -->
<!-- 			<div class="col-sm-2">User ID</div> -->
<%-- 			<div class="col-sm-10">${playerDetailInfo.userInfo.userId}</div> --%>
<!-- 		</div> -->
		<div class="form-group">
			<label for="userNm" class="col-sm-4">My Name is</label>
			<div class="col-sm-8">
				<input type="hidden" id="userId" name="userId" value="${playerDetailInfo.userInfo.userId}"/>
				${playerDetailInfo.userInfo.userNm}
			</div>
		</div>
		<div class="form-group">
			<label for="catNm1" class="col-sm-4">My type is</label>
			<div class="col-sm-8">${playerDetailInfo.catNm1}</div>
		</div>
		<div class="form-group">
			<label for="catNm2" class="col-sm-4">My Position is</label>
			<div class="col-sm-8">${playerDetailInfo.catNm2}</div>
		</div>
		<div class="form-group">
			<label for="phoneNo" class="col-sm-4">Choice Detail Type</label>
			<div class="col-sm-8" id="attrElemList">
			<c:set var="categoryAttrElemList" value="${playerDetailInfo.categoryAttrElemList}"/>
			<c:if test="${categoryAttrElemList ne null or categoryAttrElemList ne ''}">
				<c:forEach var="attrElemInfo" items="${playerDetailInfo.categoryAttrElemList}">
				${attrElemInfo.attrElemName}<br/>
				</c:forEach>	
			</c:if>
			</div>
		</div>

		
		<div class="form-group">
			<label for="linkUrl" class="col-sm-4">Link To Your Play Stream Url</label>
			<div class="col-sm-8">
			<c:set var="playerVideoLinkList" value="${playerDetailInfo.playerVideoLinkList}"/>
<!-- 			<video width="320" height="240" autoplay> -->
			
<!-- 			</video> -->
			<c:if test="${playerVideoLinkList ne '' or playerVideoLinkList ne null}">
				<c:forEach var="playerVideoLinkInfo" items="${playerVideoLinkList}" varStatus="idx">
<!-- 					<source src=""/> -->
					${palyerVideoLinkInfo.linkUrl}<br/>
				</c:forEach>
			</c:if>
			</div>
		</div>
		

		<div class="form-group">
			<label for="introduce" class="col-sm-4">Introduce Yourself!</label>
			<div class="col-sm-8">
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
						location.href = "/player/playerPortal";
					}
					
				}				
			});	
		}
	});
	
	$("#listBtn").on("click", function(){
		location.href = "/player/playerPortal";	
	});
	
	$("#modifyBtn").on("click", function(){
		var frm = $("#viewFrm");
		frm.attr("action","/player/modify");
		frm.attr("method","post");
		frm.submit();
// 		location.href = "/player/modify";
	});
});
</script>
</html>