<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::: LinkedNest.net</title>
<!-- editor -->
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/common-editor.js"></script>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/board/article/common.js"></script>

<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/profile/autocomplete.js"></script>

</head>
<body>
<div class="container">
	<h1 id="btn-groups" class="page-header">Modification&nbsp;&nbsp;<small>Profile</small></h1>
	<form id="actionFrm" name="actionFrm" method="post" class="form-horizontal" role="form"  enctype="multipart/form-data">	
		<input type="hidden" id="profileType" 	name="profileType" 	value="${profileType}"/>
		<input type="hidden" id="categoryId" 	name="categoryId" 	value="${categoryId}"/>
		<input type="hidden" id="profileId" 	name="profileId" 	value="${profileInfo.profileId}"/>
 	<c:choose>
		<c:when test="${profileType eq 1}">
		<h3><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.personalinfo"/></h3>
		<hr/>
		
	<div class="row">
		<div class="col-sm-6">
			<c:if test="${profileInfo.profileImgPath ne '' && profileInfo.profileImgPath ne null}">
			<div class="thumbImg unset">
				<img src="http://jwlee0208.cdn3.cafe24.com/${profileInfo.profileImgPath}" class="img-rounded"/>
				<input type="hidden" id="profileImgPath" 			name="profileImgPath" 		value="${profileInfo.profileImgPath}"/>
				<input type="button" class="btn btn-default" value="삭제" onclick="javascript:delThumbImage('set');">
			</div>
			</c:if>
			<div class="thumbImg set">
				<img class="img-rounded" onerror="this.src='${pageContext.request.contextPath}/img/no_image.png'"/>
				<input type="file" class="form-control" id="profileImg" name="profileImg" placeholder="upload your profile image"/>		
			</div>
		</div>	
		<div class="col-sm-6">
		  	<div class="form-group">
		    	<label for="" class="col-sm-5 control-label"><tag:message code="text.player.name"/></label>
			    <div class="col-sm-7">
			    	<p class="form-control-static"><input type="text" class="form-control" id="name" name="name" placeholder="write your name" value="${profileInfo.name}"/></p>
				</div>
			</div>
			<div class="form-group">
			    <label for="" class="col-sm-5 control-label"><tag:message code="text.height"/></label>
			    <div class="col-sm-7">
			      	<p class="form-control-static">
			      		<input type="number" class="form-control" id="height" name="profilePlayerDto.height" value="${profileInfo.profilePlayerDto.height}"/>
			      	</p>
			    </div>
			</div>
			<div class="form-group">
			    <label for="" class="col-sm-5 control-label"><tag:message code="text.weight"/></label>
			    <div class="col-sm-7">
			      	<p class="form-control-static">
			      		<input type="number" class="form-control" id="weight" name="profilePlayerDto.weight" value="${profileInfo.profilePlayerDto.weight}"/>
			      	</p>
			    </div>
			</div>

			<div class="form-group">
			    <label for="" class="col-sm-5 control-label"><tag:message code="text.dateofbirth"/></label>
			    <div class="col-sm-7">
			      	<p class="form-control-static">
						<input type="date" class="form-control" id="birthDate" name="profilePlayerDto.birthDate" value="${fn:substring(profileInfo.profilePlayerDto.birthDate,0,10)}"/>
					</p>
			    </div>
			</div>
	
			<div class="form-group">
			    <label for="" class="col-sm-5 control-label"><tag:message code="text.birthplace"/></label>
			    <div class="col-sm-7">
			      <p class="form-control-static"><input type="text" class="form-control" id="birthPlace" name="profilePlayerDto.birthPlace" value="${profileInfo.profilePlayerDto.birthPlace}"/></p>
			    </div>
			</div>	
	
			<div class="form-group">
			    <label for="" class="col-sm-5 control-label"><tag:message code="text.education"/></label>
			    <div class="col-sm-7">
			    	<p class="form-control-static"><textarea class="form-control" id="education" name="profilePlayerDto.education">${profileInfo.profilePlayerDto.education}</textarea></p>
				</div>
			</div>	
			<div class="form-groupp">
			    <label for="" class="col-sm-5 control-label"><tag:message code="text.hobbies"/></label>
			    <div class="col-sm-7">
			    	<p class="form-control-static"><input type="text" class="form-control" id="hobbies" name="profilePlayerDto.hobbies" value="${profileInfo.profilePlayerDto.hobbies}"/></p>
				</div>
			</div>					
			<div class="form-group">
			    <label for="" class="col-sm-5 control-label"><tag:message code="text.favoritefood"/></label>
			    <div class="col-sm-7">
				    <p class="form-control-static"><input type="text" class="form-control" id="favoriteFood" name="profilePlayerDto.favoriteFood" value="${profileInfo.profilePlayerDto.favoriteFood}"/></p>	    
			    </div>
			</div>	
			<div class="form-group">
			    <label for="" class="col-sm-5 control-label"><tag:message code="text.nationality"/></label>
				<div class="col-sm-7"> 
				    <p class="form-control-static"><input type="text" class="form-control" id="nationalitySearch" value="<tag:message code='code.country.${profileInfo.profilePlayerDto.nationality}'/>"/></p>
					<input type="hidden" class="form-control" id="nationality" name="profilePlayerDto.nationality"  value="${profileInfo.profilePlayerDto.nationality}"/>
				</div>    
			</div>	
			<div class="form-group">
			    <label for="" class="col-sm-5 control-label"><tag:message code="text.language"/></label>
			    <div class="col-sm-7"> 
				    <p class="form-control-static"><input type="text" class="form-control" id="languageSearch" value="<tag:message code='code.language.${profileInfo.profilePlayerDto.language}'/>"/></p>
				    <input type="hidden" class="form-control" id="language" name="profilePlayerDto.language" value="${profileInfo.profilePlayerDto.language}"/>
				</div>
			</div>		
		</div>	
	</div>	
		
