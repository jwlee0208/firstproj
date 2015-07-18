<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/common/paging.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/board/article/articleList.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
<c:set var="boardName" value=""/>
<c:if test="${boardId eq 1}"><c:set var="boardName" value="자유게시판"/></c:if>
<c:if test="${boardId eq 2}"><c:set var="boardName" value="Q&A"/></c:if>
<c:if test="${boardId eq 3}"><c:set var="boardName" value="기타게시판"/></c:if>	
<div class="container">
	<div class="page-header">
	  <h1>BOARD&nbsp;&nbsp;<small>${boardName}</small></h1>
	</div>	
	
	<ol class="breadcrumb">
	  <li><a href="#" onclick="javascript:goHome();">Home</a></li>
	  <li><a>Board</a></li>
	  <li class="secondBranch active">${boardName}</li>
	</ol>		
	
<!-- 	<h3 class="sub-header">글 목록</h3> -->
	<form id="boardFrm" name="boardFrm" method="post">
	
	<!-- 리스트에서 선택된 게시글 아이디 -->
	<input type="hidden" id="selectedArticleId" name="selectedArticleId" />
	<input type="hidden" id="boardId" name="boardId" value="${boardId}"/>

	<!-- 검색 영역 -->	
	<div class="form-group">
		
		<div class="col-sm-10">
			<input type="hidden" 	id="searchCondition" name="searchCondition" value="titleNcontent"/>
			<input type="text" 		id="searchText" 	 name="searchText" 		class="form-control"/>		
		</div>
		<div class="btn-group">
			<input type="button" onclick="javascript: goSearch();" class="btn btn-default" value="검색"/>
		</div>
	</div>
	
	
	<c:set var="list" value="${boardList}" />	
<div class="col-md-9" role="main">
	<div class="table-responsive" id="listDiv">
		<!-- paging에 필요한 파라미터 -->
		<input type="hidden" id="pageNo" 		name="pageNo" 		value="${pagedResult.pageNo}" /> 
		<input type="hidden" id="totalListCnt" 	name="totalListCnt" value="${pagedResult.totalListCnt}" /> 
		<input type="hidden" id="totalPageCnt" 	name="totalPageCnt" value="${pagedResult.totalPageCnt}" /> 
		<input type="hidden" id="startPageNo" 	name="startPageNo" 	value="${pagedResult.startPageNo}" /> 
		<input type="hidden" id="pageSize" 		name="pageSize" 	value="${pagedResult.pageSize}" />

		<table style="width: 100%;" class="table table-hover">
			<colgroup>
				<col width="10%" />
				<col width="70%" />
				<col width="10%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th>게시글 번호</th>
					<th>제목</th>
					<th>작성일자</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${null ne pagedResult.list && pagedResult.list.size() > 0}">
						<c:forEach var="content" items="${pagedResult.list}">
							<tr>
								<td>${content.articleId}</td>	
								<td onclick="javascript:goView('${content.articleId}');">${content.title}</td>
								<td>${fn:substring(content.createDate, 0, 10)}</td>
								<td>${content.authorNm}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">작성된 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
