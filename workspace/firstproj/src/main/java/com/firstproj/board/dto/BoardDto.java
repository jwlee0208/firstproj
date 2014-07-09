package com.firstproj.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("board.boardDto")
public class BoardDto {
	
	private String title;
	private String content;
	private String authorId;
	private String authorNm;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthorId() {
		return authorId;
	}
	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}
	public String getAuthorNm() {
		return authorNm;
	}
	public void setAuthorNm(String authorNm) {
		this.authorNm = authorNm;
	}
	
}
