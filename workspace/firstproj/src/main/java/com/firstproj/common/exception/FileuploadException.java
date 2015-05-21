package com.firstproj.common.exception;

@SuppressWarnings("serial")
public class FileuploadException extends Exception{
	private String message = "파일업로드 진행중 오류가 발생했습니다.";

	public FileuploadException() {
		super();
	}

	public FileuploadException(String message) {
		super();
		this.message = message;
	}

	public FileuploadException(Throwable cause){
		super(cause);
	}
}
