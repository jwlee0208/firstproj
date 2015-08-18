package com.firstproj.board.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.board.dto.BoardCategoryDto;

@Repository("BoardCategoryDao")
public class BoardCategoryDao extends SqlSessionDaoSupport{
    
    public List<BoardCategoryDto> selectBoardCategoryList() throws Exception{
        return getSqlSession().selectList("sql.boardcategory.selectBoardCategoryList");
    }
    
    public int insertBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception{
        return getSqlSession().insert("sql.boardcategory.insertBoardCategory", boardCategoryDto);
    }

    public int updateBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception{
        return getSqlSession().update("sql.boardcategory.updateBoardCategory", boardCategoryDto);
    }

    public int deleteBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception{
        return getSqlSession().delete("sql.boardcategory.deleteBoardCategory", boardCategoryDto);
    }

}
