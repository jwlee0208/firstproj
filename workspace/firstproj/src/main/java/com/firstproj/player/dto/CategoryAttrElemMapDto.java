package com.firstproj.player.dto;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("player.categoryAttrElemMapDto")
public class CategoryAttrElemMapDto extends CategoryAttrElemDto implements Serializable{
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

    
}
