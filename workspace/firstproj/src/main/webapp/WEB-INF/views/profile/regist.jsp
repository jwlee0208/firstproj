<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- editor -->
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/common-editor.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/board/article/common.js"></script>
</head>
<body>
<div class="container">
	<h1 id="btn-groups" class="page-header">Registration</h1>
	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form"  enctype="multipart/form-data">	
		<input type="hidden" id="profileType" name="profileType" value="${profileType}"/>
		<input type="hidden" id="categoryId" name="categoryId" value="${catagoryId}"/>
 	<c:choose>
		<c:when test="${profileType eq 1}">
		<h3>Personal Information</h3>
		<hr/>
		<div class="input-group">
			<span class="input-group-addon">Profile Image</span>
			<input type="file" class="form-control" id="profileImg" name="profileImg" placeholder="upload your profile image"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Name</span>
			<input type="text" class="form-control" id="name" name="name" placeholder="write your name"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Position</span>
			<input type="hidden" id="catId1" name="catId1" value="01010100"/>
			<select id="catId2" name="catId2" class="form-control">
				<option value="">::: select your main position :::</option>
				<option value="01010101">Pitcher</option>
				<option value="01010102">Catcher</option>
				<option value="01010103">First Base</option>
				<option value="01010104">Second Base</option>
				<option value="01010105">Third Base</option>
				<option value="01010106">Short Stop</option>
				<option value="01010107">Left Fielder</option>
				<option value="01010108">Center Fielder</option>
				<option value="01010109">Right Fielder</option>
				<option value="01010110">DH</option>
			</select>	
		</div>
		<br/>
		<div class="row">
  			<div class="col-lg-6">
			    <div class="input-group">
			    	<span class="input-group-addon">Height (cm)</span>
			    	<input type="text" class="form-control" id="height" name="profilePlayerDto.height"/>  
			    </div> 
		    </div>
		    <div class="col-lg-6">
		    	<div class="input-group">
		    		<span class="input-group-addon">Weight (kg)</span>
		    		<input type="text" class="form-control" id="weight" name=" profilePlayerDto.weight"/>
		    	</div>
		    </div>
		</div>	
		<br/>
		<div class="input-group">
		    <span class="input-group-addon">Date Of Birth</span>
			<input type="date" class="form-control" id="birthDate" name="profilePlayerDto.birthDate"/>
		</div>	
		<br/>
		<div class="input-group">
		    <span class="input-group-addon">Birth Place</span>
		    <input type="text" class="form-control" id="birthPlace" name="profilePlayerDto.birthPlace"/>
		</div>	
		<br/>	
		<div class="input-group">
		    <span class="input-group-addon">Education</span>
		    <textarea class="form-control" id="education" name="profilePlayerDto.education"></textarea>
		</div>	
		<br/>		
		<div class="input-group">
		    <span class="input-group-addon">Hobbies</span>
		    <input type="text" class="form-control" id="hobbies" name="profilePlayerDto.hobbies"/>
		</div>					
		<br/>
		<div class="input-group">
		    <span class="input-group-addon">Favorite Foods</span>
		    <input type="text" class="form-control" id="favoriteFood" name="profilePlayerDto.favoriteFood"/>
		</div>	
		<br/>						
		<div class="input-group">
		    <span class="input-group-addon">Nationality</span>
		    <input type="text" class="form-control" id="nationality" name="profilePlayerDto.nationality"/>
		</div>	
		<br/>								
		<div class="input-group">
		    <span class="input-group-addon">Language</span>
		    <input type="text" class="form-control" id="language" name="profilePlayerDto.language"/>
		</div>		
		<br/>									
		<div class="input-group">
		    <span class="input-group-addon">Introduce</span>
		    <textarea class="form-control tinymce" id="introduce" name="introduce"></textarea>
		</div>
		
		<h3>Player Information</h3>
		<hr/>		
