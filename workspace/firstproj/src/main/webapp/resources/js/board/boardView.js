$(document).on("ready", function(){
	$("#goToList").on("click", function(){
		goBoardList();
	});
	
	$("#previous").on("click", function(){
		var prevBoardId = $("#prevBoardId").val();
		goBoardView(prevBoardId);
	});
	$("#next").on("click", function(){
		var nextBoardId = $("#nextBoardId").val();
		goBoardView(nextBoardId);
	});
	
	$("#goToModify").on("click", function(){
		var frm = $("#viewFrm");
		frm.attr("action", "/board/modify");
		frm.attr("method", "post");
		frm.submit();		
	});
	
});

//게시글 조회
function goBoardView(boardId){
	
	$("#selectedBoardId").val(boardId);
	
	var frm = $("#viewFrm");
	frm.attr("action", "/board/view");
	frm.attr("method", "post");
	frm.submit();
}

function goBoardList(){	
	location.href = "/board/list";
}

function goBoardModify(boardId){
	
	$("#selectedBoardId").val(boardId);
	
	var frm = $("#viewFrm");
	frm.attr("action", "/board/modifyBoard");
	frm.attr("method", "post");
	frm.submit();		
}