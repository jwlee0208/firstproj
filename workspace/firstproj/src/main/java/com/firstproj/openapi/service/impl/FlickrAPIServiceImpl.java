package com.firstproj.openapi.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.tika.Tika;
import org.scribe.model.Token;
import org.scribe.model.Verifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.firstproj.openapi.service.FlickrAPIService;
import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.FlickrException;
import com.flickr4java.flickr.REST;
import com.flickr4java.flickr.RequestContext;
import com.flickr4java.flickr.auth.Auth;
import com.flickr4java.flickr.auth.AuthInterface;
import com.flickr4java.flickr.auth.Permission;
import com.flickr4java.flickr.galleries.GalleriesInterface;
import com.flickr4java.flickr.galleries.Gallery;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoAllContext;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.PhotoSet;
import com.flickr4java.flickr.photos.PhotoSetList;
import com.flickr4java.flickr.photos.PhotosInterface;
import com.flickr4java.flickr.photos.SearchParameters;
import com.flickr4java.flickr.uploader.UploadMetaData;
import com.flickr4java.flickr.uploader.Uploader;

import net.sf.json.JSONObject;

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
    
    private Photo getPhoto(String photoId, String secret){
        Flickr           f          = new Flickr(apiKey, sharedSecret, new REST());
        PhotosInterface  photos     = f.getPhotosInterface();
        Photo            photoObj   = null;
        try {
            photoObj   = photos.getInfo(photoId, secret);
        } catch (FlickrException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("[FlickrAPIService.getPhoto Exception]");
        }
        return photoObj;
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
            photoList = photos.search(params, 100, 1);
        } catch (FlickrException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        return photoList;
    }
    
    @Override
    public JSONObject uploadPhotoList(MultipartFile attachFile, String title, String contents, String tokenKey, Token token){
        JSONObject resultObj = new JSONObject();
        InputStream is = null;
        String responseStr = "";
        Flickr f = new Flickr(apiKey, sharedSecret, new REST());
            
        AuthInterface ai = f.getAuthInterface();
//        
//        Token token = ai.getRequestToken();
        System.out.println("token : " + token);
        
//        String authUrl = ai.getAuthorizationUrl(token, Permission.WRITE);
//        System.out.println("Follow this URL to authorise yourself on Flickr");
//        System.out.println(authUrl);
//        System.out.println("Paste in the token it gives you:");
//        System.out.print(">>");
        
        Token requestToken = ai.getAccessToken(token, new Verifier(tokenKey));
        
        Auth auth = null;
        try {
            auth = ai.checkToken(requestToken);
            RequestContext.getRequestContext().setAuth(auth);
            f.setAuth(auth);
        } catch (FlickrException e2) {
            // TODO Auto-generated catch block
            e2.printStackTrace();
            System.out.println(">>> ot authenticated : ");
        }
        
        try {
            is = attachFile.getInputStream();
            
//            Tika chkFileExt = new Tika();
//            String chkFileExtStr = "";
//            try {
//                chkFileExtStr = chkFileExt.detect(is).toLowerCase();
//            } catch (IOException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//                resultObj.put("code"        , "error");
//                resultObj.put("message"     , "IOException");
//            }
//System.out.println("chkFileExtStr : " + chkFileExtStr);
            UploadMetaData metaData = new UploadMetaData();
            metaData.setContentType(attachFile.getContentType());
            metaData.setDescription(contents);
            metaData.setFilename(attachFile.getName());
            metaData.setPublicFlag(true);
            metaData.setSafetyLevel(Flickr.SAFETYLEVEL_SAFE);
            metaData.setTitle(title);  
            metaData.setFamilyFlag(false);
            metaData.setFriendFlag(true);
            
            Uploader uploader = f.getUploader();
            
            try {
                
                
//                System.out.println("imageadd > service");
//                System.out.println("contentType : " + attachFile.getContentType());
//                System.out.println("originalFileType : " + attachFile.getOriginalFilename());
//                System.out.println("name : " + attachFile.getName());
//                System.out.println("size : " + attachFile.getSize());
//                System.out.println("bytes : " + attachFile.getBytes());
//                System.out.println("chkFileExtStr : " + chkFileExtStr);
//                System.out.println("is.toString() : " + is.toString() +", " + is.read());
                
                responseStr = uploader.upload(is, metaData);
                Photo photoInfo = this.getPhoto(responseStr, token.getSecret());
                resultObj.put("code"        , "ok");
                resultObj.put("photoId"     , responseStr);
                resultObj.put("midUrl"      , photoInfo.getMediumUrl());
                resultObj.put("smallUrl"    , photoInfo.getSmallUrl());
                System.out.println("try responseStr : " + responseStr);
            } catch (FlickrException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                resultObj.put("code"        , "error");
                resultObj.put("message"     , "flickrException");
            }            
        } catch (IOException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
            resultObj.put("code"        , "error");
            resultObj.put("message"     , "IOException");

        }
        System.out.println("responseStr : " + responseStr);
        
        return resultObj;
    }
    
    @Override
    public JSONObject checkAuth() {
        JSONObject resultObj = new JSONObject();
        Flickr          f       = new Flickr(apiKey, sharedSecret, new REST());
        AuthInterface   ai      = f.getAuthInterface();
        Token           token   = ai.getRequestToken();        
        String          authUrl = ai.getAuthorizationUrl(token, Permission.WRITE);
        
        resultObj.put("token"   , token.getToken());
        resultObj.put("secret"  , token.getSecret());
        resultObj.put("authUrl" , authUrl);
        
        return resultObj;
//        Scanner scanner = new Scanner(System.in);
//        String tokenKey = scanner.nextLine();
//        scanner.close();        
//
//        Token requestToken = ai.getAccessToken(token, new Verifier(tokenKey));
//        
//        
//        
//        Auth auth = null;
//        try {
//            auth = ai.checkToken(requestToken);
//            System.out.println(">>> authenticated : " + auth);
//        } catch (FlickrException e2) {
//            // TODO Auto-generated catch block
//            e2.printStackTrace();
//            System.out.println(">>> ot authenticated : ");
//        }  
        
    }
    
}
