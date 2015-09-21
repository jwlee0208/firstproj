<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag" %>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0); 
%>   
<c:choose>
	<c:when test="${userInfo ne null}">
		<tag:message code="common.username"/> :  ${userInfo.userNm}</br>
		<tag:message code="common.userid"/> : ${userInfo.userId}</br>
		<tag:message code="common.email"/> : ${userInfo.email}</br>
		<tag:message code="common.cellphone"/> : ${userInfo.phoneNo}</br>
		<tag:message code="common.nationality"/> : ${userInfo.nationality}</br>
		<tag:message code="common.language"/> : ${userInfo.language}</br>
		<tag:message code="common.joindate"/> : ${fn:substring(userInfo.joinDate, 0, 10)}</br>
	</c:when>
</c:choose>	
	