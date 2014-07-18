function goList(boardCategory){	
	if(boardCategory < 6){
		location.href = "/firstproj/list.page?boardCategory=" + boardCategory + "&menuId=" + boardCategory;		
	}else{
		location.href = "/prohibite/list.page?menuId=" + boardCategory;
	}

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