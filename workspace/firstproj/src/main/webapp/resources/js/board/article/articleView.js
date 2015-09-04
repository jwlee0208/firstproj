var frm = $("#viewFrm");

$(function(){
	/**
	 * 게시글 목록으로 이동
	 */
	$("#goToList").on("click", function(){
		goList($("#viewFrm #boardId").val());
	});
	/**
	 * 이전 글 조회
	 */
	$("#previous").on("click", function(){
		var prevArticleId = $("#prevArticleId").val();
		goView(prevArticleId);
	});
	/**
	 * 다음 글 조회
	 */
	$("#next").on("click", function(){
		var nextArticleId = $("#nextArticleId").val();
		goView(nextArticleId);
	});
	/**
	 * 게시글 수정
	 */
	$("#goToModify").on("click", function(){
		location.href = "/board/article/modify/" + $("#selectedArticleId").val() +"/" + $("#viewFrm #boardId").val();
	});
	/**
	 * 게시글 삭제
	 */
	$("#goToDelete").on("click", function(){
		$.ajax({
			url : '/board/article/deleteBoardArticle.json',
			type : 'post',
			data : {selectedArticleId : $("#selectedArticleId").val()},
			dataType : 'json',
			success : function(data){
				if(data.result){
					location.href = "/board/article/list/" + $("#viewFrm #boardId").val() + "/" + $("#viewFrm #boardId").val();
				}else{
					alert(data.validate);
				}
			},
			error : function(xhr, textStatus, thrownError){
				console.log("error : " + xhr.status + ", " + textStatus + ", " + thrownError);
			}
		});
	});	
});

//게시글 조회
function goView(articleId){
	location.href = "/board/article/view/"+articleId;	
}