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
<%-- 						<span class="label <c:choose><c:when test="${list.catNm2 eq 'hitter'}">label-success</c:when><c:when test="${list.catNm2 eq 'pitcher'}">label-info</c:when><c:otherwise>label-warning</c:otherwise></c:choose> position"><tag:message code='text.${list.catNm2}'/></span> --%>					
						<c:choose>
							<c:when test="${list.profileImgPath ne null && list.profileImgPath ne ''}">
						<img src="http://jwlee0208.cdn3.cafe24.com/${list.profileImgPath}" 
							 data-src="holder.js/250x200" alt="image" class="img-thumbnail" 
							 onerror="this.src='http://jwlee0208.cdn3.cafe24.com/img/no_image.png'"  
							 onclick="javascript:goProfileView('${list.profileId}', '${list.profileType}');"  
							 style="padding-top:10px; cursor:pointer; width: 250px; height: 200px;"/>
							</c:when>
							<c:otherwise>
						<img src="http://jwlee0208.cdn3.cafe24.com/img/no_image.png" 
							 data-src="holder.js/250x200" alt="image" class="img-thumbnail"
							 onclick="javascript:goProfileView('${list.profileId}', '${list.profileType}');" 
							 style="padding-top:10px; cursor:pointer; width: 250px; height: 200px;"/>
							</c:otherwise>
						</c:choose>					
						<div class="caption" style="cursor:pointer;">
							<h3 style="background: #efefef; padding:5px 0 5px 0px; text-align:center;"><span onclick="javascript:goProfileView('${list.profileId}', '${list.profileType}');">${list.name}</span></h3>
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
								<span class="btn btn-danger btn-block" 		role="button" onclick="javascript:goProfileView('${list.profileId}', '${list.profileType}');" data-toggle="modal" data-target="#myModal"><tag:message code='button.watchme'/></span>
<%-- 								<span class="btn btn-primary" 	role="button" onclick="javascript:goDetail('${list.userInfo.userId}');" data-toggle="modal" data-target="#myModal">LIKE</span> --%>
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
