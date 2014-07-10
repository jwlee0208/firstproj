<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>진원's Web</title>
<%@ include file="/WEB-INF/view/common/include.jsp"%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/ui.menu.js"></script> --%>

</head>
<body>

	<div id="wrap">
		<!-- container -->
		<div id="container">
        	<tiles:insertAttribute name="menu"/>
			<!-- contentsWrap -->
			<div id="contentsWrap" class="fluid">
				<!-- header -->
				<div class="header">
					<tiles:insertAttribute name="header"/>
				</div>
				<!-- //header -->

				<!-- contents -->
				<div class="contents">
	    			<tiles:insertAttribute name="body"/>
				</div>
				<!-- //contents -->
			</div>
			<!-- //contentsWrap -->
				    			
	    	<tiles:insertAttribute name="footer"/>
		</div>
		<!-- //container -->
	</div>
</body>

</html>