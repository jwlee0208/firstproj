<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.firstproj.user.dto.UserDto"%>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/home/home.js"></script>
<style>
.navbar-blue {
  background-color: #0039cc;
  border-color: #0030ab;
}
.navbar-blue .navbar-brand {
  color: #ffffff;
}
.navbar-blue .navbar-brand:hover,
.navbar-blue .navbar-brand:focus {
  color: #e6e6e6;
  background-color: transparent;
}
.navbar-blue .navbar-text {
  color: #ffffff;
}
.navbar-blue .navbar-nav > li:last-child > a {
  border-right: 1px solid #0030ab;
}
.navbar-blue .navbar-nav > li > a {
  color: #ffffff;
  border-left: 1px solid #0030ab;
}
.navbar-blue .navbar-nav > li > a:hover,
.navbar-blue .navbar-nav > li > a:focus {
  color: #acc5e8;
  background-color: transparent;
}
.navbar-blue .navbar-nav > .active > a,
.navbar-blue .navbar-nav > .active > a:hover,
.navbar-blue .navbar-nav > .active > a:focus {
  color: #acc5e8;
  background-color: #0030ab;
}
.navbar-blue .navbar-nav > .disabled > a,
.navbar-blue .navbar-nav > .disabled > a:hover,
.navbar-blue .navbar-nav > .disabled > a:focus {
  color: #cccccc;
  background-color: transparent;
}
.navbar-blue .navbar-toggle {
  border-color: #dddddd;
}
.navbar-blue .navbar-toggle:hover,
.navbar-blue .navbar-toggle:focus {
  background-color: #dddddd;
}
.navbar-blue .navbar-toggle .icon-bar {
  background-color: #cccccc;
}
.navbar-blue .navbar-collapse,
.navbar-blue .navbar-form {
  border-color: #002fa8;
}
.navbar-blue .navbar-nav > .dropdown > a:hover .caret,
.navbar-blue .navbar-nav > .dropdown > a:focus .caret {
  border-top-color: #acc5e8;
  border-bottom-color: #acc5e8;
}
.navbar-blue .navbar-nav > .open > a,
.navbar-blue .navbar-nav > .open > a:hover,
.navbar-blue .navbar-nav > .open > a:focus {
  background-color: #0030ab;
  color: #acc5e8;
}
.navbar-blue .navbar-nav > .open > a .caret,
.navbar-blue .navbar-nav > .open > a:hover .caret,
.navbar-blue .navbar-nav > .open > a:focus .caret {
  border-top-color: #acc5e8;
  border-bottom-color: #acc5e8;
}
.navbar-blue .navbar-nav > .dropdown > a .caret {
  border-top-color: #ffffff;
  border-bottom-color: #ffffff;
}
@media (max-width: 767) {
  .navbar-blue .navbar-nav .open .dropdown-menu > li > a {
    color: #ffffff;
  }
  .navbar-blue .navbar-nav .open .dropdown-menu > li > a:hover,
  .navbar-blue .navbar-nav .open .dropdown-menu > li > a:focus {
    color: #acc5e8;
    background-color: transparent;
  }
  .navbar-blue .navbar-nav .open .dropdown-menu > .active > a,
  .navbar-blue .navbar-nav .open .dropdown-menu > .active > a:hover,
  .navbar-blue .navbar-nav .open .dropdown-menu > .active > a:focus {
    color: #acc5e8;
    background-color: #0030ab;
  }
  .navbar-blue .navbar-nav .open .dropdown-menu > .disabled > a,
  .navbar-blue .navbar-nav .open .dropdown-menu > .disabled > a:hover,
  .navbar-blue .navbar-nav .open .dropdown-menu > .disabled > a:focus {
    color: #cccccc;
    background-color: transparent;
  }
}
.navbar-blue .navbar-link {
  color: #ffffff;
}
.navbar-blue .navbar-link:hover {
  color: #acc5e8;
}

