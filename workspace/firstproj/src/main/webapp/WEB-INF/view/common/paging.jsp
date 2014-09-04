<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%         
    int totalPageCnt = Integer.parseInt(request.getParameter("totalPageCnt"));
    int pageNo       = Integer.parseInt(request.getParameter("pageNo"));
    int startPageNo  = Integer.parseInt(request.getParameter("startPageNo"));  
    int endPageNo    = Integer.parseInt(request.getParameter("endPageNo"));
%> 
<c:set var="totalPageCnt"         value="<%=totalPageCnt %>"/>
<c:set var="pageNo"               value="<%=pageNo %>"/>
<c:set var="startPageNo"          value="<%=startPageNo %>"/>
<c:set var="endPageNo"            value="<%=endPageNo %>"/> 
 
<div class="pagination pagination-centered" id="pageDiv">
	<ul>
		
 
<!-- 리스트내용이 없을때 등록버튼 위치 -->
<c:if test="${totalPageCnt == 0}">
<!--    <span class="split"></span> -->
<!--    <span class="split"></span> -->
</c:if> 
<c:if test="${totalPageCnt > 0}">            
   <c:if test="${startPageNo ne 1}">         
      <li><a class="icon laquo"       href="javascript:void(0);" onclick="javascript:goFirst();">처음</a>  </li>     
      <li><a class="icon lt"          href="javascript:void(0);" onclick="javascript:goPrevious('${pageNo}','${totalPageCnt}');">이전</a> </li>
   </c:if>            
<!--    <span class="split"></span>    -->
   <c:forEach var="loopPageNo" begin="${startPageNo}" end="${endPageNo}">
            <c:if test='${loopPageNo eq pageNo}'><li class="active"><a href="javascript:void(0);">${loopPageNo}</a></li></c:if>
            <c:if test='${loopPageNo ne pageNo}'><li><a href="javascript:void(0);" onclick="javascript:goPage('${loopPageNo}');">${loopPageNo}</a></li></c:if>
   </c:forEach>                             
<!--    <span class="split"></span>                -->
   <c:if test="${endPageNo ne totalPageCnt}">                       
      <li><a class="icon rt"          href="javascript:void(0);" onclick="javascript:goNext('${pageNo}','${totalPageCnt}');">다음</a> </li> 
      <li><a class="icon raquo"       href="javascript:void(0);" onclick="javascript:goEnd();">마지막</a></li>
   </c:if> 
</c:if>
	</ul>
</div>