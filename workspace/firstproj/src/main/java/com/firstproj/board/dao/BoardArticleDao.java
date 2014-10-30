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
	public List<BoardArticleDto> getBoardArticleList(BoardArticleDto boardArticleDto) throws Exception{
		return getSqlSession().selectList("sql.boardArticle.selectList", boardArticleDto);
	}
	
	public List<BoardArticleDto> selectBoardArticleList(Map<String, Object> param) throws Exception {                          
	       SearchCondition searchCondition = new SearchCondition();             
	       searchCondition.setStartRow((Integer)param.get("startRow"));
	       searchCondition.setEndRow((Integer)param.get("endRow"));
	                          
	       searchCondition.setBoardId((int)param.get("boardId"));
	       searchCondition.setSearchCondition((String)param.get("searchCondition"));
	       searchCondition.setSearchText((String)param.get("searchText"));
	       searchCondition.setStartDate((String)param.get("startDate"));
	       searchCondition.setEndDate((String)param.get("endDate"));
	 
	       List<BoardArticleDto> list =  getSqlSession().selectList("sql.boardArticle.selectBoardList", searchCondition);
	       
	       return list;   
	}
	
	public int selectArticleListCnt(Map<String, Object> param) throws Exception {
	       SearchCondition searchCondition = new SearchCondition();
	        
	       searchCondition.setBoardId((int)param.get("boardId"));
	       searchCondition.setSearchCondition((String)param.get("searchCondition"));
	       searchCondition.setSearchText((String)param.get("searchText"));
	       searchCondition.setStartDate((String)param.get("startDate"));
	       searchCondition.setEndDate((String)param.get("endDate"));
	 
	       int result = getSqlSession().selectOne("sql.boardArticle.selectListCount", searchCondition);                
	       return result;
	} 
	
	/**
	 * 게시글 입력
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	public int insertBoardArticle(BoardArticleDto boardArticleDto) throws Exception{
		
		System.out.println(">>> In Dao : " + boardArticleDto.toString());
		
		return getSqlSession().insert("sql.boardArticle.insertArticleInfo", boardArticleDto);
	}
	/**
	 * 게시글 수정
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	public int updateBoardArticle(BoardArticleDto boardArticleDto) throws Exception{
		
		System.out.println(">>> In Dao : " + boardArticleDto.toString());
		
		return getSqlSession().update("sql.boardArticle.updateArticleInfo", boardArticleDto);
	}	
	/**
	 * 게시글 삭제
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	public int deleteBoardArticle(BoardArticleDto boardArticleDto) throws Exception{
		// 논리적 삭제
		return getSqlSession().update("sql.boardArticle.deleteArticleInfo", boardArticleDto);
	}
	
	/**
	 * 게시글 조회
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	public BoardArticleDto selectBoardArticle(BoardArticleDto boardArticleDto) throws Exception{
		return getSqlSession().selectOne("sql.boardArticle.selectBoardContent", boardArticleDto);
	}
	/**
	 * 이전 글 조회
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	public BoardArticleDto selectPrevBoardArticle(BoardArticleDto boardArticleDto) throws Exception{
		return getSqlSession().selectOne("sql.boardArticle.selectPrevBoardContent", boardArticleDto);
	}
	/**
	 * 다음 글 조회
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	public BoardArticleDto selectNextBoardArticle(BoardArticleDto boardArticleDto) throws Exception{
		return getSqlSession().selectOne("sql.boardArticle.selectNextBoardContent", boardArticleDto);
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
	 *   @param boardArticleDto
	 *   @return
	 *   @throws Exception
	 *   @return List<BoardArticleDto>
	 */
	public List<BoardArticleDto> selectBoardArticleFive(BoardArticleDto boardArticleDto) throws Exception{
		return getSqlSession().selectList("sql.boardArticle.selectArticleFive", boardArticleDto);
				
	}
	
	
	
}
