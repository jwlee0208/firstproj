package com.firstproj.player.service;

import java.util.List;
import java.util.Map;

import com.firstproj.common.util.PagedList;
import com.firstproj.player.SearchConditionPlayer;
import com.firstproj.player.dto.CategoryAttrDto;
import com.firstproj.player.dto.CategoryAttrElemMapDto;
import com.firstproj.player.dto.CategoryDto;
import com.firstproj.player.dto.PlayerInfoDetail;
import com.firstproj.player.dto.PlayerInfoDto;
import com.firstproj.player.dto.PlayerInfoSearchDto;
import com.firstproj.user.dto.UserDto;

public interface PlayerService {
	
    public List<CategoryAttrElemMapDto> getCategoryAttrElemMapList(CategoryAttrElemMapDto param) 					throws Exception;
    
    public List<CategoryDto> 			getCategoryList(CategoryDto param) 											throws Exception;
    
    public List<CategoryAttrDto> 		getAttrElementList(CategoryAttrDto param) 									throws Exception;
    
    public int	 						getCategoryAttrElemMapCnt(Map<String, Object> param) 						throws Exception;
    
    public PagedList 					getCategoryAttrElemMapPagedList(Map<String, Object> paramMap) 				throws Exception;
    
    public List<CategoryAttrElemMapDto> getCategoryAttrElemMapList(Map<String,Object> paramMap) 					throws Exception;

    public int 							getPlayerInfoCnt(Map<String, Object> param) 								throws Exception;
    
    public PagedList 					getPlayerInfoPagedList(Map<String, Object> paramMap) 						throws Exception; 
    
    public List<PlayerInfoDto> 			getPlayerInfoList(Map<String,Object> paramMap) 								throws Exception;
    
    public List<PlayerInfoSearchDto> 	getPlayerInfoCntPerCategory(Map<String, Object> paramMap) 					throws Exception; 

    public boolean 						getIsRegisted(UserDto userObj) 												throws Exception;
    
    public List<String> 				getAutoComplete(SearchConditionPlayer searchConditionPlayer) 				throws Exception;
    
    
    public int 							insertPlayerInfoDetail(PlayerInfoDetail playerInfoDetail, UserDto userInfo) throws Exception;
    
    public PlayerInfoDto 				getPlayerInfoDetail(UserDto userDto) 										throws Exception;
    
    public boolean 						getIsRegistedPlayer(UserDto userDto) 										throws Exception;
    
    public int 							deletePlayerInfo(PlayerInfoDto playerInfoDto) 								throws Exception;
    
    public int updatePlayerInfoDetail(PlayerInfoDetail playerInfoDetail, UserDto userInfo) 							throws Exception;
}
