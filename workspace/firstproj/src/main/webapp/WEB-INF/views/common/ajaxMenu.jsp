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
    <div class="container-fluid">
    	<!-- mobile menu list button -->   
    	<div class="navbar-header">
		    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-collapse-player-menu-list" aria-expanded="false" aria-controls="nav-collapse-player-menu-list">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
    		<a class="navbar-brand" href="javascript:;" onclick="javascript:goHome();"><span style="color:white; font-size: 25px; font-weight: bold;">L</span>inked<span style="color:white; font-size: 25px; font-weight: bold;">N</span>est - <span style="color:white; font-size: 15px;">Checkout future's MVP</span>&nbsp;</a>
    	</div>
		<div class="collapse navbar-collapse" id="nav-collapse-player-menu-list">
			<ul class="nav navbar-nav">
		        <li>
		        	<a href="javascript:;" onclick="javascript:goPortal(6, 1);" ><tag:message code="menu.player"/></a>
		        </li>
		        <li>
		        	<a href="javascript:;" onclick="javascript:goPortal(6, 5);" ><tag:message code="menu.club"/></a>
		        </li>				
<!-- 		        <li> -->
<!-- 		        	<a href="javascript:;" onclick="javascript:alert('준비중입니다.');" >트라이아웃 정보</a> -->
<!-- 		        </li>				 -->
			</ul>
			<form class="navbar-form navbar-right" role="search">
			<c:if test="${null eq userInfo}">
				<a onclick="javascript:goRegist(6);" 	class="btn btn-primary"><tag:message code="signup"/></a>
				<a onclick="javascript:goLogin(7);" 	class="btn btn-default"><tag:message code="signin"/></a>
			</c:if>	
			<c:if test="${null ne userInfo}">
				<span style="color: white;">Welcome</span><a href="#" class="navbar-link">"${userInfo.userNm}"</a>&nbsp;<a onclick="javascript:logout();"		class="btn btn-default"><tag:message code="logout"/></a>
			</c:if>
            
          	</form>
			<!-- 
			<c:if test="${null eq userInfo}">
				<li><button onclick="javascript:goRegist(6);" 	class="btn btn-primary"><tag:message code="signup"/></button></li>
				<li><a onclick="javascript:goLogin(7);" 	class="btn btn-default"><tag:message code="signin"/></a></li>
			</c:if>	
			<c:if test="${null ne userInfo}">
			<li><span style="color: white;">Welcome</span><a href="#" class="navbar-link">"${userInfo.userNm}"</a>&nbsp;<a onclick="javascript:logout();"		class="btn btn-default"><tag:message code="logout"/></a></li>
			</c:if>
 			-->
	
		</div>
	</div>
</nav>	