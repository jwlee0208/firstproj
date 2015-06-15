function goList(boardId){	
	var menuId = boardId;
	location.href = "/board/article/list/" + boardId + "/" + menuId;
}
function goHome(){
	location.href = "/home/0";
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

function goPlayer(menuId){
	var baseUrl = "/player/playerList";
	if(menuId == 6){
		baseUrl = "/player/playerPortal";
	}
	baseUrl += "/" + menuId;
	location.href = baseUrl; 
//		"/player/attrElemMapList";
}

function goBoardConfig(){
	location.href = "/board/list/7";
}