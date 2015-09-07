<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<div class="row">
	<div class="col-md-4">
		<div class="panel panel-danger">
		  <div class="panel-heading">
		    <h3 class="panel-title">개인정보 관련<span class="glyphicon glyphicon-cog" aria-hidden="true" style="float:right;"></span></h3>
		  </div>
		  <div class="panel-body">
		    <c:import url="/config/priv/privInfo" />
		  </div>
		</div>			
	</div>
	<div class="col-md-4">
		<div class="panel panel-info">
		  <div class="panel-heading">
		    <h3 class="panel-title">게시판 관련<span class="glyphicon glyphicon-cog" aria-hidden="true" style="float:right;"></span></h3>
		  </div>
		  <div class="panel-body">
		    <c:import url="/common/sideBoardList/${userInfo.userId}" />
		  </div>
		</div>		
	</div>
	<div class="col-md-4">
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">마이 쉐어<span class="glyphicon glyphicon-cog" aria-hidden="true" style="float:right;"></span></h3>
		  </div>
		  <div class="panel-body">
		    Panel content
		  </div>
		</div>			
	</div>
</div>