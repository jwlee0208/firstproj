package com.firstproj.share.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.firstproj.common.dto.ShareDto;
import com.firstproj.share.dao.ShareDao;

@Service("ShareServiceImpl")
public class ShareServiceImpl implements ShareService{
    
    @Inject
    private ShareDao shareDao;
    
    @Override
    public ShareDto getShareInfo(ShareDto shareDto) throws Exception{
        return this.shareDao.selectShareInfo(shareDto);
    }

    @Override
    public int insertShareInfo(ShareDto shareDto) throws Exception{
        return this.shareDao.insertShareInfo(shareDto);
    }
}
