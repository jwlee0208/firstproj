function goList(boardId){	
	location.href = "/board/article/list?boardId=" + boardId + "&menuId=" + boardId;
}
function goHome(){
	location.href = "/home?menuId=0";
}

function goInfo(){
	location.href = "/aboutUs";
}

function goRegist(boardId){
	location.href = "/user/regist?menuId=" + boardId;
}

function goLogin(boardId){
	location.href = "/login?menuId=" + boardId;
}

function logout(){
	location.href = "/logout";
}

function goPlayer(menuId){
	var baseUrl = "/player/playerList";
	if(menuId == 6){
		baseUrl = "/player/playerPortal";
	}
	baseUrl += "?menuId=" + menuId;
	location.href = baseUrl; 
//		"/player/attrElemMapList";
}