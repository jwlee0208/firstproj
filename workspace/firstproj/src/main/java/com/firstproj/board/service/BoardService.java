package com.firstproj.board.service;

import java.util.List;
import java.util.Map;

import com.firstproj.board.dto.BoardCategoryDto;
import com.firstproj.board.dto.BoardCategoryPortalDto;
import com.firstproj.board.dto.BoardDto;
import com.firstproj.common.util.PagedList;

public interface BoardService {

	BoardDto                     getBoardInfo(BoardDto boardDto) throws Exception;

	int                          insertBoardInfo(BoardDto boardDto) throws Exception;

	int                          updateBoardInfo(BoardDto boardDto) throws Exception;

	List<BoardDto>               getBoardList() throws Exception;
	
	List<BoardDto>               getBoardList(Map<String, Object> paramMap) throws Exception;

	PagedList                    getBoardPagedList(Map<String, Object> paramMap) throws Exception;

	int                          getListCnt(Map<String, Object> param) throws Exception;

	BoardDto                     selectBoardInfo(BoardDto boardDto) throws Exception;

	BoardDto                     getPrevBoardInfo(BoardDto boardDto) throws Exception;

	BoardDto                     getNextBoardInfo(BoardDto boardDto) throws Exception;

	int                          modifyBoardInfo(BoardDto boardDto) throws Exception;

    List<BoardCategoryDto>       getBoardCategoryList() throws Exception;

    List<BoardCategoryPortalDto> getBoardCategoryAndBoardList() throws Exception;

    BoardDto                     getBoardCategoryAndBoardInfo(BoardDto boardDto) throws Exception;

}
