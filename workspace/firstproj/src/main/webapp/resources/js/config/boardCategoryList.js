$(function(){
	$("input[name=createCategory]").click(function(){
		location.href = "/config/board/writeCategory";
	});
});
//페이지 이동
function goPage(pageNo) {
	$("#pageNo").val(pageNo);
	
	$.ajax({
		async : false,
		type : 'POST',
		dataType : 'html',
		url : '/config/board/categoryList',
		data : $("#boardCategoryFrm").serialize(),
		processData : true,
		cache : false,
		success : function(data) {

			if (data != null && data != undefined) {
				var listDiv = $(data).find("#listDiv").html();
				var pageDiv = $(data).find("#pageDiv").html();

				$("#listDiv").html(listDiv);
				$("#pageDiv").html(pageDiv);
			}
		}
	});
}
// 이전 페이지 그룹으로
function goPrevious(pageNo, totalPageCnt) {
	var pageSize = $("#pageSize").val();
	var divide = Math.floor(Number(pageNo) / pageSize);
	var remain = Math.floor(Number(pageNo) % pageSize);
	var prevPageNo = 0;
	if (divide > 0) {
		if (remain > 0)
			divide++;
		prevPageNo = (divide - 1) * Number(pageSize);
	} else {
		return;
	}
	if (prevPageNo < 1) {
		return;
	}
	goPage(prevPageNo);
}
// 다음 페이지 그룹으로
function goNext(pageNo, totalPageCnt) {
	var pageSize = $("#pageSize").val();
	var divide = Math.floor((Number(pageNo) - 1) / (Number(pageSize)));
	var nextPageNo = (divide + 1) * Number(pageSize) + 1;

	if (nextPageNo > Number(totalPageCnt))
		return;
	else
		goPage(nextPageNo);
}
// 처음으로
function goFirst() {
	goPage(1);
}
// 마지막으로
function goEnd() {
	var endPageNo = $("#totalPageCnt").val();
	goPage(endPageNo);
}
function goBoardCategoryModify(boardCategoryId){
	$("#selectedBoardCategoryId").val(boardCategoryId);
	
	var frm = $("#boardCategoryFrm");
	frm.attr("action", "/config/board/modifyCategory");
	frm.attr("method", "get");
	frm.submit();		

}

function goBoardCategoryView(boardCategoryId){
	$("#selectedBoardCategoryId").val(boardCategoryId);
	
	var frm = $("#boardCategoryFrm");
	frm.attr("action", "/config/board/viewCategory");
	frm.attr("method", "get");
	frm.submit();

}

