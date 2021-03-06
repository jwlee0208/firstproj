package com.firstproj.player.dto;

import org.apache.ibatis.type.Alias;

@Alias("player.categoryAttrElemMapDto")
public class CategoryAttrElemMapDto 
extends CategoryAttrElemDto 
//implements Serializable
{
    private int     attrElemMapId;
    private int     attrId;
    private int     attrElemId;
    private int     catId;
    private String  userId;
    private String  userName;
    private String  attrElemMapName;
    private String  createDate;
    private String  createUserId;
    private String  createUserName;
    private String  modifyDate;
    private String  modifyUserId;
    private String  modifyUserName;
   
    public CategoryAttrElemMapDto() {
        super();
        // TODO Auto-generated constructor stub
    }
    public int getAttrElemMapId() {
        return attrElemMapId;
    }
    public void setAttrElemMapId(int attrElemMapId) {
        this.attrElemMapId = attrElemMapId;
    }
    public int getAttrId() {
        return attrId;
    }
    public void setAttrId(int attrId) {
        this.attrId = attrId;
    }
    public int getAttrElemId() {
        return attrElemId;
    }
    public void setAttrElemId(int attrElemId) {
        this.attrElemId = attrElemId;
    }
    public int getCatId() {
        return catId;
    }
    public void setCatId(int catId) {
        this.catId = catId;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getAttrElemMapName() {
        return attrElemMapName;
    }
    public void setAttrElemMapName(String attrElemMapName) {
        this.attrElemMapName = attrElemMapName;
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
    public String getCreateUserName() {
        return createUserName;
    }
    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
    }
    public String getModifyDate() {
        return modifyDate;
    }
    public void setModifyDate(String modifyDate) {
        this.modifyDate = modifyDate;
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

    public String getCategoryNameStr(){
        
        String categoryNameStr = "";
        
        if(this.catId == 1){
            categoryNameStr = "선수";
        }else if(this.catId == 2){
            categoryNameStr = "감독";
        }else if(this.catId == 3){
            categoryNameStr = "코치";
        }else if(this.catId == 4){
            categoryNameStr = "에이전트";
        }else if(this.catId == 5){
            categoryNameStr = "팀";
        }else if(this.catId == 6){
            categoryNameStr = "투수";
        }else if(this.catId == 7){
            categoryNameStr = "타자";
        }
        
        return categoryNameStr;
    }
    
    public String getAttrElemNameStr() {
        String attrElemNameStr = "";
        if(this.attrElemId == 1 || this.attrElemId == 19){
            attrElemNameStr = "우투";
        }else if(this.attrElemId == 2 || this.attrElemId == 20){
            attrElemNameStr = "좌투";
        }else if(this.attrElemId == 3 || this.attrElemId == 21){
            attrElemNameStr = "양투";
        }else if(this.attrElemId == 4){
            attrElemNameStr = "오버핸드";
        }else if(this.attrElemId == 5){
            attrElemNameStr = "언더핸드";
        }else if(this.attrElemId == 6){
            attrElemNameStr = "사이드암";
        }else if(this.attrElemId == 7){
            attrElemNameStr = "스리쿼터";
        }else if(this.attrElemId == 8 || this.attrElemId == 22){
            attrElemNameStr = "우타";
        }else if(this.attrElemId == 9 || this.attrElemId == 23){
            attrElemNameStr = "좌타";
        }else if(this.attrElemId == 10){
            attrElemNameStr = "포수";
        }else if(this.attrElemId == 11){
            attrElemNameStr = "지명타자";
        }else if(this.attrElemId == 12){
            attrElemNameStr = "1루수";
        }else if(this.attrElemId == 13){
            attrElemNameStr = "2루수";
        }else if(this.attrElemId == 14){
            attrElemNameStr = "3루수";
        }else if(this.attrElemId == 15){
            attrElemNameStr = "유격수";
        }else if(this.attrElemId == 16){
            attrElemNameStr = "좌익수";
        }else if(this.attrElemId == 17){
            attrElemNameStr = "중견수";
        }else if(this.attrElemId == 18){
            attrElemNameStr = "우익수";
        }else if(this.attrElemId == 24){
            attrElemNameStr = "양타";
        }else if(this.attrElemId == 25){
            attrElemNameStr = "아시아";
        }else if(this.attrElemId == 26){
            attrElemNameStr = "북미";
        }else if(this.attrElemId == 27){
            attrElemNameStr = "남미";
        }else if(this.attrElemId == 28){
            attrElemNameStr = "유럽";
        }else{
            attrElemNameStr = "기타";
        }
        return attrElemNameStr;
    }

    public String getAttrNameStr(){
        
        String attrNameStr = "";
        
        if(this.attrId == 1 || this.attrId == 5){
            attrNameStr = "투구";
        }else if(this.attrId == 2){
            attrNameStr = "투구타입";
        }else if(this.attrId == 3 || this.attrId == 6){
            attrNameStr = "타격";
        }else if(this.attrId == 4){
            attrNameStr = "포지션";
        }else if(this.attrId == 7 || this.attrId == 8){
            attrNameStr = "지역";
        }else{
            attrNameStr = "기타";
        }
        return attrNameStr;
    }
	@Override
	public String toString() {
		return "CategoryAttrElemMapDto [attrElemMapId=" + attrElemMapId
				+ ", attrId=" + attrId + ", attrElemId=" + attrElemId
				+ ", catId=" + catId + ", userId=" + userId + ", userName="
				+ userName + ", attrElemMapName=" + attrElemMapName
				+ ", createDate=" + createDate + ", createUserId="
				+ createUserId + ", createUserName=" + createUserName
				+ ", modifyDate=" + modifyDate + ", modifyUserId="
				+ modifyUserId + ", modifyUserName=" + modifyUserName + "]";
	}

}
