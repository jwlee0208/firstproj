<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html ng-app="website">
<head>
    <title>LinkedNest - Link Between Player With Club</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slideshow.css">
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
</style>
</head>
<body>


	<div class="jumbotron">
		<h1>Keep Going Your Way</h1>
		<p>Why don't you just go one step more?</p>
		<p>Do not afraid of yourself. You are the player.</p>
		<p>Never ever give up.</p>
		<p><strong>"It ain't over till it's over."</strong> - 'Yogi' Lawrence Peter Berra</p>
		<p class="btn btn-primary btn-lg" role="button">Regist Profile&nbsp;>></p>
	</div>


	<div class="row" style="padding-left: 20px; padding-right: 20px; ">
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
<!-- 		<div class="row">	 -->
<!-- 			<div class="embed-responsive embed-responsive-16by9"> -->
<!-- 				<iframe class="embed-responsive-item" width="420" height="255" src="//www.youtube.com/embed/7X9QYfwTuE8" frameborder="0" allowfullscreen></iframe> -->
<!-- 			</div> -->
<!-- 		</div>	 -->
		<!-- right area -->
<!-- 		<div class="row" ng-controller="SubCtrl">	 -->
<!-- 			 <div class="slider2"> -->
<!-- 			    <img ng-repeat="slide in slides" class="slide slide-animation nonDraggableImage" -->
<!-- 			         ng-swipe-right="nextSlide()" ng-swipe-left="prevSlide()" -->
<!-- 			         ng-hide="!isCurrentSlideIndex($index)" ng-src="{{slide.image}}"> -->
			
<!-- 			    <a class="arrow prev" href="#" ng-click="nextSlide()"></a> -->
<!-- 			    <a class="arrow next" href="#" ng-click="prevSlide()"></a> -->
<!-- 			    <nav class="nav-slide"> -->
<!-- 			        <div class="wrapper"> -->
<!-- 			            <ul class="dots"> -->
<!-- 			                <li class="dot" ng-repeat="slide in slides"> -->
<!-- 			                    <a href="#"  -->
<!-- 			                    	ng-class="{'active':isCurrentSlideIndex($index)}" -->
<!-- 			                       	ng-click="setCurrentSlideIndex($index);">{{slide.description}}</a> -->
<!-- 			                </li> -->
<!-- 			            </ul> -->
<!-- 			        </div> -->
<!-- 			    </nav> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-animate.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-touch.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.10.3/TweenMax.min.js"></script>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/angular/slide/slideshow.js"></script>


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

</body>
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

	var jumboHeight = $('.jumbotron').outerHeight();
	function parallax(){
	    var scrolled = $(window).scrollTop();
	    $('.bg').css('height', (jumboHeight-scrolled) + 'px');
	}

	$(window).scroll(function(e){
	    parallax();
	});
</script>


</html>
