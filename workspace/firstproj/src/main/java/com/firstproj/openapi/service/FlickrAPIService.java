package com.firstproj.openapi.service;

import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;

public interface FlickrAPIService {

    public PhotoList<Photo> getPhotoList(String searchText);

}
