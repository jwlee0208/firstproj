<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::: LinkedNest.net</title>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-validate.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>

<!-- bootstrap -->
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-theme.min.css">
<link 	rel="stylesheet" 			href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" 		src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript"	src="${pageContext.request.contextPath}/js/holder.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>

<style type="text/css">
	.form-group .col-sm-10 {vertical-align : middle;}
</style>
</head>
<body>
<div class="container-fluid">
	<form id="viewFrm" name="viewFrm" method="post" class="form-horizontal" role="form">
		<input type="hidden" id="profileId" 	name="profileId" value="${profileInfo.profileId}"/>
		<div style="display:none;"><h2>${profileInfo.title}&nbsp;<small>Profile</small></h2></div>
		
		<img src="http://jwlee0208.cdn3.cafe24.com/${profileInfo.profileImgPath}" />
		
<c:choose>
	<c:when test="${profileInfo.profileType eq 1}">
		<h3>Personal Information</h3>
		<hr/>
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Name</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.name}</p>
			</div>
		</div>
		  <div class="form-group">
		    <label for="" class="col-sm-2 control-label">Height / Weight</label>
		    <div class="col-sm-10">
		      <p class="form-control-static">${profileInfo.profilePlayerDto.height} / ${profileInfo.profilePlayerDto.weight}</p>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="" class="col-sm-2 control-label">Date Of Birth</label>
		    <div class="col-sm-10">
		      <p class="form-control-static">${profileInfo.profilePlayerDto.birthDate}</p>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="" class="col-sm-2 control-label">Birth Place</label>
		    <div class="col-sm-10">
		      <p class="form-control-static">${profileInfo.profilePlayerDto.birthPlace}</p>
		    </div>
		  </div>	
		<h3>Player Information</h3>
		<hr/>
		<c:set var="profileAttrList" value="${profileInfo.profileAttrList}"/>
		<c:if test="${!empty profileAttrList}">
			<c:forEach var="profileAttrInfo" items="${profileAttrList}">
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">${profileAttrInfo.profileAttrName}</label>
	    	<c:if test="${!empty profileAttrInfo.profileAttrElementMapList}">
		    <div class="col-sm-10">
	    		<c:forEach var="profileAttrElemInfo" items="${profileAttrInfo.profileAttrElementMapList}">
	    		<p class="form-control-static">${profileAttrElemInfo.profileAttrElementMapName}</p>
	    		</c:forEach>
	    	</div>	
	    	</c:if>
		    	
		</div>
			</c:forEach>	
			
		</c:if>

		<h3>Career</h3>
		<hr/>
		<c:set var="profileCareerList" value="${profileInfo.profileCareerList}"/>
		<c:if test="${!empty profileCareerList}">
		
			<table class="table">
				<thead class="thead-inverse">
					<tr>
						<th>Title</th>
						<th>Description</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th>Status</th>
						<th>Seq</th>
					</tr>
				</thead>
				<tbody>		
			<c:forEach var="profileCareerInfo" items="${profileCareerList}">
					<tr>
			    		<th class="row"><p class="form-control-static">${profileCareerInfo.careerTitle}</p></th>
		    			<td><p class="form-control-static">${profileCareerInfo.careerDescription}</p></td>
		    			<td><p class="form-control-static">${profileCareerInfo.startDate}</p></td>
		    			<td><p class="form-control-static">${profileCareerInfo.endDate}</p></td>
		    			<td><p class="form-control-static">${profileCareerInfo.careerStatus}</p></td>
		    			<td><p class="form-control-static">${profileCareerInfo.careerSeq}</p></td>
					</tr>
			</c:forEach>		
				</tbody>
			</table>									
		</c:if>
		<c:set var="profileStreamList" value="${profileInfo.profileStreamList}"/>
		<c:if test="${!empty profileStreamList}">
		<h3>Play Streamming</h3>
		<hr/>
		<c:forEach var="profileStreamInfo" items="${profileStreamList}">
		<h3><small>${profileStreamInfo.streamTitle}</small></h3>	
		<div class="embed-responsive embed-responsive-16by9">${profileStreamInfo.streamUrl}</div>
		</c:forEach>
		</c:if>
		<h3>Statistics</h3>
		<hr/>	
		<c:set var="profileStatPitcherList" value="${profileInfo.profileStatPitcherList}"/>
		<c:set var="profileStatHitterList" value="${profileInfo.profileStatHitterList}"/>
		<c:set var="profileStatFielderList" value="${profileInfo.profileStatFielderList}"/>
				
		<c:if test="${!empty profileStatPitcherList}">
		<h3><small>Pitching Stat</small></h3>
				
		<table class="table">
			<thead class="table-inverse">
				<tr>
					<th>Team</th>
					<th>Year</th>
					<th>INN</th>
					<th>W</th>
					<th>L</th>
					<th>ERA</th>
					<th>G</th>
					<th>GS</th>
					<th>SV</th>
					<th>SVO</th>
					<th>IP</th>
					<th>H</th>
					<th>R</th>
					<th>ER</th>
					<th>HR</th>
					<th>BB</th>
					<th>SO</th>
					<th>AVG</th>
					<th>WHIP</th>
					<th>K</th>
					<th>ETC</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="profileStatPitcherInfo" items="${profileStatPitcherList}">
				<tr>
					<td><p class="form-control-static">${profileStatPitcherInfo.pTeamName}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.pStatYear}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.inn}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.w}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.l}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.era}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.g}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.gs}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.sv}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.svo}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.ip}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.h}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.r}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.er}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.hr}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.bb}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.so}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.avg}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.whip}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.k}</p></td>
					<td><p class="form-control-static">${profileStatPitcherInfo.etc}</p></td>
				</tr>					
			</c:forEach>
			</tbody>
		</table>
				
		</c:if>
		<c:if test="${!empty profileStatHitterList}">
		<h3><small>Hitting Stat</small></h3>		
		<table class="table">
			<thead class="table-inverse">
				<tr>
					<th>Team</th>
					<th>Year</th>
					<th>G</th>
					<th>AB</th>
					<th>R</th>
					<th>H</th>
					<th>2B</th>
					<th>3B</th>
					<th>HR</th>
					<th>RBI</th>
					<th>BB</th>
					<th>SO</th>
					<th>SB</th>
					<th>CS</th>
					<th>AVG</th>
					<th>OBP</th>
					<th>SLG</th>
					<th>OPS</th>
					<th>ETC</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="profileStatHitterInfo" items="${profileStatHitterList}">
				<tr>
					<td><p class="form-control-static">${profileStatHitterInfo.hTeamName}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.hStatYear}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.g}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.ab}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.r}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.h}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.twoB}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.threeB}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.hr}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.rbi}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.bb}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.so}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.sb}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.cs}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.avg}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.obp}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.slg}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.ops}</p></td>
					<td><p class="form-control-static">${profileStatHitterInfo.etc}</p></td>
				</tr>	
			</c:forEach>
			</tbody>
		</table>	
		</c:if>
		<c:if test="${!empty profileStatFielderList}">
		<h3><small>Fielding Stat</small></h3>
		<table class="table">
			<thead class="table-inverse">
				<tr>
					<th>Team</th>
					<th>Year</th>
					<th>Position</th>
					<th>G</th>
					<th>GS</th>
					<th>INN</th>
					<th>TC</th>
					<th>PO</th>
					<th>A</th>
					<th>E</th>
					<th>DP</th>
					<th>SB</th>
					<th>CS</th>
					<th>SBPCT</th>
					<th>PB</th>
					<th>C_WP</th>
					<th>FPCT</th>
					<th>PRF</th>
					<th>ETC</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="profileStatFielderInfo" items="${profileStatFielderList}">
				<tr>
					<th class="row"><p class="form-control-static">${profileStatFielderInfo.fTeamName}</p></th>								
	    			<td><p class="form-control-static">${profileStatFielderInfo.fStatYear}</p></td>
	    			<td><p class="form-control-static">${profileStatFielderInfo.pos}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.g}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.gs}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.inn}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.tc}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.po}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.a}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.e}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.dp}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.sb}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.cs}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.sbpct}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.pb}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.cWp}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.fpct}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.rf}</p>
	    			<td><p class="form-control-static">${profileStatFielderInfo.etc}</p>
				</tr>
			</c:forEach>						
			</tbody>					
		</table>
		</c:if>										  
	</c:when>
	<c:when test="${profileInfo.profileType eq 2}">
	
	</c:when>
	<c:when test="${profileInfo.profileType eq 3}">
		<h3>Team Information</h3>
		<hr/>
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Name</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.name}</p>
			</div>
		</div>
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Franchise</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.profileTeamDto.city}</p>
			</div>
		</div>	
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Established Date</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.profileTeamDto.establishedDate}</p>
			</div>
		</div>
		<h3>League Information</h3>
		<hr/>
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Area</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.leagueInfoDto.area}</p>
			</div>
		</div>		
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Country</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.leagueInfoDto.country}</p>
			</div>
		</div>				
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Name</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.leagueInfoDto.leagueName}</p>
			</div>
		</div>
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">League Type</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.leagueInfoDto.leagueType}</p>
			</div>
		</div>
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">League Division</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.leagueInfoDto.leagueDivision}</p>
			</div>
		</div>		
					
	</c:when>
