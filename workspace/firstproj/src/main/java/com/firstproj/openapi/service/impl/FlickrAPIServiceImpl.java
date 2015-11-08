package com.firstproj.openapi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.firstproj.openapi.service.FlickrAPIService;
import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.FlickrException;
import com.flickr4java.flickr.REST;
import com.flickr4java.flickr.galleries.GalleriesInterface;
import com.flickr4java.flickr.galleries.Gallery;
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
    
    @Override
    public PhotoList<Photo> getPhotoList(String searchText){
        PhotoList<Photo> photoList  = null;
        Flickr           f          = new Flickr(apiKey, sharedSecret, new REST());
        PhotosInterface  photos     = f.getPhotosInterface();
        // setting search params
        SearchParameters params     = new SearchParameters();
        params.setText(searchText);
        params.setPrivacyFilter(1);
        params.setSort(SearchParameters.INTERESTINGNESS_DESC);
        params.setSafeSearch(Flickr.SAFETYLEVEL_SAFE);
        try {
            params.setMedia("photos");
        } catch (FlickrException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        try {
            photoList = photos.search(params, 16, 1);
        } catch (FlickrException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        return photoList;
    }

    @Override
    public PhotoList<Photo> getPhotoListByUserId(String userId){
        PhotoList<Photo> photoList  = null;
        Flickr           f          = new Flickr(apiKey, sharedSecret, new REST());
        PhotosInterface  photos     = f.getPhotosInterface();
        // setting search params
        SearchParameters params     = new SearchParameters();
        
        params.setUserId(userId);
        params.setPrivacyFilter(1);
        params.setSort(SearchParameters.DATE_POSTED_ASC);
        params.setSafeSearch(Flickr.SAFETYLEVEL_SAFE);
        try {
            params.setMedia("photos");
        } catch (FlickrException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        try {
            photoList = photos.search(params, 10, 1);
        } catch (FlickrException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        return photoList;
    }
    
    @Override
    public List<Gallery> getGalleryListByUserId(String userId){
        List<Gallery>       galList     = null;
        Flickr              f           = new Flickr(apiKey, sharedSecret, new REST());
        GalleriesInterface  gallery     = f.getGalleriesInterface();
        
        try {
            galList = gallery.getList(userId, 10, 5);
        } catch (FlickrException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        return galList;
    }
    
    public PhotoList<Photo> getPhotoList(SearchParameters params){
        PhotoList<Photo> photoList  = null;
        Flickr           f          = new Flickr(apiKey, sharedSecret, new REST());
        PhotosInterface  photos     = f.getPhotosInterface();
        // setting search params
//        SearchParameters params     = new SearchParameters();
        
//        params.setUserId(userId);
        params.setPrivacyFilter(1);
        params.setSort(SearchParameters.DATE_POSTED_ASC);
        params.setSafeSearch(Flickr.SAFETYLEVEL_SAFE);
        try {
            params.setMedia("photos");
        } catch (FlickrException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        try {
            photoList = photos.search(params, 10, 1);
        } catch (FlickrException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        return photoList;
    }
}
