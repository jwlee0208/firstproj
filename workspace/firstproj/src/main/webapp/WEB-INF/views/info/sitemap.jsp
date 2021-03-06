<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="container">
	<h1 id="btn-groups" class="page-header">Site Map</h1>		
	<ol class="breadcrumb">
		<li><a href="#" onclick="javascript:goHome();">Home</a></li>
		<li>Site Map</li>
	</ol>		
	
	<h2 id="btn-groups" class="page-header">Online Authlete Agent Service</h2>
	<div class="row" style="padding-bottom:20px; margin-left:10px;">
		<div class="col-md-4"><a href="/">Home</a></div>
		<div class="col-md-4">
			<p class="text-danger">Player</p>
			<ul>
				<li><a href="/player/playerPortal/6">Player List</a></li>
			</ul>
		</div>
		<div class="col-md-4">
			<p class="text-danger">Team</p>
			<ul>
				<li><a href="/player/playerPortal/6">Team List</a></li>
			</ul>
		</div>
	</div>
	<h2 id="btn-groups" class="page-header">Share(like Blog)</h2>
	<div class="row" style="padding-bottom:20px; margin-left:10px;">
		<div class="col-md-12"><a href="/share/main">main</a></div>
	</div>
	<h2 id="btn-groups" class="page-header">Membership</h2>
	<div class="row" style="padding-bottom:20px; margin-left:10px;">
		<div class="col-md-4">
			<a href="/user/regist/6">Sign up</a>
		</div>
		<div class="col-md-4">
			<a href="/login/7">Sign in</a>
		</div>
		<div class="col-md-4">
			<a href="/user/forgotPassword">forgot password</a>
		</div>
	</div>
	<h2 id="btn-groups" class="page-header">Rules</h2>
	<div class="row" style="padding-bottom:20px; margin-left:10px;">
		<p class="text-danger">Rules</p>
		<div class="col-md-12">
			<ul>
				<li><a href="/common/privateRule">Private Policy</a></li>
				<li><a href="/common/useRule">Terms of Use</a></li>
			</ul>
		</div>
	</div>

</div>