.navbar-red {
  background-color: #fa2020;
  border-color: #f30505;
}
.navbar-red .navbar-brand {
  color: #ffffff;
}
.navbar-red .navbar-brand:hover,
.navbar-red .navbar-brand:focus {
  color: #e6e6e6;
  background-color: transparent;
}
.navbar-red .navbar-text {
  color: #ffffff;
}
.navbar-red .navbar-nav > li:last-child > a {
  border-right: 1px solid #f30505;
}
.navbar-red .navbar-nav > li > a {
  color: #ffffff;
  border-left: 1px solid #f30505;
}
.navbar-red .navbar-nav > li > a:hover,
.navbar-red .navbar-nav > li > a:focus {
  color: #f2c2cb;
  background-color: transparent;
}
.navbar-red .navbar-nav > .active > a,
.navbar-red .navbar-nav > .active > a:hover,
.navbar-red .navbar-nav > .active > a:focus {
  color: #f2c2cb;
  background-color: #f30505;
}
.navbar-red .navbar-nav > .disabled > a,
.navbar-red .navbar-nav > .disabled > a:hover,
.navbar-red .navbar-nav > .disabled > a:focus {
  color: #cccccc;
  background-color: transparent;
}
.navbar-red .navbar-toggle {
  border-color: #dddddd;
}
.navbar-red .navbar-toggle:hover,
.navbar-red .navbar-toggle:focus {
  background-color: #dddddd;
}
.navbar-red .navbar-toggle .icon-bar {
  background-color: #cccccc;
}
.navbar-red .navbar-collapse,
.navbar-red .navbar-form {
  border-color: #f10505;
}
.navbar-red .navbar-nav > .dropdown > a:hover .caret,
.navbar-red .navbar-nav > .dropdown > a:focus .caret {
  border-top-color: #f2c2cb;
  border-bottom-color: #f2c2cb;
}
.navbar-red .navbar-nav > .open > a,
.navbar-red .navbar-nav > .open > a:hover,
.navbar-red .navbar-nav > .open > a:focus {
  background-color: #f30505;
  color: #f2c2cb;
}
.navbar-red .navbar-nav > .open > a .caret,
.navbar-red .navbar-nav > .open > a:hover .caret,
.navbar-red .navbar-nav > .open > a:focus .caret {
  border-top-color: #f2c2cb;
  border-bottom-color: #f2c2cb;
}
.navbar-red .navbar-nav > .dropdown > a .caret {
  border-top-color: #ffffff;
  border-bottom-color: #ffffff;
}
@media (max-width: 767) {
  .navbar-red .navbar-nav .open .dropdown-menu > li > a {
    color: #ffffff;
  }
  .navbar-red .navbar-nav .open .dropdown-menu > li > a:hover,
  .navbar-red .navbar-nav .open .dropdown-menu > li > a:focus {
    color: #f2c2cb;
    background-color: transparent;
  }
  .navbar-red .navbar-nav .open .dropdown-menu > .active > a,
  .navbar-red .navbar-nav .open .dropdown-menu > .active > a:hover,
  .navbar-red .navbar-nav .open .dropdown-menu > .active > a:focus {
    color: #f2c2cb;
    background-color: #f30505;
  }
  .navbar-red .navbar-nav .open .dropdown-menu > .disabled > a,
  .navbar-red .navbar-nav .open .dropdown-menu > .disabled > a:hover,
  .navbar-red .navbar-nav .open .dropdown-menu > .disabled > a:focus {
    color: #cccccc;
    background-color: transparent;
  }
}
.navbar-red .navbar-link {
  color: #ffffff;
}
.navbar-red .navbar-link:hover {
  color: #f2c2cb;
}

