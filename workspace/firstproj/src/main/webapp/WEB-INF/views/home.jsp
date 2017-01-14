<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/circle.css"/>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/profile/profileView.js"></script>
<style>
.jumbotron {
    position: relative;
    background: #000 url("../img/home/img06.jpg") center center;
    width: 100%;
    height: 100%;
    background-size: cover;
    overflow: hidden;
    text-shadow: #444 0 1px 1px;
    color: white; 
}
iframe {width : 250px; height : 200px; align:center;}
</style>

	<div class="jumbotron" class="padding-top:0px;">
		<h2>Why Don't You Try To Find Your Team?</h2>
<%-- 		<h1><tag:message code='main.text1'/></h1> --%>
<%-- 		<p><tag:message code='sub.text1'/></p> --%>
<%-- 		<p><tag:message code='sub.text2'/></p> --%>
<%-- 		<p><tag:message code='sub.text3'/></p> --%>
		<p>&nbsp;</p>
		<p><strong>"<tag:message code='sub.text4'/>"</strong> - 'Yogi' Lawrence Peter Berra</p>
		<input type="button" class="btn btn-success btn-lg pull-right registProfile" value="Regist Your Profile"/>
	</div>
	<form id="mainFrm" name="mainFrm" method="post"></form>	
	<div class="container" role="main">
		<h4><tag:message code='text.recentregistplayers'/>&nbsp;&nbsp;<small><a href="/profile/list/1/01010100"><tag:message code='button.more'/></a></small></h4>
		
		<div class="row">
		<c:choose>
			<c:when test="${!empty recentPlayerProfileList}">
				<c:forEach var="recentPlayerProfileInfo" items="${recentPlayerProfileList}">
					<div class="col-md-4">
						<div class="thumbnail">
							<c:choose>
								<c:when test="${recentPlayerProfileInfo.profileImgPath ne null && recentPlayerProfileInfo.profileImgPath ne ''}">
							<img src="http://jwlee0208.cdn3.cafe24.com/${recentPlayerProfileInfo.profileImgPath}" 
								 data-src="holder.js/250x200" alt="image" class="img-thumbnail" 
								 onerror="this.src='http://jwlee0208.cdn3.cafe24.com/img/no_image.png'"  
								 onclick="javascript:goProfileView('${recentPlayerProfileInfo.profileId}', '${recentPlayerProfileInfo.profileType}');" 
								 data-toggle="modal" data-target="#myModal" 
								 style="padding-top:10px; cursor:pointer; width: 250px; height: 200px;"/>
								</c:when>
								<c:otherwise>
							<img src="http://jwlee0208.cdn3.cafe24.com/img/no_image.png" 
								 data-src="holder.js/250x200" alt="image" class="img-thumbnail"
								 onclick="javascript:goProfileView('${recentPlayerProfileInfo.profileId}', '${recentPlayerProfileInfo.profileType}');" 
								 data-toggle="modal" data-target="#myModal" 
								 style="padding-top:10px; cursor:pointer; width: 250px; height: 200px;"/>
								</c:otherwise>
							</c:choose>	
							<div class="caption" style="cursor:pointer;">
								<h3 style="background: #efefef; padding:5px 0 5px 0px; text-align:center;"><span onclick="javascript:goProfileView('${recentPlayerProfileInfo.profileId}', '${recentPlayerProfileInfo.profileType}');">${recentPlayerProfileInfo.name}</span></h3>
