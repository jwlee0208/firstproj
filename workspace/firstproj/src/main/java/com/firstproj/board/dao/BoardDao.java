package com.firstproj.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.board.dto.BoardDto;
import com.firstproj.common.util.SearchCondition;

@Repository("BoardDao")
public class BoardDao extends SqlSessionDaoSupport{
	/**
	 * 게시판 조회
	 * @return
	 * @throws Exception
	 */
	public List<BoardDto> getBoardList() throws Exception{
		return getSqlSession().selectList("sql.board.selectList");
	}
	
	public List<BoardDto> selectBoardList(Map<String, Object> param) throws Exception {                          
	       SearchCondition searchCondition = new SearchCondition();             
	       searchCondition.setStartRow((Integer)param.get("startRow"));
	       searchCondition.setEndRow((Integer)param.get("endRow"));
	                          
	       searchCondition.setSearchCondition((String)param.get("searchCondition"));
	       searchCondition.setSearchText((String)param.get("searchText"));
	       searchCondition.setStartDate((String)param.get("startDate"));
	       searchCondition.setEndDate((String)param.get("endDate"));
	       searchCondition.setEmployeeYn((String)param.get("employeeYn"));
	 
	       List<BoardDto> list =  getSqlSession().selectList("sql.board.selectBoardList", searchCondition);
	       return list;   
	}
	
	public int selectListCnt(Map<String, Object> param) throws Exception {
	       SearchCondition searchCondition = new SearchCondition();
	                                                        
	       searchCondition.setSearchCondition((String)param.get("searchCondition"));
	       searchCondition.setSearchText((String)param.get("searchText"));
	       searchCondition.setStartDate((String)param.get("startDate"));
	       searchCondition.setEndDate((String)param.get("endDate"));
	       searchCondition.setEmployeeYn((String)param.get("employeeYn"));
	 
	       int result = getSqlSession().selectOne("sql.board.selectListCount", searchCondition);                
	       return result;
	} 
	
	/**
	 * 게시글 입력
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public int insertBoard(BoardDto boardDto) throws Exception{
		return getSqlSession().insert("sql.board.insertBoard", boardDto);
	}
}
