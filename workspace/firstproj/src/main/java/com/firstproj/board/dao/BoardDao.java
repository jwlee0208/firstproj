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
	                          
	       searchCondition.setBoardCategory((int)param.get("boardCategory"));
	       searchCondition.setSearchCondition((String)param.get("searchCondition"));
	       searchCondition.setSearchText((String)param.get("searchText"));
	       searchCondition.setStartDate((String)param.get("startDate"));
	       searchCondition.setEndDate((String)param.get("endDate"));
	 
	       List<BoardDto> list =  getSqlSession().selectList("sql.board.selectBoardList", searchCondition);
	       
	       
	       return list;   
	}
	
	public int selectListCnt(Map<String, Object> param) throws Exception {
	       SearchCondition searchCondition = new SearchCondition();
	        
	       searchCondition.setBoardCategory((int)param.get("boardCategory"));
	       searchCondition.setSearchCondition((String)param.get("searchCondition"));
	       searchCondition.setSearchText((String)param.get("searchText"));
	       searchCondition.setStartDate((String)param.get("startDate"));
	       searchCondition.setEndDate((String)param.get("endDate"));
	 
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
		
//		System.out.println("dao : " + boardDto.toString());
		
		return getSqlSession().insert("sql.board.insertBoard", boardDto);
	}
	
	/**
	 * 게시글 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardDto selectBoardContent(BoardDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectBoardContent", boardDto);
	}
	/**
	 * 이전 글 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardDto selectPrevBoardContent(BoardDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectPrevBoardContent", boardDto);
	}
	/**
	 * 다음 글 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardDto selectNextBoardContent(BoardDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectNextBoardContent", boardDto);
	}
}
