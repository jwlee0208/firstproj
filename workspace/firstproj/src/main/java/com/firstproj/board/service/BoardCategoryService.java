package com.firstproj.board.service;

import java.util.List;

import com.firstproj.board.dto.BoardCategoryDto;

public interface BoardCategoryService {
    public List<BoardCategoryDto> getBoardCategoryList(BoardCategoryDto boardCategoryDto) throws Exception;
    
    public int insertBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception;
    
    public int updateBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception;
    
    public int deleteBoardCategory(BoardCategoryDto boardCategoryDto) throws Exception;
}
