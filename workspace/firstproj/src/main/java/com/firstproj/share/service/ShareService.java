package com.firstproj.share.service;

import com.firstproj.common.dto.ShareDto;

public interface ShareService {
    public ShareDto  getShareInfo(ShareDto shareDto)    throws Exception;
    
    public int       insertShareInfo(ShareDto shareDto) throws Exception;

    public int       updateShareInfo(ShareDto shareDto) throws Exception;
    
}
