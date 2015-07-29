package com.firstproj.player.dto;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("player.categoryAttrElemDto")
public class CategoryAttrElemDto 
//extends CategoryAttrDto 
//implements Serializable 
{
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
    private String  attrName;
    
    private List<CategoryAttrElemDto>  childCatAttrElemInfos;
    
    public CategoryAttrElemDto() {
        super();
        // TODO Auto-generated constructor stub
    }
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
    
    public String getAttrName() {
        return attrName;
    }
    public void setAttrName(String attrName) {
        this.attrName = attrName;
    }
    public List<CategoryAttrElemDto> getChildCatAttrElemInfos() {
        return childCatAttrElemInfos;
    }
    public void setChildCatAttrElemInfos(
            List<CategoryAttrElemDto> childCatAttrElemInfos) {
        this.childCatAttrElemInfos = childCatAttrElemInfos;
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
        }else{
            attrNameStr = "기타";
        }
        return attrNameStr;
    }
    @Override
    public String toString() {
        return "CategoryAttrElemDto [attrElemId=" + attrElemId + ", attrId="
                + attrId + ", catId=" + catId + ", attrElemName="
                + attrElemName + ", createDate=" + createDate
                + ", createUserId=" + createUserId + ", createUserName="
                + createUserName + ", modifyDate=" + modifyDate
                + ", modifyUserId=" + modifyUserId + ", modifyUserName="
                + modifyUserName + ", childCatAttrElemInfos="
                + childCatAttrElemInfos + "]";
    }
    
}
