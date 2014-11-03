package com.firstproj.player.service;

import java.util.List;
import java.util.Map;

import com.firstproj.common.util.PagedList;
import com.firstproj.player.dto.CategoryAttrDto;
import com.firstproj.player.dto.CategoryAttrElemDto;
import com.firstproj.player.dto.CategoryAttrElemMapDto;
import com.firstproj.player.dto.CategoryDto;

public interface PlayerService {
    public List<CategoryAttrElemMapDto> getCategoryAttrElemMapList(CategoryAttrElemMapDto param) throws Exception;
    public List<CategoryDto> getCategoryList(CategoryDto param) throws Exception;
    public List<CategoryAttrElemDto> getAttrElementList(CategoryAttrDto param) throws Exception;
    public int getCategoryAttrElemMapCnt(Map<String, Object> param) throws Exception;
    public PagedList getCategoryAttrElemMapPagedList(Map<String, Object> paramMap) throws Exception;
    public List<CategoryAttrElemMapDto> getCategoryAttrElemMapList(Map<String,Object> paramMap) throws Exception;

}