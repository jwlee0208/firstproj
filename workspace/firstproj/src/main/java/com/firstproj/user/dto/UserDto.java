package com.firstproj.user.dto;

import javax.validation.constraints.NotNull;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;

@Alias("user.userDto")
public class UserDto {
	private String userId;
	@NotNull @NotEmpty
	private String userNm;
	@NotNull @NotEmpty
	private String passwd;
	
	@Email
	private String email;
	@NumberFormat
	private String phoneNo;
	
	private String joinDate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	@Override
	public String toString() {
		return "UserDto [userId=" + userId + ", userNm=" + userNm + ", passwd="
				+ passwd + ", email=" + email + ", phoneNo=" + phoneNo
				+ ", joinDate=" + joinDate + "]";
	}
	
	
	 
}
