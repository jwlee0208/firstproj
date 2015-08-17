<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML>
<!--[if IE 7 ]>		 <html class="no-js ie ie7 lte7 lte8 lte9" lang="ko-KR"> <![endif]-->
<!--[if IE 8 ]>		 <html class="no-js ie ie8 lte8 lte9" lang="ko-KR"> <![endif]-->
<!--[if IE 9 ]>		 <html class="no-js ie ie9 lte9>" lang="ko-KR"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js" lang="ko-KR"> <!--<![endif]-->
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" 		content="IE=Edge" />
<meta http-equiv="Pragma" 				content="no-cache">
<meta http-equiv="expires" 				content="-1" >
<meta name="viewport" 					content="width=device-width, initial-scale=1">
<meta name="google-site-verification" 	content="7UeiOduowaVDwAs8XpEDd9CCnyDQr6I2npw9k8guOCc" />
<link rel="icon" href="${pageContext.request.contextPath}/img/common/favicon.ico">
<title>Developer's Blog - Nevertheless Keep Going</title>
<%@ include file="/WEB-INF/views/common/include.jsp"%>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/common.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/offcanvas.css">
<style>
.go_to_top {
    display:scroll;
    position:fixed;
    bottom:60px;
    right:15px;
    width:70px;
    font-weight:bold; 
    color:black;
    background-color:#eee;
    border:1px solid #e1e1e1;
}
.go_to_down {
    display:scroll;
    position:fixed;
    bottom:15px;
    right:15px;
    width:70px;
    font-weight:bold; 
    color:black;
    background-color:#eee;
    border:1px solid #e1e1e1;
}

/* .btn_up_layer {position:absolute;top:0;right:10px;display:none;padding:5px 10px;z-index:1; } */
/* .btn_down_layer {position:absolute;top:0;right:10px;display:none;padding:5px 10px;z-index:1; } */
</style>
<script>
/* 위로
스크롤이 특정 위치로 이동하면 위로버튼이 나타난다.
위로버튼을 클릭하면 상단으로 이동
*/
// function btn_mv_up(oj) {
//  if(!oj) return false;
//  var st = $(window).scrollTop();
//  var h = $(window).height();
 
//  $(oj).stop().hide().css('top',h + st - 90);    // 스크롤 이동에 따른 위로버튼의 위치 이동
//  if(st > 200) { $(oj).fadeIn(); }    // 위로버튼을 보여주는 위치 지정
//  else if(st < 200) { $(oj).stop().fadeOut(); }    // 위로버튼을 숨기는 위치 지정
// }

// // function btn_mv_down(oj) {
// // 	 if(!oj) return false;
// // 	 var st = $(window).scrollTop();
// // 	 var h = $(window).height();
	 
// // 	 $(oj).stop().hide().css('top',h + st - 50);    // 스크롤 이동에 따른 위로버튼의 위치 이동
// // 	 if(st > 200) { $(oj).fadeIn(); }    // 위로버튼을 보여주는 위치 지정
// // 	 else if(st < 200) { $(oj).stop().fadeOut(); }    // 위로버튼을 숨기는 위치 지정
// // 	}

// // 위로 버튼
//  $(document).scroll(function() {
//   btn_mv_up('.btn_up_layer');
// //   btn_mv_down('.btn_down_layer');
//  });

//  $(function(){
// 	 $(".btn_up_layer").click(function() {
// 	 	$("html, body").animate({scrollTop:0}, 'slow');
// 	 });

// // 	 $(".btn_down_layer").click(function() {
// // 		 	$("html, body").animate({scrollTop:($(document).height() - $(window).height() - $(window).scrollTop())}, 'slow');
// // 	 });
//  });
</script>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="menu"/>
	<div class="container" role="application">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9" role="main">			
				<tiles:insertAttribute name="body"/>
					
			</div>
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="complementary">	
				<tiles:insertAttribute name="quickBoardList"/>
			</div>	
		</div>
<!-- 		<button type="button" class="btn_up_layer btn btn-default">&nbsp;top&nbsp;</button> -->
<!-- 		<button type="button" class="btn_down_layer btn btn-primary">∨</button> -->
		<a class="go_to_top btn" href="#" title="go to top of page">Top</a>
		<a class="go_to_down btn" href="#scrollDown" title="go to down of page">Down</a>
	</div>	

	<div id="scrollDown"></div>
	<tiles:insertAttribute name="footer"/>
</body>

</html>