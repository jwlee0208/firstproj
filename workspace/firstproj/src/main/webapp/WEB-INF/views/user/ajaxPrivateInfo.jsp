<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0); 
%>   
<c:choose>
	<c:when test="${userInfo ne null}">
		이름 :  ${userInfo.userNm}</br>
		아이디 : ${userInfo.userId}</br>
		이메일 : ${userInfo.email}</br>
		핸드폰 번호 : ${userInfo.phoneNo}</br>
		국적 : ${userInfo.nationality}</br>
		언어 : ${userInfo.language}</br>
		가입일자 : ${fn:substring(userInfo.joinDate, 0, 10)}</br>
	</c:when>
</c:choose>	
	