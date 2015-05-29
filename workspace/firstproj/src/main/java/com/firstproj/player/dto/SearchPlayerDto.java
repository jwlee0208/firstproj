package com.firstproj.player.dto;

import org.apache.ibatis.type.Alias;

import com.firstproj.common.paging.PageParam;

@Alias("player.searchPlayerDto")
public class SearchPlayerDto extends PageParam{
    
    private String      searchCondition;
    private String      searchText;
    
    private CategoryDto categoryInfo;
    
    public String getSearchCondition() {
        return searchCondition;
    }

    public void setSearchCondition(String searchCondition) {
        this.searchCondition = searchCondition;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

    public CategoryDto getCategoryInfo() {
        return categoryInfo;
    }

    public void setCategoryInfo(CategoryDto categoryInfo) {
        this.categoryInfo = categoryInfo;
    }

    @Override
    public String toString() {
        return "SearchPlayerDto [searchCondition=" + searchCondition
                + ", searchText=" + searchText + ", categoryInfo="
                + categoryInfo + "]";
    }

}