<!-- 		<div class="input-group"> -->
<!-- 			<span class="input-group-addon">Profile Image</span> -->
<!-- 			<input type="file" class="form-control" id="profileImg" name="profileImg" placeholder="upload your profile image"/> -->
<!-- 		</div> -->
<!-- 		<br/> -->
		
		<div class="input-group">
			<span class="input-group-addon">Main Position</span>
			<input type="hidden" id="catId1" name="catId1" value="${profileInfo.catId1}"/>
			<select id="catId2" name="catId2" class="form-control">
				<option value="">::: select your main position :::</option>
				<option <c:if test="${profileInfo.catId2 eq '01010101'}">selected</c:if> value="01010101">Pitcher</option>
				<option <c:if test="${profileInfo.catId2 eq '01010102'}">selected</c:if> value="01010102">Catcher</option>
				<option <c:if test="${profileInfo.catId2 eq '01010103'}">selected</c:if> value="01010103">First Base</option>
				<option <c:if test="${profileInfo.catId2 eq '01010104'}">selected</c:if> value="01010104">Second Base</option>
				<option <c:if test="${profileInfo.catId2 eq '01010105'}">selected</c:if> value="01010105">Third Base</option>
				<option <c:if test="${profileInfo.catId2 eq '01010106'}">selected</c:if> value="01010106">Short Stop</option>
				<option <c:if test="${profileInfo.catId2 eq '01010107'}">selected</c:if> value="01010107">Left Fielder</option>
				<option <c:if test="${profileInfo.catId2 eq '01010108'}">selected</c:if> value="01010108">Center Fielder</option>
				<option <c:if test="${profileInfo.catId2 eq '01010109'}">selected</c:if> value="01010109">Right Fielder</option>
				<option <c:if test="${profileInfo.catId2 eq '01010110'}">selected</c:if> value="01010110">DH</option>
			</select>	
		</div>
		<br/>
								
		<h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.playerattr"/></h3>
		<hr/>
		<c:set var="attrElemList" value="${attrElementList}"/>

<c:if test="${!empty attrElemList}">
	<div style="padding:0 15px 0 15px;">
	<c:set var="rowCnt" value="${0}"/>
	<c:set var="profileAttrList" value="${profileInfo.profileAttrList}"/>
	
	<c:forEach var="attrElemInfo" items="${attrElemList}">
		<div class="row">
			<h4><tag:message code="text.${attrElemInfo.profileAttrName}"/></h4>
			<c:set var="profileAttrElemList" value="${attrElemInfo.profileAttrElementList}"/>
			<c:if test="${!empty profileAttrElemList}">
				<c:forEach var="profileAttrElemInfo" items="${profileAttrElemList}" varStatus="index">
				<c:set var="checked" value=""/>
			<div class="col-lg-2">
				<div class="input-group">
					<input type="hidden" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrId" value="${attrElemInfo.profileAttrId}"/>
					<input type="hidden" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrName" value="${attrElemInfo.profileAttrName}"/>
					<input type="hidden" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrElementName" value="${profileAttrElemInfo.profileAttrElementName}"/>
					<c:if test="${!empty profileAttrList}">
						<c:forEach var="profileAttrInfo" items="${profileAttrList}">
							<c:set var="profileAttrElemList" value="${profileAttrInfo.profileAttrElementMapList}"/>
							<c:if test="${!empty profileAttrElemList}">
								<c:forEach var="profileAttrElemMapInfo" items="${profileAttrElemList}" varStatus="index">
									<c:if test="${profileAttrElemMapInfo.profileAttrElementId eq profileAttrElemInfo.profileAttrElementId}">
									<c:set var="checked" value="checked"/>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</c:if>
					<span class="input-group-addon"><input type="checkbox" id="" name="profileAttrElementMapList[${rowCnt}].profileAttrElementId" aria-label="Checkbox for following text input" ${checked} value="${profileAttrElemInfo.profileAttrElementId}"></span>
					<input type="text" class="form-control" aria-label="Text input with checkbox" name="profileAttrElementMapList[${rowCnt}].profileAttrElementMapName" value="<tag:message code="attr.${attrElemInfo.profileAttrName}.${profileAttrElemInfo.profileAttrElementName}"/>">
					<input type="hidden" name="profileAttrElementMapList[${rowCnt}].profileId" value="${profileInfo.profileId}"/>
				</div>			
			</div>
				<c:set var="rowCnt" value="${rowCnt+1}"/>	
				</c:forEach>
			</c:if>
		</div>					
	</c:forEach>
	</div>			
