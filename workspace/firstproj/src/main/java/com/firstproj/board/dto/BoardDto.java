package com.firstproj.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("board.boardDto")
public class BoardDto {
	private int 	boardId;
	private String 	boardName;
	private String 	boardType;
	private String 	createUserId;
	private String 	createUserName;
	private String 	createDate;
	private String 	modifyUserId;
	private String 	modifyUserName;
	private String 	modifyDate;
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public String getCreateUserName() {
		return createUserName;
	}
	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getModifyUserId() {
		return modifyUserId;
	}
	public void setModifyUserId(String modifyUserId) {
		this.modifyUserId = modifyUserId;
	}
	public String getModifyUserName() {
		return modifyUserName;
	}
	public void setModifyUserName(String modifyUserName) {
		this.modifyUserName = modifyUserName;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	@Override
	public String toString() {
		return "BoardDto [boardId=" + boardId + ", boardName=" + boardName
				+ ", boardType=" + boardType + ", createUserId=" + createUserId
				+ ", createUserName=" + createUserName + ", createDate="
				+ createDate + ", modifyUserId=" + modifyUserId
				+ ", modifyUserName=" + modifyUserName + ", modifyDate="
				+ modifyDate + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + boardId;
		result = prime * result
				+ ((boardName == null) ? 0 : boardName.hashCode());
		result = prime * result
				+ ((boardType == null) ? 0 : boardType.hashCode());
		result = prime * result
				+ ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result
				+ ((createUserId == null) ? 0 : createUserId.hashCode());
		result = prime * result
				+ ((createUserName == null) ? 0 : createUserName.hashCode());
		result = prime * result
				+ ((modifyDate == null) ? 0 : modifyDate.hashCode());
		result = prime * result
				+ ((modifyUserId == null) ? 0 : modifyUserId.hashCode());
		result = prime * result
				+ ((modifyUserName == null) ? 0 : modifyUserName.hashCode());
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
		BoardDto other = (BoardDto) obj;
		if (boardId != other.boardId)
			return false;
		if (boardName == null) {
			if (other.boardName != null)
				return false;
		} else if (!boardName.equals(other.boardName))
			return false;
		if (boardType == null) {
			if (other.boardType != null)
				return false;
		} else if (!boardType.equals(other.boardType))
			return false;
		if (createDate == null) {
			if (other.createDate != null)
				return false;
		} else if (!createDate.equals(other.createDate))
			return false;
		if (createUserId == null) {
			if (other.createUserId != null)
				return false;
		} else if (!createUserId.equals(other.createUserId))
			return false;
		if (createUserName == null) {
			if (other.createUserName != null)
				return false;
		} else if (!createUserName.equals(other.createUserName))
			return false;
		if (modifyDate == null) {
			if (other.modifyDate != null)
				return false;
		} else if (!modifyDate.equals(other.modifyDate))
			return false;
		if (modifyUserId == null) {
			if (other.modifyUserId != null)
				return false;
		} else if (!modifyUserId.equals(other.modifyUserId))
			return false;
		if (modifyUserName == null) {
			if (other.modifyUserName != null)
				return false;
		} else if (!modifyUserName.equals(other.modifyUserName))
			return false;
		return true;
	}
	
	
}
