function editorImgUploadComplete(fileStr){
	var hostname = "jwlee0208.cdn3.cafe24.com";		//location.host;
	  
	  if( fileStr.length > 0 ){	   
	   var strImg = "<br><img src='http://" + hostname + fileStr + "' border=0>";		  
//	   var strImg = "<br><img src='http://" + hostname + getContextPath() + fileStr + "' border=0>";
	   var contents = tinyMCE.activeEditor.getDoc().body.innerHTML;	   
	   tinyMCE.activeEditor.setContent( contents + strImg);
	  }
}

function share(type, articleId){
	window.open("http://www.facebook.com/sharer/sharer.php?u=http://jwlee0208.cafe24.com/board/article/view/" + articleId);
}