<!-- 								<div class="btn-group btn-group-lg btn-group-justified"> -->
<%-- 									<c:if test="${!empty recentPlayerProfileInfo.profileAttrList}"> --%>
<%-- 									<c:forEach var="profileAttrElemInfo" items="${recentPlayerProfileInfo.profileAttrList}"> --%>
<%-- 										<c:if test="${!empty profileAttrElemInfo.profileAttrElementMapList}"> --%>
<%-- 											<c:forEach var="profileAttrElemInfo" items="${profileAttrElemInfo.profileAttrElementMapList}"> --%>
<%-- 									<div class="btn btn-default">${profileAttrElemInfo.profileAttrElementMapName}</div> --%>
<%-- 											</c:forEach> --%>
<%-- 										</c:if>	 --%>
<%-- 									</c:forEach>				 --%>
<%-- 									</c:if> --%>
<!-- 								</div> -->
								<p class="content_${index.count}"></p>
								<p>
									<span class="btn btn-danger btn-block" 		role="button" onclick="javascript:goProfileView('${recentPlayerProfileInfo.profileId}', '${recentPlayerProfileInfo.profileType}');" data-toggle="modal" data-target="#myModal"><tag:message code='button.watchme'/></span>
								</p>
							</div>
						</div>		
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div style="text-align:center; min-height : 70px;vertical-align: middle;">
					<h3><tag:message code='text.noregistplayer'/></h3>
				</div>
			</c:otherwise>	
		</c:choose>
		</div>			
		
		<h4>Recent Registered Team List&nbsp;&nbsp;<small><a href="/profile/list/3/01010300"><tag:message code='button.more'/></a></small></h4>
		<div class="row">
		<c:choose>
			<c:when test="${!empty recentTeamProfileList}">
				<c:forEach var="recentTeamProfileInfo" items="${recentTeamProfileList}">
					<div class="col-md-4">
						<div class="thumbnail">
							<c:choose>
								<c:when test="${recentTeamProfileInfo.profileImgPath ne null && recentTeamProfileInfo.profileImgPath ne ''}">
							<img src="http://jwlee0208.cdn3.cafe24.com/${recentTeamProfileInfo.profileImgPath}" 
								 data-src="holder.js/250x200" alt="image" class="img-thumbnail" 
								 onerror="this.src='http://jwlee0208.cdn3.cafe24.com/img/no_image.png'"  
								 onclick="javascript:goProfileView('${recentTeamProfileInfo.profileId}', '${recentTeamProfileInfo.profileType}');" 
								 data-toggle="modal" data-target="#myModal" 
								 style="padding-top:10px; cursor:pointer; width: 250px; height: 200px;"/>
								</c:when>
								<c:otherwise>
							<img src="http://jwlee0208.cdn3.cafe24.com/img/no_image.png" 
								 data-src="holder.js/250x200" alt="image" class="img-thumbnail"
								 onclick="javascript:goProfileView('${recentTeamProfileInfo.profileId}', '${recentTeamProfileInfo.profileType}');" 
								 data-toggle="modal" data-target="#myModal" 
								 style="padding-top:10px; cursor:pointer; width: 250px; height: 200px;"/>
								</c:otherwise>
							</c:choose>	
							<div class="caption" style="cursor:pointer;">
								<h3 style="background: #efefef; padding:5px 0 5px 0px; text-align:center;"><span onclick="javascript:goProfileView('${recentTeamProfileInfo.profileId}', '${recentTeamProfileInfo.profileType}');">${recentTeamProfileInfo.name}</span></h3>
								<div class="btn-group btn-group-lg btn-group-justified">
<%-- 									<c:if test="${!empty recentTeamProfileInfo.profileAttrList}"> --%>
<%-- 									<c:forEach var="profileAttrElemInfo" items="${recentTeamProfileInfo.profileAttrList}"> --%>
<%-- 										<c:if test="${!empty profileAttrElemInfo.profileAttrElementMapList}"> --%>
<%-- 											<c:forEach var="profileAttrElemInfo" items="${profileAttrElemInfo.profileAttrElementMapList}"> --%>
<%-- 									<div class="btn btn-default">${profileAttrElemInfo.profileAttrElementMapName}</div> --%>
<%-- 											</c:forEach> --%>
<%-- 										</c:if>	 --%>
<%-- 									</c:forEach>				 --%>
<%-- 									</c:if> --%>
								</div>
								<p class="content_${index.count}"></p>
								<p>
									<span class="btn btn-danger btn-block" 		role="button" onclick="javascript:goProfileView('${recentTeamProfileInfo.profileId}', '${recentTeamProfileInfo.profileType}');" data-toggle="modal" data-target="#myModal"><tag:message code='button.watchme'/></span>
								</p>
							</div>
						</div>		
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div style="text-align:center; min-height : 70px;vertical-align: middle;">
					<h3><tag:message code='text.noregistplayer'/></h3>
				</div>
			</c:otherwise>	
		</c:choose>
		
		</div>
