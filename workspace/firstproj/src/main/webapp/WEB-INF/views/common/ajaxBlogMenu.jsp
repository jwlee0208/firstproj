<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.firstproj.user.dto.UserDto"%>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/home/home.js"></script>
<%
	UserDto userInfo = (UserDto)request.getSession().getAttribute("userInfo");
%>
<c:set var="userInfo" value="<%=userInfo%>"/>

<nav class="navbar navbar-inverse" role="navigation">
	<input type="hidden" id="menuId" name="menuId" value="${param.menuId}"/>
    <div class="container">
    	<div class="navbar-header"><a class="navbar-brand" href="/board/article/main"><span style="color:white; font-size: 25px; font-weight: bold;">D</span>eveloper's <span style="color:white; font-size: 25px; font-weight: bold;">B</span>log &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></div>
		<div class="collapse2 nav-collapse">
			<ul class="nav navbar-nav">
				<li <c:if test="${param.menuId eq 5}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goInfo();">About</a></li>
		          	<c:if test="${!empty boardCategoryList}">
		          		<c:forEach var="boardCategoryInfo" items="${boardCategoryList}">
 				<li class="dropdown">
		          <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">${boardCategoryInfo.boardCategoryName}<span class="caret"></span></a>
		          <c:if test="${!empty boardCategoryInfo.boardList}">
		          <ul class="dropdown-menu" role="menu">
		          
		          		<c:forEach var="boardInfo" items="${boardCategoryInfo.boardList}">
			          		<c:if test="${boardCategoryInfo.boardCategoryId eq boardInfo.boardCategoryId}">
					<li <c:if test="${param.menuId eq 1}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goList(${boardInfo.boardId});">${boardInfo.boardName}</a></li>
							</c:if>
						</c:forEach>
		          	
		          </ul>
		          </c:if>
		        </li>
						</c:forEach>
		          	</c:if>		        
<%-- 				<li <c:if test="${param.menuId eq 7}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goBoardConfig();">게시판 설정</a></li> --%>
			</ul>
<!-- 			<ul class="nav navbar-nav navbar-right"> -->
<!-- 				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li> -->
<%-- 				<li <c:if test="${param.menuId eq 4}">class="active"</c:if>><a href="javascript:void(0);">Site Map</a></li> --%>
<!-- 				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li> -->
<!-- 			</ul> -->
		</div>

			<form class="navbar-form navbar-right" role="search">
	<c:choose>
		<c:when test="${null eq userInfo}">
			<button type="button" class="btn btn-primary" onclick="javascript:goRegist(6);"><tag:message code="signup"/></button>
			<a onclick="javascript:goLogin(7);" class="btn btn-default"><tag:message code="signin"/></a>
		</c:when>	
		<c:otherwise>
			<span style="color: white;">Welcome</span> <a href="#" class="navbar-link">"${userInfo.userNm}"</a>
	        <button type="button" class="btn btn-default" onclick="javascript:logout();"><tag:message code="logout"/></button>				
		</c:otherwise>

	</c:choose>	
			</form>				
	</div>
</nav>	