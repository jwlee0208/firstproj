package com.firstproj.board.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("board.boardCategoryPortalDto")
public class BoardCategoryPortalDto extends BoardCategoryDto{
    
    private List<BoardDto>   boardList;
    
    public List<BoardDto> getBoardList() {
        return boardList;
    }
    public void setBoardList(List<BoardDto> boardList) {
        this.boardList = boardList;
    }
    
    @Override
    public String toString() {
        return "BoardCategoryPortalDto [boardList=" + boardList + "]";
    }
    
}
