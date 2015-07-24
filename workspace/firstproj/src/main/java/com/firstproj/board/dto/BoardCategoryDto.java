package com.firstproj.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("board.boardCategoryDto")
public class BoardCategoryDto {
    private int     boardCategoryId;
    private String  boardCategoryName;
    
    public int getBoardCategoryId() {
        return boardCategoryId;
    }
    public void setBoardCategoryId(int boardCategoryId) {
        this.boardCategoryId = boardCategoryId;
    }
    public String getBoardCategoryName() {
        return boardCategoryName;
    }
    public void setBoardCategoryName(String boardCategoryName) {
        this.boardCategoryName = boardCategoryName;
    }
    
    @Override
    public String toString() {
        return "BoardCategoryDto [boardCategoryId=" + boardCategoryId
                + ", boardCategoryName=" + boardCategoryName + "]";
    }
   
}
