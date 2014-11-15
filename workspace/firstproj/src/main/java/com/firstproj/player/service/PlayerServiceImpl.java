package com.firstproj.player.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.firstproj.common.util.PagedList;
import com.firstproj.common.util.PagingUtil;
import com.firstproj.player.SearchConditionPlayer;
import com.firstproj.player.dao.PlayerDao;
import com.firstproj.player.dto.CategoryAttrDto;
import com.firstproj.player.dto.CategoryAttrElemMapDto;
import com.firstproj.player.dto.CategoryDto;
import com.firstproj.player.dto.PlayerInfoDto;
import com.firstproj.player.dto.PlayerInfoSearchDto;
import com.firstproj.user.dto.UserDto;

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
    
    public List<CategoryAttrDto> getAttrElementList(CategoryAttrDto param) throws Exception{
        return playerDao.getAttrElemList(param);
    }
    
    @Override
    public int getCategoryAttrElemMapCnt(Map<String, Object> param) throws Exception {                     
           return playerDao.selectAttrElemMapListCnt(param);      
    }    
    @Override
    public PagedList getCategoryAttrElemMapPagedList(Map<String, Object> paramMap) throws Exception {                              
        List<?> list = this.getCategoryAttrElemMapList(paramMap);
 
        int pageNo       = (Integer) paramMap.get("pageNo");    
        int listRowCnt   = (Integer) paramMap.get("listRowCnt");
        int totalListCnt = (Integer) paramMap.get("totalListCnt");
        int pageSize     = (Integer) paramMap.get("pageSize");
        int startRow     = (Integer) paramMap.get("startRow");                              
        int endRow       = (Integer) paramMap.get("endRow");       
 
        PagedList pagedList = new PagedList(list, pageNo, pageSize, totalListCnt, startRow, endRow, listRowCnt);
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
           return playerDao.selectAttrElemMapList(paramMap);            
    } 

    @Override
    public int getPlayerInfoCnt(Map<String, Object> param) throws Exception {                     
           return playerDao.selectPlayerListCnt(param);      
    }    
 
    @Override
    public PagedList getPlayerInfoPagedList(Map<String, Object> paramMap) throws Exception {                              
        List<?> list = this.getPlayerInfoList(paramMap);
 
        int pageNo       = (Integer) paramMap.get("pageNo");    
        int listRowCnt   = (Integer) paramMap.get("listRowCnt");
        int totalListCnt = (Integer) paramMap.get("totalListCnt");
        int pageSize     = (Integer) paramMap.get("pageSize");
        int startRow     = (Integer) paramMap.get("startRow");                              
        int endRow       = (Integer) paramMap.get("endRow");       
 
        PagedList pagedList = new PagedList(list, pageNo, pageSize, totalListCnt, startRow, endRow, listRowCnt);
        return pagedList;
    }   
    @Override
    public List<PlayerInfoDto> getPlayerInfoList(Map<String,Object> paramMap) throws Exception {                       
           int pageNo     = (Integer) paramMap.get("pageNo");                                   
           int listRowCnt = (Integer) paramMap.get("listRowCnt");
           int startRow   = PagingUtil.getStartRow(pageNo, listRowCnt);                                        
           int endRow     = PagingUtil.getEndRow(startRow, listRowCnt);
     
           paramMap.put("startRow", startRow);                                     
           paramMap.put("endRow", endRow);
           
           return playerDao.selectPlayerList(paramMap);            
    } 
    /**
     * 카테고리별 검색된 갯수 조회
     * @param paramMap
     * @return
     * @throws Exception
     */
    @Override
    public List<PlayerInfoSearchDto> getPlayerInfoCntPerCategory(Map<String, Object> paramMap) throws Exception {
        return this.playerDao.selectSearchedPlayerListPerCategory(paramMap);
    }
    /**
     * @brief player에 등록된 사용자인지 여부를 체크
     * @param userObj
     * @return
     * @throws Exception
     */
    @Override
    public boolean getIsRegisted(UserDto userObj) throws Exception{
    	return this.playerDao.selectIsRegisted(userObj);
    }
    /**
     * @brief autoComplete
     * @param searchConditionPlayer
     * @return
     * @throws Exception
     */
    @Override
    public List<String> getAutoComplete(SearchConditionPlayer searchConditionPlayer) throws Exception{
    	return this.playerDao.selectAutoComplete(searchConditionPlayer);
    }
}
