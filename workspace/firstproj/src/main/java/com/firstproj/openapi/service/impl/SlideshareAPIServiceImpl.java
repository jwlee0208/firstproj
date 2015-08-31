package com.firstproj.openapi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.social.slideshare.api.SlideShare;
import org.springframework.social.slideshare.api.SlideshowOperations;
import org.springframework.social.slideshare.api.domain.SearchSlideshowsResponse;
import org.springframework.social.slideshare.api.domain.Slideshow;
import org.springframework.social.slideshare.api.impl.SlideShareTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.firstproj.openapi.service.SlideshareAPIService;

@Service("SlideshareAPIServiceImpl")
public class SlideshareAPIServiceImpl implements SlideshareAPIService{

    @Value("${slideshare.api.key}")
    private String apiKey;
    
    @Value("${slideshare.shared.secret}")
    private String sharedSecret;
    
    /**
     * @brief slideshare List 조회
     */
    @Override
    public List<Slideshow> searchSlideshowList(String searchText){
        SlideShare                  slideshare               = new SlideShareTemplate(apiKey, sharedSecret);
        SlideshowOperations         slideshowOperations      = slideshare.slideshowOperations();
        List<Slideshow>             slideshowList            = null;

        if(!StringUtils.isEmpty(searchText)){
            SearchSlideshowsResponse    searchSlideshowsResponse = slideshowOperations.searchSlideshows(searchText, 5);
            
            if(searchSlideshowsResponse.getNumResults() > 0){
                slideshowList = searchSlideshowsResponse.getSlideshows();
            }            
        }
    
        return slideshowList;
    }
}
