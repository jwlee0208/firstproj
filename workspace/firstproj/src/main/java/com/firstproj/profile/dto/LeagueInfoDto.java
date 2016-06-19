package com.firstproj.profile.dto;

import org.apache.ibatis.type.Alias;

@Alias("profile.leagueInfoDto")
public class LeagueInfoDto {
	private int leagueId;
	private String leagueType;
	private String leagueName;
	private String leagueDivision;
	private String commissioner;
	private String leagueWebsiteUrl;
	private int joinedTeamCnt;
	private String area;
	private String country;
	private String establishedDate;
	private String createDate;
	private String createUserId;
	public int getLeagueId() {
		return leagueId;
	}
	public void setLeagueId(int leagueId) {
		this.leagueId = leagueId;
	}
	public String getLeagueType() {
		return leagueType;
	}
	public void setLeagueType(String leagueType) {
		this.leagueType = leagueType;
	}
	public String getLeagueName() {
		return leagueName;
	}
	public void setLeagueName(String leagueName) {
		this.leagueName = leagueName;
	}
	public String getLeagueDivision() {
		return leagueDivision;
	}
	public void setLeagueDivision(String leagueDivision) {
		this.leagueDivision = leagueDivision;
	}
	public String getCommissioner() {
		return commissioner;
	}
	public void setCommissioner(String commissioner) {
		this.commissioner = commissioner;
	}
	public String getLeagueWebsiteUrl() {
		return leagueWebsiteUrl;
	}
	public void setLeagueWebsiteUrl(String leagueWebsiteUrl) {
		this.leagueWebsiteUrl = leagueWebsiteUrl;
	}
	public int getJoinedTeamCnt() {
		return joinedTeamCnt;
	}
	public void setJoinedTeamCnt(int joinedTeamCnt) {
		this.joinedTeamCnt = joinedTeamCnt;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getEstablishedDate() {
		return establishedDate;
	}
	public void setEstablishedDate(String establishedDate) {
		this.establishedDate = establishedDate;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	
	
	
}