<!-- // 2016.06.14 이후 작 --> 		
<!-- 		
		<div class="row">
		<c:choose>
			<c:when test="${!empty recentPlayerList}">
				<c:forEach var="list" items="${recentPlayerList}">
					<div class="col-md-6">
						<div class="thumbnail">
					<c:choose>
						<c:when test="${list.playerVideoLinkList[0].linkUrl ne null && list.playerVideoLinkList[0].linkUrl ne ''}">
						<div style="margin: auto;">
							<c:out value="${list.playerVideoLinkList[0].linkUrl}" escapeXml="false"/>
						</div>	
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${list.profileImgFilePath ne null && list.profileImgFilePath ne ''}">
							<img src="http://jwlee0208.cdn3.cafe24.com/${list.profileImgFilePath}" 
								 data-src="holder.js/250x200" alt="image" class="img-thumbnail" 
								 onerror="this.src='http://jwlee0208.cdn3.cafe24.com/img/no_image.png'"  
								 onclick="javascript:goDetail('${list.userInfo.userId}');" 
								 data-toggle="modal" data-target="#myModal" 
								 style="padding-top:10px; cursor:pointer; width: 250px; height: 200px;"/>
								</c:when>
								<c:otherwise>
							<img src="http://jwlee0208.cdn3.cafe24.com/img/no_image.png" 
								 data-src="holder.js/250x200" alt="image" class="img-thumbnail"
								 onclick="javascript:goDetail('${list.userInfo.userId}');" 
								 data-toggle="modal" data-target="#myModal" 
								 style="padding-top:10px; cursor:pointer; width: 250px; height: 200px;"/>
								</c:otherwise>
							</c:choose>	
						</c:otherwise>
					</c:choose>			
							<div class="caption" style="cursor:pointer;">
								<h3 style="background: #efefef; padding:5px 0 5px 0px; text-align:center;"><span onclick="javascript:goDetail('${list.userInfo.userId}');">${list.userInfo.userNm}</span></h3>
								<div class="btn-group btn-group-lg btn-group-justified">
									<c:forEach var="attrElemInfo" items="${list.categoryAttrElemList}">
									<div class="btn btn-default">${attrElemInfo.attrElemNameStr}</div>
									</c:forEach>				
								</div>
								<p class="content_${index.count}"></p>
								<p>
									<span class="btn btn-danger btn-block" 		role="button" onclick="javascript:goDetail('${list.userInfo.userId}');"><tag:message code='button.watchme'/></span>
								</p>
							</div>
						</div>		
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div style="text-align:center; min-height : 70px;vertical-align: middle;">
					<h3><tag:message code='text.noregistplayer'/></h3>
				</div>
			</c:otherwise>	
		</c:choose>
		</div>	
		
		<h4><tag:message code='text.recentregistteams'/>&nbsp;&nbsp;<small><a href="/team/teamPortal/6"><tag:message code='button.more'/></a></small></h4>
		<div class="row">
		<c:choose>
			<c:when test="${!empty recentTeamList}">
				<c:forEach var="list" items="${recentTeamList}">
					<div class="col-md-4">
						<div class="thumbnail">
					<c:choose>
						<c:when test="${list.profileImgFilePath ne null && list.profileImgFilePath ne ''}">
							<img src="http://jwlee0208.cdn3.cafe24.com/${list.profileImgFilePath}" 
								 data-src="holder.js/250x200" alt="image" class="img-thumbnail" 
								 onerror="this.src='http://jwlee0208.cdn3.cafe24.com/img/no_image.png'"  
								 onclick="javascript:goDetail('${list.userInfo.userId}');" 
								 data-toggle="modal" data-target="#myModal" 
								 style="padding-top:10px; cursor:pointer; width: 250px; height: 200px;"/>
						</c:when>
						<c:otherwise>
							<img src="http://jwlee0208.cdn3.cafe24.com/img/no_image.png" 
								 data-src="holder.js/250x200" alt="image" class="img-thumbnail"
								 onclick="javascript:goDetail('${list.userInfo.userId}');" 
								 data-toggle="modal" data-target="#myModal" 
								 style="padding-top:10px; cursor:pointer; width: 250px; height: 200px;"/>
						</c:otherwise>
					</c:choose>					
							<div class="caption" style="cursor:pointer;">
								<h3><span onclick="javascript:goDetail('${list.userInfo.userId}');" data-toggle="modal" data-target="#myModal">${list.userInfo.userNm}</span></h3>
									<div class="btn-group btn-group-lg btn-group-justified">
									<c:forEach var="attrElemInfo" items="${list.categoryAttrElemList}">
										<div class="btn btn-default">${attrElemInfo.attrElemNameStr}</div>
									</c:forEach>				
									</div>
	
								<p class="content_${index.count}"></p>
								<p>
									<span class="btn btn-primary btn-block" 		role="button" onclick="javascript:goDetail('${list.userInfo.userId}');" data-toggle="modal" data-target="#myModal"><tag:message code='button.detailview'/></span>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div style="text-align:center; min-height : 70px;vertical-align: middle;">
				<h3><tag:message code='text.noregistplayer'/></h3>
				</div>
			</c:otherwise>	
		</c:choose>
		</div>	
 -->		
		<h4><tag:message code='text.recenttryoutinfo'/>&nbsp;&nbsp;<small><a href="/share/jwlee/list/15"><tag:message code='button.more'/></a></small></h4>
		<div class="row" style="padding-left: 10px; padding-right: 10px;">
			<div class="boardDiv li_1_board" style="padding-top : 10px;">
				<div class="table-responsive">
					<table class="table table-striped">
						<colgroup><col width="10%"/><col width="90%"/></colgroup>
					<c:choose>		
						<c:when test="${null ne recentTryoutList && recentTryoutList.size() > 0}">
							<c:forEach var="article" items="${recentTryoutList}">
						<tr>
							<td>${fn:substring(article.createDate, 0, 10)}</td>
							<td><span onclick="javascript:goArticleView('${article.articleId}');" data-toggle="modal" data-target="#myModal" style="cursor:pointer;">${article.title }</span></td>
						</tr>	
							</c:forEach> 
						</c:when>
						<c:otherwise>
						<tr><td colspan="2">데이터가 없습니다.</td></tr>
						</c:otherwise>	
					</c:choose>		
					</table>
				</div>
			</div>
		</div>	
	</div>
	
	<!-- Modal -->
	<c:import url="/common/modalPopup"/>
