package com.firstproj.common.util;

public class SearchCondition {
	// 검색 조건 파라미터
	private String 	searchCondition;
	private String 	searchText;
	private String 	startDate;
	private String 	endDate;
	private int 	boardCategory;

	// 페이징을 위한 파라미터
	private int startRow;
	private int endRow;

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getStartDate() {
		return (startDate != null && startDate != "") ? startDate + " 00:00:00"
				: startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return (endDate != null && endDate != "") ? endDate + " 23:59:59"
				: endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(int boardCategory) {
		this.boardCategory = boardCategory;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

}