</c:choose>		
		
		<h3>Introduce</h3>
		<hr/>	
		<div class="form-group">
			<div class="col-sm-12">
			<p class="form-control-static"><c:out value="${profileInfo.introduce}" escapeXml="false"/></p>
			</div>
		</div>
		
		<h3>Contact Information</h3>
		<hr/>	
<c:if test="${profileInfo.profileContactInfoDto.email ne null}">
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Email</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><a href="mailto: ${profileInfo.profileContactInfoDto.email}">${profileInfo.profileContactInfoDto.email}</a></p>
			</div>
		</div>
</c:if>		
<c:if test="${profileInfo.profileContactInfoDto.phoneNo ne null}">
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Phone No.</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><a href="tel:${profileInfo.profileContactInfoDto.phoneNo}">${profileInfo.profileContactInfoDto.phoneNo}</a></p>
			</div>
		</div>
</c:if>
<c:if test="${profileInfo.profileContactInfoDto.cellPhoneNo ne null}">
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Cell Phone No.</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><a href="tel:${profileInfo.profileContactInfoDto.cellPhoneNo}">${profileInfo.profileContactInfoDto.cellPhoneNo}</a></p>
			</div>
		</div>
</c:if>
<c:if test="${profileInfo.profileContactInfoDto.facebookUrl ne null}">
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Facebook</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><a href="facebook.com/${profileInfo.profileContactInfoDto.facebookUrl}">${profileInfo.profileContactInfoDto.facebookUrl}</a></p>
			</div>
		</div>
</c:if>
<c:if test="${profileInfo.profileContactInfoDto.twitterUrl ne null}">
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Twitter</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><a href="twitter.com/${profileInfo.profileContactInfoDto.twitterUrl}">${profileInfo.profileContactInfoDto.twitterUrl}</a></p>
			</div>
		</div>
</c:if>
<c:if test="${profileInfo.profileContactInfoDto.instagramUrl ne null}">
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Instagram</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><a href="instagram.com/${profileInfo.profileContactInfoDto.instagramUrl}">${profileInfo.profileContactInfoDto.instagramUrl}</a></p>
			</div>
		</div>
</c:if>
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
						location.href = "/profile/list/1";
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
});
</script>
</html>