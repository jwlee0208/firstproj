package com.firstproj.player.dto;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("player.categoryAttrDto")
public class CategoryAttrDto extends CategoryDto implements Serializable{
    private int     attrId = 0;
    private int     catId = 0;
    private String  attrName;
    private String  createDate;
    private String  createUserId;
    private String  createUserName;
    private String  modifyDate;
    private String  modifyUserId;
    private String  modifyUserName;
    
    private List<CategoryAttrElemDto> categoryAttrElemList;
    
    public int getAttrId() {
        return attrId;
    }
    public void setAttrId(int attrId) {
        this.attrId = attrId;
    }
    public int getCatId() {
        return catId;
    }
    public void setCatId(int catId) {
        this.catId = catId;
    }
    public String getAttrName() {
        return attrName;
    }
    public void setAttrName(String attrName) {
        this.attrName = attrName;
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
    
    
    
    public List<CategoryAttrElemDto> getCategoryAttrElemList() {
		return categoryAttrElemList;
	}
	public void setCategoryAttrElemList(
			List<CategoryAttrElemDto> categoryAttrElemList) {
		this.categoryAttrElemList = categoryAttrElemList;
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
}
