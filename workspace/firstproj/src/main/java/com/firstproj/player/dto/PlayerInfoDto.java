package com.firstproj.player.dto;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import com.firstproj.user.dto.UserDto;

@SuppressWarnings("serial")
@Alias("player.playerInfoDto")
public class PlayerInfoDto implements Serializable
//extends UserDto
{
    private int 	playerInfoId;
    private int 	catId1;
    private int 	catId2;
    private String 	catNm1;
    private String 	catNm2;
    private String 	introduce;
    private String 	userId;
    private MultipartFile	profileImg;
    private String 			profileImgFilePath;
    private String 			profileImgName;
    
    private UserDto userInfo;

    private List<PlayerVideoLinkDto> playerVideoLinkList;
    
    private List<CategoryAttrElemDto> categoryAttrElemList;
    
    public int getPlayerInfoId() {
        return playerInfoId;
    }
    public void setPlayerInfoId(int playerInfoId) {
        this.playerInfoId = playerInfoId;
    }
    public int getCatId1() {
        return catId1;
    }
    public void setCatId1(int catId1) {
        this.catId1 = catId1;
    }
    public int getCatId2() {
        return catId2;
    }
    public void setCatId2(int catId2) {
        this.catId2 = catId2;
    }
    public String getCatNm1() {
        return catNm1;
    }
    public void setCatNm1(String catNm1) {
        this.catNm1 = catNm1;
    }
    public String getCatNm2() {
        return catNm2;
    }
    public void setCatNm2(String catNm2) {
        this.catNm2 = catNm2;
    }
	public UserDto getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserDto userInfo) {
		this.userInfo = userInfo;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public MultipartFile getProfileImg() {
		return profileImg;
	}
	public String getProfileImgFilePath() {
		return profileImgFilePath;
	}
	public void setProfileImgFilePath(String profileImgFilePath) {
		this.profileImgFilePath = profileImgFilePath;
	}
	public String getProfileImgName() {
		return profileImgName;
	}
	public void setProfileImgName(String profileImgName) {
		this.profileImgName = profileImgName;
	}
	public void setProfileImg(MultipartFile profileImg) {
		this.profileImg = profileImg;
	}
	public List<PlayerVideoLinkDto> getPlayerVideoLinkList() {
		return playerVideoLinkList;
	}
	public void setPlayerVideoLinkList(List<PlayerVideoLinkDto> playerVideoLinkList) {
		this.playerVideoLinkList = playerVideoLinkList;
	}
	public List<CategoryAttrElemDto> getCategoryAttrElemList() {
		return categoryAttrElemList;
	}
	public void setCategoryAttrElemList(
			List<CategoryAttrElemDto> categoryAttrElemList) {
		this.categoryAttrElemList = categoryAttrElemList;
	}
	@Override
	public String toString() {
		return "PlayerInfoDto [playerInfoId=" + playerInfoId + ", catId1=" + catId1 + ", catId2=" + catId2
				+ ", catNm1=" + catNm1 + ", catNm2=" + catNm2 + ", introduce=" + introduce + ", userId=" + userId
				+ ", profileImg=" + profileImg + ", profileImgFilePath=" + profileImgFilePath + ", profileImgName="
				+ profileImgName + ", userInfo=" + userInfo + ", playerVideoLinkList=" + playerVideoLinkList
				+ ", categoryAttrElemList=" + categoryAttrElemList + "]";
	}
	
}
