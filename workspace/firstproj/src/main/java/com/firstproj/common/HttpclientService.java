package com.firstproj.common;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.firstproj.common.util.ParseStringUtil;

@Repository("HttpclientService")
public class HttpclientService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * @Name doGet
     * @Date 2014. 3. 7.
     * @Return HashMap<String, String>
     * @Param String url
     * @param int timeout ( second )
     * @param HashMap<String, String> params
     * @param String encodeKey ( UTF-8 / EUC-KR .. )
     * @Description HTTP전송중 GET 방식으로 데이터 전송하고 응답데이터와 상태코드를 HashMap으로 리턴함 ( response, status )
     */
    public HashMap<String, String> doGet( String url,  int timeout, HashMap<String, String> params, @Value("UTF-8") String encodeKey )  throws Exception {
        
        HashMap<String, String> responseData= new HashMap<String, String>();
        // HttpClient 선언 
        HttpClient client = new HttpClient();
        // 넘겨줄 파라미터가 있다면 선언필요함
        client.getParams().setParameter("http.useragent", "Test Client");
        
        // 타임아웃 설정 
        client.getParams().setParameter("http.connection.timeout", timeout*1000);
        client.getParams().setParameter("http.socket.timeout", timeout*1000);
        
        // 사용자가 요청한 인코딩을 포함한 스트링  저장용 ( 기본은 UTF-8 )
        String encodeString = "";
        
        if( encodeKey.equals("") || encodeKey.equals("null") ){
            encodeKey = "UTF-8";
            encodeString = "application/x-www-form-urlencoded; charset=UTF-8";
        } else {
            encodeString = "application/x-www-form-urlencoded; charset="+encodeKey;
        }
        
        HttpMethod method = new GetMethod( url );
        method.setRequestHeader("Content-Type", encodeString);
        
        // HashMap의 데이터를 name=value 형태로 구성 
        String queryString = ParseStringUtil.convertToHashMaptoQueryString( params );
        method.setQueryString( queryString );
        
        int statusCode = client.executeMethod(method);
        byte [] response  = method.getResponseBody();
        
        // 연결종료 
        method.releaseConnection();
        
        // 응답 데이터 작성 
        // 데이터 응답을 위하여 인코딩 처리함 
        responseData.put("response", new String(response, encodeKey ) );
        responseData.put("status", String.valueOf(statusCode) );
        
        return responseData;
    }

    /**
     * @Name doPost
     * @Date 2014. 3. 7.
     * @Return HashMap<String, String>
     * @Param String url
     * @param int timeout ( second )
     * @param HashMap<String, String> params
     * @param String encodeKey ( UTF-8 / EUC-KR .. )
     * @Description HTTP전송중 POST 방식으로 데이터 전송하고 응답데이터와 상태코드를 HashMap으로 리턴함 ( response, status )
     */
    public HashMap<String, String> doPost( String url,  int timeout, HashMap<String, String> params, @Value("UTF-8") String encodeKey )  throws Exception {
        
        HashMap<String, String> responseData= new HashMap<String, String>();        
        // HttpClient 선언 
        HttpClient client = new HttpClient();
        // 넘겨줄 파라미터가 있다면 선언필요함 
        client.getParams().setParameter("http.useragent", "Test Client");
        
        // 타임아웃 설정 ( 입력은 초단위 ) 
        client.getParams().setParameter("http.connection.timeout", timeout*1000);
        client.getParams().setParameter("http.socket.timeout", timeout*1000);
        
        // 사용자가 요청한 인코딩을 포함한 스트링  저장용 ( 기본은 UTF-8 )
        String encodeString = "";
        
        
        // POST 로 메소드 선언 
        PostMethod method = new PostMethod(url);
        
        if( encodeKey.equals("") || encodeKey.equals("null") ){
            encodeKey = "UTF-8";
            encodeString = "application/x-www-form-urlencoded; charset=UTF-8";
        } else {
            encodeString = "application/x-www-form-urlencoded; charset="+encodeKey;
        }
        
        // 인코딩 설정 
        method.setRequestHeader("Content-Type", encodeString);
        
        Iterator iter = params.entrySet().iterator();
        while (iter.hasNext()) {
            Entry entry = (Entry) iter.next();
            method.addParameter((String) entry.getKey(), String.valueOf(entry.getValue()));
        }
        
        
        int statusCode = client.executeMethod(method);
        byte [] response  = method.getResponseBody();

        method.releaseConnection();
        
        // 데이터 응답을 위하여 인코딩 처리함 
        responseData.put("response", new String(response, encodeKey)  );
        responseData.put("status", String.valueOf(statusCode) );
        
        return responseData;
        
    }
}
