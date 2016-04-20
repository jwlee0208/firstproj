<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag" %>

<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.firstproj.user.dto.UserDto"%>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/home/home.js"></script>
<style>
/* ul { padding: 0; } */
</style>

<div class="container-fluid" style="background:#efefef;">
	<form class="navbar-form navbar-right">
		<select class="form-control" id="locale" name="locale">
			<option value="">::: Language :::</option>
			<option value="kr">한국어</option>
			<option value="en">English</option>
			<option value="zh">中国</option>
			<option value="ja">日本語</option>
		</select>					
	</form>		
</div>

<!-- <div style="height : 3px; background-color:maroon;"></div> -->
<!-- <div style="border-top : 2px solid maroon; border-bottom : 2px solid maroon; vertical-align: middle;"> -->
<!-- <div style="vertical-align: middle;"> -->
<!-- 	<div style="padding-left: 40px;"> -->
<!-- 		<h1>The Root is the beginning</h1> -->
<!-- 	</div>	 -->
<!-- </div> -->