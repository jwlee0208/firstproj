package com.firstproj.player.dto;

import java.util.List;
import org.apache.ibatis.type.Alias;

@Alias("player.playerInfoDetail")
public class PlayerInfoDetail{
	private PlayerInfoDto 				 playerInfoDto;
	private List<CategoryAttrElemMapDto> attrElemMapList;
	private List<PlayerVideoLinkDto>	 playerVideoLinkList;
	
	public PlayerInfoDto getPlayerInfoDto() {
		return playerInfoDto;
	}
	public void setPlayerInfoDto(PlayerInfoDto playerInfoDto) {
		this.playerInfoDto = playerInfoDto;
	}
	public List<CategoryAttrElemMapDto> getAttrElemMapList() {
		return attrElemMapList;
	}
	public void setAttrElemMapList(List<CategoryAttrElemMapDto> attrElemMapList) {
		this.attrElemMapList = attrElemMapList;
	}
	public List<PlayerVideoLinkDto> getPlayerVideoLinkList() {
		return playerVideoLinkList;
	}
	public void setPlayerVideoLinkList(List<PlayerVideoLinkDto> playerVideoLinkList) {
		this.playerVideoLinkList = playerVideoLinkList;
	}
	@Override
	public String toString() {
		return "PlayerInfoDetail [playerInfoDto=" + playerInfoDto
				+ ", attrElemMapList=" + attrElemMapList
				+ ", playerVideoLinkList=" + playerVideoLinkList + "]";
	}

}