</c:if>

		<h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.career"/>&nbsp;&nbsp;<input type="button" class="btn btn-default addCareerBtn" value="+"/></h3>
		<hr/>
		<c:set var="profileCareerList" value="${profileInfo.profileCareerList}"/>
		<c:if test="${!empty profileCareerList}">
		
			<table class="table tableCareer">
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
			<c:forEach var="profileCareerInfo" items="${profileCareerList}" varStatus="index">
					<tr id="career_tr_${index.count-1}" class="career_tr">
			    		<th class="row"><p class="form-control-static">
			    			<input type="text" class="form-control" id="careerTitle" name="profileCareerList[0].careerTitle" value="${profileCareerInfo.careerTitle}"/></p>
			    			<input type="hidden" class="form-control" name="profileCareerList[0].profileId" value="${profileInfo.profileId}"/>
			    			<input type="hidden" class="form-control" name="profileCareerList[0].careerId" value="${profileCareerInfo.careerId}"/>
			    		</th>
		    			<td><p class="form-control-static"><textarea class="form-control" id="careerTitle" name="profileCareerList[0].careerDescription" row="5" col="20">${profileCareerInfo.careerDescription}</textarea></p></td>
		    			<td><p class="form-control-static"><input type="month" class="form-control" id="careerStartDate" name="profileCareerList[0].startDate" value="${profileCareerInfo.startDate}"/></p></td>
		    			<td><p class="form-control-static"><input type="month" class="form-control" id="careerEndDate" name="profileCareerList[0].endDate" value="${profileCareerInfo.endDate}"/></p></td>
		    			<td><p class="form-control-static">
							<select class="form-control" id="careerTitle" name="profileCareerList[0].careerStatus">
								<option <c:if test="${profileCareerInfo.careerStatus eq -1}">selected</c:if> value="-1">::: status :::</option>
								<option <c:if test="${profileCareerInfo.careerStatus eq 0}">selected</c:if>value="0">not playing</option>
								<option <c:if test="${profileCareerInfo.careerStatus eq 1}">selected</c:if>value="1">playing</option>
							</select>
		    			</p></td>
		    			<td><p class="form-control-static"><input type="number" class="form-control" id="careerSeq" name="profileCareerList[0].careerSeq" min="0" max="100" value="${profileCareerInfo.careerSeq}"/></p></td>
					</tr>
			</c:forEach>		
				</tbody>
			</table>									
		</c:if>
		<c:set var="profileStreamList" value="${profileInfo.profileStreamList}"/>
		<c:if test="${!empty profileStreamList}">
		<h3><span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.playstream"/>&nbsp;&nbsp;<input type="button" class="btn btn-default addStreamBtn" value="+"/></h3>
		<hr/>
		<c:forEach var="profileStreamInfo" items="${profileStreamList}" varStatus="index">
		<div class="row stream_div" style="padding-bottom:5px;">
  			<div class="col-lg-6">
			    <div class="input-group">
			    	<span class="input-group-addon">Title</span>
			    	<input type="text" class="form-control" id="streamTitle_${index.count-1}" name="profileStreamList[${index.count-1}].streamTitle" value="${profileStreamInfo.streamTitle}"/>  
			    	<input type="hidden" class="form-control" name="profileStreamList[${index.count-1}].profileId" value="${profileInfo.profileId}"/>
			    	<input type="hidden" class="form-control" name="profileStreamList[${index.count-1}].streamId" value="${profileStreamInfo.streamId}"/>
			    </div> 
		    </div>
		    <div class="col-lg-6">
		    	<div class="input-group">
		    		<span class="input-group-addon">URL</span>
		    		<input type="text" class="form-control" id="streamUrl_${index.count-1}" name="profileStreamList[${index.count-1}].streamUrl" value='<c:out value="${profileStreamInfo.streamUrl}" escapeXml="false"/>'/>
		    	</div>
		    </div>
		</div>


		</c:forEach>
		</c:if>

		<c:set var="profileStatPitcherList" value="${profileInfo.profileStatPitcherList}"/>
		<c:set var="profileStatHitterList" value="${profileInfo.profileStatHitterList}"/>
		<c:set var="profileStatFielderList" value="${profileInfo.profileStatFielderList}"/>

	<c:if test="${!empty profileStatPitcherList && !empty profileStatHitterList && !empty profileStatFielderList}">			
		<h3><span class="glyphicon glyphicon-align-justify" aria-hidden="true"></span>&nbsp;<tag:message code="text.stats"/></h3>
		<hr/>	
				
		<c:if test="${!empty profileStatPitcherList}">
		<h3><small><tag:message code="text.pitching.stat"/></small>&nbsp;&nbsp;<input type="button" class="btn btn-default addPitcherBtn" value="+"/></h3>
				
		<table class="table tablePitcherStat">
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
					<th>DEL</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="profileStatPitcherInfo" items="${profileStatPitcherList}" varStatus="index">
				<tr id="pitcher_tr_${index.count-1}" class="pitcher_tr">
					<td>
						<input type="text" 			class="form-control" id="pTeamName_${index.count-1}" name="profileStatPitcherList[${index.count-1}].pTeamName" value="${profileStatPitcherInfo.pTeamName}"/>
						<input type="hidden" class="form-control" name="profileStatPitcherList[${index.count-1}].profileId" value="${profileInfo.profileId}"/>
						<input type="hidden" class="form-control" name="profileStatPitcherList[${index.count-1}].statPitcherId" value="${profileStatPitcherInfo.statPitcherId}"/>
					</td>
					<td><input type="month" 		class="form-control" id="pStatYear_${index.count-1}" name="profileStatPitcherList[${index.count-1}].pStatYear" value="${profileStatPitcherInfo.pStatYear}"/></td>
					<td><input type="number" 		class="form-control" id="inn_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].inn" value="${profileStatPitcherInfo.inn}"/></td>
					<td><input type="number" 		class="form-control" id="w_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].w" value="${profileStatPitcherInfo.w}"/></td>
					<td><input type="number" 		class="form-control" id="l_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].l" value="${profileStatPitcherInfo.l}"/></td>
					<td><input type="number" 		class="form-control" id="era_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].era" value="${profileStatPitcherInfo.era}"/></td>
					<td><input type="number" 		class="form-control" id="g_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].g" value="${profileStatPitcherInfo.g}"/></td>
					<td><input type="number" 		class="form-control" id="gs_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].gs" value="${profileStatPitcherInfo.gs}"/></td>
					<td><input type="number" 		class="form-control" id="sv_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].sv" value="${profileStatPitcherInfo.sv}"/></td>
					<td><input type="number"		class="form-control" id="svo_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].svo" value="${profileStatPitcherInfo.svo}"/></td>
					<td><input type="number" 		class="form-control" id="ip_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].ip" value="${profileStatPitcherInfo.ip}"/></td>
					<td><input type="number" 		class="form-control" id="h_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].h" value="${profileStatPitcherInfo.h}"/></td>
					<td><input type="number" 		class="form-control" id="r_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].r" value="${profileStatPitcherInfo.r}"/></td>
					<td><input type="number" 		class="form-control" id="er_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].er" value="${profileStatPitcherInfo.er}"/></td>
					<td><input type="number" 		class="form-control" id="hr_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].hr" value="${profileStatPitcherInfo.hr}"/></td>
					<td><input type="number" 		class="form-control" id="bb_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].bb" value="${profileStatPitcherInfo.bb}"/></td>
					<td><input type="number" 		class="form-control" id="so_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].so" value="${profileStatPitcherInfo.so}"/></td>
					<td><input type="number" 		class="form-control" id="avg_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].avg" value="${profileStatPitcherInfo.avg}"/></td>
					<td><input type="number" 		class="form-control" id="whip_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].whip" value="${profileStatPitcherInfo.whip}"/></td>
					<td><input type="number" 		class="form-control" id="k_${index.count-1}" 		name="profileStatPitcherList[${index.count-1}].k" value="${profileStatPitcherInfo.k}"/></td>
					<td><input type="button" 		class="btn btn-default removePitcherBtn" value="-"/></td>
				</tr>					
			</c:forEach>
			</tbody>
		</table>
				
		</c:if>
		<c:if test="${!empty profileStatHitterList}">
		<h3><small><tag:message code="text.hitting.stat"/></small>&nbsp;&nbsp;<input type="button" class="btn btn-default addHitterBtn" value="+"/></h3>		
		<table class="table tableHitterStat">
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
					<th>DEL</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="profileStatHitterInfo" items="${profileStatHitterList}" varStatus="index">
				<tr id="hitter_tr_${index.count-1}" class="hitter_tr">
					<td>
						<input type="text" 			class="form-control" id="hTeamName" 		name="profileStatHitterList[${index.count-1}].hTeamName" value="${profileStatHitterInfo.hTeamName}"/>
						<input type="hidden" class="form-control" name="profileStatHitterList[${index.count-1}].profileId" value="${profileInfo.profileId}"/>
						<input type="hidden" class="form-control" name="profileStatFielderList[${index.count-1}].statHitterId" value="${profileStatHitterInfo.statHitterId}"/>
					</td>
					<td><input type="month" 		class="form-control" id="hStatYear" 		name="profileStatHitterList[${index.count-1}].hStatYear" value="${profileStatHitterInfo.hStatYear}"/></td>
					<td><input type="number" 		class="form-control" id="g" 		name="profileStatHitterList[${index.count-1}].g" value="${profileStatHitterInfo.g}"/></td>
					<td><input type="number" 		class="form-control" id="ab" 		name="profileStatHitterList[${index.count-1}].ab" value="${profileStatHitterInfo.ab}"/></td>
					<td><input type="number" 		class="form-control" id="r" 		name="profileStatHitterList[${index.count-1}].r" value="${profileStatHitterInfo.r}"/></td>
					<td><input type="number" 		class="form-control" id="h" 		name="profileStatHitterList[${index.count-1}].h" value="${profileStatHitterInfo.h}"/></td>
					<td><input type="number" 		class="form-control" id="twoB" 		name="profileStatHitterList[${index.count-1}].twoB" value="${profileStatHitterInfo.twoB}"/></td>
					<td><input type="number" 		class="form-control" id="threeB" 		name="profileStatHitterList[${index.count-1}].threeB" value="${profileStatHitterInfo.threeB}"/></td>
					<td><input type="number" 		class="form-control" id="hr" 		name="profileStatHitterList[${index.count-1}].hr" value="${profileStatHitterInfo.hr}"/></td>
					<td><input type="number" 		class="form-control" id="rbi" 		name="profileStatHitterList[${index.count-1}].rbi" value="${profileStatHitterInfo.rbi}"/></td>
					<td><input type="number" 		class="form-control" id="bb" 		name="profileStatHitterList[${index.count-1}].bb" value="${profileStatHitterInfo.bb}"/></td>
					<td><input type="number" 		class="form-control" id="so" 		name="profileStatHitterList[${index.count-1}].so" value="${profileStatHitterInfo.so}"/></td>
					<td><input type="number" 		class="form-control" id="sb" 		name="profileStatHitterList[${index.count-1}].sb" value="${profileStatHitterInfo.sb}"/></td>
					<td><input type="number" 		class="form-control" id="cs" 		name="profileStatHitterList[${index.count-1}].cs" value="${profileStatHitterInfo.cs}"/></td>
					<td><input type="number" 		class="form-control" id="avg" 		name="profileStatHitterList[${index.count-1}].avg" value="${profileStatHitterInfo.avg}"/></td>
					<td><input type="number" 		class="form-control" id="obp" 		name="profileStatHitterList[${index.count-1}].obp" value="${profileStatHitterInfo.obp}"/></td>
					<td><input type="number" 		class="form-control" id="slg" 		name="profileStatHitterList[${index.count-1}].slg" value="${profileStatHitterInfo.slg}"/></td>
					<td><input type="number" 		class="form-control" id="ops" 		name="profileStatHitterList[${index.count-1}].ops" value="${profileStatHitterInfo.ops}"/></td>
					<td><input type="button" 		class="btn btn-default removeHitterBtn" value="-"/></td>
				</tr>	
			</c:forEach>
			</tbody>
		</table>	
		</c:if>
		<c:if test="${!empty profileStatFielderList}">
		<h3><small><tag:message code="text.fielding.stat"/></small>&nbsp;&nbsp;<input type="button" class="btn btn-default addFielderBtn" value="+"/></h3>
		<table class="table tableFielderStat">
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
					<th>DEL</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="profileStatFielderInfo" items="${profileStatFielderList}" varStatus="index">
				<tr id="fielder_tr_${index.count-1}" class="fielder_tr">
					<th class="row">
						<input type="text" 		class="form-control" id="fTeamName" 		name="profileStatFielderList[${index.count-1}].fTeamName" value="${profileStatFielderInfo.fTeamName}"/>
						<input type="hidden" class="form-control" name="profileStatFielderList[${index.count-1}].profileId" value="${profileInfo.profileId}"/>
						<input type="hidden" class="form-control" name="profileStatFielderList[${index.count-1}].statFielderId" value="${profileStatFielderInfo.statFielderId}"/>
					</th>								
	    			<td><input type="month" 		class="form-control" id="fStatYear" 		name="profileStatFielderList[${index.count-1}].fStatYear" value="${profileStatFielderInfo.fStatYear}"/></td>
	    			<td><input type="number" 		class="form-control" id="pos" 		name="profileStatFielderList[${index.count-1}].pos" value="${profileStatFielderInfo.pos}"/></td>
	    			<td><input type="number" 		class="form-control" id="g" 		name="profileStatFielderList[${index.count-1}].g" value="${profileStatFielderInfo.g}"/></td>
	    			<td><input type="number" 		class="form-control" id="gs" 		name="profileStatFielderList[${index.count-1}].gs" value="${profileStatFielderInfo.gs}"/></td>
	    			<td><input type="number" 		class="form-control" id="inn" 		name="profileStatFielderList[${index.count-1}].inn" value="${profileStatFielderInfo.inn}"/></td>
	    			<td><input type="number" 		class="form-control" id="tc" 		name="profileStatFielderList[${index.count-1}].tc" value="${profileStatFielderInfo.tc}"/></td>
	    			<td><input type="number" 		class="form-control" id="po" 		name="profileStatFielderList[${index.count-1}].po" value="${profileStatFielderInfo.po}"/></td>
	    			<td><input type="number" 		class="form-control" id="a" 		name="profileStatFielderList[${index.count-1}].a" value="${profileStatFielderInfo.a}"/></td>
	    			<td><input type="number" 		class="form-control" id="e" 		name="profileStatFielderList[${index.count-1}].e" value="${profileStatFielderInfo.e}"/></td>
	    			<td><input type="number" 		class="form-control" id="dp" 		name="profileStatFielderList[${index.count-1}].dp" value="${profileStatFielderInfo.dp}"/></td>
	    			<td><input type="number" 		class="form-control" id="sb" 		name="profileStatFielderList[${index.count-1}].sb" value="${profileStatFielderInfo.sb}"/></td>
	    			<td><input type="number" 		class="form-control" id="cs" 		name="profileStatFielderList[${index.count-1}].cs" value="${profileStatFielderInfo.cs}"/></td>
	    			<td><input type="number" 		class="form-control" id="sbpct" 		name="profileStatFielderList[${index.count-1}].sbpct" value="${profileStatFielderInfo.sbpct}"/></td>
	    			<td><input type="number" 		class="form-control" id="pb" 		name="profileStatFielderList[${index.count-1}].pb" value="${profileStatFielderInfo.pb}"/></td>
	    			<td><input type="number" 		class="form-control" id="cWp" 		name="profileStatFielderList[${index.count-1}].cWp" value="${profileStatFielderInfo.cWp}"/></td>
	    			<td><input type="number" 		class="form-control" id="fpct" 		name="profileStatFielderList[${index.count-1}].fpct" value="${profileStatFielderInfo.fpct}"/></td>
	    			<td><input type="number" 		class="form-control" id="rf" 		name="profileStatFielderList[${index.count-1}].rf" value="${profileStatFielderInfo.rf}"/></td>
	    			<td><input type="button" 		class="btn btn-default removeFielderBtn" value="-"/></td>
				</tr>
			</c:forEach>						
			</tbody>					
		</table>
		</c:if>	
	</c:if>										  
	</c:when>
	<c:when test="${profileInfo.profileType eq 2}">
	
	</c:when>
	<c:when test="${profileInfo.profileType eq 3}">
		<h3>Team Information</h3>
		<hr/>
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.team.name"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.name}</p>
			</div>
		</div>
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.team.franchise"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.profileTeamDto.city}</p>
			</div>
		</div>	
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.team.eastablish.date"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.profileTeamDto.establishedDate}</p>
			</div>
		</div>
		<h3>League Information</h3>
		<hr/>
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.continent"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><tag:message code="code.area.${profileInfo.leagueInfoDto.area}"/></p>
			</div>
		</div>		
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.countries"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><tag:message code="code.country.${profileInfo.leagueInfoDto.country}"/></p>
			</div>
		</div>				
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.league.name"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.leagueInfoDto.leagueName}</p>
			</div>
		</div>
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.league.level"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><tag:message code="code.leaguetype.${profileInfo.leagueInfoDto.leagueType}"/></p>
			</div>
		</div>
	  	<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.league.division"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static">${profileInfo.leagueInfoDto.leagueDivision}</p>
			</div>
		</div>		
					
	</c:when>
