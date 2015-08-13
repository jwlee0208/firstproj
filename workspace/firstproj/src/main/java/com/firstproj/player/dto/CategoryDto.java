package com.firstproj.player.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;


@Alias("player.categoryDto")
public class CategoryDto 
//implements Serializable
{
    private int parentCatId = 0;
    private int catId = 0;
    
    private String catName;
    private String createDate;
    private String createUserId;
    private String createUserName;
    private String modifyUserId;
    private String modifyUserName;
    
    private List<CategoryAttrDto> categoryAttrDtoList;
    
    public int getParentCatId() {
        return parentCatId;
    }
    public void setParentCatId(int parentCatId) {
        this.parentCatId = parentCatId;
    }
    public int getCatId() {
        return catId;
    }
    public void setCatId(int catId) {
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
        }else if(this.catId == 8){
            categoryNameStr = "프로";
        }else if(this.catId == 9){
            categoryNameStr = "세미프로";
        }else{
            categoryNameStr = "";
        }
        
        return categoryNameStr;
    }
    
    
}
