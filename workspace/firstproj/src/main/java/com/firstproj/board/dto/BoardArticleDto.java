package com.firstproj.board.dto;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@Alias("board.boardArticleDto")
public class BoardArticleDto {
	
	private int	   			articleId;
	@NotNull @Min(0)
	private int				boardId;
	@NotNull @NotEmpty
	private String 			title;
	@NotNull @NotEmpty
	private String 			content;
	private String 			authorId;
	private String 			authorNm;
	private String 			createDate;
	private MultipartFile 	thumbImg;
	private String			filePath;	
	private String			originalFileName;

	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
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
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public MultipartFile getThumbImg() {
		return thumbImg;
	}
	public void setThumbImg(MultipartFile thumbImg) {
		this.thumbImg = thumbImg;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	@Override
	public String toString() {
		return "BoardArticleDto [articleId=" + articleId + ", boardId="
				+ boardId + ", title=" + title + ", content=" + content
				+ ", authorId=" + authorId + ", authorNm=" + authorNm
				+ ", createDate=" + createDate + ", thumbImg=" + thumbImg
				+ ", filePath=" + filePath + ", originalFileName="
				+ originalFileName + "]";
	}

}
