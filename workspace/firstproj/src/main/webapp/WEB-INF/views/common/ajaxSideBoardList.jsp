<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		  <div class="list-group">
    <c:if test="${sideBoardList ne null}">	
    	<c:forEach var="boardInfo" items="${sideBoardList}">
			<a href="/board/article/list/${boardInfo.boardId}/1" class="list-group-item">${boardInfo.boardName} <span class="badge"> ${boardInfo.boardArticleCnt} </span></a>
    	</c:forEach>
    </c:if>			  
          </div>
<!-- 	<nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix-top"> -->
<!--     	<ul class="nav bs-docs-sidenav"> -->
    	
<%--     <c:if test="${sideBoardList ne null}">	 --%>
<%--     	<c:forEach var="boardInfo" items="${sideBoardList}"> --%>
<!--     		<li class=""> -->
<%--   				<a href="/board/article/list/${boardInfo.boardId}/1">${boardInfo.boardName} <span class="badge"> ${boardInfo.boardArticleCnt} </span></a> --%>
<!--   			</li>	 -->
<%--     	</c:forEach> --%>
<%--     </c:if>	 --%>
    	
    	
<!-- 			<li class=""> -->
<!--   				<a href="#js-overview">Overview</a> -->
<!-- 				  <ul class="nav"> -->
<!-- 				    <li class=""><a href="#js-individual-compiled">Individual or compiled</a></li> -->
<!-- 				    <li class=""><a href="#js-data-attrs">Data attributes</a></li> -->
<!-- 				    <li class=""><a href="#js-programmatic-api">Programmatic API</a></li> -->
<!-- 				    <li class=""><a href="#js-noconflict">No conflict</a></li> -->
<!-- 				    <li class=""><a href="#js-events">Events</a></li> -->
<!-- 				    <li class=""><a href="#js-version-nums">Version numbers</a></li> -->
<!-- 				    <li class=""><a href="#js-disabled">When JavaScript is disabled</a></li> -->
<!-- 				    <li class=""><a href="#callout-third-party-libs">Third-party libraries</a></li> -->
<!-- 				  </ul> -->
<!-- 			</li> -->
<!-- 			<li class=""><a href="#transitions">Transitions</a></li> -->
<!-- 			<li class=""> -->
<!-- 			  <a href="#modals">Modal</a> -->
<!-- 			  <ul class="nav"> -->
<!-- 			    <li class=""><a href="#modals-examples">Examples</a></li> -->
<!-- 			    <li class=""><a href="#modals-sizes">Sizes</a></li> -->
<!-- 			    <li class=""><a href="#modals-remove-animation">Remove animation</a></li> -->
<!-- 			    <li class=""><a href="#modals-related-target">Varying content based on trigger button</a></li> -->
<!-- 			    <li class=""><a href="#modals-usage">Usage</a></li> -->
<!-- 			    <li class=""><a href="#modals-options">Options</a></li> -->
<!-- 			    <li class=""><a href="#modals-methods">Methods</a></li> -->
<!-- 			    <li class=""><a href="#modals-events">Events</a></li> -->
<!-- 			  </ul> -->
<!-- 			</li> -->
<!-- 			<li class=""> -->
<!-- 			  <a href="#dropdowns">Dropdown</a> -->
<!-- 			  <ul class="nav"> -->
<!-- 			    <li class=""><a href="#dropdowns-examples">Examples</a></li> -->
<!-- 			    <li class=""><a href="#dropdowns-usage">Usage</a></li> -->
<!-- 			    <li class=""><a href="#dropdowns-methods">Methods</a></li> -->
<!-- 			    <li class=""><a href="#dropdowns-events">Events</a></li> -->
<!-- 			  </ul> -->
<!-- 			</li> -->
<!-- 			<li class=""> -->
<!-- 			  <a href="#scrollspy">Scrollspy</a> -->
<!-- 			  <ul class="nav"> -->
<!-- 			    <li class=""><a href="#scrollspy-examples">Examples</a></li> -->
<!-- 			    <li class=""><a href="#scrollspy-usage">Usage</a></li> -->
<!-- 			    <li class=""><a href="#scrollspy-methods">Methods</a></li> -->
<!-- 			    <li class=""><a href="#scrollspy-options">Options</a></li> -->
<!-- 			    <li class=""><a href="#scrollspy-events">Events</a></li> -->
<!-- 			  </ul> -->
<!-- 			</li> -->
<!-- 			<li class=""> -->
<!-- 			  <a href="#tabs">Tab</a> -->
<!-- 			  <ul class="nav"> -->
<!-- 			    <li class=""><a href="#tabs-examples">Examples</a></li> -->
<!-- 			    <li class=""><a href="#tabs-usage">Usage</a></li> -->
<!-- 			    <li class=""><a href="#tabs-methods">Methods</a></li> -->
<!-- 			    <li class=""><a href="#tabs-events">Events</a></li> -->
<!-- 			  </ul> -->
<!-- 			</li> -->
<!-- 			<li class=""> -->
<!-- 			  <a href="#tooltips">Tooltip</a> -->
<!-- 			  <ul class="nav"> -->
<!-- 			    <li class=""><a href="#tooltips-examples">Examples</a></li> -->
<!-- 			    <li class=""><a href="#tooltips-usage">Usage</a></li> -->
<!-- 			    <li class=""><a href="#tooltips-options">Options</a></li> -->
<!-- 			    <li class=""><a href="#tooltips-methods">Methods</a></li> -->
<!-- 			    <li class=""><a href="#tooltips-events">Events</a></li> -->
<!-- 			  </ul> -->
<!-- 			</li> -->
<!-- 			<li class=""> -->
<!-- 			  <a href="#popovers">Popover</a> -->
<!-- 			  <ul class="nav"> -->
<!-- 			    <li class=""><a href="#popovers-examples">Examples</a></li> -->
<!-- 			    <li class=""><a href="#popovers-usage">Usage</a></li> -->
<!-- 			    <li class=""><a href="#popovers-options">Options</a></li> -->
<!-- 			    <li class=""><a href="#popovers-events">Events</a></li> -->
<!-- 			  </ul> -->
<!-- 			</li> -->
<!-- 			<li class=""> -->
<!-- 			  <a href="#alerts">Alert</a> -->
<!-- 			  <ul class="nav"> -->
<!-- 			    <li class=""><a href="#alerts-examples">Examples</a></li> -->
<!-- 			    <li class=""><a href="#alerts-usage">Usage</a></li> -->
<!-- 			    <li class=""><a href="#alerts-methods">Methods</a></li> -->
<!-- 			    <li class=""><a href="#alerts-events">Events</a></li> -->
<!-- 			  </ul> -->
<!-- 			</li> -->
<!-- 			<li class=""> -->
<!-- 			  <a href="#buttons">Button</a> -->
<!-- 			  <ul class="nav"> -->
<!-- 			    <li class=""><a href="#buttons-stateful">Stateful</a></li> -->
<!-- 			    <li class=""><a href="#buttons-single-toggle">Single toggle</a></li> -->
<!-- 			    <li class=""><a href="#buttons-checkbox-radio">Checkbox / Radio</a></li> -->
<!-- 			    <li class=""><a href="#buttons-methods">Methods</a></li> -->
<!-- 			  </ul> -->
<!-- 			</li> -->
<!-- 			<li class=""> -->
<!-- 			  <a href="#collapse">Collapse</a> -->
<!-- 			  <ul class="nav"> -->
<!-- 			    <li class=""><a href="#collapse-example">Example</a></li> -->
<!-- 			    <li class=""><a href="#collapse-example-accordion">Accordion example</a></li> -->
<!-- 			    <li class=""><a href="#collapse-usage">Usage</a></li> -->
<!-- 			    <li class=""><a href="#collapse-options">Options</a></li> -->
<!-- 			    <li class=""><a href="#collapse-methods">Methods</a></li> -->
<!-- 			    <li class=""><a href="#collapse-events">Events</a></li> -->
<!-- 			  </ul> -->
<!-- 			</li> -->
<!-- 			<li class=""> -->
<!-- 			  <a href="#carousel">Carousel</a> -->
<!-- 			  <ul class="nav"> -->
<!-- 			    <li class=""><a href="#carousel-examples">Examples</a></li> -->
<!-- 			    <li class=""><a href="#carousel-usage">Usage</a></li> -->
<!-- 			    <li class=""><a href="#carousel-options">Options</a></li> -->
<!-- 			    <li class=""><a href="#carousel-methods">Methods</a></li> -->
<!-- 			    <li class=""><a href="#carousel-events">Events</a></li> -->
<!-- 			  </ul> -->
<!-- 			</li> -->
<!-- 			<li class=""> -->
<!-- 			  <a href="#affix">Affix</a> -->
<!-- 			  <ul class="nav"> -->
<!-- 			    <li class=""><a href="#affix-examples">Examples</a></li> -->
<!-- 			    <li class=""><a href="#affix-usage">Usage</a></li> -->
<!-- 			    <li class=""><a href="#affix-options">Options</a></li> -->
<!-- 			    <li class=""><a href="#affix-methods">Methods</a></li> -->
<!-- 			    <li class=""><a href="#affix-events">Events</a></li> -->
<!-- 			  </ul> -->
<!-- 			</li> -->

              
<!-- 		</ul> -->
<!-- 		<a class="back-to-top" href="#top">Back to top</a> -->
<!-- 	</nav> -->
