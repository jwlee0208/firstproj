<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.list-group-item-category {
	z-index: 0;
    color: #fff;
    background-color: #efefef;
    border-color: #ddd;
}
</style>
		<div class="list-group">  
    <c:if test="${sideBoardList ne null}">	
    	<c:set var="classInfo" value="collapse in"/>	
    	<c:forEach var="categoryInfo" items="${sideBoardList}" varStatus="index">
    		<a href="#sideCategoryDiv${categoryInfo.boardCategoryId}" class="list-group-item list-group-item-category" style="font-weight: bold;" data-toggle="collapse" aria-controls="sideCategoryDiv${categoryInfo.boardCategoryId}">${categoryInfo.boardCategoryName}</a>
    		<div id="sideCategoryDiv${categoryInfo.boardCategoryId}" class="${classInfo}">
    		<c:set var="boardList" value="${categoryInfo.sideBoardList}"/>
    		
    		<c:if test="${boardList ne null}">
    			<c:forEach var="boardInfos" items="${boardList}">
	    		<c:set var="url" value="/board/article/list/${boardInfos.boardInfo.boardId}"/>
	    		<c:if test="${userId ne null && userId ne ''}">
	    		<c:set var="url" value="/share/${userId}/list/${boardInfos.boardInfo.boardId}"/>
	    		</c:if>
				<a href="${url}" class="list-group-item" id="sideBoardMenu_${boardInfos.boardInfo.boardId}">&nbsp;&nbsp;&nbsp;${boardInfos.boardInfo.boardName} <span class="badge"> ${boardInfos.boardArticleCnt} </span></a>    			    			
    			</c:forEach>
    		</c:if>
    		</div>
    	
    	</c:forEach>
    </c:if>			  
        </div>  