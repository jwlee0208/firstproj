package com.firstproj.board.dto;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.NotEmpty;

@Alias("board.boardArticleDto")
public class BoardArticleDto {
	
	private int	   		articleId;
	@NotNull @Min(0)
	private int			boardId;
	@NotNull @NotEmpty
	private String 		title;
	@NotNull @NotEmpty
	private String 		content;
	private String 		authorId;
	private String 		authorNm;
	private String 		createDate;
	

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
	@Override
	public String toString() {
		return "BoardDto [articleId=" + articleId + ", boardId=" + boardId
				+ ", title=" + title + ", content=" + content + ", authorId="
				+ authorId + ", authorNm=" + authorNm + ", createDate="
				+ createDate + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + articleId;
		result = prime * result
				+ ((authorId == null) ? 0 : authorId.hashCode());
		result = prime * result
				+ ((authorNm == null) ? 0 : authorNm.hashCode());
		result = prime * result + boardId;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result
				+ ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardArticleDto other = (BoardArticleDto) obj;
		if (articleId != other.articleId)
			return false;
		if (authorId == null) {
			if (other.authorId != null)
				return false;
		} else if (!authorId.equals(other.authorId))
			return false;
		if (authorNm == null) {
			if (other.authorNm != null)
				return false;
		} else if (!authorNm.equals(other.authorNm))
			return false;
		if (boardId != other.boardId)
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (createDate == null) {
			if (other.createDate != null)
				return false;
		} else if (!createDate.equals(other.createDate))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}

	
}
