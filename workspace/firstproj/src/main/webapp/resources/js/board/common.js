function editorImgUploadComplete(fileStr){
	var hostname = location.host;
	  
	  if( fileStr.length > 0 ){	   
	   var strImg = "<br><img src='http://" + hostname + getContextPath() + fileStr + "' border=0>";
	   var contents = tinyMCE.activeEditor.getDoc().body.innerHTML;	   
	   tinyMCE.activeEditor.setContent( contents + strImg);
	  }
}