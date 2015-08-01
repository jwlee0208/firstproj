package com.firstproj.board.dto;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import com.firstproj.common.util.SearchCondition;


@SuppressWarnings("serial")
@Alias("board.boardArticleDto")
public class BoardArticleDto extends SearchCondition
//implements Serializable
{
    
	// 입력 파라미터
	private String			thumbnailSize;
	
	
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
	private int 			status;
	private int             boardCategoryId;
	private String          boardCategoryName;
	private String			boardName;
	
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
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getContentText(){
		return content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}
	
	public String getThumbnailSize() {
		return thumbnailSize;
	}
	public void setThumbnailSize(String thumbnailSize) {
		this.thumbnailSize = thumbnailSize;
	}
	
	public int getBoardCategoryId() {
        return boardCategoryId;
    }
    public void setBoardCategoryId(int boardCategoryId) {
        this.boardCategoryId = boardCategoryId;
    }
    public String getBoardCategoryName() {
        return boardCategoryName;
    }
    public void setBoardCategoryName(String boardCategoryName) {
        this.boardCategoryName = boardCategoryName;
    }
    public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	
	@Override
	public String toString() {
		return "BoardArticleDto [thumbnailSize=" + thumbnailSize + ", articleId=" + articleId + ", boardId=" + boardId
				+ ", title=" + title + ", content=" + content + ", authorId=" + authorId + ", authorNm=" + authorNm
				+ ", createDate=" + createDate + ", thumbImg=" + thumbImg + ", filePath=" + filePath
				+ ", originalFileName=" + originalFileName + ", status=" + status + ", boardCategoryId="
				+ boardCategoryId + ", boardCategoryName=" + boardCategoryName + ", boardName=" + boardName + "]";
	}
	
}
