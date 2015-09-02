package com.firstproj.openapi.service;

import java.util.List;

import com.flickr4java.flickr.galleries.Gallery;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;

public interface FlickrAPIService {

    public PhotoList<Photo> getPhotoList(String searchText);

    public PhotoList<Photo> getPhotoListByUserId(String userId);

    public List<Gallery> getGalleryListByUserId(String userId);

}
