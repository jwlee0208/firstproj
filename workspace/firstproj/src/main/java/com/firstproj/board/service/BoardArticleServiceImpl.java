package com.firstproj.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.firstproj.board.dao.BoardArticleDao;
import com.firstproj.board.dto.BoardArticleDto;
import com.firstproj.common.util.PagedList;
import com.firstproj.common.util.PagingUtil;

@Service("BoardArticleServiceImpl")
public class BoardArticleServiceImpl implements BoardArticleService{
	
	@Resource(name="BoardArticleDao")
	private BoardArticleDao boardArticleDao;
	
	@Override
	public List<BoardArticleDto> getBoardList() throws Exception{
		return this.boardArticleDao.getBoardList();
	}
	@Override
	public int selectListCnt(Map<String, Object> param) throws Exception {                     
	       return boardArticleDao.selectListCnt(param);      
	}    
	@Override
	public PagedList getBoardPagedList(Map<String, Object> paramMap) throws Exception {                              
        List<?> articleList = this.getBoardList(paramMap);
 
        int pageNo       = (Integer) paramMap.get("pageNo");    
        int listRowCnt   = (Integer) paramMap.get("listRowCnt");
        int totalListCnt = (Integer) paramMap.get("totalListCnt");
        int pageSize     = (Integer) paramMap.get("pageSize");
        int startRow     = (Integer) paramMap.get("startRow");                              
        int endRow       = (Integer) paramMap.get("endRow");       
 
        PagedList pagedList = new PagedList(articleList, pageNo, pageSize, totalListCnt, startRow, endRow, listRowCnt);
	    return pagedList;
	}   
	@Override
	public List<BoardArticleDto> getBoardList(Map<String,Object> paramMap) throws Exception {                       
	       int pageNo     = (Integer) paramMap.get("pageNo");                                   
	       int listRowCnt = (Integer) paramMap.get("listRowCnt");
	       int startRow   = PagingUtil.getStartRow(pageNo, listRowCnt);                                        
	       int endRow     = PagingUtil.getEndRow(startRow, listRowCnt);
	 
	       paramMap.put("startRow", startRow);                                     
	       paramMap.put("endRow", endRow);
	       return boardArticleDao.selectBoardList(paramMap);            
	} 
	
	@Override
	public int insertBoard(BoardArticleDto boardDto) throws Exception{
		return this.boardArticleDao.insertBoard(boardDto);
	}
	/**
	 * 게시 글 조회
	 */
	@Override
	public BoardArticleDto selectBoardContent(BoardArticleDto boardDto) throws Exception {
		
		return this.boardArticleDao.selectBoardContent(boardDto);
	}
	/**
	 * 이전 글 조회
	 */
	@Override
	public BoardArticleDto selectPrevBoardContent(BoardArticleDto boardDto) throws Exception {
		return this.boardArticleDao.selectPrevBoardContent(boardDto);
	}
	/**
	 * 다음 글 조회
	 */
	@Override
	public BoardArticleDto selectNextBoardContent(BoardArticleDto boardDto) throws Exception {
		return this.boardArticleDao.selectNextBoardContent(boardDto);
	}
	
	@Override
	public List<BoardArticleDto> selectBoardArticleFive(BoardArticleDto boardDto) throws Exception {
		return this.boardArticleDao.selectBoardArticleFive(boardDto);
	}
}
