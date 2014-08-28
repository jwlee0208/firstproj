package com.firstproj.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.board.dto.BoardArticleDto;
import com.firstproj.common.util.SearchCondition;

@Repository("BoardArticleDao")
public class BoardArticleDao extends SqlSessionDaoSupport{
	/**
	 * 게시판 조회
	 * @return
	 * @throws Exception
	 */
	public List<BoardArticleDto> getBoardList() throws Exception{
		return getSqlSession().selectList("sql.board.selectList");
	}
	
	public List<BoardArticleDto> selectBoardList(Map<String, Object> param) throws Exception {                          
	       SearchCondition searchCondition = new SearchCondition();             
	       searchCondition.setStartRow((Integer)param.get("startRow"));
	       searchCondition.setEndRow((Integer)param.get("endRow"));
	                          
	       searchCondition.setBoardId((int)param.get("boardId"));
	       searchCondition.setSearchCondition((String)param.get("searchCondition"));
	       searchCondition.setSearchText((String)param.get("searchText"));
	       searchCondition.setStartDate((String)param.get("startDate"));
	       searchCondition.setEndDate((String)param.get("endDate"));
	 
	       List<BoardArticleDto> list =  getSqlSession().selectList("sql.board.selectBoardList", searchCondition);
	       
	       
	       return list;   
	}
	
	public int selectListCnt(Map<String, Object> param) throws Exception {
	       SearchCondition searchCondition = new SearchCondition();
	        
	       searchCondition.setBoardId((int)param.get("boardId"));
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
	public int insertBoard(BoardArticleDto boardDto) throws Exception{
		
//		System.out.println("dao : " + boardDto.toString());
		
		return getSqlSession().insert("sql.board.insertBoard", boardDto);
	}
	
	/**
	 * 게시글 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardArticleDto selectBoardContent(BoardArticleDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectBoardContent", boardDto);
	}
	/**
	 * 이전 글 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardArticleDto selectPrevBoardContent(BoardArticleDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectPrevBoardContent", boardDto);
	}
	/**
	 * 다음 글 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardArticleDto selectNextBoardContent(BoardArticleDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectNextBoardContent", boardDto);
	}
	/**
	 * 다섯개의 게시글 조회
	 * <pre>
	 * 1. MethodName	: selectBoardArticleFive
	 * 2. ClassName		: BoardArticleDao
	 * 3. Comment		: 
	 * 4. 작성자			: leejinwon
	 * 5. 작성일			: 2014. 8. 28. 오후 3:39:03
	 * </pre>
	 *   @param boardDto
	 *   @return
	 *   @throws Exception
	 *   @return List<BoardArticleDto>
	 */
	public List<BoardArticleDto> selectBoardArticleFive(BoardArticleDto boardDto) throws Exception{
		return getSqlSession().selectList("sql.board.selectArticleFive", boardDto);
				
	}
}
