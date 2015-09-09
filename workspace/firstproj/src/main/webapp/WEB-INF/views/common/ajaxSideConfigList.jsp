<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.list-group-item-category {
	z-index: 0;
    color: #fff;
    background-color: #efefef;
    border-color: #ddd;
}
</style>
<script>
	function goConfigMain(){
		location.href = "/config/main"
	}
</script>
		<div class="list-group">  		
    		<a href="#" class="list-group-item list-group-item-category" style="font-weight: bold;" onclick="javascript:goConfigMain();">Personal Setting</a>
			<a href="#" class="list-group-item" onclick="javascript:configDefaultPriv();">개인 정보 수정</a>
			<a href="#" class="list-group-item" onclick="javascript:configProfileInfo();">마이 쉐어 정보</a>
			<a href="#" class="list-group-item" onclick="javascript:configBoardCategory();">게시판 카테고리 설정</a>
			<a href="#" class="list-group-item" onclick="javascript:configBoard();">게시판 목록 설정</a>    			    			
        </div>  