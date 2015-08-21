$(document).on("ready", function() {
	$("input[name='goToWrite']").on("click", function() {
		var url 	= '';	//"/board/article/write.page?boardId="+$("#boardId").val();
		var userId 	= $("#userId").val();
		if(userId != null && userId != ''){
			url = "/share/" + userId + "/write/" + $("#boardId").val();
		}else{
			url = "/board/article/write/" + $("#boardId").val();
		}
		location.href = url;
	});
});
// 페이지 이동
function goPage(pageNo) {
	$("#pageNo").val(pageNo);
	var url 	= '/board/article/list';
	var userId 	= $("#userId").val();
	if(userId != null && userId != ''){
		url = "/share/" + userId + "/list/" + $("#boardId").val();
	}
	
	$.ajax({
		async 		: false,
		type 		: 'POST',
		dataType 	: 'html',
		url 		: url ,				//'/board/article/list.page',
		data 		: $("#boardFrm").serialize(),
		processData : true,
		cache 		: false,
		success 	: function(data) {

			if (data != null && data != undefined) {
				var listDiv = $(data).find("#listDiv").html();
				var pageDiv = $(data).find("#pageDiv").html();

				$("#listDiv").html(listDiv);
				$("#pageDiv").html(pageDiv);
			}
		}
	});
}

//// 이전 페이지 그룹으로
//function goPrevious(pageNo, totalPageCnt) {
//	var pageSize = $("#pageSize").val();
//	var divide = Math.floor(Number(pageNo) / pageSize);
//	var remain = Math.floor(Number(pageNo) % pageSize);
//	var prevPageNo = 0;
//	if (divide > 0) {
//		if (remain > 0)
//			divide++;
//		prevPageNo = (divide - 1) * Number(pageSize);
//	} else {
//		return;
//	}
//	if (prevPageNo < 1) {
//		return;
//	}
//	goPage(prevPageNo);
//}
//// 다음 페이지 그룹으로
//function goNext(pageNo, totalPageCnt) {
//	var pageSize = $("#pageSize").val();
//	var divide = Math.floor((Number(pageNo) - 1) / (Number(pageSize)));
//	var nextPageNo = (divide + 1) * Number(pageSize) + 1;
//
//	if (nextPageNo > Number(totalPageCnt))
//		return;
//	else
//		goPage(nextPageNo);
//}
//// 처음으로
//function goFirst() {
//	goPage(1);
//}
//// 마지막으로
//function goEnd() {
//	var endPageNo = $("#totalPageCnt").val();
//	goPage(endPageNo);
//}
//function goSearch(){
//	goPage(1);
//}
// 게시글 조회
function goView(articleId){
	var url 	= '';	
	var userId 	= $("#userId").val();
	if(userId != null && userId != ''){
		url = "/share/" + userId + "/view/" + articleId;
	}else{
		url = "/board/article/view/" + articleId;
	}

	location.href = url;		//"/board/article/view/"+articleId;	
//	$("#selectedArticleId").val(articleId);
//	
//	var frm = $("#boardFrm");
//	frm.attr("action", "/board/article/view/" + articleId);
//	frm.attr("method", "get");
//	frm.submit();
}

$(function(){
	$("#searchText").keypress(function(event){
				
		if(event.which == 13){
			event.preventDefault();

			var url 	= '';	
			var userId 	= $("#userId").val();
			if(userId != null && userId != ''){
				url = "/share/" + userId + "/list/" + $("#boardId").val();
			}else{
				url = "/board/article/list";
			}

			var frm = $("#boardFrm");
			frm.attr("url"		, url);
			frm.attr("method"	, "post");
			frm.submit();
		}
	});
	
})


