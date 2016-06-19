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
    private int 			          playerInfoId;
    private String 			          catId1;
    private String 			          catId2;
    private String 			          catNm1;
    private String 			          catNm2;
    private String 			          introduce;
    private String 			          userId;
    private MultipartFile	          profileImg;
    private String 			          profileImgFilePath;
    private String 			          profileImgName;
    
    private UserDto                   userInfo;

    private List<PlayerVideoLinkDto>  playerVideoLinkList;
    private List<CategoryAttrElemDto> categoryAttrElemList;
    
    public int getPlayerInfoId() {
        return playerInfoId;
    }
    public void setPlayerInfoId(int playerInfoId) {
        this.playerInfoId = playerInfoId;
    } 
    public String getCatId1() {
        return catId1;
    }
    public void setCatId1(String catId1) {
        this.catId1 = catId1;
    }
    public String getCatId2() {
        return catId2;
    }
    public void setCatId2(String catId2) {
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
	
	public String getCatNm1Str(){
        
        String categoryNameStr = "";
        
//        if(this.catId1 == 1){
//            categoryNameStr = "선수";
//        }else if(this.catId1 == 2){
//            categoryNameStr = "감독";
//        }else if(this.catId1 == 3){
//            categoryNameStr = "코치";
//        }else if(this.catId1 == 4){
//            categoryNameStr = "에이전트";
//        }else if(this.catId1 == 5){
//            categoryNameStr = "팀";
//        }
        
        return categoryNameStr;
    }

	public String getCatNm2Str(){
        
        String categoryNameStr = "";
        
//        if(this.catId2 == 6){
//            categoryNameStr = "투수";
//        }else if(this.catId2 == 7){
//            categoryNameStr = "타자";
//        }else if(this.catId2 == 8){
//            categoryNameStr = "프로";
//        }else if(this.catId2 == 9){
//            categoryNameStr = "세미프로";
//        }
        
        return categoryNameStr;
    }
	
}
