package com.firstproj.player.dto;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@SuppressWarnings("serial")
@Alias("player.categoryAttrElemDto")
public class CategoryAttrElemDto extends CategoryAttrDto implements Serializable {
    private int     attrElemId;
    private int     attrId;
    private int     catId;
    private String  attrElemName;
    private String  createDate;
    private String  createUserId;
    private String  createUserName;
    private String  modifyDate;
    private String  modifyUserId;
    private String  modifyUserName;
    
    public int getAttrElemId() {
        return attrElemId;
    }
    public void setAttrElemId(int attrElemId) {
        this.attrElemId = attrElemId;
    }
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
    public String getAttrElemName() {
        return attrElemName;
    }
    public void setAttrElemName(String attrElemName) {
        this.attrElemName = attrElemName;
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