</c:choose>		
		
		<h3><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.introduce"/></h3>
		<hr/>	
		<div class="form-group">
			<div class="col-sm-12">
			<p class="form-control-static"><textarea class="form-control tinymce" id="introduce" name="introduce"><c:out value="${profileInfo.introduce}" escapeXml="false"/></textarea></p>
			</div>
		</div>
		
		<h3><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>&nbsp;&nbsp;<tag:message code="text.contact"/></h3>
		<hr/>	
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.email"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><input type="email" class="form-control" id="email" name="profileContactInfoDto.email" placeholder="write your e-mail" value="${profileInfo.profileContactInfoDto.email}"/></p>
			</div>
		</div>
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Phone No.</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><input type="tel" class="form-control" id="phoneNo" name="profileContactInfoDto.phoneNo" placeholder="write your phone No." value="${profileInfo.profileContactInfoDto.phoneNo}"/></p>
			</div>
		</div>
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label">Cell Phone No.</label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><input type="tel" class="form-control" id="cellPhoneNo" name="profileContactInfoDto.cellPhoneNo" placeholder="write your cell phone No." value="${profileInfo.profileContactInfoDto.cellPhoneNo}"/></p>
			</div>
		</div>
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.website"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><input type="url" class="form-control" id="websiteUrl" name="profileContactInfoDto.websiteUrl" placeholder="write your website url" aria-describedby="basic-addon3" value="${profileInfo.profileContactInfoDto.websiteUrl}"/></p>
			</div>
		</div>

		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.facebook.id"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><input type="text" class="form-control" id="facebookUrl" name="profileContactInfoDto.faceebookUrl" placeholder="write your facebook id" value="${profileInfo.profileContactInfoDto.facebookUrl}"/></p>
			</div>
		</div>
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.twitter.id"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><input type="text" class="form-control" id="twitterUrl" name="profileContactInfoDto.twitterUrl" placeholder="write your twitter id" value="${profileInfo.profileContactInfoDto.twitterUrl}"/></p>
			</div>
		</div>
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.instagram.id"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><input type="text" class="form-control" id="instagramUrl" name="profileContactInfoDto.instagramUrl" placeholder="write your instagram id" value="${profileInfo.profileContactInfoDto.instagramUrl}"/></p>
			</div>
		</div>
		<div class="form-group">
	    	<label for="" class="col-sm-2 control-label"><tag:message code="text.address"/></label>
		    <div class="col-sm-10">
		    	<p class="form-control-static"><input type="text" class="form-control" id="address" name="profileContactInfoDto.address" placeholder="write your address" value="${profileInfo.profileContactInfoDto.address}"/></p>
			</div>
		</div>
	</form>
	<div class="btn-group btn-group-justified">
		<div class="btn-group">
			<input type="button" class="btn btn-default" id="saveBtn" value="save" data-loading-text="Processing..."/>	
		</div>
	</div>
	<br/>
