function goList(boardId){	
	location.href = "/board/list.page?boardId=" + boardId + "&menuId=" + boardId;
}
function goHome(){
	location.href = "/home.page?menuId=0";
}

function goInfo(){
	location.href = "/aboutUs.page";
}

function goRegist(boardId){
	location.href = "/user/regist.page?menuId=" + boardId;
}

function goLogin(boardId){
	location.href = "/login?menuId=" + boardId;
}

function logout(){
	location.href = "/logout.page";
}