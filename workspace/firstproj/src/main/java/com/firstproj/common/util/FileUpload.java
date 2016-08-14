package com.firstproj.common.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUpload{
	private Logger logger = Logger.getLogger(this.getClass());
	private ServletContext servletContext;
	public static final String FILE_EXTENSIONS_IMAGES = "jpg, jpeg, png, gif, bmp";
	
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

	public String uploadFile(MultipartFile attachFile, int width, int height){
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
//			uploadFilePath = servletContext.getRealPath("/resources" + destinationUrl);
			uploadFilePath = "/www" + destinationUrl;
		}
		
		File file = null;
		StringBuffer fileRealPath = new StringBuffer();
		fileRealPath.append(uploadFilePath);
		fileRealPath.append("/");
		fileRealPath.append(DateUtil.formatDateToday());
		fileRealPath.append("/");
		String fileDirPath = fileRealPath.toString();
		fileRealPath.append(newFileName);
		logger.info(fileRealPath.toString());
		
		try {
			logger.info("[fileRealPath]" + fileRealPath);
			file = makeFolder(fileRealPath.toString());
		} catch(Exception e) {
			logger.info("[upload makeFolder Missing]", e);
		}
		// FTP 파일 업로드 부분
		FTPClient ftpClient = null;
		
		try {
		    ftpClient = new FTPClient();	        
	        ftpClient.setControlEncoding("EUC-KR");
	        
	        ftpClient.connect("iup.cdn3.cafe24.com", 21);
	        System.out.println(" [ ftpClient ] : connecting.....");
	        int replyCode = ftpClient.getReplyCode();
	        
	        System.out.println(" [ ftpClient ] : " + replyCode +", " + FTPReply.isPositiveCompletion(replyCode));
	        
	        if(!FTPReply.isPositiveCompletion(replyCode)){
	            System.out.println(" [ ftpClient ] : disconnect.....");
	            ftpClient.disconnect();
	        }else{
	            // timeout 10초
	            ftpClient.setSoTimeout(10000);
	            // login
	            ftpClient.login("jwlee0208", "in2299out");
	            System.out.println(" [ ftpClient ] : loging.....");
	            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
	            ftpClient.enterLocalPassiveMode();
	            
	            FileInputStream is = null;
	            ByteArrayInputStream bais = null;
	            
	            if (attachFile.getInputStream().getClass().equals(FileInputStream.class)) {
	            	is = (FileInputStream) attachFile.getInputStream();	

	            	System.out.println("[ fileDirpath ] : " + fileDirPath);
	                System.out.println(" [ ftpClient ] : makeDir : " + ftpClient.makeDirectory(fileDirPath));
	                System.out.println(" [ ftpClient ] : storeFile : " + ftpClient.storeFile(fileRealPath.toString(), is));
	                System.out.println(" [ ftpClient ] : uploading.....");
	                
	                is.close();

	            } else if (attachFile.getInputStream().getClass().equals(ByteArrayInputStream.class)) {
	            	bais = (ByteArrayInputStream) attachFile.getInputStream();

	            	System.out.println("[ fileDirpath ] : " + fileDirPath);
	                System.out.println(" [ ftpClient ] : makeDir : " + ftpClient.makeDirectory(fileDirPath));
	                System.out.println(" [ ftpClient ] : storeFile : " + ftpClient.storeFile(fileRealPath.toString(), bais));
	                System.out.println(" [ ftpClient ] : uploading.....");
	                
	                bais.close();

	            }
/*	            
	            FileInputStream is = (FileInputStream) attachFile.getInputStream(); 
                System.out.println("[ fileDirpath ] : " + fileDirPath);
                System.out.println(" [ ftpClient ] : makeDir : " + ftpClient.makeDirectory(fileDirPath));
                System.out.println(" [ ftpClient ] : storeFile : " + ftpClient.storeFile(fileRealPath.toString(), is));
                System.out.println(" [ ftpClient ] : uploading.....");
                is.close();
*/                
                ftpClient.logout();

	        }

		} catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{   
            if(ftpClient != null && ftpClient.isConnected()){
                try {
                    ftpClient.disconnect();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
		
		// END : FTP 파일 업로드 부분
		
		
		/*
		try {
			
			// 파일 확장자 구하기
			String extType = attachFile.getOriginalFilename().substring(attachFile.getOriginalFilename().lastIndexOf(".") + 1);
			logger.info(" >> extType : " + extType + ", yn : " + (FILE_EXTENSIONS_IMAGES.matches(".*" + extType.trim() + ".*")) + ", width/height : " + width + "/" + height);			
			// 이미지 파일인 경우
			if(FILE_EXTENSIONS_IMAGES.matches(".*" + extType.trim() + ".*")){
				//  image file resizing
				if(width > 0 && height > 0){
					BufferedImage imageObj = ImageIO.read(attachFile.getInputStream());
									
					// 이미지 타입
					int imageType = imageObj.getType();
					logger.info(" >>> imageType : " + imageType);					
					// Image Resizing
					BufferedImage resizedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
					
					Graphics g = resizedImage.getGraphics();
					g.drawImage(imageObj, 0, 0, width, height, null);
					g.dispose();
					
					ImageIO.write(resizedImage, extType, file);
				}else{
					attachFile.transferTo(file);
				}
			}else{
				attachFile.transferTo(file);
			}

//			attachFile.transferTo(file);

		} catch(Exception e) {
			logger.info("[upload transferTo Missing]", e);
		}
		*/
		return thumbnailUrl;
		
	}
	
	
	public String uploadFile(MultipartFile attachFile) throws Exception {
		return this.uploadFile(attachFile, 0, 0);
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
	
	public void remoteUpload(String thumbnailUrl, String fileRealPath, File file) throws Exception {
	        if ("live".equals(PropertiesConfig.getInstance().getServerConfig("mode"))) {
	            //remote upload
	            String destionUrl = PropertiesConfig.getInstance().getServerConfig("remote.thumbnail.path");
	            destionUrl += thumbnailUrl;
	            logger.info("[destionuRL]" + destionUrl);
	            SftpUtil sftpUtil = new SftpUtil();
	            sftpUtil.init((String)PropertiesConfig.getInstance().getServerConfig("uploadserver.ip")
	                    ,(String)PropertiesConfig.getInstance().getServerConfig("uploadserver.id")
	                    ,(String)PropertiesConfig.getInstance().getServerConfig("uploadserver.password")
	                    ,Integer.parseInt(PropertiesConfig.getInstance().getServerConfig("uploadserver.port")));
	            
	            sftpUtil.makeFolder(destionUrl);

	            sftpUtil.upload(destionUrl, new File(fileRealPath));
	            sftpUtil.disconnection();
	        }
	 }

}
