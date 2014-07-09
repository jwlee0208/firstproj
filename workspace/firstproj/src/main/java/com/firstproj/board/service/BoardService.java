package com.firstproj.board.service;

import java.util.List;

import com.firstproj.board.dto.BoardDto;

public interface BoardService {
	public List<BoardDto> getBoardList() throws Exception;
}
