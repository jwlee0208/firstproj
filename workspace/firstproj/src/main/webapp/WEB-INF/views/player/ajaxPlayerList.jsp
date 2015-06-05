<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.tryout.com:8080/taglib/custom" 	prefix="custom" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<c:choose>
	<c:when test="${empty playerList}">
	asdf
	</c:when>
	<c:otherwise>
		<div class="table-responsive" id="listDiv">
	<%-- 		<div>Total :  ${pagedResult.totalListCnt} (Players)</div> --%>
			 
			
	<!-- 		<table class="table table-hover"> -->
	<!-- 			<tr> -->
	<!-- 				<th>Profile Image</th> -->
	<!-- 				<th>Name</th> -->
	<!-- 				<th>Type</th> -->
	<!-- 				<th>Detail Type</th> -->
	<!-- 				<th>Detail View</th> -->
	<!-- 			</tr> -->
			
	<%-- 		<c:forEach var="list" items="${pagedResult.list}" varStatus="index"> --%>
	<!-- 			<tr> -->
	<%-- 				<td><img data-src="holder.js/128x128" src="${pageContext.request.contextPath}<c:choose><c:when test="${list.profileImgFilePath ne null && list.profileImgFilePath ne ''}">${list.profileImgFilePath}</c:when><c:otherwise>/img/no_image.png</c:otherwise></c:choose>"/></td> --%>
	<%-- 				<td onclick="javascript:goDetail('${list.userInfo.userId}');">${list.userInfo.userNm}(${list.userInfo.userId})</td> --%>
	<%-- 				<td>${list.catNm1}</td> --%>
	<%-- 				<td>${list.catNm2}</td> --%>
	<!-- 				<td><input type="button" class="btn btn-info" value="Detail Info." name="viewDetail" /></td> -->
	<!-- 			</tr> -->
				
	<%-- 		</c:forEach> --%>
	<!-- 		</table> -->
	
			<c:forEach var="list" items="${playerList}">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<span class="label <c:choose><c:when test="${list.catNm2 eq 'hitter'}">label-success</c:when><c:when test="${list.catNm2 eq 'pitcher'}">label-info</c:when><c:otherwise>label-warning</c:otherwise></c:choose> position">${list.catNm2Str}</span>
				<c:choose>
					<c:when test="${list.profileImgFilePath ne null && list.profileImgFilePath ne ''}">
						<img src="${pageContext.request.contextPath}${list.profileImgFilePath}" 
							 data-src="holder.js/400x400" alt="image" class="img-rounded" 
							 onerror="this.src='${pageContext.request.contextPath}/img/no_image.png'"  
							 onclick="javascript:goDetail('${list.userInfo.userId}');" 
							 data-toggle="modal" data-target="#myModal" 
							 style="padding-top:10px; cursor:pointer;"/>
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/img/no_image.png" 
							 data-src="holder.js/400x400" alt="image" class="img-rounded" 
							 onclick="javascript:goDetail('${list.userInfo.userId}');" 
							 data-toggle="modal" data-target="#myModal" 
							 style="padding-top:10px; cursor:pointer;"/>
					</c:otherwise>
				</c:choose>					
						
						<div class="caption" style="cursor:pointer;">
							<h3><span onclick="javascript:goDetail('${list.userInfo.userId}');" data-toggle="modal" data-target="#myModal">${list.userInfo.userNm}</span></h3>
							<p class="content_${index.count}" style="text-overflow:ellipsis; overflow:hidden;">
								<div class="row"><div class="col-xs-6">Type</div><div class="col-xs-6">${list.catNm1Str}</div></div>
								<div class="row"><div class="col-xs-6">Position</div><div class="col-xs-6">${list.catNm2Str}</div></div>
<%-- 								<c:if test="${list.introduce eq null || list.introduce eq ''}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if> --%>
<%-- 								<c:if test="${list.introduce ne null && list.introduce ne ''}"> --%>
<%-- 									<span onclick="javascript:goDetail('${list.userInfo.userId}');" data-toggle="modal" data-target="#myModal">${fn:substring(list.introduce, 0, 10)}...</span> --%>
<%-- 								</c:if> --%>
							</p>
							<p>
								<span class="btn btn-info" 		role="button" onclick="javascript:goDetail('${list.userInfo.userId}');" data-toggle="modal" data-target="#myModal">Detail View</span>
								<span class="btn btn-primary" 	role="button" onclick="javascript:goDetail('${list.userInfo.userId}');" data-toggle="modal" data-target="#myModal">LIKE</span>
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

