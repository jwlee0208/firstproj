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
    	<div class="navbar-header"><a class="navbar-brand" href="javascript:;" onclick="javascript:goHome();">firstproj</a></div>
		<div class="collapse2 nav-collapse">
			<ul class="nav navbar-nav">
				<li <c:if test="${param.menuId eq 0}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goHome();">홈</a></li>
				<li <c:if test="${param.menuId eq 5}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goInfo();">About Us</a></li>
				<li <c:if test="${param.menuId eq 1}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goList(1);">자유게시판</a></li>
				<li <c:if test="${param.menuId eq 2}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goList(2);">Q&A</a></li>
				<li <c:if test="${param.menuId eq 3}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goList(3);">기타게시판</a></li>
				<li <c:if test="${param.menuId eq 4}">class="active"</c:if>><a href="javascript:void(0);">사이트맵</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">	
	<c:choose>
		<c:when test="${null eq userInfo}">
				<li <c:if test="${param.menuId eq 6}">class="active"</c:if>><a href="javascript:;" onclick="javascript:goRegist(6);">회원가입</a></li>
				<li <c:if test="${param.menuId eq 7}">class="active"</c:if>><a href="javascript:;" onclick="javascript:goLogin(7);">로그인</a></li>
		</c:when>	
		<c:otherwise>
				<li class="active"><a href="javascript:;">[ ${userInfo.userNm} ]</a></li>
				<li><a href="javascript:'" onclick="javascript:logout();">logout</a></li>
		</c:otherwise>

	</c:choose>		
			</ul>	
		</div>
	</div>
</nav>	