var frm = $("#viewFrm");

$(document).on("ready", function(){
	$("#goToList").on("click", function(){
		goList($("#boardCategory").val());
	});
	
	$("#previous").on("click", function(){
		var prevBoardId = $("#prevBoardId").val();
		goView(prevBoardId);
	});
	$("#next").on("click", function(){
		var nextBoardId = $("#nextBoardId").val();
		goView(nextBoardId);
	});
	
});

//게시글 조회
function goView(boardId){
	
	$("#selectedBoardId").val(boardId);
	
	var frm = $("#viewFrm");
	frm.attr("action", "/firstproj/view.page");
	frm.attr("method", "post");
	frm.submit();
}