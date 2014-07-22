package com.firstproj.common.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUpload{
	private Logger logger = Logger.getLogger(this.getClass());
	private ServletContext servletContext;
	
	private String destinationUrl;
	
	public String getDestinationUrl() {
		return destinationUrl;
	}
	
	public void setDestinationUrl(String destinationUrl) {
		this.destinationUrl = destinationUrl;
	}

	public FileUpload(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	public String uploadFile(MultipartFile attachFile) throws Exception {
		String uploadFilePath = null;
		String newFolderDir = DateUtil.formatDateToday() + "/" ;    	
		//String newFileName = attachFile.getOriginalFilename();
		String newFileName = Long.toString(System.currentTimeMillis()) + attachFile.getOriginalFilename().substring(attachFile.getOriginalFilename().lastIndexOf("."));
		String thumbnailUrl = destinationUrl + "/" + newFolderDir + newFileName;
		
		logger.info("[thumbnailUrl]" + thumbnailUrl);
		
		if ("live".equals(PropertiesConfig.getInstance().getServerConfig("mode"))) {
			uploadFilePath = PropertiesConfig.getInstance().getServerConfig("thumbnail.uploadpath");
		} else if ("test".equals(PropertiesConfig.getInstance().getServerConfig("mode"))) {
			uploadFilePath = PropertiesConfig.getInstance().getServerConfig("test.thumbnail.uploadpath");
		} else {
			uploadFilePath = servletContext.getRealPath("/resources" + destinationUrl);
		}
		
		File file = null;
		StringBuffer fileRealPath = new StringBuffer();
		fileRealPath.append(uploadFilePath);
		fileRealPath.append("/");
		fileRealPath.append(DateUtil.formatDateToday());
		fileRealPath.append("/");
		fileRealPath.append(newFileName);
		logger.info(fileRealPath.toString());
		
		
		/*
		String newFolderDir = DateUtil.formatDateToday() + "/" ;    	
		String newFileName = newFolderDir + attachFile.getOriginalFilename();
		String thumbnailUrl = destinationUrl + "/" + newFileName;
		fileDir.append(destinationUrl);
		fileDir.append("/");
		fileDir.append(newFolderDir);
		logger.info("[destinationUrl]" + destinationUrl);
		String fileRealPath = servletContext.getRealPath(destinationUrl) + "/" + newFileName;
		*/
		try {
			logger.info("[fileRealPath]" + fileRealPath);
			file = makeFolder(fileRealPath.toString());
		} catch(Exception e) {
			logger.info("[upload makeFolder Missing]", e);
		}

		try {
			attachFile.transferTo(file);
		} catch(Exception e) {
			logger.info("[upload transferTo Missing]", e);
		}
		return thumbnailUrl;
	}
	
	/*
	public String uploadFile(MultipartFile attachFile) throws Exception {
		File file = null;
		String newFolderDir = DateUtil.formatDateToday() + "/" ;    	
		String newFileName = newFolderDir + attachFile.getOriginalFilename();
		String thumbnailUrl = destinationUrl + "/" + newFileName;
		StringBuffer fileDir = new StringBuffer();
		fileDir.append(destinationUrl);
		fileDir.append("/");
		fileDir.append(newFolderDir);
		
		logger.info("[destinationUrl]" + destinationUrl);
		String fileRealPath = servletContext.getRealPath(destinationUrl) + "/" + newFileName;
		try {
			logger.info("[destinationUrl]" + destinationUrl);
			logger.info("[fileRealPath]" + fileRealPath);
			file = makeFolder(fileRealPath);
		} catch(Exception e) {
			logger.info("[upload makeFolder Missing]", e);
		}

		try {
			attachFile.transferTo(file);
		} catch(Exception e) {
			logger.info("[upload transferTo Missing]", e);
		}
		return thumbnailUrl;
	}
	*/

	public File makeFolder(String filePath) {
		File file = new File(filePath);
		file.mkdirs();
		return file;
	}
	
	//이미지 파일 용량 체크
	public Boolean checkFileSize(long maxSize, MultipartFile uploadFile) throws Exception {
        long fileSize = uploadFile.getSize();
        if (fileSize > maxSize || fileSize <= 0) {
        	logger.info("20MB 이상의 파일은 업로드 할 수 없습니다.");
        	return false;
        }
        return true;
	}
	
	//이미지 확장자 체크 
	public Boolean checkFileExtension(String fileExtensions, MultipartFile uploadFile) throws Exception {
	    String fileName = uploadFile.getOriginalFilename().trim();
	    String fileType = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()).toLowerCase();
	    if (fileExtensions.indexOf(fileType) == -1) {
	    	logger.info("올바른 파일 확장자가 아닙니다. [" + fileType + "," + fileName + "]");
	    	return false;
	    }
	    return true;
	}
	
	//이미지 width, height 체크
	public Boolean checkImageWidthHeight(int width, int height, MultipartFile uploadFile) throws Exception {
		BufferedImage image = ImageIO.read(uploadFile.getInputStream());
		
		Integer intWidth = image.getWidth();
		Integer intHeight = image.getHeight();
		
		System.out.println("width" + intWidth);
		System.out.println("height" + intHeight);
		
		if (intWidth != width) {
			return false;
		} else if (intHeight != height) {
			return false;
		}
		return true;
	}
	
	
	//IP에 맞는 서버ID 가져오기 
	public int getThumbnailServerId(String serverIP) throws Exception {
		String serverMode = PropertiesConfig.getInstance().getServerConfig("mode");
		Map<Integer,String> serverMap = new HashMap<Integer,String>();
		
		if ("live".equals(serverMode)) {
			serverMap.put(1, PropertiesConfig.getInstance().getServerConfig("thumbnail.address1"));
			serverMap.put(2, PropertiesConfig.getInstance().getServerConfig("thumbnail.address2"));
		} else if ("test".equals(serverMode)) {
			serverMap.put(1, PropertiesConfig.getInstance().getServerConfig("test.thumbnail.address1"));
			serverMap.put(2, PropertiesConfig.getInstance().getServerConfig("test.thumbnail.address1"));
		} else {
			serverMap.put(1, PropertiesConfig.getInstance().getServerConfig("dev.thumbnail.address1"));
			serverMap.put(2, PropertiesConfig.getInstance().getServerConfig("dev.thumbnail.address1"));
		}
		
		for (Entry<Integer, String> entry : serverMap.entrySet()) {
            Integer key=entry.getKey();
            String value=entry.getValue();
            if (serverIP.equals(value)) {
            	return key;
            }
        }	
		return 1;
	}
}