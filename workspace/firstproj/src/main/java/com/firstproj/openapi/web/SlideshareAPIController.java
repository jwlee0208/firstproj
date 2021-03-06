package com.firstproj.openapi.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.social.slideshare.api.domain.Slideshow;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.firstproj.openapi.dto.SearchCommonAPIDto;
import com.firstproj.openapi.service.impl.SlideshareAPIServiceImpl;

@Controller
@RequestMapping(value = "/api/slideshare")
public class SlideshareAPIController {
    
    @Resource(name = "SlideshareAPIServiceImpl")
    private SlideshareAPIServiceImpl slideshareAPIService;

    @RequestMapping(value = "/slideList")
    public String getSlideList(SearchCommonAPIDto searchCommonAPIDto, Model model){
        String              keyword         = searchCommonAPIDto.getKeyword();
        List<Slideshow>     slideList       = null;
        
        if(!StringUtils.isEmpty(keyword)){
            slideList       = this.slideshareAPIService.searchSlideshowList(keyword);
        }
        
        model.addAttribute("slideList", slideList);
        return "api/slideshare/ajaxSlideList";
    }
}
