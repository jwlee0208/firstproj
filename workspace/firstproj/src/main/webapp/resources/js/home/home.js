function goList(boardId){	
	var menuId = boardId;
	var userId = $("#userId").val();
	var url = "/board/article/list/" + boardId;
	if(userId != null && userId != ''){
		url = "/share/" + userId +"/list/" + boardId;
	} 
	location.href = url;
}
function goHome(){
	location.href = "/home/0";
}

function goInfo(){
	var userId = $("#userId").val();
	var url = "/aboutUs";
	if(userId != null && userId != ''){
		url = "/share/profile/" + userId;
	} 

	location.href = url;
}

function goRegist(boardId){
	location.href = "/user/regist/" + boardId;
}

function goLogin(boardId){
	location.href = "/login/" + boardId;
}

function logout(){
	location.href = "/logout";
}

function goPortal(menuId, catId){
	var baseUrl = "";
	/*
	if(menuId == 6){
		baseUrl = "/player/playerPortal";
	}
	*/
	if(catId == 1){
		baseUrl = "/player/playerPortal";
	}else{
		baseUrl = "/team/teamPortal";
	}
	
	baseUrl += "/" + menuId;
	location.href = baseUrl; 
}

function goClub(menuId){
	
	baseUrl += "/" + menuId;
	location.href = baseUrl; 	
}

function goBoardConfig(){
	location.href = "/board/list/7";
}

function goConfig(){
	location.href = "/config/main";
}

$(function(){
	$("#totSearchText").keypress(function(event){
				
		if(event.which == 13){
			event.preventDefault();

			goTotSearch();
			
		}
	});
});

function goTotSearch(){
	var url 	= '';	
	var userId 	= $("#userId").val();
	
	if(userId != null && userId != ''){
		url = "/share/list";
	}else{
		url = "/board/article/list";
	}

	var frm = $("#totSearchFrm");
	frm.attr("action"	, url);
	frm.attr("method"	, "post");
	frm.submit();
}
