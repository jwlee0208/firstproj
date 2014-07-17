<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/home/home.js"></script>
<style>
ul { padding: 0; }
</style>
<nav class="navbar navbar-default" role="navigation">

    <div class="container-fluid">
    	<div class="navbar-header"><a class="navbar-brand" href="#">firstproj</a></div>
		<div class="collapse2 nav-collapse">
			<ul class="nav navbar-nav">
				<li <c:if test="${param.menuId eq 0}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goHome();">홈</a></li>
				<li <c:if test="${param.menuId eq 5}">class="active"</c:if>><a href="javascript:void(0);">소개</a></li>
				<li <c:if test="${param.menuId eq 1}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goList(1);">자유게시판</a></li>
				<li <c:if test="${param.menuId eq 2}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goList(2);">Q&A</a></li>
				<li <c:if test="${param.menuId eq 3}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goList(3);">기타게시판</a></li>
				<li <c:if test="${param.menuId eq 4}">class="active"</c:if>><a href="javascript:void(0);">사이트맵</a></li>
			</ul>	
		</div>
	</div>
</nav>	