package com.firstproj.prohibiteword.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.board.dto.BoardDto;
import com.firstproj.common.util.SearchCondition;
import com.firstproj.prohibiteword.dto.ProhibiteWordDto;

@Repository("prohibiteWordDao")
public class ProhibiteWordDao extends SqlSessionDaoSupport {
	
	public List<ProhibiteWordDto> getProhibiteList() throws Exception{
		return getSqlSession().selectList("sql.prohibite.selectList");
	}
	
	public List<ProhibiteWordDto> selectProhibiteList(Map<String, Object> param) throws Exception{
	       SearchCondition searchCondition = new SearchCondition();             
	       searchCondition.setStartRow((Integer)param.get("startRow"));
	       searchCondition.setEndRow((Integer)param.get("endRow"));
	                          
	       searchCondition.setSearchCondition((String)param.get("searchCondition"));
	       searchCondition.setSearchText((String)param.get("searchText"));
	       searchCondition.setStartDate((String)param.get("startDate"));
	       searchCondition.setEndDate((String)param.get("endDate"));
	 
	       List<ProhibiteWordDto> list =  getSqlSession().selectList("sql.prohibite.selectProhibiteList", searchCondition);	       
	       
	       return list;  	
	}
	
	public int selectListCnt(Map<String, Object> param) throws Exception{
	       SearchCondition searchCondition = new SearchCondition();
	        
	       searchCondition.setSearchCondition((String)param.get("searchCondition"));
	       searchCondition.setSearchText((String)param.get("searchText"));
	       searchCondition.setStartDate((String)param.get("startDate"));
	       searchCondition.setEndDate((String)param.get("endDate"));

	       int result = getSqlSession().selectOne("sql.prohibite.selectListCount", param);
		return result;
	}
	
	/**
	 * 게시글 입력
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public int insertProhibiteWord(ProhibiteWordDto prohibiteWordDto) throws Exception{
		
		return getSqlSession().insert("sql.prohibite.insertProhibitedWord", prohibiteWordDto);
	}
}