<!-- 	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
<!-- 	  <div class="modal-dialog modal-lg"> -->
<!-- 	    <div class="modal-content"> -->
<!-- 	      <div class="modal-header"> -->
<!-- 	        <button type="button" class="close" data-dismiss="modal" onclick="javascript:initModalHtml();"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
<!-- 	        <h4 class="modal-title" id="myModalLabel">Modal title</h4> -->
<!-- 	      </div> -->
<!-- 	      <div class="modal-body" style="height : 500px; overflow-y:scroll; "></div> -->
<!-- 	      <div class="modal-footer"> -->
<!-- 	        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:initModalHtml();">Close</button> -->
<!-- 	      </div> -->
<!-- 	    </div> -->
<!-- 	  </div> -->
<!-- 	</div> -->
<script>
	$().ready(function(){
		$("#li_1").addClass("active");
		
		$(".li_1_board").show();
		
		$("#boardTab .li").on("click", function(){
			$(".li").removeClass("active");
			$(".boardDiv").hide();
			
			$("#" + $(this).attr("id")).addClass("active");
			$("." + $(this).attr("id") + "_board").show();
		});
	});


	function goArticleView(articleId){
		$.ajax({
			url : '/share/view/' + articleId,
			data : {selectedArticleId : articleId},
			dataType : 'html',
			success : function(data){
				$('.modal-title').html(($(data).find(".panel-title").html()));
				$('.modal-body').html(($(data).find(".panel-body").html()));
			}
		});
	}

	var jumboHeight = $('.jumbotron').outerHeight();
	function parallax(){
	    var scrolled = $(window).scrollTop();
	    $('.bg').css('height', (jumboHeight-scrolled) + 'px');
	}

	$(window).scroll(function(e){
	    parallax();
	});
</script>