<c:if test="${!empty profileAttrList}">
	<c:set var="rowCnt" value="${0}"/>
	<c:forEach var="profileAttrInfo" items="${profileAttrList}">
		<div class="row">
			<h4>${profileAttrInfo.profileAttrName}</h4>
			<c:set var="profileAttrElemList" value="${profileAttrInfo.profileAttrElementList}"/>
			<c:if test="${!empty profileAttrElemList}">
				<c:forEach var="profileAttrElemInfo" items="${profileAttrElemList}" varStatus="index">
			<div class="col-lg-2">
				<div class="input-group">
					<input type="hidden" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrId" value="${profileAttrInfo.profileAttrId}"/>
					<input type="hidden" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrName" value="${profileAttrInfo.profileAttrName}"/>
					<span class="input-group-addon"><input type="checkbox" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrElementId" aria-label="Checkbox for following text input" value="${profileAttrElemInfo.profileAttrElementId}"></span>
					<input type="text" class="form-control" aria-label="Text input with checkbox" name="profileAttrElementMapList[${rowCnt}].profileAttrElementMapName" value="${profileAttrElemInfo.profileAttrElementName}">
				</div>			
			</div>
				<c:set var="rowCnt" value="${rowCnt+1}"/>	
				</c:forEach>
			</c:if>
		</div>					
	</c:forEach>			
