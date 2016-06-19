package com.firstproj.profile.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.xerces.impl.dv.util.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.firstproj.common.paging.PageHolder;
import com.firstproj.profile.dto.ProfileAttrDto;
import com.firstproj.profile.dto.ProfileDto;
import com.firstproj.profile.dto.SearchProfileDto;
import com.firstproj.profile.service.ProfileServiceImpl;

@Controller
@RequestMapping(value="/profile")
public class ProfileController {

	private static final Log logger = LogFactory.getLog(ProfileController.class);
	
	@Resource(name="profileService")
	private ProfileServiceImpl profileService;
	
	@RequestMapping(value="/view/{profileType}/{profileId}")
	public String getProfileView(Model model, @PathVariable String profileType, @PathVariable int profileId){
		
		ProfileDto profileDto = new ProfileDto();
		profileDto.setProfileId(profileId);
		profileDto.setProfileType(profileType);
		logger.debug("[ProfileController][getProfileView] profileDto : " + profileDto.toString());
		ProfileDto selectedProfileInfo = this.profileService.getProfileInfo(profileDto);
		logger.debug("[ProfileController][getProfileView] selectedProfileInfo : " + selectedProfileInfo.toString());
		model.addAttribute("profileInfo", selectedProfileInfo);
		
		return "/profile/ajaxProfileView";
	}
	
	@RequestMapping(value="/list/{profileType}/{catId}")
	public String getProfileList(Model model, @PathVariable int profileType, @PathVariable String catId){
		
		ProfileDto profileDto = new ProfileDto();
		profileDto.setCatId1(catId);
		
		List<ProfileAttrDto> attrElementList = this.profileService.getProfileAttrElementList(profileDto);
		
		model.addAttribute("profileType"	, profileType);
		model.addAttribute("attrElementList", attrElementList);
		return "/profile/profileList";
	}
	
    @RequestMapping("/ajaxProfileList")
    public String getAjaxProfileList(HttpServletRequest request, Model model, SearchProfileDto searchProfileDto, HttpSession session){
    	logger.info("[ ProfileController.getAjaxProfileList() ][ Param ] searchProfileDto : " + searchProfileDto.toString());
    	
    	if(searchProfileDto.getSearchText() != null && searchProfileDto.getSearchText() != ""){
    	    searchProfileDto.setSearchText(new String(Base64.decode(searchProfileDto.getSearchText())));
    	}
    	
        List<ProfileDto> 	profileList = null;
        PageHolder          pageHolder 	= null;
        int                 profileCnt  = 0;
        
        searchProfileDto.setListSize(9*3);
        
        try {
            profileList = profileService.getSearchedProfileList(searchProfileDto);
            profileCnt  = profileService.getSearchedProfileListCnt(searchProfileDto);

            if(profileCnt > 0){
                pageHolder = new PageHolder(profileCnt, searchProfileDto.getPage(), 9*3);   
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            model.addAttribute("searchProfileInfo"   , searchProfileDto);
            model.addAttribute("profileList"         , profileList);
            model.addAttribute("pageHolder"          , pageHolder);
        }
        
        return "/profile/ajaxProfileList";
    }
	
}
