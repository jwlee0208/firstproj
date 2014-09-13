<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript" src="http://apis.daum.net/maps/maps2.js?apikey=98f284673f90ce9e7af4fa2aa4776e3465dc16f3"></script>

<!-- <script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=98f284673f90ce9e7af4fa2aa4776e3465dc16f3" charset="utf-8"></script>  -->
<!-- <script charset="UTF-8" src="http://apis.daum.net/maps/real/maps3.70.js"></script> -->
<script>
	function goToAUTab(index){
		$(".li").removeClass("active");
		$(".tabDiv").hide();
		$(".li_" + index).addClass("active");
		$(".tab" + index).show();
		var innerHtml = "";
// 			"<a href=\"javascript:;\">";
		if(index == 1) 		innerHtml += "Introduction";
		else if(index == 2) innerHtml += "History";
		else if(index == 3) innerHtml += "Organization";
		else if(index == 4) innerHtml += "Location";
// 		innerHtml += "</a>";
		$(".secondBranch").html(innerHtml);
	}
</script>
<div class="container">
		<h1 id="btn-groups" class="page-header">ABOUT US</h1>
		
		<ol class="breadcrumb">
		  <li><a href="#" onclick="javascript:goHome();">Home</a></li>
		  <li><a>About Us</a></li>
		  <li class="secondBranch active"></li>
		</ol>		
		
		<ul class="nav nav-tabs nav-justified" role="tablist">
<!-- 			<li class="li li_1"><a href="#" onclick="javascript:goToAUTab(1);">Introduction</a></li> -->
			<li class="li li_2"><a href="#" onclick="javascript:goToAUTab(2);">History</a></li>
<!-- 			<li class="li li_3"><a href="#" onclick="javascript:goToAUTab(3);">Organization</a></li> -->
			<li class="li li_4"><a href="#" onclick="javascript:goToAUTab(4);">Location</a></li>
		</ul>

		<div class="tabDiv tab1" style="padding-top: 20px;">
<!-- 			<div class="jumbotron"> -->
<!-- 				<h1>Introduction Our Organization</h1> -->
<!-- 				<p class="btn btn-primary btn-lg" role="button">See more</p> -->
<!-- 			</div> -->
		</div>		
		<div class="tabDiv tab2" style="padding-top: 20px;">
			<div style="padding-left: 50px; padding-right: 50px;">
				<h1>1996. <small>Aug. Stopping Baseball As Player</small></h1><br/>
				<h1>1994. <small>Aug. Picked Up National Baseball Team</small></h1><br/>
				<h1>1994. <small>Mar. Matriculation Into Junior High School</small></h1><br/>
				<h1>1992. <small>Sep. Beginning Baseball As Player </small></h1><br/>
				<h1>1988. <small>Mar. Matriculation Into Elementary School</small></h1><br/>
				<h1>1983. <small>Feb. Born In Seoul</small></h1>			
			</div>
		</div>
		<div class="tabDiv tab3" style="padding-top: 20px;">
<!-- 			<h2>Organization</h2> -->
		</div>
		<div class="tabDiv tab4" style="padding-top: 20px;">
<!-- 			<h2>Location</h2>		 -->
			<div style="height : 400px; overflow-y:scroll; padding-bottom : 20px; ">
			  <div class="col-md-8"><div id="map"></div></div>
			  <div class="col-md-4">
			  	<h2><small>주소</small></h2>
			  	<p class="text-info">서울시 강남구 대치동 000-00</p>
			  	<h2><small>대중교통</small></h2>
			  	<p class="text-info">000-00</p>
			  </div>			
				
			</div>
		</div>
</div>		
<script>
$(document).on("ready", function(){
	goToAUTab(2);
});

// var map;
// function init() {
// 	map =  new daum.maps.Map(document.getElementById('map'), {
// 		center: new daum.maps.LatLng(37.537123, 127.005523)
// 	});
// 	var zoomControl = new daum.maps.ZoomControl();
// 	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
// 	var mapTypeControl = new daum.maps.MapTypeControl();
// 	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
// }
var map = new DMap("map",{width:700,height:400});
	map.setCenter(new DLatLng(37.50696024199666, 127.06154455833864), 2);
	 var iw = new DInfoWindow("http://local.daum.net/localn/include/cms_map.html", {width:270, height:160});
	var m = new DMark(new DLatLng(37.50696024199666, 127.06154455833864));
	map.addOverlay(m);

</script>	  	  