</c:if>
		<br/>
		<h3>Career</h3>
		<hr/>
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
					<tr>		
						<th class="row"><input type="text" class="form-control" id="careerTitle" name="profileCareerList[0].careerTitle"/></th>
						<td><textarea class="form-control" id="careerTitle" name="profileCareerList[0].careerDescription" row="5" col="20"></textarea></td>
						<td><input type="month" class="form-control" id="careerTitle" name="profileCareerList[0].startDate"/></td>
						<td><input type="month" class="form-control" id="careerTitle" name="profileCareerList[0].endDate"/></td>
						<td>
							<select class="form-control" id="careerTitle" name="profileCareerList[0].careerStatus">
								<option value="-1">::: status :::</option>
								<option value="0">not playing</option>
								<option value="1">playing</option>
							</select>
						</td>
						<td><input type="number" class="form-control" id="careerSeq" name="profileCareerList[0].careerSeq" min="0" max="100"/></td>
					</tr>
				</tbody>
			</table>	
		<h3>Play Streamming</h3>
		<hr/>
		<div class="row">
  			<div class="col-lg-6">
			    <div class="input-group">
			    	<span class="input-group-addon">Title</span>
			    	<input type="text" class="form-control" id="streamTitle_0" name="profileStreamList[0].streamTitle"/>  
			    </div> 
		    </div>
		    <div class="col-lg-6">
		    	<div class="input-group">
		    		<span class="input-group-addon">URL</span>
		    		<input type="text" class="form-control" id="streamUrl_0" name="profileStreamList[0].streamUrl"/>
		    	</div>
		    </div>
		</div>
		<br/>
		
		<h3>Contact Info.</h3>
		<hr/>		
		<div class="input-group">
			<span class="input-group-addon">Email</span>
		    <input type="email" class="form-control" id="email" name="profileContactInfoDto.email" placeholder="write your e-mail"/>			
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Phone No.</span>
		    <input type="tel" class="form-control" id="phoneNo" name="profileContactInfoDto.phoneNo" placeholder="write your phone No."/>			
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">cellPhoneNo</span>
		    <input type="tel" class="form-control" id="cellPhoneNo" name="profileContactInfoDto.cellPhoneNo" placeholder="write your cell phone No."/>		
		</div>
		<br/>
		<div class="input-group">
 			<span class="input-group-addon" id="basic-addon3">http://</span>
		    <input type="url" class="form-control" id="websiteUrl" name="profileContactInfoDto.websiteUrl" placeholder="write your website url" aria-describedby="basic-addon3"/>
		</div>
		<br/>		
		<div class="input-group">
			<span class="input-group-addon">facebook</span>
		    <input type="text" class="form-control" id="facebookUrl" name="profileContactInfoDto.faceebookUrl" placeholder="write your facebook id"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">twitter</span>
		    <input type="text" class="form-control" id="twitterUrl" name="profileContactInfoDto.twitterUrl" placeholder="write your twitter id"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">instagram</span>
		    <input type="text" class="form-control" id="instagramUrl" name="profileContactInfoDto.instagramUrl" placeholder="write your instagram id"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Address</span> 				
			<input type="text" class="form-control" id="address" name="profileContactInfoDto.address" placeholder="write your address"/>		
		</div>
		<br/>
								
		<h3>Statistics</h3>
		<hr/>	
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
					<th>Add</th>
				</tr>
			</thead>
			<tbody>
				<tr id="pitcher_tr_0" class="pitcher_tr">
					<td><input type="text" 			class="form-control" id="pTeamName_0" name="profileStatPitcherList[0].pTeamName"/></td>
					<td><input type="month" 		class="form-control" id="pStatYear_0" name="profileStatPitcherList[0].pStatYear"/></td>
					<td><input type="number" 		class="form-control" id="inn_0" 		name="profileStatPitcherList[0].inn"/></td>
					<td><input type="number" 		class="form-control" id="w_0" 		name="profileStatPitcherList[0].w"/></td>
					<td><input type="number" 		class="form-control" id="l_0" 		name="profileStatPitcherList[0].l"/></td>
					<td><input type="number" 		class="form-control" id="era_0" 		name="profileStatPitcherList[0].era"/></td>
					<td><input type="number" 		class="form-control" id="g_0" 		name="profileStatPitcherList[0].g"/></td>
					<td><input type="number" 		class="form-control" id="gs_0" 		name="profileStatPitcherList[0].gs"/></td>
					<td><input type="number" 		class="form-control" id="sv_0" 		name="profileStatPitcherList[0].sv"/></td>
					<td><input type="number"		class="form-control" id="svo_0" 		name="profileStatPitcherList[0].svo"/></td>
					<td><input type="number" 		class="form-control" id="ip_0" 		name="profileStatPitcherList[0].ip"/></td>
					<td><input type="number" 		class="form-control" id="h_0" 		name="profileStatPitcherList[0].h"/></td>
					<td><input type="number" 		class="form-control" id="r_0" 		name="profileStatPitcherList[0].r"/></td>
					<td><input type="number" 		class="form-control" id="er_0" 		name="profileStatPitcherList[0].er"/></td>
					<td><input type="number" 		class="form-control" id="hr_0" 		name="profileStatPitcherList[0].hr"/></td>
					<td><input type="number" 		class="form-control" id="bb_0" 		name="profileStatPitcherList[0].bb"/></td>
					<td><input type="number" 		class="form-control" id="so_0" 		name="profileStatPitcherList[0].so"/></td>
					<td><input type="number" 		class="form-control" id="avg_0" 		name="profileStatPitcherList[0].avg"/></td>
					<td><input type="number" 		class="form-control" id="whip_0" 		name="profileStatPitcherList[0].whip"/></td>
					<td><input type="number" 		class="form-control" id="k_0" 		name="profileStatPitcherList[0].k"/></td>
					<td><input type="button" 		class="btn btn-default addPitcherBtn" value="+"/></td>
				</tr>
				<tr id="pitcher_tr_1" class="pitcher_tr">
					<td><input type="text" 		class="form-control" id="pTeamName_1" name="profileStatPitcherList[1].pTeamName"/></td>
					<td><input type="month" 		class="form-control" id="pStatYear_1" name="profileStatPitcherList[1].pStatYear"/></td>
					<td><input type="number" 		class="form-control" id="inn_1" 		name="profileStatPitcherList[1].inn"/></td>
					<td><input type="number" 	class="form-control" id="w_1" 		name="profileStatPitcherList[1].w"/></td>
					<td><input type="number" 	class="form-control" id="l_1" 		name="profileStatPitcherList[1].l"/></td>
					<td><input type="number" 		class="form-control" id="era_1" 		name="profileStatPitcherList[1].era"/></td>
					<td><input type="number" 		class="form-control" id="g_1" 		name="profileStatPitcherList[1].g"/></td>
					<td><input type="number" 		class="form-control" id="gs_1" 		name="profileStatPitcherList[1].gs"/></td>
					<td><input type="number" 		class="form-control" id="sv_1" 		name="profileStatPitcherList[1].sv"/></td>
					<td><input type="number"		class="form-control" id="svo_1" 		name="profileStatPitcherList[1].svo"/></td>
					<td><input type="number" 		class="form-control" id="ip_1" 		name="profileStatPitcherList[1].ip"/></td>
					<td><input type="number" 		class="form-control" id="h_1" 		name="profileStatPitcherList[1].h"/></td>
					<td><input type="number" 		class="form-control" id="r_1" 		name="profileStatPitcherList[1].r"/></td>
					<td><input type="number" 		class="form-control" id="er_1" 		name="profileStatPitcherList[1].er"/></td>
					<td><input type="number" 		class="form-control" id="hr_1" 		name="profileStatPitcherList[1].hr"/></td>
					<td><input type="number" 		class="form-control" id="bb_1" 		name="profileStatPitcherList[1].bb"/></td>
					<td><input type="number" 		class="form-control" id="so_1" 		name="profileStatPitcherList[1].so"/></td>
					<td><input type="number" 		class="form-control" id="avg_1" 		name="profileStatPitcherList[1].avg"/></td>
					<td><input type="number" 		class="form-control" id="whip_1" 		name="profileStatPitcherList[1].whip"/></td>
					<td><input type="number" 		class="form-control" id="k_1" 		name="profileStatPitcherList[1].k"/></td>
					<td><input type="button" 		class="btn btn-default addPitcherBtn" value="+"/></td>
				</tr>
			</tbody>
		</table>		

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
					<th>Add</th>
				</tr>
			</thead>
			<tbody>
				<tr id="hitter_tr_0" class="hitter_tr">
					<td><input type="text" 			class="form-control" id="hTeamName" 		name="profileStatHitterList[0].hTeamName"/></td>
					<td><input type="month" 		class="form-control" id="hStatYear" 		name="profileStatHitterList[0].hStatYear"/></td>
					<td><input type="number" 		class="form-control" id="g" 		name="profileStatHitterList[0].g"/></td>
					<td><input type="number" 		class="form-control" id="ab" 		name="profileStatHitterList[0].ab"/></td>
					<td><input type="number" 		class="form-control" id="r" 		name="profileStatHitterList[0].r"/></td>
					<td><input type="number" 		class="form-control" id="h" 		name="profileStatHitterList[0].h"/></td>
					<td><input type="number" 		class="form-control" id="twoB" 		name="profileStatHitterList[0].twoB"/></td>
					<td><input type="number" 		class="form-control" id="threeB" 		name="profileStatHitterList[0].threeB"/></td>
					<td><input type="number" 		class="form-control" id="hr" 		name="profileStatHitterList[0].hr"/></td>
					<td><input type="number" 		class="form-control" id="rbi" 		name="profileStatHitterList[0].rbi"/></td>
					<td><input type="number" 		class="form-control" id="bb" 		name="profileStatHitterList[0].bb"/></td>
					<td><input type="number" 		class="form-control" id="so" 		name="profileStatHitterList[0].so"/></td>
					<td><input type="number" 		class="form-control" id="sb" 		name="profileStatHitterList[0].sb"/></td>
					<td><input type="number" 		class="form-control" id="cs" 		name="profileStatHitterList[0].cs"/></td>
					<td><input type="number" 		class="form-control" id="avg" 		name="profileStatHitterList[0].avg"/></td>
					<td><input type="number" 		class="form-control" id="obp" 		name="profileStatHitterList[0].obp"/></td>
					<td><input type="number" 		class="form-control" id="slg" 		name="profileStatHitterList[0].slg"/></td>
					<td><input type="number" 		class="form-control" id="ops" 		name="profileStatHitterList[0].ops"/></td>
					<td><input type="button" 		class="btn btn-default addHitterBtn" value="+"/></td>
				</tr>
			</tbody>
		</table>	
		
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
					<th>Add</th>
				</tr>
			</thead>
			<tbody>
				<tr id="fielder_tr_0" class="fielder_tr">
					<th class="row"><input type="text" 		class="form-control" id="fTeamName" 		name="profileStatFielderList[0].fTeamName"/></th>								
	    			<td><input type="month" 		class="form-control" id="fStatYear" 		name="profileStatFielderList[0].fStatYear"/></td>
	    			<td><input type="number" 		class="form-control" id="pos" 		name="profileStatFielderList[0].pos"/></td>
	    			<td><input type="number" 		class="form-control" id="g" 		name="profileStatFielderList[0].g"/></td>
	    			<td><input type="number" 		class="form-control" id="gs" 		name="profileStatFielderList[0].gs"/></td>
	    			<td><input type="number" 		class="form-control" id="inn" 		name="profileStatFielderList[0].inn"/></td>
	    			<td><input type="number" 		class="form-control" id="tc" 		name="profileStatFielderList[0].tc"/></td>
	    			<td><input type="number" 		class="form-control" id="po" 		name="profileStatFielderList[0].po"/></td>
	    			<td><input type="number" 		class="form-control" id="a" 		name="profileStatFielderList[0].a"/></td>
	    			<td><input type="number" 		class="form-control" id="e" 		name="profileStatFielderList[0].e"/></td>
	    			<td><input type="number" 		class="form-control" id="dp" 		name="profileStatFielderList[0].dp"/></td>
	    			<td><input type="number" 		class="form-control" id="sb" 		name="profileStatFielderList[0].sb"/></td>
	    			<td><input type="number" 		class="form-control" id="cs" 		name="profileStatFielderList[0].cs"/></td>
	    			<td><input type="number" 		class="form-control" id="sbpct" 		name="profileStatFielderList[0].sbpct"/></td>
	    			<td><input type="number" 		class="form-control" id="pb" 		name="profileStatFielderList[0].pb"/></td>
	    			<td><input type="number" 		class="form-control" id="cWp" 		name="profileStatFielderList[0].cWp"/></td>
	    			<td><input type="number" 		class="form-control" id="fpct" 		name="profileStatFielderList[0].fpct"/></td>
	    			<td><input type="number" 		class="form-control" id="rf" 		name="profileStatFielderList[0].rf"/></td>
	    			<td><input type="button" 		class="btn btn-default addFielderBtn" value="+"/></td>
				</tr>
			</tbody>
		</table>											
		</c:when>
		<c:when test="${profileType eq 2}">
		
		</c:when>
		<c:when test="${profileType eq 3}">
		
			<input type="hidden" id="catId1" name="catId1" value="01010300"/>
			<input type="hidden" id="catId2" name="catId2" value="01010301"/>	
		
		<h3>Team Information</h3>
		<hr/>
		<div class="input-group">
			<span class="input-group-addon">Profile Image</span>
			<input type="file" class="form-control" id="profileImg" name="profileImg" placeholder="upload your profile image"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Name</span>
			<input type="text" class="form-control" id="name" name="name" placeholder="write your name"/>
		</div>
		<br/>
		<div class="input-group">
		    <span class="input-group-addon">Introduce</span>
		    <textarea class="form-control tinymce" id="introduce" name="introduce"></textarea>
		</div>
		<br/>
