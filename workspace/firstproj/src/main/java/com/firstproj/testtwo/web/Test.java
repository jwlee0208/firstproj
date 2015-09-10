package com.firstproj.testtwo.web;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.net.imap.IMAPClient.SEARCH_CRITERIA;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.social.slideshare.api.SlideShare;
import org.springframework.social.slideshare.api.SlideshowOperations;
import org.springframework.social.slideshare.api.domain.SearchSlideshowsResponse;
import org.springframework.social.slideshare.api.domain.Slideshow;
import org.springframework.social.slideshare.api.impl.SlideShareTemplate;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.REST;
import com.flickr4java.flickr.auth.Auth;
import com.flickr4java.flickr.galleries.GalleriesInterface;
import com.flickr4java.flickr.galleries.Gallery;
import com.flickr4java.flickr.groups.Group;
import com.flickr4java.flickr.groups.GroupsInterface;
import com.flickr4java.flickr.people.User;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.PhotosInterface;
import com.flickr4java.flickr.photos.SearchParameters;
import com.flickr4java.flickr.test.TestInterface;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.YouTube.Subscriptions;
import com.google.api.services.youtube.model.SearchListResponse;
import com.google.api.services.youtube.model.SearchResult;
import com.google.api.services.youtube.model.Subscription;

public class Test {
    
    @Value("${slideshare.api.key}")
    private static String apiKey;
    
    @Value("${slideshare.shared.secret}")
    private static String sharedSecret;
    
    /** Global instance of the HTTP transport. */
    private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();

    /** Global instance of the JSON factory. */
    private static final JsonFactory JSON_FACTORY = new JacksonFactory();
    
    /** Global instance of the max number of videos we want returned. */
    private static final long NUMBER_OF_VIDEOS_RETURNED = 5;    
    
	public static String solution(String S) {
        String shiftedStr = "";
        System.out.println("S : " + S);
        // write your code in Java SE 8
        if(S != null && S!= ""){
            for(int index = 0 ; index < S.length() -1 ; index++){
                shiftedStr = S.substring(index, index + 2);
                
                if(shiftedStr.equals("AB")){
                    
                    
                    return Test.solution(S.replace(shiftedStr, "AA"));
//                    Test.solution(S);
                }else if(shiftedStr.equals("BA")){
                	return Test.solution(S.replace(shiftedStr, "AA"));
                    
//                    Test.solution(S);
                }else if(shiftedStr.equals("CB")){
                    
                    return Test.solution(S.replace(shiftedStr, "CC"));
//                    Test.solution(S);
                }else if(shiftedStr.equals("AA")){
                    
                    return Test.solution(S.replace(shiftedStr, "A"));
//                    Test.solution(S);
                }else if(shiftedStr.equals("CC")){
                    
                    return Test.solution(S.replace(shiftedStr, "C"));
//                    Test.solution(S);
                }
                System.out.println(S +", " +S.substring(index, index + 2));        
            }    
        }    
        return null;
        
    }
//	private static Jedis jedis = new Jedis("127.0.0.1");
	/**
	 * 문자열 비교 함수 테스
	 */
	private static void checkoutCompareWay(){
		System.out.println("jpg".compareTo("jpg, jpeg, png, gif, bmp"));
		System.out.println("jpg, jpeg, png, gif, bmp".compareTo("jpg"));
		System.out.println("jpg".matches(".*jpg, jpeg, png, gif, bmp.*"));
		System.out.println("jpg, jpeg, png, gif, bmp".matches(".*jpg.*"));

	}
	
	private static void getDate(){
	    
        Calendar calendar = Calendar.getInstance();
        
        
        StringBuffer startSb    = new StringBuffer();
        StringBuffer endSb      = new StringBuffer();
        String year      = String.valueOf(calendar.get(calendar.YEAR));
        String prevMonth = String.format("%02d", calendar.get(calendar.MONTH));
        
        
        String startDate = startSb.append(year).append(prevMonth).append(String.format("%02d", 1)).toString();
        String endDate = endSb.append(year).append(prevMonth).append(String.format("%02d", calendar.getMaximum(calendar.DAY_OF_MONTH))).toString();
        
        System.out.println(startDate +"\n" + endDate);
	}
	
