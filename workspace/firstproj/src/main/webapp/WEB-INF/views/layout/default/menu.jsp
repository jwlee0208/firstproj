<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.firstproj.user.dto.UserDto"%>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/home/home.js"></script>
<style>
ul { padding: 0; }
</style>
<%
	UserDto userInfo = (UserDto)request.getSession().getAttribute("userInfo");
%>
<c:set var="userInfo" value="<%=userInfo%>"/>
<nav class="navbar navbar-default" role="navigation">
	<input type="hidden" id="menuId" name="menuId" value="${param.menuId}"/>
    <div class="container-fluid">
    	<div class="navbar-header"><a class="navbar-brand" href="javascript:;" onclick="javascript:goHome();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nevertheless The First Project is..&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></div>
		<div class="collapse2 nav-collapse">
			<ul class="nav navbar-nav">
 				<li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Home<span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
					<li <c:if test="${param.menuId eq 0}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goHome();">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/home2">Home2</a></li>
					<li><a href="${pageContext.request.contextPath}/home3">Home3</a></li>
					<li><a href="${pageContext.request.contextPath}/home4">Home4</a></li>
		          </ul>
		        </li>				
				<li <c:if test="${param.menuId eq 5}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goInfo();">About Us</a></li>
 				<li class="dropdown">
		          <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">Board<span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
					<li <c:if test="${param.menuId eq 1}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goList(1);">자유게시판</a></li>
					<li <c:if test="${param.menuId eq 2}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goList(2);">Q&A</a></li>
					<li <c:if test="${param.menuId eq 3}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goList(3);">기타게시판</a></li>
		          </ul>
		        </li>				
				<li <c:if test="${param.menuId eq 4}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goPlayer();">Player</a></li>
				
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
			<button type="button" class="btn btn-primary" onclick="javascript:goRegist(6);">Sign up</button>
			<a onclick="javascript:goLogin(7);" class="btn btn-default">Sign in</a>
		</c:when>	
		<c:otherwise>
			Signed in as "<a href="#" class="navbar-link">${userInfo.userNm}</a>"
	        <button type="button" class="btn btn-default" onclick="javascript:logout();">logout</button>				
		</c:otherwise>

	</c:choose>	
			</form>				
<!-- 			<ul class="nav navbar-nav navbar-right">	 -->
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${null eq userInfo}"> --%>
<%-- 				<li <c:if test="${param.menuId eq 6}">class="active"</c:if>><a onclick="javascript:goRegist(6);" class="btn btn-default">Regist</a></li> --%>
<%-- 				<li <c:if test="${param.menuId eq 7}">class="active"</c:if>><a onclick="javascript:goLogin(7);" class="btn btn-default">Sign in</a></li> --%>
<%-- 		</c:when>	 --%>
<%-- 		<c:otherwise> --%>
<%-- 				<li class="active"><a href="javascript:;">[ ${userInfo.userNm} ]</a></li> --%>
<!-- 				<li><a href="javascript:'" onclick="javascript:logout();"><span class="btn btn-default">logout</span></a></li> -->
<%-- 		</c:otherwise> --%>

<%-- 	</c:choose>		 --%>
<!-- 				<li>&nbsp;&nbsp;&nbsp;</li> -->
<!-- 			</ul>	 -->
		</div>
	</div>
</nav>	