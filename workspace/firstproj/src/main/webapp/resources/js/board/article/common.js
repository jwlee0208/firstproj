function editorImgUploadComplete(fileStr){
	var hostname = "jwlee0208.cdn3.cafe24.com";		//location.host;
	  
	  if( fileStr.length > 0 ){	   
	   var strImg = "<br><img src='http://" + hostname + fileStr + "' border=0>";		  
//	   var strImg = "<br><img src='http://" + hostname + getContextPath() + fileStr + "' border=0>";
	   var contents = tinyMCE.activeEditor.getDoc().body.innerHTML;	   
	   tinyMCE.activeEditor.setContent( contents + strImg);
	  }
}