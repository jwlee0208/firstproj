package com.firstproj.testtwo.web;

import java.util.Calendar;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Value;

import com.benfante.jslideshare.SlideShareAPI;
import com.benfante.jslideshare.SlideShareAPIFactory;
import com.benfante.jslideshare.messages.Tag;

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
	
	
	public static void main(String[] args) throws Exception{
		// Testing compareTo method
//		Test.checkoutCompareWay();
//		Test.solution("ABBCC");
	    String mail = new String(Base64.encodeBase64("jwlee0208@gmail.com".getBytes()));
//		System.out.println(mail +", " + new String(Base64.decodeBase64(Base64.encodeBase64("jwlee0208@gmail.com".getBytes())))+", " + new String(Base64.decodeBase64(Base64.encodeBase64("andsZWUwMjA4QGdtYWlsLmNvbQ=="))));
//		System.out.println(Base64.encodeBase64("jw22642912".getBytes()));
	    
	    Test.getDate();
	    
	    System.out.println("apiKey : " + Test.apiKey +", secret : " + Test.sharedSecret);
	    
	    SlideShareAPI ssapi = SlideShareAPIFactory.getSlideShareAPI("EzdnlXer", "2PFQEaHV");

	    
	    
	    Tag tag = ssapi.getSlideshowByTag("baseball");
	    System.out.println(tag.getName());
	}	
}
