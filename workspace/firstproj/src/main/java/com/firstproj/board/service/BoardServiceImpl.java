package com.firstproj.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.firstproj.board.dao.BoardDao;
import com.firstproj.board.dto.BoardDto;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="BoardDao")
	private BoardDao boardDao;
	
	public List<BoardDto> getBoardList() throws Exception{
		return this.boardDao.getBoardList();
	}

	public int insertBoard(BoardDto boardDto) throws Exception{
		return this.boardDao.insertBoard(boardDto);
	}
}
