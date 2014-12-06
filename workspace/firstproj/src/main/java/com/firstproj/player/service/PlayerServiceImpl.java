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
import com.firstproj.player.dto.PlayerInfoDetail;
import com.firstproj.player.dto.PlayerInfoDto;
import com.firstproj.player.dto.PlayerInfoSearchDto;
import com.firstproj.player.dto.PlayerVideoLinkDto;
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
    
    @Override
    public int insertPlayerInfoDetail(PlayerInfoDetail playerInfoDetail, UserDto userInfo) throws Exception{
    	
    	// inserting playerInfo
    	PlayerInfoDto playerInfo = playerInfoDetail.getPlayerInfoDto();
    	
    	int playerInfoId = 0;
    	if(playerInfo != null){
    		
    		String userId = userInfo.getUserId();
    		System.out.println("userId : " + userId);
//    		System.out.println("}}}}}}}}}}}}}}}}}}}}}}}}}}}} userInfo : " + userInfo.toString());
    		
//    		playerInfo.setUserInfo(userInfo);
    		playerInfo.setUserId(userId);
    		playerInfoId = this.insertPlayerInfo(playerInfo);

        	// inserting playerVideoLinkInfo
        	List<PlayerVideoLinkDto> playerVideoLinkList = playerInfoDetail.getPlayerVideoLinkList();

        	if(playerVideoLinkList != null && playerVideoLinkList.size() > 0){
        		for(PlayerVideoLinkDto playerVideoLinkDto : playerVideoLinkList){
        			playerVideoLinkDto.setPlayerInfoId(playerInfoId);
        			
        			this.insertPlayerVideoLinkInfo(playerVideoLinkDto);
        		}
        	}
        	
        	// inserting categoryAttrMappingInfo
        	List<CategoryAttrElemMapDto> attrElemMapList = playerInfoDetail.getAttrElemMapList(); 
        	
        	if(attrElemMapList != null && attrElemMapList.size() > 0){
        		for(CategoryAttrElemMapDto categoryAttrElemMapDto : attrElemMapList){
        			categoryAttrElemMapDto.setUserId(userInfo.getUserId());
        			categoryAttrElemMapDto.setUserName(userInfo.getUserNm());
        			
        			this.insertCategoryPropertyMappingInfo(categoryAttrElemMapDto);
        		}
        	}
    	}
    	return playerInfoId;
    }
    
    @SuppressWarnings("unused")
	private int insertPlayerInfo(PlayerInfoDto playerInfoDto) throws Exception{
    	int insertedProductInfoId = 0;
    	// dao 호출
    	insertedProductInfoId = this.playerDao.insertPlayerInfo(playerInfoDto);
    	return insertedProductInfoId;
    }
    
    @SuppressWarnings("unused")
	private int insertPlayerVideoLinkInfo(PlayerVideoLinkDto playerVideoLinkDto) throws Exception{
    	// dao 호출
    	return this.playerDao.insertPlayerVideoLinkInfo(playerVideoLinkDto);
    }
    
    @SuppressWarnings("unused")
	private int insertCategoryPropertyMappingInfo(CategoryAttrElemMapDto categoryAttrElemMapDto) throws Exception{
    	// dao 호출
    	return this.playerDao.insertCategoryAttrElemMap(categoryAttrElemMapDto);
    }

	@Override
	public PlayerInfoDto getPlayerInfoDetail(UserDto userDto) throws Exception {
		return this.playerDao.selectPlayerInfoDetail(userDto);
	}
	@Override
	public boolean getIsRegistedPlayer(UserDto userDto) throws Exception{
		return this.playerDao.selectIsRegistedPlayer(userDto);
	}
	@Override
	public int deletePlayerInfo(PlayerInfoDto playerInfoDto) throws Exception{
		
		int deleteResult = 0;
		
		deleteResult += this.playerDao.deletePlayerElemMapInfo(playerInfoDto);
		deleteResult += this.playerDao.deletePlayerVideoLinkInfo(playerInfoDto);
		deleteResult += this.playerDao.deletePlayerInfo(playerInfoDto);
		
		return deleteResult;
	}
}
