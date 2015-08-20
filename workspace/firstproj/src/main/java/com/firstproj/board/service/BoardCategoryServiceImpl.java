package com.firstproj.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.firstproj.board.dao.BoardCategoryDao;
import com.firstproj.board.dto.BoardCategoryDto;

@Service("BoardCategoryServiceImpl")
public class BoardCategoryServiceImpl implements BoardCategoryService{

    @Inject
    private BoardCategoryDao boardCategoryDao;

    @Override
    public List<BoardCategoryDto> getBoardCategoryList(BoardCategoryDto boardCategoryDto) throws Exception {
        // TODO Auto-generated method stub
        return this.boardCategoryDao.selectBoardCategoryList(boardCategoryDto);
    }

    @Override
    public int insertBoardCategory(BoardCategoryDto boardCategoryDto)
            throws Exception {
        // TODO Auto-generated method stub
        return this.boardCategoryDao.insertBoardCategory(boardCategoryDto);
    }

    @Override
    public int updateBoardCategory(BoardCategoryDto boardCategoryDto)
            throws Exception {
        // TODO Auto-generated method stub
        return this.boardCategoryDao.updateBoardCategory(boardCategoryDto);
    }

    @Override
    public int deleteBoardCategory(BoardCategoryDto boardCategoryDto)
            throws Exception {
        // TODO Auto-generated method stub
        return this.boardCategoryDao.deleteBoardCategory(boardCategoryDto);
    }
    
    
}
