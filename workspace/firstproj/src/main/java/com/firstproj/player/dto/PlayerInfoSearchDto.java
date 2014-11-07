package com.firstproj.player.dto;

import org.apache.ibatis.type.Alias;

@Alias("player.playerInfoSearchDto")
public class PlayerInfoSearchDto extends PlayerInfoDto{
    private int searchCntPerCat = 0;

    public int getSearchCntPerCat() {
        return searchCntPerCat;
    }

    public void setSearchCntPerCat(int searchCntPerCat) {
        this.searchCntPerCat = searchCntPerCat;
    }
    
    
}
