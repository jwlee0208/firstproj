<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jwlee0208.cafe24.com/taglib/custom" 	prefix="custom" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 			prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 	prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 			prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" 		prefix="tag"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/circle.css"/>
<style>
	iframe {width : 250px; height : 200px; align:center;}
</style>
<c:choose>
	<c:when test="${empty profileList}">
		<div class="table-responsive" style="text-align: center; height: 100%;">
			<p class="text-warning">N/A</p>
		</div>	
	</c:when>
	<c:otherwise>
		<div>
			<c:forEach var="list" items="${profileList}">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<c:choose>
							<c:when test="${list.profileImgPath ne null && list.profileImgPath ne ''}">
						<img src="http://jwlee0208.cdn3.cafe24.com/${list.profileImgPath}" 
							 data-src="holder.js/250x200" alt="image" class="img-responsive" 
							 onerror="this.src='http://jwlee0208.cdn3.cafe24.com/img/no_image.png'"  
							 onclick="javascript:goProfileView('${list.profileId}', '${list.profileType}');"  
							 style="padding-top:10px; cursor:pointer; max-width: 300px; height: 200px;"/>
							</c:when>
							<c:otherwise>
						<img src="http://jwlee0208.cdn3.cafe24.com/img/no_image.png" 
							 data-src="holder.js/250x200" alt="image" class="img-responsive"
							 onclick="javascript:goProfileView('${list.profileId}', '${list.profileType}');" 
							 style="padding-top:10px; cursor:pointer; max-width: 300px; height: 200px;"/>
							</c:otherwise>
						</c:choose>					
						<div class="caption" style="cursor:pointer;">
							<h3>
								<span onclick="javascript:goProfileView('${list.profileId}', '${list.profileType}');">${list.name}</span>
								<c:choose>
									<c:when test="${list.profileType eq 1}">
										<c:set var="playerInfo" value="${list.profilePlayerDto}"/>
										<small><tag:message code="code.country.${playerInfo.nationality}"/></small>
									</c:when>
									<c:when test="${list.profileType eq 2}">
									
									</c:when>
									<c:when test="${list.profileType eq 3}">
										<c:set var="teamInfo" value="${list.profileTeamDto}"/>
										<small>${teamInfo.city}</small>									
									</c:when>
								</c:choose>
							</h3>
							<div class="btn-group btn-group-lg btn-group-justified">
								<c:forEach var="attrInfo" items="${list.profileAttrList}">
									<c:if test="${!empty attrInfo}">
									<c:forEach var="attrElemInfo" items="${attrInfo.profileAttrElementMapList}">
								<div class="btn btn-default">${attrElemInfo.profileAttrElementMapName}</div>
									</c:forEach>
									</c:if>
								</c:forEach>				
							</div>
							<p class="content_${index.count}">
							</p>
							<p>
								<span class="btn btn-info btn-block btn-md" 		role="button" onclick="javascript:goProfileView('${list.profileId}', '${list.profileType}');" data-toggle="modal" data-target="#myModal"><tag:message code='button.detailview'/></span>
							</p>
						</div>
	
					</div>	
				</div>
			
			</c:forEach>
		</div>
	</c:otherwise>
</c:choose>


                        <!-- 리스트 페이징 영역 -->
                    <c:choose>    
                        <c:when test="${pageHolder.totalRows > 0}">
                            <custom:paginationAjax name="pageHolder" scriptName="ajaxPagination"/>
                        </c:when>
                        <c:otherwise>
                            <div style="padding: 52px 0 27px;"></div>
                        </c:otherwise>
                   </c:choose>     
                        <!-- // 리스트 페이징 영역 -->	