	public static void testFlickr() throws Exception{
        Flickr f = new Flickr("df1e5e194de94bb405b2ce898db83b90", "ed6088a596f20afd", new REST());
        Auth auth = new Auth();
        User user = new User();
        user.setId("jwlee208");
        auth.setUser(user);
        f.setAuth(auth);
        
        GroupsInterface     groups       = f.getGroupsInterface();

        // search group
        Collection<Group> searchedGroups = groups.search("jwlee208", 10, 10);
        
        if(!searchedGroups.isEmpty()){
            for(Group group : searchedGroups){
                System.out.println(group.getName());
            }
        }
        
        System.out.println(groups.search("[jQuery] window.onload와 ready()", 1, 1));
        
        
        
        PhotosInterface     photos       = f.getPhotosInterface();
        SearchParameters params = new SearchParameters();
//        params.setUserId("jwlee208@yahoo.co.kr");
        params.setText("jquery");
        
        
        
//        PhotoList<Photo> photoList = photos.search(params, 10, 1); 
//                photos.getContactsPhotos(10, true, true, true);
/*        
        if(!photoList.isEmpty()){
            for(Photo photo : photoList){
                System.out.println("photo.getTitle() : " + photo.getTitle() +"\nphoto.getLargeUrl() : " + photo.getLargeUrl() + "\nphoto.getLicense() : " + photo.getLicense() +"\nphoto.getUrls() : " + photo.getUrls() +"\nphoto.getTags() : " + photo.getTags() +"\n photo.getPhotoUrl() : " + photo.getPhotoUrl() +"\nphoto.getPermissions() : " + photo.getPermissions() +"\nphoto.getThumbnailUrl() : " + photo.getThumbnailUrl());
                System.out.println("\n----------------------------------");
            }
        }
*/        
        
        GalleriesInterface  galleries    = f.getGalleriesInterface();
        
        List<Gallery> galleries2 = galleries.getList("jwlee208", 1, 1);
        
        if(!galleries2.isEmpty()){
            for(Gallery gallery : galleries2){
                System.out.println(gallery.getId() + ", " + gallery.getTitle());
            }
        }
        
        TestInterface testInterface = f.getTestInterface();
        Collection results = testInterface.echo(Collections.EMPTY_MAP);
        
        System.out.println(results);
        List<Gallery> list = new ArrayList<Gallery>();
        
        System.out.println(list.size());
        if(list.size() > 0){
            for(Gallery gallery : list){
                System.out.println(gallery.getTitle());        
            }
        }	    
	}
	
	public static void testSlideShare(){
	    
	    SlideShare slideshare = new SlideShareTemplate("EzdnlXer", "2PFQEaHV");
	    SlideshowOperations slideshowOperations = slideshare.slideshowOperations();
	    SearchSlideshowsResponse searchSlideshowsResponse = slideshowOperations.searchSlideshows("jquery", 10);
	    if(searchSlideshowsResponse.getNumResults() > 0){
	        List<Slideshow> slideshows = searchSlideshowsResponse.getSlideshows();
	        for(Slideshow slideshow : slideshows){
	            System.out.println(slideshow.getTitle() +", " + slideshow.getEmbed() +", " + slideshow.getUrl() +", " + slideshow.getDownloadUrl());
	        }
	    }
        
	}
	
	public static void testYoutube() throws Exception{
	    YouTube youtube = new YouTube.Builder(HTTP_TRANSPORT, JSON_FACTORY, new HttpRequestInitializer() {
	          public void initialize(HttpRequest request) throws IOException {}})
	        .setApplicationName("youtube-cmdline-search-sample")
	        .build();
	    YouTube.Search.List search = youtube.search().list("id,snippet");
	    search.setKey("AIzaSyAJiDR0oG8Sg7wPASRUO1lGBXMdKbqnSBo");
//	    search.setQ(URLEncoder.encode("4할타자 백인천", "UTF-8"));
	    search.setQ("타이완 여행");
	    search.setType("video");
	    search.setVideoType("any");
	    search.setFields("items(id/kind,id/videoId,snippet/title,snippet/thumbnails/default/url)");
	    search.setMaxResults(NUMBER_OF_VIDEOS_RETURNED);
	    search.setOrder("viewCount");
	    search.setSafeSearch("moderate");
	    
	    SearchListResponse searchResponse = search.execute();

	    List<SearchResult> searchResultList = searchResponse.getItems();

	    if(searchResultList != null) {
	        
	        for(SearchResult searchResult : searchResultList){
	            
	            System.out.println(searchResult.getSnippet().toString());
	            System.out.println(searchResult.getId());
	            System.out.println(searchResult.getEtag());
	        }
	    }
	}
	
	public static void testKorean() throws Exception{
	    System.out.println(URLEncoder.encode("\"한글의 위대함\"", "UTF-8"));    // 8859_1
	}
	
	public static void main(String[] args) throws Exception{
		// Testing compareTo method
//		Test.checkoutCompareWay();
//		Test.solution("ABBCC");
	    String mail = new String(Base64.encodeBase64("jwlee0208@gmail.com".getBytes()));
//		System.out.println(mail +", " + new String(Base64.decodeBase64(Base64.encodeBase64("jwlee0208@gmail.com".getBytes())))+", " + new String(Base64.decodeBase64(Base64.encodeBase64("andsZWUwMjA4QGdtYWlsLmNvbQ=="))));
//		System.out.println(Base64.encodeBase64("jw22642912".getBytes()));
	    
//	    Test.getDate();
	    
//	    Test.testKorean();
	    
//	    Test.testFlickr();
	    
//	    Test.testSlideShare();
	    
	    Test.testYoutube();
	    
	}	
}
