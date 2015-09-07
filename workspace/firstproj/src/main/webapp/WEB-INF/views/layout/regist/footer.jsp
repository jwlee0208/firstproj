<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css"/>
<input type="hidden" id="buildType" value="${buildType}"/>
<script>
if($("#buildType").val()=='prod'){
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-65838621-1', 'auto');
  ga('send', 'pageview');
}
</script>
<footer class="footer">
	<div class="container">
	  <p><a href="https://www.facebook.com/jwlee0524" target="_blank" class="btn btn-primary">Facebook</a>
	  &nbsp;&nbsp;&nbsp;<a target="_blank" class="btn btn-primary" href="/aboutUs/5">contact</a>&nbsp;&nbsp;&nbsp;<a target="_blank" class="btn btn-primary" href="/share/jwlee">developer's blog</a></p>
	  <p>Copyrightⓒ2014 All right reserved by leejinwon</p>
      <p><a href="#">Back to top</a></p>
    </div>  
</footer>