.navbar-green {
  background-color: #53f21b;
  border-color: #44df0d;
}
.navbar-green .navbar-brand {
  color: #ffffff;
}
.navbar-green .navbar-brand:hover,
.navbar-green .navbar-brand:focus {
  color: #e6e6e6;
  background-color: transparent;
}
.navbar-green .navbar-text {
  color: #ffffff;
}
.navbar-green .navbar-nav > li:last-child > a {
  border-right: 1px solid #44df0d;
}
.navbar-green .navbar-nav > li > a {
  color: #ffffff;
  border-left: 1px solid #44df0d;
}
.navbar-green .navbar-nav > li > a:hover,
.navbar-green .navbar-nav > li > a:focus {
  color: #d9fadb;
  background-color: transparent;
}
.navbar-green .navbar-nav > .active > a,
.navbar-green .navbar-nav > .active > a:hover,
.navbar-green .navbar-nav > .active > a:focus {
  color: #d9fadb;
  background-color: #44df0d;
}
.navbar-green .navbar-nav > .disabled > a,
.navbar-green .navbar-nav > .disabled > a:hover,
.navbar-green .navbar-nav > .disabled > a:focus {
  color: #cccccc;
  background-color: transparent;
}
.navbar-green .navbar-toggle {
  border-color: #dddddd;
}
.navbar-green .navbar-toggle:hover,
.navbar-green .navbar-toggle:focus {
  background-color: #dddddd;
}
.navbar-green .navbar-toggle .icon-bar {
  background-color: #cccccc;
}
.navbar-green .navbar-collapse,
.navbar-green .navbar-form {
  border-color: #43dd0d;
}
.navbar-green .navbar-nav > .dropdown > a:hover .caret,
.navbar-green .navbar-nav > .dropdown > a:focus .caret {
  border-top-color: #d9fadb;
  border-bottom-color: #d9fadb;
}
.navbar-green .navbar-nav > .open > a,
.navbar-green .navbar-nav > .open > a:hover,
.navbar-green .navbar-nav > .open > a:focus {
  background-color: #44df0d;
  color: #d9fadb;
}
.navbar-green .navbar-nav > .open > a .caret,
.navbar-green .navbar-nav > .open > a:hover .caret,
.navbar-green .navbar-nav > .open > a:focus .caret {
  border-top-color: #d9fadb;
  border-bottom-color: #d9fadb;
}
.navbar-green .navbar-nav > .dropdown > a .caret {
  border-top-color: #ffffff;
  border-bottom-color: #ffffff;
}
@media (max-width: 767) {
  .navbar-green .navbar-nav .open .dropdown-menu > li > a {
    color: #ffffff;
  }
  .navbar-green .navbar-nav .open .dropdown-menu > li > a:hover,
  .navbar-green .navbar-nav .open .dropdown-menu > li > a:focus {
    color: #d9fadb;
    background-color: transparent;
  }
  .navbar-green .navbar-nav .open .dropdown-menu > .active > a,
  .navbar-green .navbar-nav .open .dropdown-menu > .active > a:hover,
  .navbar-green .navbar-nav .open .dropdown-menu > .active > a:focus {
    color: #d9fadb;
    background-color: #44df0d;
  }
  .navbar-green .navbar-nav .open .dropdown-menu > .disabled > a,
  .navbar-green .navbar-nav .open .dropdown-menu > .disabled > a:hover,
  .navbar-green .navbar-nav .open .dropdown-menu > .disabled > a:focus {
    color: #cccccc;
    background-color: transparent;
  }
}
.navbar-green .navbar-link {
  color: #ffffff;
}
.navbar-green .navbar-link:hover {
  color: #d9fadb;
}

.navbar-yellow {
  background-color: #fbff2e;
  border-color: #faff0d;
}
.navbar-yellow .navbar-brand {
  color: #6b6960;
}
.navbar-yellow .navbar-brand:hover,
.navbar-yellow .navbar-brand:focus {
  color: #504f48;
  background-color: transparent;
}
.navbar-yellow .navbar-text {
  color: #6b6960;
}
.navbar-yellow .navbar-nav > li:last-child > a {
  border-right: 1px solid #faff0d;
}
.navbar-yellow .navbar-nav > li > a {
  color: #6b6960;
  border-left: 1px solid #faff0d;
}
.navbar-yellow .navbar-nav > li > a:hover,
.navbar-yellow .navbar-nav > li > a:focus {
  color: #c8cc9f;
  background-color: transparent;
}
.navbar-yellow .navbar-nav > .active > a,
.navbar-yellow .navbar-nav > .active > a:hover,
.navbar-yellow .navbar-nav > .active > a:focus {
  color: #c8cc9f;
  background-color: #faff0d;
}
.navbar-yellow .navbar-nav > .disabled > a,
.navbar-yellow .navbar-nav > .disabled > a:hover,
.navbar-yellow .navbar-nav > .disabled > a:focus {
  color: #cccccc;
  background-color: transparent;
}
.navbar-yellow .navbar-toggle {
  border-color: #dddddd;
}
.navbar-yellow .navbar-toggle:hover,
.navbar-yellow .navbar-toggle:focus {
  background-color: #dddddd;
}
.navbar-yellow .navbar-toggle .icon-bar {
  background-color: #cccccc;
}
.navbar-yellow .navbar-collapse,
.navbar-yellow .navbar-form {
  border-color: #faff0a;
}
.navbar-yellow .navbar-nav > .dropdown > a:hover .caret,
.navbar-yellow .navbar-nav > .dropdown > a:focus .caret {
  border-top-color: #c8cc9f;
  border-bottom-color: #c8cc9f;
}
.navbar-yellow .navbar-nav > .open > a,
.navbar-yellow .navbar-nav > .open > a:hover,
.navbar-yellow .navbar-nav > .open > a:focus {
  background-color: #faff0d;
  color: #c8cc9f;
}
.navbar-yellow .navbar-nav > .open > a .caret,
.navbar-yellow .navbar-nav > .open > a:hover .caret,
.navbar-yellow .navbar-nav > .open > a:focus .caret {
  border-top-color: #c8cc9f;
  border-bottom-color: #c8cc9f;
}
.navbar-yellow .navbar-nav > .dropdown > a .caret {
  border-top-color: #6b6960;
  border-bottom-color: #6b6960;
}
@media (max-width: 767) {
  .navbar-yellow .navbar-nav .open .dropdown-menu > li > a {
    color: #6b6960;
  }
  .navbar-yellow .navbar-nav .open .dropdown-menu > li > a:hover,
  .navbar-yellow .navbar-nav .open .dropdown-menu > li > a:focus {
    color: #c8cc9f;
    background-color: transparent;
  }
  .navbar-yellow .navbar-nav .open .dropdown-menu > .active > a,
  .navbar-yellow .navbar-nav .open .dropdown-menu > .active > a:hover,
  .navbar-yellow .navbar-nav .open .dropdown-menu > .active > a:focus {
    color: #c8cc9f;
    background-color: #faff0d;
  }
  .navbar-yellow .navbar-nav .open .dropdown-menu > .disabled > a,
  .navbar-yellow .navbar-nav .open .dropdown-menu > .disabled > a:hover,
  .navbar-yellow .navbar-nav .open .dropdown-menu > .disabled > a:focus {
    color: #cccccc;
    background-color: transparent;
  }
}
.navbar-yellow .navbar-link {
  color: #6b6960;
}
.navbar-yellow .navbar-link:hover {
  color: #c8cc9f;
}
</style>
<%
	UserDto userInfo = (UserDto)request.getSession().getAttribute("userInfo");
