package com.firstproj.user.dto;

import org.apache.ibatis.type.Alias;

@Alias("user.userDto")
public class UserDto {
	private String userId;
//	@NotNull @NotEmpty
	private String userNm;
//	@NotNull @NotEmpty
	private String passwd;
	
	private String passwdChk;
//	@Email
	private String email;
//	@NumberFormat
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

    public String getPasswdChk() {
        return passwdChk;
    }
    public void setPasswdChk(String passwdChk) {
        this.passwdChk = passwdChk;
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
                + passwd + ", passwdChk=" + passwdChk + ", email=" + email
                + ", phoneNo=" + phoneNo + ", joinDate=" + joinDate + "]";
    }
 	 
}
