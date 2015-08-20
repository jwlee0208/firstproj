function goList(boardId){	
	var menuId = boardId;
	var userId = $("#userId").val();
	var url = "/board/article/list/" + boardId + "/" + menuId;
	if(userId != null && userId != ''){
		url = "/share/" + userId +"/list/" + boardId + "/" + menuId;
	} 
	location.href = url;
}
function goHome(){
	location.href = "/home3/0";
}

function goInfo(){
	location.href = "/aboutUs/5";
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
	location.href = "/config/main"
}