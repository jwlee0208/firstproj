package com.firstproj.testtwo.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.social.slideshare.api.SlideShare;
import org.springframework.social.slideshare.api.SlideshowOperations;
import org.springframework.social.slideshare.api.domain.SearchSlideshowsResponse;
import org.springframework.social.slideshare.api.domain.Slideshow;
import org.springframework.social.slideshare.api.impl.SlideShareTemplate;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

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

public class Test {
    
    @Value("${slideshare.api.key}")
    private static String apiKey;
    
    @Value("${slideshare.shared.secret}")
    private static String sharedSecret;
    
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
        params.setText("jquery");
        
        
        
        PhotoList<Photo> photoList = photos.search(params, 10, 1); 
//                photos.getContactsPhotos(10, true, true, true);
        
        if(!photoList.isEmpty()){
            for(Photo photo : photoList){
                System.out.println("photo.getTitle() : " + photo.getTitle() +"\nphoto.getLargeUrl() : " + photo.getLargeUrl() + "\nphoto.getLicense() : " + photo.getLicense() +"\nphoto.getUrls() : " + photo.getUrls() +"\nphoto.getTags() : " + photo.getTags() +"\n photo.getPhotoUrl() : " + photo.getPhotoUrl() +"\nphoto.getPermissions() : " + photo.getPermissions() +"\nphoto.getThumbnailUrl() : " + photo.getThumbnailUrl());
                System.out.println("\n----------------------------------");
            }
        }
        
        
        GalleriesInterface  galleries    = f.getGalleriesInterface();
        /*
        List<Gallery> galleries2 = galleries.getList("jwlee208", 1, 1);
        
        if(!galleries2.isEmpty()){
            for(Gallery gallery : galleries2){
                System.out.println(gallery.getId() + ", " + gallery.getTitle());
            }
        }
        */
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
	
	public static void main(String[] args) throws Exception{
		// Testing compareTo method
//		Test.checkoutCompareWay();
//		Test.solution("ABBCC");
	    String mail = new String(Base64.encodeBase64("jwlee0208@gmail.com".getBytes()));
//		System.out.println(mail +", " + new String(Base64.decodeBase64(Base64.encodeBase64("jwlee0208@gmail.com".getBytes())))+", " + new String(Base64.decodeBase64(Base64.encodeBase64("andsZWUwMjA4QGdtYWlsLmNvbQ=="))));
//		System.out.println(Base64.encodeBase64("jw22642912".getBytes()));
	    
	    Test.getDate();
	    
//	    Test.testFlickr();
	    
	    Test.testSlideShare();
	    
	}	
}
