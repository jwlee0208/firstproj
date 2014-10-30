package com.firstproj.player.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.firstproj.common.util.PagedList;
import com.firstproj.common.util.PagingUtil;
import com.firstproj.player.dao.PlayerDao;
import com.firstproj.player.dto.CategoryAttrDto;
import com.firstproj.player.dto.CategoryAttrElemDto;
import com.firstproj.player.dto.CategoryAttrElemMapDto;
import com.firstproj.player.dto.CategoryDto;

@Service("PlayerServiceImpl")
public class PlayerServiceImpl implements PlayerService{
    @Resource(name="PlayerDao")
    private PlayerDao playerDao;
    
    public List<CategoryAttrElemMapDto> getCategoryAttrElemMapList(CategoryAttrElemMapDto param) throws Exception{
        return playerDao.getAttrMapList(param);
    }
    
    public List<CategoryDto> getCategoryList(CategoryDto param) throws Exception{
        return playerDao.getCategoryList(param);
    }
    
    public List<CategoryAttrElemDto> getAttrElementList(CategoryAttrDto param) throws Exception{
        return playerDao.getAttrElemList(param);
    }
    
    @Override
    public int getCategoryAttrElemMapCnt(Map<String, Object> param) throws Exception {                     
           return playerDao.selectArticleListCnt(param);      
    }    
    @Override
    public PagedList getCategoryAttrElemMapPagedList(Map<String, Object> paramMap) throws Exception {                              
        List<?> articleList = this.getCategoryAttrElemMapList(paramMap);
 
        int pageNo       = (Integer) paramMap.get("pageNo");    
        int listRowCnt   = (Integer) paramMap.get("listRowCnt");
        int totalListCnt = (Integer) paramMap.get("totalListCnt");
        int pageSize     = (Integer) paramMap.get("pageSize");
        int startRow     = (Integer) paramMap.get("startRow");                              
        int endRow       = (Integer) paramMap.get("endRow");       
 
        PagedList pagedList = new PagedList(articleList, pageNo, pageSize, totalListCnt, startRow, endRow, listRowCnt);
        return pagedList;
    }   
    @Override
    public List<CategoryAttrElemMapDto> getCategoryAttrElemMapList(Map<String,Object> paramMap) throws Exception {                       
           int pageNo     = (Integer) paramMap.get("pageNo");                                   
           int listRowCnt = (Integer) paramMap.get("listRowCnt");
           int startRow   = PagingUtil.getStartRow(pageNo, listRowCnt);                                        
           int endRow     = PagingUtil.getEndRow(startRow, listRowCnt);
     
           paramMap.put("startRow", startRow);                                     
           paramMap.put("endRow", endRow);
           return playerDao.selectBoardArticleList(paramMap);            
    } 

    
}
