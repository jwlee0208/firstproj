$(document).on("ready", function(){
//	$("input[name='cancelToWrite']").on("click", function(){
	$("#cancelToWrite").on("click", function(){	
		if(confirm('작성을 취소하시겠습니까?')){
			goList();
//			location.href = "/angular/test12.page";
		}
	});
	
//	$("input[name='saveToWrite']").on("click", function(){
	$("#saveToWrite").on("click", function(){	
//		var content = tinyMCE.get('content').getContent();
//		$("#content").val(content);
		
		$.ajax({
			url : '/prohibite/insertProhibiteWord.json',
			type : 'post',
			data : $("#writeFrm").serialize(),
			dataType : 'json',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data){
				console.log("data : " + data.result);
				if(data.result){
					goList();
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

function goList(){
	var frm = $("#writeFrm");
	frm.attr("action", "/prohibite/list.page");
	frm.attr("method", "post");
	frm.submit();
} 