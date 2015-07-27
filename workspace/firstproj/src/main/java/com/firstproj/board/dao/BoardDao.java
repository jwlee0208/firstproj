package com.firstproj.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.board.dto.BoardCategoryDto;
import com.firstproj.board.dto.BoardCategoryPortalDto;
import com.firstproj.board.dto.BoardDto;
import com.firstproj.common.util.SearchCondition;

@Repository("BoardDao")
public class BoardDao extends SqlSessionDaoSupport{
	/**
	 * 게시판 목록 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
    public List<BoardDto> getBoardList() throws Exception{     
        return getSqlSession().selectList("sql.board.selectBoardListAll");
    }

    
    public List<BoardDto> getBoardList(Map<String, Object> param) throws Exception{
		
	       SearchCondition searchCondition = new SearchCondition();             
	       searchCondition.setStartRow((Integer)param.get("startRow"));
	       searchCondition.setEndRow((Integer)param.get("endRow"));
	                          
	       searchCondition.setSearchCondition((String)param.get("searchCondition"));
	       searchCondition.setSearchText((String)param.get("searchText"));
	       searchCondition.setStartDate((String)param.get("startDate"));
	       searchCondition.setEndDate((String)param.get("endDate"));
		
		return getSqlSession().selectList("sql.board.selectBoardList", param);
	}
	
	public int selectListCnt(Map<String, Object> param) throws Exception {
	       SearchCondition searchCondition = new SearchCondition();
	        
	       searchCondition.setSearchCondition((String)param.get("searchCondition"));
	       searchCondition.setSearchText((String)param.get("searchText"));
	       searchCondition.setStartDate((String)param.get("startDate"));
	       searchCondition.setEndDate((String)param.get("endDate"));
	 
	       int result = getSqlSession().selectOne("sql.board.selectListCount", searchCondition);                
	       return result;
	} 

	/**
	 * 게시판 정보 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardDto getBoardInfo(BoardDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectBoardList", boardDto);
	}
	/**
	 * 게시판 추가
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public int insertBoardInfo(BoardDto boardDto) throws Exception{
		return getSqlSession().insert("sql.board.insertBoardInfo", boardDto);
	}
	/**
	 * 게시판 정보 수정
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public int updateBoardInfo(BoardDto boardDto) throws Exception{
		return getSqlSession().update("sql.board.updateBoardInfo", boardDto);
	}

	/**
	 * 게시글 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardDto selectBoardInfo(BoardDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectBoardInfo", boardDto);
	}
	/**
	 * 이전 글 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardDto selectPrevBoardInfo(BoardDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectPrevBoardInfo", boardDto);
	}
	/**
	 * 다음 글 조회
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public BoardDto selectNextBoardInfo(BoardDto boardDto) throws Exception{
		return getSqlSession().selectOne("sql.board.selectNextBoardInfo", boardDto);
	}
	/**
	 * 게시판 추가
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public int modifyBoardInfo(BoardDto boardDto) throws Exception{
		return getSqlSession().update("sql.board.updateBoardInfo", boardDto);
	}
	/**
	 * 게시판 카테고리 조회
	 * @return
	 * @throws Exception
	 */
	public List<BoardCategoryDto> selectBoardCategoryList() throws Exception{
	    return getSqlSession().selectList("sql.board.selectBoardCategoryList");
	}
	/**
	 * 게시판 카테고리 & 게시판 목록 조회
	 * @return
	 * @throws Exception
	 */
	public List<BoardCategoryPortalDto> selectBoardCategoryAndBoardList() throws Exception{
	    return getSqlSession().selectList("sql.board.selectBoardCategoryAndBoardList");
	}
    /**
     * 게시판 카테고리 & 게시판 정보 조회
     * @return
     * @throws Exception
     */
    public BoardDto selectBoardCategoryAndBoardInfo(BoardDto boardDto) throws Exception{
        return getSqlSession().selectOne("sql.board.selectBoardCategoryAndBoardInfo", boardDto);
    }
}
