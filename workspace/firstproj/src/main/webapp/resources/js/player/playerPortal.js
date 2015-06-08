	$(document).on("ready", function() {
		$("input[name='goToRegist']").on("click", function() {
			location.href = "/player/write.page";
		});

		loadPlayerList();
	});
	
	function loadPlayerList(){
		var frm = $("#listFrm").serialize();
		$("#listDiv").load("/player/ajaxPlayerList", frm, function(){
//			alert('after load page');
		});	
	}

	$(function() {

	    var availableTags = [
	      "ActionScript",
	      "AppleScript",
	      "Asp",
	      "BASIC",
	      "C",
	      "C++",
	      "Clojure",
	      "COBOL",
	      "ColdFusion",
	      "Erlang",
	      "Fortran",
	      "Groovy",
	      "Haskell",
	      "Java",
	      "JavaScript",
	      "Lisp",
	      "Perl",
	      "PHP",
	      "Python",
	      "Ruby",
	      "Scala",
	      "Scheme"
	    ];

	    $( "#searchText" ).autocomplete({
			source : function(request, response){
				$.ajax({
					url : '/player/autoComplete.json',
					data : $("#listFrm").serialize(),
					dataType : 'json',
					method : 'post',
					success : function (data) {
						var searchResult = data.searchResult;
						console.log(searchResult);
						response(searchResult);
					}
				});
			}
	    }).data("ui-autocomplete")._renderItem = function(ul, item) {
			var $a = $("<a></a>").text(item.label);
			highlightText(this.term, $a);
			return $("<li></li>").append($a).appendTo(ul);
		};

		$( "#searchText" ).keypress(function( event ) {
			  if ( event.which == 13 ) {
				  event.preventDefault();
				  loadPlayerList();
			  }			  
		});		

		$("input[name='goToRegist']").on("click", function() {
			location.href = "/player/write.page";
		});
	});
	  
	  
	// autoComplete highlight 
	// REf.] http://salman-w.blogspot.kr/2013/12/jquery-ui-autocomplete-examples.html?m=1#example-2
	function highlightText(text, $node) {
		var searchText = $.trim(text).toLowerCase(), currentNode = $node.get(0).firstChild, matchIndex, newTextNode, newSpanNode;
		while ((matchIndex = currentNode.data.toLowerCase().indexOf(searchText)) >= 0) {
			newTextNode = currentNode.splitText(matchIndex);
			currentNode = newTextNode.splitText(searchText.length);
			newSpanNode = document.createElement("span");
			newSpanNode.className = "highlight";
			currentNode.parentNode.insertBefore(newSpanNode, currentNode);
			newSpanNode.appendChild(newTextNode);
		}
	}

	function goDetail(userId){
		
		var frm = $("#listFrm");
		frm.attr("action", "/player/playerDetailView.page?userId=" + userId);
		frm.attr("method", "post");
		frm.submit();
	}

	//리스트 페이징을 위한 메서드
	function ajaxPagination(page){
	    var newPage = isEmpty(page) ? "1" : page;
	    $("input[name=page]").val(newPage);

	    loadPlayerList();
	}    

	function isEmpty(val){
		var result = false;
		
		if(val == 'undefined' || val == null || val ==''){
			result = true;
		}
		return result;
	}