<c:if test="${!empty profileAttrList}">
	<c:set var="rowCnt" value="${0}"/>
	<c:forEach var="profileAttrInfo" items="${profileAttrList}">
		<div class="row">
			<h4>${profileAttrInfo.profileAttrName}</h4>
			<c:set var="profileAttrElemList" value="${profileAttrInfo.profileAttrElementList}"/>
			<c:if test="${!empty profileAttrElemList}">
				<c:forEach var="profileAttrElemInfo" items="${profileAttrElemList}" varStatus="index">
			<div class="col-lg-2">
				<div class="input-group">
					<input type="hidden" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrId" value="${profileAttrInfo.profileAttrId}"/>
					<input type="hidden" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrName" value="${profileAttrInfo.profileAttrName}"/>
					<span class="input-group-addon"><input type="checkbox" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrElementId" aria-label="Checkbox for following text input" value="${profileAttrElemInfo.profileAttrElementId}"></span>
					<input type="text" class="form-control" aria-label="Text input with checkbox" name="profileAttrElementMapList[${rowCnt}].profileAttrElementMapName" value="${profileAttrElemInfo.profileAttrElementName}">
				</div>			
			</div>
				<c:set var="rowCnt" value="${rowCnt+1}"/>	
				</c:forEach>
			</c:if>
		</div>					
	</c:forEach>			
