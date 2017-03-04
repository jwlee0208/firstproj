<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>

		<h3>#&nbsp;&nbsp;Team Information</h3>
		<hr/>
	  	<div class="form-group row">
	  		<div class="col-sm-6">
				<img src="http://jwlee0208.cdn3.cafe24.com/${profileInfo.profileImgPath}" class="img-fluid rounded mx-auto d-block"/>
			</div>	
			<div class="col-sm-6">
		    	<div class="form-group row">
			    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.team.name"/></label>
				    <div class="col-sm-7">
				    	<p class="form-control-static">${profileInfo.name}</p>
					</div>
				</div>
			  	<div class="form-group row">
			    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.team.franchise"/></label>
				    <div class="col-sm-7">
				    	<p class="form-control-static">${profileInfo.profileTeamDto.city}</p>
					</div>
				</div>	
			  	<div class="form-group row">
			    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.team.eastablish.date"/></label>
				    <div class="col-sm-7">
				    	<p class="form-control-static">${profileInfo.profileTeamDto.establishedDate}</p>
					</div>
				</div>

			</div>
	  		
		</div>
		<h3>#&nbsp;&nbsp;League Information</h3>
		<hr/>
	  	<div class="form-group row">
	    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.continent"/></label>
		    <div class="col-sm-7">
		    	<p class="form-control-static"><tag:message code="code.area.${profileInfo.leagueInfoDto.area}"/></p>
			</div>
		</div>		
	  	<div class="form-group row">
	    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.countries"/></label>
		    <div class="col-sm-7">
		    	<p class="form-control-static"><tag:message code="code.country.${profileInfo.leagueInfoDto.country}"/></p>
			</div>
		</div>				
	  	<div class="form-group row">
	    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.league.name"/></label>
		    <div class="col-sm-7">
		    	<p class="form-control-static">${profileInfo.leagueInfoDto.leagueName}</p>
			</div>
		</div>
	  	<div class="form-group row">
	    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.league.level"/></label>
		    <div class="col-sm-7">
		    	<p class="form-control-static"><tag:message code="code.leaguetype.${profileInfo.leagueInfoDto.leagueType}"/></p>
			</div>
		</div>
	  	<div class="form-group row">
	    	<label for="" class="col-sm-5 col-form-label"><tag:message code="text.league.division"/></label>
		    <div class="col-sm-7">
		    	<p class="form-control-static">${profileInfo.leagueInfoDto.leagueDivision}</p>
			</div>
		</div>	