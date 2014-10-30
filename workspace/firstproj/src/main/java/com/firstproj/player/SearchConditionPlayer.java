package com.firstproj.player;

import java.util.List;

import com.firstproj.common.util.SearchCondition;

public class SearchConditionPlayer extends SearchCondition{
    private String catId;
    private String attrId;
    private List<String> attrElemId;
    private String attrElemMapId;
    
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
    
}
