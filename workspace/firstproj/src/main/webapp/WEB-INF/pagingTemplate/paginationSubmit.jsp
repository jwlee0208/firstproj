<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${pageInfo.totalPage > 0}">
<div class="pagination pagination-centered">
	<ul>
        <c:if test="${pageInfo.totalPage != 1}">
            <c:if test="${pageInfo.startPage > 1}">
         <li><a href="javascript:${pageInfo.scriptName}('${pageInfo.previousScalePage}', '${pageInfo.paramString}')" class="num prev"></a></li>
            </c:if>
        </c:if>
        <c:forEach items="${pageInfo.pages}" var="page" varStatus="status">
            <c:if test="${pageInfo.currentPage != page}">
         <li><a href="javascript:${pageInfo.scriptName}('${page}', '${pageInfo.paramString}')" class="num">${page}</a></li>
            </c:if>
            <c:if test="${pageInfo.currentPage == page}">
         <li><a href="javascript://"><strong class="num">${page}</strong></a></li>
            </c:if>
        </c:forEach>
        <c:if test="${pageInfo.nextScalePage <= pageInfo.totalPage}">
        <li><a href="javascript:${pageInfo.scriptName}('${pageInfo.nextScalePage}', '${pageInfo.paramString}')" class="num next"></a></li>
        </c:if>
    </ul>
</div>
</c:if>