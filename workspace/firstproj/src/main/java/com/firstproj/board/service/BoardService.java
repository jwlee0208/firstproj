package com.firstproj.board.service;

import java.util.List;
import java.util.Map;

import com.firstproj.board.dto.BoardDto;
import com.firstproj.common.util.PagedList;

public interface BoardService {
	public List<BoardDto> getBoardList() throws Exception;
	public int selectListCnt(Map<String, Object> param) throws Exception;
	public PagedList getBoardPagedList(Map<String, Object> paramMap) throws Exception;
	public List<BoardDto> getBoardList(Map<String,Object> paramMap) throws Exception;
	
	public int insertBoard(BoardDto boardDto) throws Exception;
	public BoardDto selectBoardContent(BoardDto boardDto) throws Exception;
	public BoardDto selectPrevBoardContent(BoardDto boardDto) throws Exception;
	public BoardDto selectNextBoardContent(BoardDto boardDto) throws Exception; 
}