%>
<c:set var="userInfo" value="<%=userInfo%>"/>
<c:set var="navbarType" value='navbar-inverse'/>

<c:if test="${shareInfo ne null && userId ne null}">
	<c:if test="${shareInfo.shareType eq 1}">
		<c:set var="navbarType" value='navbar-default'/>
	</c:if>
	<c:if test="${shareInfo.shareType eq 2}">
		<c:set var="navbarType" value='navbar-inverse'/>
	</c:if>
	<c:if test="${shareInfo.shareType eq 3}">
		<c:set var="navbarType" value='navbar-red'/>
	</c:if>
	<c:if test="${shareInfo.shareType eq 4}">
		<c:set var="navbarType" value='navbar-green'/>
	</c:if>
	<c:if test="${shareInfo.shareType eq 5}">
		<c:set var="navbarType" value='navbar-yellow'/>
	</c:if>		
</c:if>
			    


<nav class="navbar ${navbarType}" role="navigation">
	<input type="hidden" id="menuId" name="menuId" value="${param.menuId}"/>
	<input type="hidden" id="userId" name="userId" value="${userId}"/>
	
    <div class="container-fluid">
    	<div class="navbar-header">
			<!-- mobile menu list button -->    	
		    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-collapse-blog-menu-list" aria-expanded="false" aria-controls="nav-collapse-blog-menu-list">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		    
		    <c:set var="url" value=""/>
	<c:choose>
		<c:when test="${userId ne '' && userId ne null}">
		    <c:set var="url" value='/share/${userId}'/>
		    
		</c:when>
		<c:otherwise>
			<c:set var="url" value='/share/main'/>
		</c:otherwise>
	</c:choose>		    
    		<a class="navbar-brand" href="${url}">
    		<c:choose>
    			<c:when test="${shareInfo ne null && userId ne null}">
    		${shareInfo.shareName}		
<!--     		<span style="color:white; font-size: 25px; font-weight: bold;">D</span>eveloper's <span style="color:white; font-size: 25px; font-weight: bold;">B</span>log &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	 -->
    			</c:when>
    			<c:otherwise>
    		LinkedNest Share	
    			</c:otherwise>
    		</c:choose>    		
    		</a>
    	</div>
		<div class="navbar-collapse collapse" id="nav-collapse-blog-menu-list">
			<ul class="nav navbar-nav">
				<li <c:if test="${param.menuId eq 5}">class="active"</c:if>><a href="javascript:void(0);" onclick="javascript:goInfo();">Profile</a></li>
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
			<form class="navbar-form navbar-right" role="search">
			<c:if test="${null eq userInfo}">
			
				<a onclick="javascript:goRegist(6);" 	class="btn btn-primary"><tag:message code="signup"/></a>
				<a onclick="javascript:goLogin(7);" 	class="btn btn-default"><tag:message code="signin"/></a>
			
			</c:if>	
			<c:if test="${null ne userInfo}">
			<span style="color: white;">Welcome</span> <a href="#" class="navbar-link" onclick="javascript:goConfig();">"${userInfo.userNm}"</a>&nbsp;<a onclick="javascript:logout();"		class="btn btn-default"><tag:message code="logout"/></a>
			</c:if>
			</form>
<!-- 				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li> -->
<%-- 				<li <c:if test="${param.menuId eq 4}">class="active"</c:if>><a href="javascript:void(0);">Site Map</a></li> --%>
<!-- 				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li> -->
			
		</div>
	</div>
</nav>	