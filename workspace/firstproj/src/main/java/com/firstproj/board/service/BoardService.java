package com.firstproj.board.service;

import java.util.List;
import java.util.Map;

import com.firstproj.board.dto.BoardArticleDto;
import com.firstproj.common.util.PagedList;

public interface BoardService {
	public List<BoardArticleDto> getBoardList() throws Exception;
	public int selectListCnt(Map<String, Object> param) throws Exception;
	public PagedList getBoardPagedList(Map<String, Object> paramMap) throws Exception;
	public List<BoardArticleDto> getBoardList(Map<String,Object> paramMap) throws Exception;
	
	public int insertBoard(BoardArticleDto boardDto) throws Exception;
	public BoardArticleDto selectBoardContent(BoardArticleDto boardDto) throws Exception;
	public BoardArticleDto selectPrevBoardContent(BoardArticleDto boardDto) throws Exception;
	public BoardArticleDto selectNextBoardContent(BoardArticleDto boardDto) throws Exception; 
}
