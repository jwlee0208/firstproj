<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.firstproj.user.dto.UserDto"%>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/config/config.js"></script>
<%
	UserDto userInfo = (UserDto)request.getSession().getAttribute("userInfo");
%>
<c:set var="userInfo" value="<%=userInfo%>"/>
<c:if test="${null ne userInfo}">
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
		    
	<c:set var="url" value=""/>
	<c:choose>
		<c:when test="${userId ne '' && userId ne null}"><c:set var="url" value='/share/${userId}'/></c:when>
		<c:otherwise><c:set var="url" value='/share/main'/></c:otherwise>
	</c:choose>		    
    		<a class="navbar-brand" href="${url}" style="font-weight: bold; cursor: pointer;">
    		<c:choose>
    			<c:when test="${shareInfo ne null && userId ne null}">${shareInfo.shareName}</c:when>
    			<c:otherwise>LinkedNest Share</c:otherwise>
    		</c:choose>
    		<span style="color:white; ">Configuration Page</span>    				    
			</a>
    	</div>
		<div class="collapse navbar-collapse" id="nav-collapse-player-menu-list">
			<ul class="nav navbar-nav">
		        <li class="dropdown">
		        	<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">게시판 관리<span class="caret"></span></a>
		        	<ul class="dropdown-menu" role="menu">
		        		<li><a href="javascript:;" onclick="javascript:configBoard();">게시판 목록 관리</a></li>
		        		<li><a href="javascript:;" onclick="javascript:configBoardCategory();">게시판 카테고리 관리</a></li>
		        	</ul>
		        </li>
<!-- 		        <li> -->
<!-- 		        	<a href="javascript:;" onclick="javascript:configCategory();" >카테고리 관리</a> -->
<!-- 		        </li>				 -->
		        <li>
		        	<a href="javascript:;" onclick="javascript:configPrivInfo();" data-toggle="dropdown">개인정보 관리<span class="caret"></span></a>
		        	<ul class="dropdown-menu" role="menu">
		        		<li><a href="javascript:;" onclick="javascript:configDefaultPriv();">기본 정보 관리</a></li>
		        		<li><a href="javascript:;" onclick="javascript:configProfileInfo();">Share 프로파일 관리</a></li>
		        	</ul>
		        </li>
			</ul>
		</div>
	</div>
</nav>
</c:if>	