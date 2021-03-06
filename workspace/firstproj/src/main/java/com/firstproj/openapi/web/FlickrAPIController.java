package com.firstproj.openapi.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.firstproj.openapi.dto.SearchCommonAPIDto;
import com.firstproj.openapi.service.impl.FlickrAPIServiceImpl;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/api/flickr")
public class FlickrAPIController {
    
    @Resource(name = "FlickrAPIServiceImpl")
    private FlickrAPIServiceImpl flickrAPIService;
    
    @RequestMapping(value = "/photoList")
    public String getFlickrImageList(SearchCommonAPIDto searchCommonAPIDto, Model model){
        
        String              keyword     = searchCommonAPIDto.getKeyword();
        PhotoList<Photo>    photoList   = null;
        
        if(!StringUtils.isEmpty(keyword)){
            photoList = this.flickrAPIService.getPhotoList(keyword);
        }
        
        model.addAttribute("photoList", photoList);
        return "api/flickr/ajaxPhotoList";
    }
    
    @RequestMapping(value = "/checkAuth/{authType}")
    public JSONObject checkAuth(Model model, @PathVariable String authType){
        return this.flickrAPIService.checkAuth();
    }
}
