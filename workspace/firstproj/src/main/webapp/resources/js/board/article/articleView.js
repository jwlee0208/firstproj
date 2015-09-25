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
		var result = confirm('진짜 삭제하시겠습니까?');
		if(result){
			$.ajax({
				url 		: '/board/article/deleteBoardArticle/'+$("#selectedArticleId").val(),
				type 		: 'post',
				dataType 	: 'json',
				success 	: function(data){
					if(data.result){
						goList($("#viewFrm #boardId").val());
					}else{
						alert('삭제되지 않았습니다.');
					}
				},
				error : function(xhr, textStatus, thrownError){
					console.log("error : " + xhr.status + ", " + textStatus + ", " + thrownError);
				}
			});			
		}
	});	
});

//게시글 조회
function goView(articleId){
	location.href = "/board/article/view/"+articleId;	
}