package com.firstproj.player.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;


@Alias("player.categoryDto")
public class CategoryDto 
{
    private String parentCatId = "";
    private String catId = "";
    
    private String catName;
    private String createDate;
    private String createUserId;
    private String createUserName;
    private String modifyUserId;
    private String modifyUserName;
    
    private List<CategoryAttrDto> categoryAttrDtoList;
    
    private List<CategoryDto> childCategoryList;

    public String getParentCatId() {
        return parentCatId;
    }
    public void setParentCatId(String parentCatId) {
        this.parentCatId = parentCatId;
    }
    public String getCatId() {
        return catId;
    }
    public void setCatId(String catId) {
        this.catId = catId;
    }
    public String getCatName() {
        return catName;
    }
    public void setCatName(String catName) {
        this.catName = catName;
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
    
    public List<CategoryAttrDto> getCategoryAttrDtoList() {
		return categoryAttrDtoList;
	}
	public void setCategoryAttrDtoList(List<CategoryAttrDto> categoryAttrDtoList) {
		this.categoryAttrDtoList = categoryAttrDtoList;
	}
	
	public List<CategoryDto> getChildCategoryList() {
        return childCategoryList;
    }
    public void setChildCategoryList(List<CategoryDto> childCategoryList) {
        this.childCategoryList = childCategoryList;
    }
    
    public String getCategoryNameStr(){
        
        String categoryNameStr = "";
        /*
        if(this.catId == "01010000"){
            categoryNameStr = "Baseball";
        }else if(this.catId == "01020000"){
            categoryNameStr = "";
        }else if(this.catId == "01000000"){
            categoryNameStr = "코치";
        }else if(this.catId == "01000000"){
            categoryNameStr = "에이전트";
        }else if(this.catId == "01000000"){
            categoryNameStr = "팀";
        }else if(this.catId == "01000000"){
            categoryNameStr = "투수";
        }else if(this.catId == "01000000"){
            categoryNameStr = "타자";
        }else if(this.catId == "01000000"){
            categoryNameStr = "프로";
        }else if(this.catId == "01000000"){
            categoryNameStr = "세미프로";
        }else{
            categoryNameStr = "";
        }
        */
        return categoryNameStr;
    }
    
    
}
