package com.firstproj.player.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.player.SearchConditionPlayer;
import com.firstproj.player.dto.CategoryAttrDto;
import com.firstproj.player.dto.CategoryAttrElemDto;
import com.firstproj.player.dto.CategoryAttrElemMapDto;
import com.firstproj.player.dto.CategoryDto;

@Repository("PlayerDao")
public class PlayerDao extends SqlSessionDaoSupport{

    public List<CategoryAttrElemMapDto> getAttrMapList(CategoryAttrElemMapDto param) throws Exception{
        return getSqlSession().selectList("sql.player.selectCategoryAttrElemMapList", param);
    }
    
    public List<CategoryDto> getCategoryList(CategoryDto param) throws Exception{
        return getSqlSession().selectList("sql.player.selectCategoryList", param);
    }
    
    public List<CategoryAttrElemDto> getAttrElemList(CategoryAttrDto param) throws Exception{
        return getSqlSession().selectList("sql.player.selectCategoryAttrElemList", param);
    }
    
    public List<CategoryAttrElemMapDto> selectBoardArticleList(Map<String, Object> param) throws Exception {                          
        SearchConditionPlayer searchCondition = new SearchConditionPlayer();             
        searchCondition.setStartRow((Integer)param.get("startRow"));
        searchCondition.setEndRow((Integer)param.get("endRow"));
                           
        searchCondition.setCatId((String)param.get("catId"));
        searchCondition.setAttrId((String)param.get("attrId"));
        searchCondition.setAttrElemId((List<String>)param.get("attrElemId"));
        searchCondition.setSearchCondition((String)param.get("searchCondition"));
        searchCondition.setSearchText((String)param.get("searchText"));
        searchCondition.setStartDate((String)param.get("startDate"));
        searchCondition.setEndDate((String)param.get("endDate"));
  
        List<CategoryAttrElemMapDto> list =  getSqlSession().selectList("sql.player.selectBoardList", searchCondition);
        
        return list;   
 }
    
    
    public int selectArticleListCnt(Map<String, Object> param) throws Exception {
        SearchConditionPlayer searchCondition = new SearchConditionPlayer();
         
        searchCondition.setCatId((String)param.get("catId"));
        searchCondition.setAttrId((String)param.get("attrId"));
        searchCondition.setAttrElemId((List<String>)param.get("attrElemId"));
        searchCondition.setSearchCondition((String)param.get("searchCondition"));
        searchCondition.setSearchText((String)param.get("searchText"));
        searchCondition.setStartDate((String)param.get("startDate"));
        searchCondition.setEndDate((String)param.get("endDate"));
  
        int result = getSqlSession().selectOne("sql.player.selectListCount", searchCondition);                
        return result;
 } 
}
