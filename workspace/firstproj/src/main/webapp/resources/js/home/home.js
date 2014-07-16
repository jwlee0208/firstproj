function goList(boardCategory){	
	location.href = "/firstproj/list.page?boardCategory=" + boardCategory + "&menuId=" + boardCategory;
}
function goHome(){
	location.href = "/home.page?menuId=0";
}