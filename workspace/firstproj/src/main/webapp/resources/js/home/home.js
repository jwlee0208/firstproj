function goList(boardCategory){	
	location.href = "/board/list.page?boardCategory=" + boardCategory + "&menuId=" + boardCategory;
}
function goHome(){
	location.href = "/home.page?menuId=0";
}

function goRegist(boardCategory){
	location.href = "/user/regist.page?menuId=" + boardCategory;
}

function goLogin(boardCategory){
	location.href = "/login?menuId=" + boardCategory;
}

function logout(){
	location.href = "/logout.page";
}