</c:if>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">League</span>
		    <select class="form-control" id="leagueId" name="profileTeamDto.leagueId">
		    	<c:if test="${!empty leagueInfoList}">
		    		<c:forEach var="leagueInfo" items="${leagueInfoList}">
		    	<option value="${leagueInfo.leagueId}">[${leagueInfo.area}]${leagueInfo.leagueName}</option>	
		    		</c:forEach>
		    	</c:if>
		    	
		    	
		    </select>			
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">City</span>
		    <input type="text"	class="form-control" id="profileTeamDto.city" name="profileTeamDto.city"/>		
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Established Date</span>
		    <input type="date"	class="form-control" id="profileTeamDto.establishedDate" name="profileTeamDto.establishedDate"/>		
		</div>
		<br/>
		<h3>Contact Info.</h3>
		<hr/>		
		<div class="input-group">
			<span class="input-group-addon">Email</span>
		    <input type="email" class="form-control" id="email" name="profileContactInfoDto.email" placeholder="write your e-mail"/>			
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Phone No.</span>
		    <input type="tel" class="form-control" id="phoneNo" name="profileContactInfoDto.phoneNo" placeholder="write your phone No."/>			
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">cellPhoneNo</span>
		    <input type="tel" class="form-control" id="cellPhoneNo" name="profileContactInfoDto.cellPhoneNo" placeholder="write your cell phone No."/>		
		</div>
		<br/>
		<div class="input-group">
 			<span class="input-group-addon" id="basic-addon3">http://</span>
		    <input type="url" class="form-control" id="websiteUrl" name="profileContactInfoDto.websiteUrl" placeholder="write your website url" aria-describedby="basic-addon3"/>
		</div>
		<br/>		
		<div class="input-group">
			<span class="input-group-addon">facebook</span>
		    <input type="text" class="form-control" id="facebookUrl" name="profileContactInfoDto.faceebookUrl" placeholder="write your facebook id"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">twitter</span>
		    <input type="text" class="form-control" id="twitterUrl" name="profileContactInfoDto.twitterUrl" placeholder="write your twitter id"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">instagram</span>
		    <input type="text" class="form-control" id="instagramUrl" name="profileContactInfoDto.instagramUrl" placeholder="write your instagram id"/>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon">Address</span> 				
			<input type="text" class="form-control" id="address" name="profileContactInfoDto.address" placeholder="write your address"/>		
		</div>
		<br/>
		
		</c:when>
	</c:choose>
	</form>
	<div class="btn-group btn-group-justified"">
		<div class="btn-group">
			<input type="button" class="btn btn-default" id="saveBtn" value="save" data-loading-text="Processing..."/>	
		</div>
	</div>
	<br/>
