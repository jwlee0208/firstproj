package com.firstproj.share.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.firstproj.common.dto.ShareDto;
import com.firstproj.share.dao.ShareDao;
import com.firstproj.user.dto.UserDto;

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
    
    @Override
    public int updateShareInfo(ShareDto shareDto) throws Exception{
        return this.shareDao.updateShareInfo(shareDto);
    }
    
    @Override
    public void setShareInfo(Model model, HttpSession session){
        UserDto     sessionInfo     = (UserDto)session.getAttribute("userInfo");
        ShareDto    shareDto        = new ShareDto();
        ShareDto    shareInfo       = null;
        
        if(sessionInfo != null){
            shareDto.setUserId(sessionInfo.getUserId());
            try {
                shareInfo = this.getShareInfo(shareDto);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        
        model.addAttribute("shareInfo"  , shareInfo);
        model.addAttribute("userInfo"   , sessionInfo);
    }

}