<div class="col-md-3" role="complementary">
	<nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix-top">
    	<ul class="nav bs-docs-sidenav">
			<li class="">
  				<a href="#js-overview">Overview</a>
				  <ul class="nav">
				    <li class=""><a href="#js-individual-compiled">Individual or compiled</a></li>
				    <li class=""><a href="#js-data-attrs">Data attributes</a></li>
				    <li class=""><a href="#js-programmatic-api">Programmatic API</a></li>
				    <li class=""><a href="#js-noconflict">No conflict</a></li>
				    <li class=""><a href="#js-events">Events</a></li>
				    <li class=""><a href="#js-version-nums">Version numbers</a></li>
				    <li class=""><a href="#js-disabled">When JavaScript is disabled</a></li>
				    <li class=""><a href="#callout-third-party-libs">Third-party libraries</a></li>
				  </ul>
			</li>
			<li class=""><a href="#transitions">Transitions</a></li>
			<li class="">
			  <a href="#modals">Modal</a>
			  <ul class="nav">
			    <li class=""><a href="#modals-examples">Examples</a></li>
			    <li class=""><a href="#modals-sizes">Sizes</a></li>
			    <li class=""><a href="#modals-remove-animation">Remove animation</a></li>
			    <li class=""><a href="#modals-related-target">Varying content based on trigger button</a></li>
			    <li class=""><a href="#modals-usage">Usage</a></li>
			    <li class=""><a href="#modals-options">Options</a></li>
			    <li class=""><a href="#modals-methods">Methods</a></li>
			    <li class=""><a href="#modals-events">Events</a></li>
			  </ul>
			</li>
			<li class="">
			  <a href="#dropdowns">Dropdown</a>
			  <ul class="nav">
			    <li class=""><a href="#dropdowns-examples">Examples</a></li>
			    <li class=""><a href="#dropdowns-usage">Usage</a></li>
			    <li class=""><a href="#dropdowns-methods">Methods</a></li>
			    <li class=""><a href="#dropdowns-events">Events</a></li>
			  </ul>
			</li>
			<li class="">
			  <a href="#scrollspy">Scrollspy</a>
			  <ul class="nav">
			    <li class=""><a href="#scrollspy-examples">Examples</a></li>
			    <li class=""><a href="#scrollspy-usage">Usage</a></li>
			    <li class=""><a href="#scrollspy-methods">Methods</a></li>
			    <li class=""><a href="#scrollspy-options">Options</a></li>
			    <li class=""><a href="#scrollspy-events">Events</a></li>
			  </ul>
			</li>
			<li class="">
			  <a href="#tabs">Tab</a>
			  <ul class="nav">
			    <li class=""><a href="#tabs-examples">Examples</a></li>
			    <li class=""><a href="#tabs-usage">Usage</a></li>
			    <li class=""><a href="#tabs-methods">Methods</a></li>
			    <li class=""><a href="#tabs-events">Events</a></li>
			  </ul>
			</li>
			<li class="">
			  <a href="#tooltips">Tooltip</a>
			  <ul class="nav">
			    <li class=""><a href="#tooltips-examples">Examples</a></li>
			    <li class=""><a href="#tooltips-usage">Usage</a></li>
			    <li class=""><a href="#tooltips-options">Options</a></li>
			    <li class=""><a href="#tooltips-methods">Methods</a></li>
			    <li class=""><a href="#tooltips-events">Events</a></li>
			  </ul>
			</li>
			<li class="">
			  <a href="#popovers">Popover</a>
			  <ul class="nav">
			    <li class=""><a href="#popovers-examples">Examples</a></li>
			    <li class=""><a href="#popovers-usage">Usage</a></li>
			    <li class=""><a href="#popovers-options">Options</a></li>
			    <li class=""><a href="#popovers-events">Events</a></li>
			  </ul>
			</li>
			<li class="">
			  <a href="#alerts">Alert</a>
			  <ul class="nav">
			    <li class=""><a href="#alerts-examples">Examples</a></li>
			    <li class=""><a href="#alerts-usage">Usage</a></li>
			    <li class=""><a href="#alerts-methods">Methods</a></li>
			    <li class=""><a href="#alerts-events">Events</a></li>
			  </ul>
			</li>
			<li class="">
			  <a href="#buttons">Button</a>
			  <ul class="nav">
			    <li class=""><a href="#buttons-stateful">Stateful</a></li>
			    <li class=""><a href="#buttons-single-toggle">Single toggle</a></li>
			    <li class=""><a href="#buttons-checkbox-radio">Checkbox / Radio</a></li>
			    <li class=""><a href="#buttons-methods">Methods</a></li>
			  </ul>
			</li>
			<li class="">
			  <a href="#collapse">Collapse</a>
			  <ul class="nav">
			    <li class=""><a href="#collapse-example">Example</a></li>
			    <li class=""><a href="#collapse-example-accordion">Accordion example</a></li>
			    <li class=""><a href="#collapse-usage">Usage</a></li>
			    <li class=""><a href="#collapse-options">Options</a></li>
			    <li class=""><a href="#collapse-methods">Methods</a></li>
			    <li class=""><a href="#collapse-events">Events</a></li>
			  </ul>
			</li>
			<li class="">
			  <a href="#carousel">Carousel</a>
			  <ul class="nav">
			    <li class=""><a href="#carousel-examples">Examples</a></li>
			    <li class=""><a href="#carousel-usage">Usage</a></li>
			    <li class=""><a href="#carousel-options">Options</a></li>
			    <li class=""><a href="#carousel-methods">Methods</a></li>
			    <li class=""><a href="#carousel-events">Events</a></li>
			  </ul>
			</li>
			<li class="">
			  <a href="#affix">Affix</a>
			  <ul class="nav">
			    <li class=""><a href="#affix-examples">Examples</a></li>
			    <li class=""><a href="#affix-usage">Usage</a></li>
			    <li class=""><a href="#affix-options">Options</a></li>
			    <li class=""><a href="#affix-methods">Methods</a></li>
			    <li class=""><a href="#affix-events">Events</a></li>
			  </ul>
			</li>

              
		</ul>
		<a class="back-to-top" href="#top">Back to top</a>
            
<!-- 		<a href="#" class="bs-docs-theme-toggle" role="button">Preview theme</a> -->
            
	</nav>
</div>	
	</form>
	<!-- paging area -->                                                
	<c:set var="totalListCnt" value="${pagedResult.totalListCnt}"/>
	<c:set var="totalPageCnt" value="${pagedResult.totalPageCnt}"/>
	                                                                                                      
	<jsp:include page="../../common/paging.jsp" flush="false">
	    <jsp:param value="${totalPageCnt}"            name="totalPageCnt"/>
	    <jsp:param value="${pagedResult.pageNo}"      name="pageNo"/>
	    <jsp:param value="${pagedResult.startPageNo}" name="startPageNo"/>
	    <jsp:param value="${pagedResult.endPageNo}"   name="endPageNo"/>   
	</jsp:include>


	<div class="btn-group btn-group-justified" style="padding-bottom: 20px;">
		<div class="btn-group">
			<input type="submit" class="btn btn-default pull-right" value="글쓰기" name="goToWrite" />
		</div>
	</div>	
</div>