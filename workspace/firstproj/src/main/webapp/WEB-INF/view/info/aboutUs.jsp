<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
		<h1 id="btn-groups" class="page-header">ABOUT US</h1>
		
		<ol class="breadcrumb">
		  <li><a href="#" onclick="javascript:goHome();">Home</a></li>
		  <li class="secondBranch active"></li>
		</ol>		
		
		<ul class="nav nav-tabs nav-justified" role="tablist">
			<li class="li li_1"><a href="#" onclick="javascript:goToAUTab(1);">Introduction</a></li>
			<li class="li li_2"><a href="#" onclick="javascript:goToAUTab(2);">History</a></li>
			<li class="li li_3"><a href="#" onclick="javascript:goToAUTab(3);">Organization</a></li>
			<li class="li li_4"><a href="#" onclick="javascript:goToAUTab(4);">Location</a></li>
		</ul>

		<div class="tabDiv tab1">
			<h2>Introduction</h2>
		</div>		
		<div class="tabDiv tab2">
			<h2>History</h2>
		</div>
		<div class="tabDiv tab3">
			<h2>Organization</h2>
		</div>
		<div class="tabDiv tab4">
			<h2>Location</h2>  <p>서울시 강남구 대치동 000-00</p>		
			<div style="height : 400px; overflow-y:scroll; padding-bottom : 20px; ">
				<div id="map"></div>
			</div>
		</div>
</body>
<script>
$(document).on("ready", function(){
	goToAUTab(1);
	init();
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
var map = new DMap("map",{width:400,height:400});
	map.setCenter(new DLatLng(37.50696024199666, 127.06154455833864), 2);
	 var iw = new DInfoWindow("http://local.daum.net/localn/include/cms_map.html", {width:270, height:160});
	var m = new DMark(new DLatLng(37.50696024199666, 127.06154455833864));
	map.addOverlay(m);

</script>
</html>		  	  