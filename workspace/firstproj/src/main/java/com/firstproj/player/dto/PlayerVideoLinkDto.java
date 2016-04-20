package com.firstproj.player.dto;

import org.apache.ibatis.type.Alias;

@Alias("player.playerVideoLinkDto")
public class PlayerVideoLinkDto {
	private int 	playerVideoLinkId;
	private int 	playerInfoId;
	private String 	linkUrl;
	private int 	seq;
	public int getPlayerVideoLinkId() {
		return playerVideoLinkId;
	}
	public void setPlayerVideoLinkId(int playerVideoLinkId) {
		this.playerVideoLinkId = playerVideoLinkId;
	}
	public int getPlayerInfoId() {
		return playerInfoId;
	}
	public void setPlayerInfoId(int playerInfoId) {
		this.playerInfoId = playerInfoId;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	@Override
	public String toString() {
		return "PlayerVideoLinkDto [playerVideoLinkId=" + playerVideoLinkId
				+ ", playerInfoId=" + playerInfoId + ", linkUrl=" + linkUrl
				+ ", seq=" + seq + "]";
	}
	
	

}
