package com.firstproj.openapi.service.impl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.firstproj.openapi.service.FlickrAPIService;
import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.FlickrException;
import com.flickr4java.flickr.REST;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.PhotosInterface;
import com.flickr4java.flickr.photos.SearchParameters;

@Service("FlickrAPIServiceImpl")
public class FlickrAPIServiceImpl implements FlickrAPIService{
    
    @Value("${flickr.api.key}")
    private String apiKey;
    
    @Value("${flickr.shared.secret}")
    private String sharedSecret;
    
    public PhotoList<Photo> getPhotoList(String searchText){
        Flickr f = new Flickr(apiKey, sharedSecret, new REST());
        PhotosInterface  photos = f.getPhotosInterface();
        SearchParameters params = new SearchParameters();
        params.setText(searchText);

        PhotoList<Photo> photoList = null;
        try {
            photoList = photos.search(params, 10, 1);
        } catch (FlickrException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        return photoList;
    }
    
}
