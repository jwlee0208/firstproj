<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>I'm ${playerDetailInfo.userInfo.userNm} ::: LinkedNest.net</title>
<!-- bootstrap -->
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-theme.min.css">
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
<%-- <link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-combined.min.css"> --%>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
<!-- chart.js -->
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/chart.js/Chart.min.js"></script>

<style type="text/css">
	.form-group .col-sm-10 {vertical-align : middle;}
</style>
</head>
<body>
<div class="container">
	<form id="viewFrm" name="viewFrm" method="post" class="form-horizontal" role="form">
		<input type="hidden" id="playerInfoId" name="playerInfoId" value="${playerDetailInfo.playerInfoId}"/>
		<h1 id="btn-groups" class="page-header">I'm ${playerDetailInfo.userInfo.userNm}&nbsp;&nbsp;&nbsp;<small>Player Information</small></h1>
		<div class="form-group">
			<label for="linkUrl" class="col-sm-2">Checkout My Play Streamming</label>
			<div class="col-sm-10">
				<div class="embed-responsive embed-responsive-16by9">
					${playerDetailInfo.playerVideoLinkList[0].linkUrl}
				</div>
				
<%-- 			<c:set var="playerVideoLinkList" value="${playerDetailInfo.playerVideoLinkList}"/> --%>
<%-- 			<c:if test="${playerVideoLinkList ne '' or playerVideoLinkList ne null}"> --%>
<%-- 				<c:forEach var="playerVideoLinkInfo" items="${playerVideoLinkList}" varStatus="idx"> --%>
<%-- 					<iframe class="embed-responsive-item" width="420" height="255" src="${palyerVideoLinkInfo.linkUrl}" frameborder="0" allowfullscreen></iframe><br/> --%>
<%-- 				</c:forEach> --%>
<%-- 			</c:if> --%>
			</div>
		</div>
		
		<div class="form-group">
			<label for="profileImgFilePath" class="col-sm-2">Profile Image</label>
			<div class="col-sm-10"><img data-src="holder.js/300x200" src="http://jwlee0208.cdn3.cafe24.com/${playerDetailInfo.profileImgFilePath}" class="img-thumbnail" width="300px" height="200px" /></div>
		</div>
<!-- 
		<div class="form-group">
			<label for="userNm" class="col-sm-2">My Name is</label>
			<div class="col-sm-10">
				<input type="hidden" id="userId" name="userId" value="${playerDetailInfo.userInfo.userId}"/>
				${playerDetailInfo.userInfo.userNm}
			</div>
		</div>
 -->		
		<div class="form-group">
			<label for="catNm1" class="col-sm-2">My type is</label>
			<div class="col-sm-10">${playerDetailInfo.catNm1}</div>
		</div>
		<div class="form-group">
			<label for="catNm2" class="col-sm-2">My Position is</label>
			<div class="col-sm-10">${playerDetailInfo.catNm2}</div>
		</div>
		<div class="form-group">
			<label for="phoneNo" class="col-sm-2">Detail Type</label>
			<div class="col-sm-10" id="attrElemList">
			<c:set var="categoryAttrElemList" value="${playerDetailInfo.categoryAttrElemList}"/>
			<c:if test="${categoryAttrElemList ne null or categoryAttrElemList ne ''}">
				<c:forEach var="attrElemInfo" items="${playerDetailInfo.categoryAttrElemList}">
				<div>
				<h4><span class="label label-default">${attrElemInfo.attrNameStr}</span></h4><span>${attrElemInfo.attrElemNameStr}</span>
				</div>
				</c:forEach>	
			</c:if>
			</div>
		</div>
		<div class="form-group">
			<label for="batChart" class="col-sm-2">Batting Factor</label>
			<canvas id="batChart" width="400" height="400"></canvas>
		</div>	
		<div class="form-group">
			<label for="fieldChart" class="col-sm-2">Fielding Factor</label>
			<canvas id="fieldChart" width="400" height="400"></canvas>
		</div>	
		<div class="form-group">
			<label for="introduce" class="col-sm-2">Introduce Yourself!</label>
			<div class="col-sm-10">
				<c:out value="${playerDetailInfo.introduce}" escapeXml="false"/>
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
$(document).ready(function() {
	$("img").addClass("media-object");
	$("img").attr("width", "95%");
	$("img").off("error");
	$("img").on("error", function(){
		$(this).attr("src", '${pageContext.request.contextPath}/img/no_image.png');
	});
});

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
		frm.attr("method","get");
		frm.submit();
