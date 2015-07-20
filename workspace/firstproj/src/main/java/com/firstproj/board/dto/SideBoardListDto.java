package com.firstproj.board.dto;

import org.apache.ibatis.type.Alias;

@Alias("board.sideBoardListDto")
public class SideBoardListDto extends BoardDto{
    private int boardArticleCnt;

    public int getBoardArticleCnt() {
        return boardArticleCnt;
    }

    public void setBoardArticleCnt(int boardArticleCnt) {
        this.boardArticleCnt = boardArticleCnt;
    }

    @Override
    public String toString() {
        return "SideBoardListDto [boardArticleCnt=" + boardArticleCnt + "]";
    }
    
}
