package com.firstproj.openapi.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.flickr4java.flickr.galleries.Gallery;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.SearchParameters;

public interface FlickrAPIService {

    public PhotoList<Photo> getPhotoList(String searchText);

    public PhotoList<Photo> getPhotoListByUserId(String userId);

    public List<Gallery> getGalleryListByUserId(String userId);
    
    public PhotoList<Photo> getPhotoList(SearchParameters params);
    
    public String uploadPhotoList(MultipartFile attachFile, String title, String contents);

}
