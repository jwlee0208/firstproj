	$(document).on("ready", function() {
		$("input[name='goToRegist']").on("click", function() {
			console.log('goTAoWrite');
			location.href = "/player/write.page";
		});

		
		$( "#searchText" ).keypress(function( event ) {
			  if ( event.which == 13 ) {
				  event.preventDefault();
			  }			  
			  goSearch();
		});
	});

	function setChildCategory(){
		var catId = $("#cat1").val();
		$.ajax({
			url : '/player/childCategoryList.json',
			data : {parentCatId : catId},
			method : 'post',
			dateType : 'json',
			success : function(data){

				var childCatList = data.childCatList;
				var childCatListLength = childCatList.length;
				
				if(childCatListLength > 0){
					for(var i = 0 ; i < childCatListLength ; i++){
						$("#cat2").append("<option value=\""+ childCatList[i].catId +"\">" + childCatList[i].categoryNameStr + "</option>");
					}
				}else{
					$("#cat2 option").remove();
					$("#cat2").append("<option value=\"\">카테고리를 선택해 주세요.</option>");
				}

				$("#selectedCatId").val(catId);
				initAttrElement();
				$("#attrElemList").html('');
				goPage(1);
			}
		});	
	}

	function setAttrList(){
		var catId = $("#cat2").val();
		searchAttrList(catId);
	}

	function searchAttrList(catId){
		initAttrElement();
		$.ajax({
			url : '/player/attrElementList.json',
			data : {catId : catId, searchText : $("#searchText").val()},
			method : 'post',
			dateType : 'json',
			success : function(data){

				if(data != null){
					var attrElementList = data.attrElementList;

					if(attrElementList != null){
						var attrElementListLength = attrElementList.length;
						var prevAttrId = 0;
						var innerHtml = "<div style=\"padding-top: 10px;padding-left: 10px;padding-bottom: 10px;\">";
						for(var i = 0 ; i < attrElementListLength ; i++){
// 							console.log(attrElementList[i].attrElemName + ", " + attrElementList[i] + ", " + attrElementList[i].attrName);

							var attrId = attrElementList[i].attrId;

							if(prevAttrId == 0 || (prevAttrId != 0 && attrId > prevAttrId)){
								innerHtml += "<div id=\"" + attrId +"\" onclick=\"javascript:attrFilterList(" + attrId + ");\" style=\"font-weight:bold;\">" + attrElementList[i].attrNameStr + "</div>";
							}

							innerHtml += "<label class=\"checkbox-inline\"><input type=\"checkbox\" id=\"attrElem_" + attrElementList[i].attrElemId +"\" " + " name=\"" + attrElementList[i].attrElemId + "\" class=\"attrElemChkBox\" value=\"" + attrElementList[i].attrElemId + "\"/>" + attrElementList[i].attrElemNameStr + "</label>";

							prevAttrId = attrId;
						}
						innerHtml += "</div>";
						$("#attrElemList").html(innerHtml);
						// 각 체크박스에  onclick 이벤트 설정
						$(".attrElemChkBox").attr("onclick", "javascript:attrElemFilterList();");

						$("#selectedCatId").val(catId);

						goPage(1);
						
					}
				}
			}				
		});
	}
	function attrFilterList(attrId){
		$("#selectedAttrId").val(attrId);
		goPage(1);
		
	} 
	
	function attrElemFilterList(){
		var attrElemIds = "";
		
		$.each($(".attrElemChkBox"), function(index, value){

			if($(this).is(":checked")){
				attrElemIds += $(this).val();
				attrElemIds += ",";	
			}	
			
		});
		if(attrElemIds != ""){
			attrElemIds += "end";
		}
		
		attrElemIds = attrElemIds.replace(/,end/g,"");

		$("#selectedAttrElemId").val(attrElemIds);
				
		goPage(1);

	}
	
	function initAttrElement(){
		// 선택된 속성 항목을 초기화
		$("#selectedAttrElemId").val('');
	}
