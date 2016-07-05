<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"	%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" 	content="IE=Edge" />
<meta name="viewport" 				content="width=device-width, initial-scale=1">
<meta name="title" 					content="Player List"/>
<meta name="author" 				content="Lee Jinwon"/>
<meta name="description" 			content="Checkout Future's MVP"/>
<meta name="robots" 				content="index,follow" /> 
<meta name="keywords" 				content="blog, baseball, link, player, profile"/>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/pagination.css">
<link 	rel="stylesheet" 		href="${pageContext.request.contextPath}/css/profileList.css">
</head>
<body>
<form id="listFrm" name="listFrm" method="post">
	<div class="container">
	
		<h1 id="btn-groups" class="page-header">League List</h1>
		<div class="form-group">
	
			<div class="form-group" role="search">	
				<input type="hidden" 	id="searchCondition" 	name="searchCondition" value="name"/>
				<input type="hidden" 	id="searchText" 		name="searchText" />
				<input type="text" 		id="searchTextStr" 		name="searchTextStr" class="form-control ui-autocomplete-input" placeholder="<tag:message code='text.request.insert.search.keyword'/>"/>
			</div>
			
			<!-- list area -->
			<div id="listDiv" role="main">
<c:choose>
	<c:when test="${!empty leagueList}">
		<c:forEach var="leagueInfo" items="${leagueList}">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<c:choose>
							<c:when test="${leagueInfo.leagueImgPath ne null && leagueInfo.leagueImgPath ne ''}">
						<img src="http://jwlee0208.cdn3.cafe24.com/${leagueInfo.leagueImgPath}" 
							 data-src="holder.js/250x200" alt="image" class="img-thumbnail" 
							 onerror="this.src='http://jwlee0208.cdn3.cafe24.com/img/no_image.png'"  
							 onclick="javascript:goDetailLeague('${leagueInfo.leagueId}');"  
							 style="padding-top:10px; cursor:pointer; width: 250px; height: 200px;"/>
							</c:when>
							<c:otherwise>
						<img src="http://jwlee0208.cdn3.cafe24.com/img/no_image.png" 
							 data-src="holder.js/250x200" alt="image" class="img-thumbnail"
							 onclick="javascript:goDetailLeague('${leagueInfo.leagueId}');" 
							 style="padding-top:10px; cursor:pointer; width: 250px; height: 200px;"/>
							</c:otherwise>
						</c:choose>					
						<div class="caption" style="cursor:pointer;">
							<h3 style="background: #efefef; padding:5px 0 5px 0px; text-align:center;"><span onclick="javascript:goDetailLeague('${leagueInfo.leagueId}');">${leagueInfo.leagueName}</span></h3>
								<div class="btn-group btn-group-lg btn-group-justified">
									<div class="btn btn-default">${leagueInfo.leagueType}</div>
									<div class="btn btn-default">${leagueInfo.area}</div>
									<div class="btn btn-default">${leagueInfo.country}</div>
								</div>
							<p class="content_${index.count}">
							</p>
							<p>
								<span class="btn btn-danger btn-block" 		role="button" onclick="javascript:goDetailLeague('${leagueInfo.leagueId}');" data-toggle="modal" data-target="#myModal">See Detail</span>
							</p>
						</div>	
					</div>	
				</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		nothing
	</c:otherwise>	
</c:choose>		
			</div>
			<!-- // list area -->
		<c:if test="${isLogon}">
			<div class="btn-group btn-group-justified" style="padding-bottom: 20px;">
				<div class="btn-group">
					<input type="button" class="btn btn-default pull-right" value="새로운 리그 등록" name="goToRegistLeague" />
				</div>
			</div>		
		</c:if>
		</div>	
	</div>
	<!-- modal popup area -->
	<c:import url="/common/modalPopup"/>
	<!-- // modal popup area -->	
</form>
</body>
<script>
$(document).on("ready", function() {
	$("input[name='goToRegistLeague']").on("click", function() {
		location.href = "/profile/registLeague";
	});

	$( "#searchText" ).keypress(function( event ) {
		  if ( event.which == 13 ) {
			  event.preventDefault();
			  goLeagueSearch();
		  }			  
	});		
});

function goLeagueSearch(){
	
}

function isEmpty(val){
	var result = false;
	
	if(val == '' || val == null || val == 'undefined'){
		result = true;
	}
	return result;
	
}

function goDetailLeague(leagueId){
	$.ajax({
		url : '/profile/leagueView/' + leagueId,
		data : '',
		dataType : 'html',
		success : function(data){
			$('.modal-title').html(($(data).find("h2").html()));
			$('.modal-body').html(data);
		}
	});
}

// modal 창 조회후 close시 html 초기화 : css issue
function initModalHtml(){
	$('.modal-body').html('');
}

</script>
</html>