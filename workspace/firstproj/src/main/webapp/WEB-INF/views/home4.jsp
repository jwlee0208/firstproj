<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slideshow.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-animate.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-touch.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.10.3/TweenMax.min.js"></script>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/angular/slide/slideshow.js"></script>
	<textarea id="boardJson01" name="boardJson01">${articleFive01JsonArr}</textarea>


	<div class="jumbotron">
		<h1>Back To The Simple</h1>
		<p>What is your important point. Have you ever lost a way to goal.</p>
		<p>We always try to concentrate 3 point.</p>
		<p>- What is original.</p>
		<p>- How can we approach to goal simply.</p>
		<p>- Is this comfortable.</p>
		<p>...</p>
		<p class="btn btn-primary btn-lg" role="button" onclick="javascript:goInfo();">See more</p>
	</div>
	
	<div class="row-fluid" style="padding-left: 40px; padding-right: 30px; " ng-app="website">
		<!-- left area -->
		<div class="col-md-4">
			<ul class="nav nav-tabs" role="tablist" id="boardTab">
				<li id="li_1" class="li"><a>자유게시판&nbsp;&nbsp;<span class="btn btn-default" onclick="javascript:goList(1);">more+</span></a></li>
				<li id="li_2" class="li"><a>Q&A&nbsp;&nbsp;<span class="btn btn-default" onclick="javascript:goList(2);">more+</span></a></li>
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
			${articleFile02Redis}
			<div class="boardDiv li_2_board" style="display:none; padding-top : 10px;">
				<div class="table-responsive">
					<table class="table table-striped">
						<colgroup><col width="30%"/><col width="70%"/></colgroup>
				<c:choose>		
					<c:when test="${null ne articleFive02 && articleFive02.size() > 0}">
						<c:forEach var="article" items="${articleFive02}">
						<tr>
							<td>${fn:substring(article.createDate, 0, 10)}</td>
							<td><span onclick="javascript:goArticleView('${article.articleId}');" data-toggle="modal" data-target="#myModal" >${article.title }</span></td>
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
		<!-- center area -->
		<div class="col-md-4">	
			<div class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item" width="400" height="255" src="//www.youtube.com/embed/7X9QYfwTuE8" frameborder="0" allowfullscreen></iframe>
	<!-- 		  	<iframe class="embed-responsive-item" width="420" height="255" src="//www.youtube.com/embed/sD8pJQ_9K4Y" frameborder="0" allowfullscreen></iframe>		 -->
			</div>
		</div>	
		<!-- right area -->
		<div class="col-md-4" ng-controller="SubCtrl">	
			 <div class="slider2">
			    <img ng-repeat="slide in slides" class="slide slide-animation nonDraggableImage"
			         ng-swipe-right="nextSlide()" ng-swipe-left="prevSlide()"
			         ng-hide="!isCurrentSlideIndex($index)" ng-src="{{slide.image}}">
			
			    <a class="arrow prev" href="#" ng-click="nextSlide()"></a>
			    <a class="arrow next" href="#" ng-click="prevSlide()"></a>
			    <nav class="nav-slide">
			        <div class="wrapper">
			            <ul class="dots">
			                <li class="dot" ng-repeat="slide in slides">
			                    <a href="#" 
			                    	ng-class="{'active':isCurrentSlideIndex($index)}"
			                       	ng-click="setCurrentSlideIndex($index);">{{slide.description}}</a>
			                </li>
			            </ul>
			        </div>
			    </nav>
			</div>
		</div>
	</div>
	
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-animate.min.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-touch.min.js"></script> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.10.3/TweenMax.min.js"></script> -->

<%-- <script type="text/javascript" 		src="${pageContext.request.contextPath}/js/angular/slide/slideshow.js"></script> --%>


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

// 		setBoard01();
	});


	function goArticleView(articleId){
		$.ajax({
			url : '/board/article/view',
			data : {selectedArticleId : articleId},
			dataType : 'html',
			success : function(data){
				$('.modal-title').html(($(data).find(".panel-title").html()));
				$('.modal-body').html(($(data).find(".panel-body").html()));
			}
		});
	}

	function setBoard01(){
		var boardJson01 = $.parseJSON($("#boardJson01").val());
		var html = "<table class=\"table table-striped\"><colgroup><col width=\"30%\"/><col width=\"70%\"/></colgroup>";
		
		for(var i = 0 ; i < boardJson01.length; i++){
			html += "<tr>";
			html += "<td>" + boardJson01[i].createDate.substring(0,10) +"</td>";
			html += "<td><span onclick=\"javascript:goArticleView('" + boardJson01[i].articleId + "');\" data-toggle=\"modal\" data-target=\"#myModal\" >" + boardJson01[i].title + "</span></td>";
			html += "</tr>";
// 			alert(boardJson01[i].boardId +", " + boardJson01[i].articleId +", " + boardJson01[i].filePath +", " + boardJson01[i].authorNm +", " + boardJson01[i].thumbnailSize +", " + boardJson01[i].contentText);
		}
		html += "</table>";
		
		$(".li_1_board div").html(html);
	}
</script>
