var frm = $("#viewFrm");

$(document).on("ready", function(){
	$("#goToList").on("click", function(){
		goList($("#boardId").val());
	});
	
	$("#previous").on("click", function(){
		var prevArticleId = $("#prevArticleId").val();
		goView(prevArticleId);
	});
	$("#next").on("click", function(){
		var nextArticleId = $("#nextArticleId").val();
		goView(nextArticleId);
	});
	
});

//게시글 조회
function goView(articleId){
	
	$("#selectedArticleId").val(articleId);
	
	var frm = $("#viewFrm");
	frm.attr("action", "/board/article/view.page");
	frm.attr("method", "post");
	frm.submit();
}