package com.firstproj.common.web;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.firstproj.board.service.BoardArticleService;
import com.firstproj.common.util.FileUpload;
import com.firstproj.common.util.FileUtil;

@Controller("EditorController")
public class EditorController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(EditorController.class);
	public static final long MAX_UPLOAD_FILE_SIZE = 20480000;
	public static final String FILE_EXTENSIONS_IMAGES = "jpg, jpeg, png, gif, bmp";
	

    @Autowired 
    private ServletContext servletContext;
    
	@Autowired
	private BoardArticleService boardService;
	
	
	@Resource(name="fileUpload")
	private FileUpload fileUpload;
	
	
	@RequestMapping(value = {"/{path}/popImageUpload/{cmd}", "/{path1}/{path2}/popImageUpload/{cmd}"}, method = RequestMethod.GET)
	public String imageUploadForm(HttpServletRequest request, Model model, HttpSession session, @PathVariable String cmd) throws Exception {
		return "/common/popImageUpload"; 
	}
	
	@RequestMapping(value = {"/{path}/imageuploadaction", "/{path1}/{path2}/imageuploadaction", "/{path1}/{path2}/{path3}/imageuploadaction"}, method={RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public StringBuffer imageadd(MultipartFile imageFile) throws Exception {
		
		System.out.println("imageadd");
		System.out.println("" + imageFile.getOriginalFilename());
		System.out.println("" + imageFile.getName());
		System.out.println("" + imageFile.getSize());
		System.out.println("" + imageFile.getBytes());
    	StringBuffer sb = this.fileUploadByEditor(imageFile);
		return sb;
    }
	
	private StringBuffer fileUploadByEditor(MultipartFile imageFile) throws Exception {
		StringBuffer sb = new StringBuffer();
		try {
    		//이미지 파일 용량 체크
            long fileSize = imageFile.getSize();
            if (fileSize > MAX_UPLOAD_FILE_SIZE || fileSize <= 0) {
            	logger.info("20MB 이상의 파일은 업로드 할 수 없습니다.");
            	sb.append("fileSizeError");
            	return sb;
            } 
            
			if (imageFile != null) {
				//file size check
				if (!fileUpload.checkFileSize(MAX_UPLOAD_FILE_SIZE, imageFile)) {
					sb.append("fileSizeError");
					return sb;
				} else if (!fileUpload.checkFileExtension(FILE_EXTENSIONS_IMAGES, imageFile)) {
					sb.append("fileExtensionError");
					return sb;
				} 
				System.out.println("imageFile : " + imageFile);
				String fileRealPath = fileUpload.uploadFile(imageFile);
				
				System.out.println("fileRealPath : " + fileRealPath);
				
				//boardStory.setThumbnail1(fileRealPath);
				//sb.append(imageFile.getOriginalFilename());
				sb.append(fileRealPath);
			} 
		} catch(Exception e) {
			logger.info("[FileNoException" + e.toString());
		}
		return sb;
	}
	
	
	@RequestMapping(value = {"/{path}/imagedeleteaction", "/{path1}/{path2}/imagedeleteaction", "/{path1}/{path2}/{path3}/imagedeleteaction"}, method=RequestMethod.POST)
	@ResponseBody
    public String imagedelete(String fileName, Model model) throws Exception {
    	String realPath = servletContext.getRealPath("/resources" + fileName);
    	System.out.println("realPath : " + realPath);
    	logger.info("[realPath]" + realPath);
    	String message = "error";
    	
    	//String fileList = FileUtil.getFileList(realPath);
    	//String[] fileListStrArr = fileList.split(",");
    	
    	//for (int index=0; index < fileListStrArr.length; index++) {
    		//if (fileName.equals(fileListStrArr[index])) {
    			try {
    				//FileUtil.deleteFile(realPath + "/" + fileName);
    				FileUtil.deleteFile(realPath);
    				message = "success";
    			} catch(Exception e) {
    				logger.info("[FileCopy deleteFile Missing]", e);
    			}
    		//}
    	//}
    	//System.out.println(fileListStrArr);
    	//model.addAttribute("fileList", fileListStrArr);
    	return message;
    }
}
