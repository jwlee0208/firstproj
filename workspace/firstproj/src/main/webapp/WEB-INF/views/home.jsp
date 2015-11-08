<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<style>
.jumbotron {
    position: relative;
    background: #000 url("../img/home/img00.jpg") center center;
    width: 100%;
    height: 100%;
    background-size: cover;
    overflow: hidden;
    text-shadow: #444 0 1px 1px;
    color: white; 
}
iframe {width : 250px; height : 200px; align:center;}

.circle {
margin-left: auto;
margin-right: auto;
border-radius: 50%;
width: 40%;
position: relative;
}

.circle-border {
border: 1px solid black;
}

.circle-solid{
background-color: whitesmoke;
}

.circle:before {
content: "";
display: block;
padding-top: 100%;
}

.circle-inner {
position: absolute;
top: 0;
left: 0;
bottom: 0;
right: 0;
text-align: center;
}

.score-text {
margin: auto;
position: absolute;
top: 0;
left: 0;
bottom: 0;
right: 0;
height: 1em;
line-height: 1em;
font-size: 1em;
}
</style>
<form id="mainFrm" name="mainFrm" method="post">
</form>
	<div class="jumbotron">
		<h1><tag:message code='main.text1'/></h1>
		<p><tag:message code='sub.text1'/></p>
		<p><tag:message code='sub.text2'/></p>
		<p><tag:message code='sub.text3'/></p>
		<p><strong>"<tag:message code='sub.text4'/>"</strong> - 'Yogi' Lawrence Peter Berra</p>
	</div>

	<h4><tag:message code='text.recentregistplayers'/>&nbsp;&nbsp;<small><a href="/player/playerPortal/6"><tag:message code='button.more'/></a></small></h4>
	<div class="row">
	<c:choose>
		<c:when test="${!empty recentPlayerList}">
			<c:forEach var="list" items="${recentPlayerList}">
				<div class="col-md-4">
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
							<p class="content_${index.count}" style="text-overflow:ellipsis; overflow:hidden;">
								<div class="row">
									<div class="col-xs-6">
										<div class="circle circle-border">
										     <div class="circle-inner">
										         <div class="score-text">
										            ${list.catNm1}
										          </div>
										     </div>
										</div>	
									</div>
									<div class="col-xs-6">
										<div class="circle circle-border">
										     <div class="circle-inner">
										         <div class="score-text">
										            ${list.catNm2}
										          </div>
										     </div>
										</div>									
									</div>
								</div>
<%-- 								
								<div class="row"><div class="col-xs-6">Type</div><div class="col-xs-6">${list.catNm1}</div></div>
								<div class="row"><div class="col-xs-6">Position</div><div class="col-xs-6">${list.catNm2}</div></div> 
--%>
							</p>
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
							<p class="content_${index.count}" style="text-overflow:ellipsis; overflow:hidden;">
								<div class="row"><div class="col-xs-6">Type</div><div class="col-xs-6">${list.catNm1Str}</div></div>
								<div class="row"><div class="col-xs-6">Position</div><div class="col-xs-6">${list.catNm2Str}</div></div>
							</p>
							<p>
								<span class="btn btn-info" 		role="button" onclick="javascript:goDetail('${list.userInfo.userId}');" data-toggle="modal" data-target="#myModal"><tag:message code='button.detailview'/></span>
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
	
	
	

	<div class="row" style="padding-left: 20px; padding-right: 20px; display: none;">
		<!-- left area -->
		<div class="row">
			<ul class="nav nav-tabs" role="tablist" id="boardTab">
				<li id="li_1" class="li"><a>개발 관련&nbsp;&nbsp;<span class="btn btn-default" onclick="javascript:goList(1);">more+</span></a></li>
				<li id="li_2" class="li"><a>여행 관련&nbsp;&nbsp;<span class="btn btn-default" onclick="javascript:goList(2);">more+</span></a></li>
			</ul>
			<div class="boardDiv li_1_board" style="display:none; padding-top : 10px;">
				<div class="table-responsive">
					<table class="table table-striped">
						<colgroup><col width="30%"/><col width="70%"/></colgroup>
				<c:choose>		
					<c:when test="${null ne articleFive01 && articleFive01.size() > 0}">
						<c:forEach var="article" items="${articleFive01}">
						<tr>
							<td>${fn:substring(article.createDate, 0, 10)}</td>
							<td><span onclick="javascript:goArticleView('${article.articleId}');" data-toggle="modal" data-target="#myModal">${article.title }</span></td>
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
			<div class="boardDiv li_2_board" style="display:none; padding-top : 10px;">
				<div class="table-responsive">
					<table class="table table-striped">
						<colgroup><col width="30%"/><col width="70%"/></colgroup>
				<c:choose>		
					<c:when test="${null ne articleFive02 && articleFive02.size() > 0}">
						<c:forEach var="article" items="${articleFive02}">
						<tr>
							<td>${fn:substring(article.createDate, 0, 10)}</td>
							<td><span onclick="javascript:goArticleView('${article.articleId}');" data-toggle="modal" data-target="#myModal" >${article.title}</span></td>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="width : 700px;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body" style="height : 500px; overflow-y:scroll; "></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
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
			url : '/board/article/view/' + articleId,
			data : {selectedArticleId : articleId},
			dataType : 'html',
			success : function(data){
				$('.modal-title').html(($(data).find(".panel-title").html()));
				$('.modal-body').html(($(data).find(".panel-body").html()));
			}
		});
	}

	function goDetail(userId){
		var frm = $("#mainFrm");
		frm.attr("action", "/player/playerDetailView/" + userId);
		frm.attr("method", "post");
		frm.submit();		
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

