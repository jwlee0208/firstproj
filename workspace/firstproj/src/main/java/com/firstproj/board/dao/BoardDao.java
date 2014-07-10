package com.firstproj.board.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.board.dto.BoardDto;

@Repository("BoardDao")
public class BoardDao extends SqlSessionDaoSupport{
	/**
	 * 게시판 조회
	 * @return
	 * @throws Exception
	 */
	public List<BoardDto> getBoardList() throws Exception{
		return getSqlSession().selectList("sql.board.selectList");
	}
	/**
	 * 게시글 입력
	 * @param boardDto
	 * @return
	 * @throws Exception
	 */
	public int insertBoard(BoardDto boardDto) throws Exception{
		return getSqlSession().insert("sql.board.insertBoard", boardDto);
	}
}
