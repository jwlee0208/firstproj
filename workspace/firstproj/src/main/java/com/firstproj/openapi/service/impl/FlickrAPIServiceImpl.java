package com.firstproj.openapi.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
import com.flickr4java.flickr.uploader.UploadMetaData;
import com.flickr4java.flickr.uploader.Uploader;

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
    
    @Override
    public String uploadPhotoList(MultipartFile attachFile, String title, String contents){
        
        InputStream is = null;
        String responseStr = "";
        Flickr f = new Flickr(apiKey, sharedSecret, new REST());
        try {
            is = attachFile.getInputStream();
            
            Tika chkFileExt = new Tika();
            String chkFileExtStr = "";
            try {
                chkFileExtStr = chkFileExt.detect(is).toLowerCase();
        
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                responseStr = "error";
            }

            UploadMetaData metaData = new UploadMetaData();
            metaData.setContentType(attachFile.getContentType());
            metaData.setDescription(contents);
            metaData.setFilemimetype(chkFileExtStr);
            metaData.setFilename(attachFile.getName());
            metaData.setPublicFlag(true);
            metaData.setHidden(false);
            metaData.setSafetyLevel(Flickr.SAFETYLEVEL_SAFE);
            metaData.setTitle(title);  
            metaData.setAsync(false);
            metaData.setFamilyFlag(false);
            metaData.setFriendFlag(true);
            metaData.setTags(null);
            Uploader uploader = f.getUploader();
            
            try {
                responseStr = uploader.upload(is, metaData);
            } catch (FlickrException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                responseStr = "error";
            }            
        } catch (IOException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
            responseStr = "error";
        }

        
        return responseStr;
    }
    
    
}