</div>
</body>
<script>
	$(document).on("ready", function(){		
		var className = ($(".thumbImg").hasClass("unset")) ? "unset" : "set";
		
		toggleThumbImage(className);
	});

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
	   location.href = "/profile/list/"+ $("#profileType").val() +"/" + $("#catId1").val();	
	}

	$(function(){
		$("#saveBtn").click(function(){
			
			var introduce = tinyMCE.get('introduce').getContent();
			$("#introduce").val(introduce);

			var profileImg = $.trim($("#profileImg").val());
			
			if(profileImg.length == 0){
				$.ajax({
					url 		: '/profile/modifyAction',
					data 		: $("#actionFrm").serialize(),
					dataType 	: 'json',
					method 		: 'post',
					success 	: function(data){
						var result = data.result;
						var msg = data.message;
												
						if(result == 'success'){
							location.href = "/profile/list/" + $("#profileType").val() + "/" +  + $("#catId1").val();
						}else{
							alert(msg);
							return;
						}						
					}
				});					
			}else{
				// 썸네일 파일 업로드 할 때 저장
				var frm = $("#actionFrm");
				frm.attr("action", '/profile/modifyAction');
				frm.attr("method", "post");
				frm.ajaxForm(FileuploadCallback); 
				frm.submit(); 				
				
			}
		});
		
		// pitcher stat row removing
		$("body").on("click", ".removePitcherBtn", function(){
			$(this).parent().parent().get(0).remove();
		});
		// hitter stat row removing
		$("body").on("click", ".removeHitterBtn", function(){
			$(this).parent().parent().get(0).remove();
		});
		// fielder stat row removing
		$("body").on("click", ".removeFielderBtn", function(){
			$(this).parent().parent().get(0).remove();
		});

		// career row adding
		$(".addStreamBtn").click(function(){
			var rowCount = $(".stream_div").size();
			if(rowCount >= 10){
				alert('you can add your stats until 10 rows.');
				return false;
			}else{
				
				var addStreamHtml = "<div class=\"row stream_div\" style=\"padding-bottom:5px;\">";
				addStreamHtml += "<div class=\"col-lg-6\">";
				addStreamHtml += "<div class=\"input-group\">";
				addStreamHtml += "	<span class=\"input-group-addon\">Title</span>";
				addStreamHtml += "	<input type=\"hidden\" class=\"form-control\" name=\"profileStreamList["+ rowCount +"].profileId\" value=\""+$("#profileId").val()+"\"/>";
				addStreamHtml += "	<input type=\"text\" class=\"form-control\" id=\"streamTitle_"+ rowCount +"\" name=\"profileStreamList["+ rowCount +"].streamTitle\"/>";  
				addStreamHtml += "	</div>"; 
				addStreamHtml += "	</div>";
				addStreamHtml += "	<div class=\"col-lg-6\">";
				addStreamHtml += "	<div class=\"input-group\">";
				addStreamHtml += "		<span class=\"input-group-addon\">URL</span>";
				addStreamHtml += "		<input type=\"text\" class=\"form-control\" id=\"streamUrl_" + rowCount + "\" name=\"profileStreamList[" + rowCount + "].streamUrl\"/>";
				addStreamHtml += "	</div>";
				addStreamHtml += "	</div>";
				addStreamHtml += "	</div>";
			
				$(".stream_div:last").after(addStreamHtml);				
			}
			
		});			

		// career row adding
		$(".addCareerBtn").click(function(){
			var rowCount = $(".career_tr").size();
			if(rowCount >= 10){
				alert('you can add your stats until 10 rows.');
				return false;
			}else{
				
				var addCareerHtml = "<tr id=\"career_tr_"+ rowCount +"\" class=\"career_tr\">";		
				addCareerHtml += "<th class=\"row\">";
				addCareerHtml += "	<input type=\"text\" class=\"form-control\" id=\"careerTitle\" name=\"profileCareerList[" + rowCount + "].careerTitle\"/>";
				addCareerHtml += "	<input type=\"hidden\" class=\"form-control\" name=\"profileCareerList["+ rowCount +"].profileId\" value=\""+$("#profileId").val()+"\"/>";
				addCareerHtml += "</th>";
				addCareerHtml += "<td><textarea class=\"form-control\" id=\"careerTitle\" name=\"profileCareerList[" + rowCount + "].careerDescription\" row=\"5\" col=\"20\"></textarea></td>";
				addCareerHtml += "<td><input type=\"month\" class=\"form-control\" id=\"careerStartDate\" name=\"profileCareerList[" + rowCount + "].startDate\"/></td>";
				addCareerHtml += "<td><input type=\"month\" class=\"form-control\" id=\"careerEndDate\" name=\"profileCareerList[" + rowCount + "].endDate\"/></td>";
				addCareerHtml += "<td>";
				addCareerHtml += "	<select class=\"form-control\" id=\"careerTitle\" name=\"profileCareerList[" + rowCount + "].careerStatus\">";
				addCareerHtml += "		<option value=\"-1\">::: status :::</option>";
				addCareerHtml += "		<option value=\"0\">not playing</option>";
				addCareerHtml += "		<option value=\"1\">playing</option>";
				addCareerHtml += "	</select>";
				addCareerHtml += "</td>";
				addCareerHtml += "<td><input type=\"number\" class=\"form-control\" id=\"careerSeq\" name=\"profileCareerList[0].careerSeq\" min=\"0\" max=\"100\"/></td>";
				addCareerHtml += "</tr>";				
			
				$(".tableCareer > tbody:last").append(addCareerHtml);				
			}
			
		});	

		// pitcher stat row adding
		$(".addPitcherBtn").click(function(){
			var rowCount = $(".pitcher_tr").size();
			if(rowCount >= 10){
				alert('you can add your stats until 10 rows.');
				return false;
			}else{
				var addPitcherHtml = "<tr id=\"pitcher_tr_"+ rowCount +"\" class=\"pitcher_tr\">";
					addPitcherHtml += "<td>";
					addPitcherHtml += "	<input type=\"text\" 		class=\"form-control\" id=\"pTeamName_"+ rowCount +"\" name=\"profileStatPitcherList[" + rowCount + "].pTeamName\"/>"
					addPitcherHtml += "	<input type=\"hidden\" class=\"form-control\" name=\"profileStatPitcherList["+ rowCount +"].profileId\" value=\""+$("#profileId").val()+"\"/>";
					addPitcherHtml += "</td>";
					addPitcherHtml += "<td><input type=\"month\" 		class=\"form-control\" id=\"pStatYear_"+ rowCount +"\" name=\"profileStatPitcherList[" + rowCount + "].pStatYear\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"inn_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].inn\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"w_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].w\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"l_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].l\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"era_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].era\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"g_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].g\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"gs_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].gs\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"sv_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].sv\"/></td>";
					addPitcherHtml += "<td><input type=\"number\"		class=\"form-control\" id=\"svo_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].svo\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"ip_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].ip\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"h_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].h\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"r_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].r\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"er_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].er\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"hr_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].hr\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"bb_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].bb\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"so_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].so\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"avg_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].avg\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"whip_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].whip\"/></td>";
					addPitcherHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"k_"+ rowCount +"\" 		name=\"profileStatPitcherList[" + rowCount + "].k\"/></td>";
					addPitcherHtml += "<td><input type=\"button\" 		class=\"btn btn-default removePitcherBtn\" value=\"-\"/></td>";
				addPitcherHtml += "</tr>";
			
				$(".tablePitcherStat > tbody:last").append(addPitcherHtml);				
			}
			
		});	
		// hitter stat row adding
		$(".addHitterBtn").click(function(){
			var rowCount = $(".hitter_tr").size();
			if(rowCount >= 10){
				alert('you can add your stats until 10 rows.');
				return false;
			}else{
				var addHitterHtml = "<tr id=\"hitter_tr_"+ rowCount +"\" class=\"hitter_tr\">";
				addHitterHtml += "<td>";
				addHitterHtml += "	<input type=\"hidden\" class=\"form-control\" name=\"profileStatHitterList["+ rowCount +"].profileId\" value=\""+$("#profileId").val()+"\"/>";
				addHitterHtml += "	<input type=\"text\" 			class=\"form-control\" id=\"hTeamName_"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].hTeamName\"/>";
				addHitterHtml += "</td>";
				addHitterHtml += "<td><input type=\"month\" 		class=\"form-control\" id=\"hStatYear_"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].hStatYear\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"g"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].g\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"ab"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].ab\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"r"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].r\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"h"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].h\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"twoB"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].twoB\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"threeB"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].threeB\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"hr"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].hr\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"rbi"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].rbi\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"bb"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].bb\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"so"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].so\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"sb"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].sb\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"cs"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].cs\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"avg"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].avg\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"obp"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].obp\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"slg"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].slg\"/></td>";
				addHitterHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"ops"+ rowCount +"\" 		name=\"profileStatHitterList[" + rowCount + "].ops\"/></td>";
				addHitterHtml += "<td><input type=\"button\" 		class=\"btn btn-default removeHitterBtn\" value=\"-\"/></td>";
				addHitterHtml += "</tr>";
				$(".tableHitterStat > tbody:last").append(addHitterHtml);	
			}	
		});
		// fielder stat row adding
		$(".addFielderBtn").click(function(){
			var rowCount = $(".fielder_tr").size();
			if(rowCount >= 10){
				alert('you can add your stats until 10 rows.');
				return false;
			}else{
				var addFielderHtml = "<tr id=\"fielder_tr_"+ rowCount +"\" class=\"fielder_tr\">";
				addFielderHtml += "<th class=\"row\">";
				addFielderHtml += "	<input type=\"text\" 		class=\"form-control\" id=\"fTeamName\" 		name=\"profileStatFielderList[" + rowCount + "].fTeamName\"/>";
				addFielderHtml += "	<input type=\"hidden\" class=\"form-control\" name=\"profileStatFielderList["+ rowCount +"].profileId\" value=\""+$("#profileId").val()+"\"/>";
				addFielderHtml += "</th>";								
				addFielderHtml += "<td><input type=\"month\" 		class=\"form-control\" id=\"fStatYear\" 		name=\"profileStatFielderList[" + rowCount + "].fStatYear\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"pos\" 		name=\"profileStatFielderList[" + rowCount + "].pos\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"g\" 		name=\"profileStatFielderList[" + rowCount + "].g\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"gs\" 		name=\"profileStatFielderList[" + rowCount + "].gs\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"inn\" 		name=\"profileStatFielderList[" + rowCount + "].inn\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"tc\" 		name=\"profileStatFielderList[" + rowCount + "].tc\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"po\" 		name=\"profileStatFielderList[" + rowCount + "].po\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"a\" 		name=\"profileStatFielderList[" + rowCount + "].a\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"e\" 		name=\"profileStatFielderList[" + rowCount + "].e\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"dp\" 		name=\"profileStatFielderList[" + rowCount + "].dp\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"sb\" 		name=\"profileStatFielderList[" + rowCount + "].sb\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"cs\" 		name=\"profileStatFielderList[" + rowCount + "].cs\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"sbpct\" 		name=\"profileStatFielderList[" + rowCount + "].sbpct\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"pb\" 		name=\"profileStatFielderList[" + rowCount + "].pb\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"cWp\" 		name=\"profileStatFielderList[" + rowCount + "].cWp\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"fpct\" 		name=\"profileStatFielderList[" + rowCount + "].fpct\"/></td>";
				addFielderHtml += "<td><input type=\"number\" 		class=\"form-control\" id=\"rf\" 		name=\"profileStatFielderList[" + rowCount + "].rf\"/></td>";
				addFielderHtml += "<td><input type=\"button\" 		class=\"btn btn-default removeFielderBtn\" value=\"-\"/></td>";
				addFielderHtml += "</tr>";
				$(".tableFielderStat > tbody:last").append(addFielderHtml);	
			}	
			
		});	
	});
	
	function toggleThumbImage(className){
		
		$(".thumbImg").hide();
		
		$("." + className).show();
		
	}

	function delThumbImage(){
		$(".unset").remove();
		toggleThumbImage("set");
		
	}	
</script>	
</html>