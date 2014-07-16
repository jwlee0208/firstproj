package com.firstproj.prohibiteword.dto;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.NotEmpty;

import com.sun.istack.internal.NotNull;

@Alias("prohibite.prohibiteWordDto")
public class ProhibiteWordDto {

	private int 	prohibitedWordId;
	@NotNull @NotEmpty
	private String 	prohibitedWordStr;
	private String 	createUserId;
	private String 	createUserNm;
	private String 	createDate;
	
	
	public int getProhibitedWordId() {
		return prohibitedWordId;
	}
	public void setProhibitedWordId(int prohibitedWordId) {
		this.prohibitedWordId = prohibitedWordId;
	}
	public String getProhibitedWordStr() {
		return prohibitedWordStr;
	}
	public void setProhibitedWordStr(String prohibitedWordStr) {
		this.prohibitedWordStr = prohibitedWordStr;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public String getCreateUserNm() {
		return createUserNm;
	}
	public void setCreateUserNm(String createUserNm) {
		this.createUserNm = createUserNm;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	
	
}
