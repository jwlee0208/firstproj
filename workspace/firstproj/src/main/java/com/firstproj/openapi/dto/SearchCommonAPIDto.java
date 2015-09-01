package com.firstproj.openapi.dto;

import org.apache.ibatis.type.Alias;

@Alias("flickr.searchFlickrDto")
public class SearchCommonAPIDto {
    private String keyword;

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String toString() {
        return "SearchFlickrDto [keyword=" + keyword + "]";
    }
    
}
