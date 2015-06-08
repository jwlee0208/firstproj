package com.firstproj.player.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import com.firstproj.common.util.SearchCondition;

@Alias("player.searchConditionPlayer")
public class SearchConditionPlayer extends SearchCondition{
    private String       catId;
    private String       attrId;
    private List<String> attrElemId;
    private String       attrElemMapId;
    
    
    private List<CategoryAttrElemDto> catAttrElemInfos;
    
    
    public String getCatId() {
        return catId;
    }
    public void setCatId(String catId) {
        this.catId = catId;
    }
    public String getAttrId() {
        return attrId;
    }
    public void setAttrId(String attrId) {
        this.attrId = attrId;
    }
    public List<String> getAttrElemId() {
        return attrElemId;
    }
    public void setAttrElemId(List<String> attrElemId) {
        this.attrElemId = attrElemId;
    }
    public String getAttrElemMapId() {
        return attrElemMapId;
    }
    public void setAttrElemMapId(String attrElemMapId) {
        this.attrElemMapId = attrElemMapId;
    }
    public List<CategoryAttrElemDto> getCatAttrElemInfos() {
        return catAttrElemInfos;
    }
    public void setCatAttrElemInfos(List<CategoryAttrElemDto> catAttrElemInfos) {
        this.catAttrElemInfos = catAttrElemInfos;
    }
    @Override
    public String toString() {
        return "SearchConditionPlayer [catId=" + catId + ", attrId=" + attrId
                + ", attrElemId=" + attrElemId + ", attrElemMapId="
                + attrElemMapId + ", catAttrElemInfos=" + catAttrElemInfos
                + "]";
    }
    
}