</div>
</body>
<script>

	//ajax error check
	$(document).ajaxError(function(event, request){
	   if(request.status==500)
	      alert("등록에 실패하였습니다. \n업로드할 파일을 확인하세요.(파일 최대용량: 20MB)");
	   	  return;
	   }
	);
	
	//파일전송 후 콜백 함수
	function FileuploadCallback(data, state){
	
	   if (data=="error"){
	      alert("파일전송중 에러 발생!!");
	      return false;
	   } else if (data == "fileSizeError") {
		  alert("파일용량은 20MB 이하 이어야 합니다.");
		  return false;
	   } else if (data == "fileExtensionError") {
		   alert("이미지 파일을 업로드 하셔야 합니다.\n(업로드 가능한 확장자: jpg, jpeg, gif, png, bmp)");
		   return false;
	   } else if (data == "fileWidthHeightError") {
		   alert("업로드 가능한 이미지 사이즈는 314 * 166 입니다.");
		   return false;
	   }
	   alert("정상적으로 등록 되었습니다.");
	   // 정상 등록 후 목록 화면으로 이동.
	   location.href = "/profile/list/"+ $("#profileType").val() +"/" + $("#categoryId").val();	
	}

	$(function(){
		$("#saveBtn").click(function(){
			var introduce = tinyMCE.get('introduce').getContent();
			$("#introduce").val(introduce);

			var profileImg = $.trim($("#profileImg").val());
			
			if(profileImg.length == 0){
				$.ajax({
					url 		: '/profile/registAction',
					data 		: $("#actionFrm").serialize(),
					dataType 	: 'json',
					method 		: 'post',
					success 	: function(data){
						var result = data.result;
						var msg = data.message;
												
						if(result == 'success'){
							location.href = "/player/playerPortal";
						}else{
							alert(msg);
							return;
						}						
					}
				});					
			}else{
				// 썸네일 파일 업로드 할 때 저장
				var frm = $("#actionFrm");
				frm.attr("action", '/profile/registAction');
				frm.attr("method", "post");
				frm.ajaxForm(FileuploadCallback); 
				frm.submit(); 				
				
			}
		});
	});
</script>	
</html>