// 		location.href = "/player/modify";
	});


	// chart.js
	var batCtx = document.getElementById("batChart").getContext("2d");
	var batData = {
		    labels: ["타율", "출루율", "장타율", "OPS"],
		    datasets: [
		        {
		            label: "2014 League",
		            fillColor: "rgba(220,220,220,0.2)",
		            strokeColor: "rgba(220,220,220,1)",
		            pointColor: "rgba(220,220,220,1)",
		            pointStrokeColor: "#fff",
		            pointHighlightFill: "#fff",
		            pointHighlightStroke: "rgba(220,220,220,1)",
		            data: [0.330, 0.421, 0.459, 0.976]
		        },
		        {
		            label: "2015 League",
		            fillColor: "rgba(151,187,205,0.2)",
		            strokeColor: "rgba(151,187,205,1)",
		            pointColor: "rgba(151,187,205,1)",
		            pointStrokeColor: "#fff",
		            pointHighlightFill: "#fff",
		            pointHighlightStroke: "rgba(151,187,205,1)",
		            data: [0.278, 0.433, 0.360, 0.593]
		        }
		    ]
		};	
		
	new Chart(batCtx).Radar(batData, {
	    //Boolean - Whether to show lines for each scale point
	    scaleShowLine : true,

	    //Boolean - Whether we show the angle lines out of the radar
	    angleShowLineOut : true,

	    //Boolean - Whether to show labels on the scale
	    scaleShowLabels : false,

	    // Boolean - Whether the scale should begin at zero
	    scaleBeginAtZero : true,

	    //String - Colour of the angle line
	    angleLineColor : "rgba(0,0,0,.1)",

	    //Number - Pixel width of the angle line
	    angleLineWidth : 1,

	    //String - Point label font declaration
	    pointLabelFontFamily : "'Arial'",

	    //String - Point label font weight
	    pointLabelFontStyle : "normal",

	    //Number - Point label font size in pixels
	    pointLabelFontSize : 10,

	    //String - Point label font colour
	    pointLabelFontColor : "#666",

	    //Boolean - Whether to show a dot for each point
	    pointDot : true,

	    //Number - Radius of each point dot in pixels
	    pointDotRadius : 3,

	    //Number - Pixel width of point dot stroke
	    pointDotStrokeWidth : 1,

	    //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
	    pointHitDetectionRadius : 20,

	    //Boolean - Whether to show a stroke for datasets
	    datasetStroke : true,

	    //Number - Pixel width of dataset stroke
	    datasetStrokeWidth : 2,

	    //Boolean - Whether to fill the dataset with a colour
	    datasetFill : true    
	});

	var fieldCtx = document.getElementById("fieldChart").getContext("2d");
	var fieldData = {
		    labels: ["수비율", "출루율", "장타율", "OPS"],
		    datasets: [
		        {
		            label: "2014 League",
		            fillColor: "rgba(220,220,220,0.2)",
		            strokeColor: "rgba(220,220,220,1)",
		            pointColor: "rgba(220,220,220,1)",
		            pointStrokeColor: "#fff",
		            pointHighlightFill: "#fff",
		            pointHighlightStroke: "rgba(220,220,220,1)",
		            data: [65, 59, 90, 81]
		        },
		        {
		            label: "2015 League",
		            fillColor: "rgba(151,187,205,0.2)",
		            strokeColor: "rgba(151,187,205,1)",
		            pointColor: "rgba(151,187,205,1)",
		            pointStrokeColor: "#fff",
		            pointHighlightFill: "#fff",
		            pointHighlightStroke: "rgba(151,187,205,1)",
		            data: [28, 48, 40, 19]
		        }
		    ]
		};	
	new Chart(fieldCtx).Line(fieldData, {
	    pointDot: false
	});
});
</script>
</html>