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