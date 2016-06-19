	function goProfileView(profileId, profileType){
		
		$.ajax({
			url : '/profile/view/' + profileType +"/" + profileId,
			data : '',
			dataType : 'html',
			success : function(data){
				$('.modal-title').html(($(data).find("h2").html()));
				$('.modal-body').html(data);
// 				$('.modal-body').html(($(data).find(".container").html()));
			}
		});
	}
	// modal 창 조회후 close시 html 초기화 : css issue
	function initModalHtml(){
		$('.modal-body').html('');
	}
