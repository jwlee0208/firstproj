package com.firstproj.player.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.player.SearchConditionPlayer;
import com.firstproj.player.dto.CategoryAttrDto;
import com.firstproj.player.dto.CategoryAttrElemMapDto;
import com.firstproj.player.dto.CategoryDto;
import com.firstproj.player.dto.PlayerInfoDto;
import com.firstproj.player.dto.PlayerInfoSearchDto;
import com.firstproj.user.dto.UserDto;

@Repository("PlayerDao")
public class PlayerDao extends SqlSessionDaoSupport{

    public List<CategoryAttrElemMapDto> getAttrMapList(CategoryAttrElemMapDto param) throws Exception{
        return getSqlSession().selectList("sql.player.selectCategoryAttrElemMapList", param);
    }
    
    public List<CategoryDto> getCategoryList(CategoryDto param) throws Exception{
        return getSqlSession().selectList("sql.player.selectCategoryList", param);
    }
    
    public List<CategoryAttrDto> getAttrElemList(CategoryAttrDto param) throws Exception{
        return getSqlSession().selectList("sql.player.selectCategoryAttrElemList", param);
    }
    /**
     * 카테고리 속성 매핑 리스트 조회
     * @param param
     * @return
     * @throws Exception
     */
    public List<CategoryAttrElemMapDto> selectAttrElemMapList(Map<String, Object> param) throws Exception {                          
        SearchConditionPlayer searchConditionPlayer = new SearchConditionPlayer();             
        searchConditionPlayer.setStartRow((Integer)param.get("startRow"));
        searchConditionPlayer.setEndRow((Integer)param.get("endRow"));
                           
        searchConditionPlayer.setCatId((String)param.get("catId"));
        searchConditionPlayer.setAttrId((String)param.get("attrId"));
        searchConditionPlayer.setAttrElemId((List<String>)param.get("attrElemId"));
        searchConditionPlayer.setSearchCondition((String)param.get("searchCondition"));
        searchConditionPlayer.setSearchText((String)param.get("searchText"));
        searchConditionPlayer.setStartDate((String)param.get("startDate"));
        searchConditionPlayer.setEndDate((String)param.get("endDate"));
  
        System.out.println("dao searchText : " + searchConditionPlayer.getSearchText());
        System.out.println("dao searchCondition : " + searchConditionPlayer.getSearchCondition());
        
        List<CategoryAttrElemMapDto> list =  getSqlSession().selectList("sql.player.selectBoardList", searchConditionPlayer);
        
        return list;   
    }
    
    /**
     * 카테고리 속성 매핑 리스트에 대한 카운트 조회
     * @param param
     * @return
     * @throws Exception
     */
    public int selectAttrElemMapListCnt(Map<String, Object> param) throws Exception {
        SearchConditionPlayer searchConditionPlayer = new SearchConditionPlayer();
         
        searchConditionPlayer.setCatId((String)param.get("catId"));
        searchConditionPlayer.setAttrId((String)param.get("attrId"));
        searchConditionPlayer.setAttrElemId((List<String>)param.get("attrElemId"));
        searchConditionPlayer.setSearchCondition((String)param.get("searchCondition"));
        searchConditionPlayer.setSearchText((String)param.get("searchText"));
        searchConditionPlayer.setStartDate((String)param.get("startDate"));
        searchConditionPlayer.setEndDate((String)param.get("endDate"));
  
        int result = getSqlSession().selectOne("sql.player.selectListCount", searchConditionPlayer);                
        return result;
    }

    /**
     * playerList 조회
     * @param param
     * @return
     * @throws Exception
     */
    public List<PlayerInfoDto> selectPlayerList(Map<String, Object> param) throws Exception {                          
        SearchConditionPlayer searchConditionPlayer = new SearchConditionPlayer();             
        searchConditionPlayer.setStartRow((Integer)param.get("startRow"));
        searchConditionPlayer.setEndRow((Integer)param.get("endRow"));
                           
        searchConditionPlayer.setCatId((String)param.get("catId"));        
        searchConditionPlayer.setAttrId((String)param.get("attrId"));
        searchConditionPlayer.setAttrElemId((List<String>)param.get("attrElemId"));
        searchConditionPlayer.setSearchCondition((String)param.get("searchCondition"));
        searchConditionPlayer.setSearchText((String)param.get("searchText"));
        searchConditionPlayer.setStartDate((String)param.get("startDate"));
        searchConditionPlayer.setEndDate((String)param.get("endDate"));
  
        System.out.println("dao searchText : " + searchConditionPlayer.getSearchText());
        System.out.println("dao searchCondition : " + searchConditionPlayer.getSearchCondition());
        System.out.println("dao catId : " + searchConditionPlayer.getCatId());
        
        List<PlayerInfoDto> list =  getSqlSession().selectList("sql.player.selectPlayerList", searchConditionPlayer);
        
        return list;   
    }
     
    /**
     * playerListCount 조회
     * @param param
     * @return
     * @throws Exception
     */
    public int selectPlayerListCnt(Map<String, Object> param) throws Exception{
        SearchConditionPlayer searchConditionPlayer = new SearchConditionPlayer();
        
        searchConditionPlayer.setCatId((String)param.get("catId"));
        searchConditionPlayer.setAttrId((String)param.get("attrId"));
        searchConditionPlayer.setAttrElemId((List<String>)param.get("attrElemId"));
        searchConditionPlayer.setSearchCondition((String)param.get("searchCondition"));
        searchConditionPlayer.setSearchText((String)param.get("searchText"));
        searchConditionPlayer.setStartDate((String)param.get("startDate"));
        searchConditionPlayer.setEndDate((String)param.get("endDate"));
//System.out.println("attrElemId : " + searchConditionPlayer.getAttrElemId().size());
        int result = getSqlSession().selectOne("sql.player.selectPlayerListCount", searchConditionPlayer);                
        return result;

    }
    /**
     * 카테고리별 검색된 갯수 조회
     * @param param
     * @return
     * @throws Exception
     */
    public List<PlayerInfoSearchDto> selectSearchedPlayerListPerCategory(Map<String, Object> param) throws Exception{
        SearchConditionPlayer searchConditionPlayer = new SearchConditionPlayer();
        searchConditionPlayer.setSearchCondition((String)param.get("searchCondition"));
        searchConditionPlayer.setSearchText((String)param.get("searchText"));
        return getSqlSession().selectList("sql.player.selectSearchCountListPerCategory", searchConditionPlayer); 
    }
    
    /**
     * @brief player에 등록된 사용자인지 여부를 체크
     * @param param
     * @return
     * @throws Exception
     */
    public boolean selectIsRegisted(UserDto param) throws Exception{
    	
    	int chkCnt = getSqlSession().selectOne("sql.player.checkIsRegisted", param);
    	
    	return (chkCnt > 0) ? true : false;
    }
}
