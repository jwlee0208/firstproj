package com.firstproj.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.firstproj.board.dao.BoardDao;
import com.firstproj.board.dto.BoardArticleDto;
import com.firstproj.board.dto.BoardDto;
import com.firstproj.common.util.PagedList;
import com.firstproj.common.util.PagingUtil;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="BoardDao")
	private BoardDao boardDao;
	@Override
	public List<BoardDto> getBoardList(Map<String, Object> paramMap) throws Exception{
	       int pageNo     = (Integer) paramMap.get("pageNo");                                   
	       int listRowCnt = (Integer) paramMap.get("listRowCnt");
	       int startRow   = PagingUtil.getStartRow(pageNo, listRowCnt);                                        
	       int endRow     = PagingUtil.getEndRow(startRow, listRowCnt);
	 
	       paramMap.put("startRow", startRow);                                     
	       paramMap.put("endRow", endRow);
		
		return this.boardDao.getBoardList(paramMap);
	}
	
	@Override
	public int selectListCnt(Map<String, Object> param) throws Exception {                     
	       return boardDao.selectListCnt(param);      
	}    	
	
	@Override
	public PagedList getBoardPagedList(Map<String, Object> paramMap) throws Exception {                              
        List<?> boardList = this.getBoardList(paramMap);
 
        int pageNo       = (Integer) paramMap.get("pageNo");    
        int listRowCnt   = (Integer) paramMap.get("listRowCnt");
        int totalListCnt = (Integer) paramMap.get("totalListCnt");
        int pageSize     = (Integer) paramMap.get("pageSize");
        int startRow     = (Integer) paramMap.get("startRow");                              
        int endRow       = (Integer) paramMap.get("endRow");       
 
        PagedList pagedList = new PagedList(boardList, pageNo, pageSize, totalListCnt, startRow, endRow, listRowCnt);
	    return pagedList;
	} 	
	
	
	@Override
	public BoardDto getBoardInfo(BoardDto boardDto) throws Exception{
		return this.boardDao.selectBoardInfo(boardDto);
	}
	@Override
	public int insertBoardInfo(BoardDto boardDto) throws Exception{
		return this.boardDao.insertBoardInfo(boardDto);
	}
	@Override
	public int updateBoardInfo(BoardDto boardDto) throws Exception{
		return this.boardDao.updateBoardInfo(boardDto);
	}
	
	/**
	 * 게시 글 조회
	 */
	@Override
	public BoardDto selectBoardInfo(BoardDto boardDto) throws Exception {
		
		return this.boardDao.selectBoardInfo(boardDto);
	}
	/**
	 * 이전 글 조회
	 */
	@Override
	public BoardDto selectPrevBoardInfo(BoardDto boardDto) throws Exception {
		return this.boardDao.selectPrevBoardInfo(boardDto);
	}
	/**
	 * 다음 글 조회
	 */
	@Override
	public BoardDto selectNextBoardInfo(BoardDto boardDto) throws Exception {
		return this.boardDao.selectNextBoardInfo(boardDto);
	}
	
	@Override
	public int modifyBoardInfo(BoardDto boardDto) throws Exception{
		return this.boardDao.modifyBoardInfo(boardDto);
	}

}
