package com.firstproj.board.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.board.dto.BoardDto;

@Repository("BoardDao")
public class BoardDao extends SqlSessionDaoSupport{
	
	public List<BoardDto> getBoardList() throws Exception{
		return getSqlSession().selectList("sql.board.selectList");
	}
	
}
