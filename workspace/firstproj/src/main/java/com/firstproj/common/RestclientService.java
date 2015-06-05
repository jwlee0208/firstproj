package com.firstproj.common;

import java.nio.charset.Charset;
import java.util.HashMap;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.RestTemplate;

@Repository("RestclientService")
public class RestclientService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Inject
    private RestTemplate restTemplate;
    
    /**
     * @Name restPost
     * @Date 2014. 3. 7.
     * @Return HashMap<String, String>
     * @Param String url
     * @param int timeout ( second )
     * @param String params ( JSON )
     * @Description REST 전송중 POST 방식으로 데이터 전송하고 응답데이터와 상태코드를 HashMap으로 리턴함 ( response, status )
     */ 
    public HashMap<String, String> restPost( String url, String params, int timeout ) throws Exception {
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        ((SimpleClientHttpRequestFactory)restTemplate.getRequestFactory()).setConnectTimeout(1000*timeout);

        HttpEntity entity = new HttpEntity(params, headers);
        ResponseEntity<String> response_entity  = restTemplate.postForEntity( url, entity, String.class );
        
        String response = response_entity.getBody();
        MediaType contentType = response_entity.getHeaders().getContentType();
        HttpStatus statusCode = response_entity.getStatusCode();

        HashMap<String, String> responseData= new HashMap<String, String>();
        responseData.put("status", String.valueOf(statusCode.value()) );
        responseData.put("response", response );
        
        return responseData;
    }   
    
    
    /**
     * @Name restPut
     * @Date 2014. 3. 7.
     * @Return HashMap<String, String>
     * @Param String url
     * @param int timeout ( second )
     * @param String params ( JSON )
     * @Description REST 전송중 PUT 방식으로 데이터 전송하고 응답데이터와 상태코드를 HashMap으로 리턴함 ( response, status )
     */ 
    public void restPut( String url, String params, int timeout ) throws Exception {
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        ((SimpleClientHttpRequestFactory) restTemplate.getRequestFactory()).setConnectTimeout(1000*timeout);
        
        HttpEntity entity = new HttpEntity(params, headers);
        restTemplate.put(url, params);
    }   
    
    /**
     * @Name restPut
     * @Date 2014. 3. 7.
     * @Return HashMap<String, String>
     * @Param String url ( {parma} 포함된 )
     * @param String params ( @RequestBody로 넘길 데이터 )
     * @Param HashMap urlVariables ( url에 맵핑될 데이터 )
     * @param int timeout ( second )
     * @param String params ( JSON )
     * @Description REST 전송중 PUT 방식으로 데이터 전송하고 응답데이터와 상태코드를 HashMap으로 리턴함 ( response, status )
     */ 
    public void restPut( String url, String params, HashMap<String, String> urlVariables, int timeout ) throws Exception {
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        ((SimpleClientHttpRequestFactory) restTemplate.getRequestFactory()).setConnectTimeout(1000*timeout);
        
        HttpEntity entity = new HttpEntity(params, headers);
        restTemplate.put(url, params, urlVariables);
    }   
    
    /**
     * @Name restPutExchange
     * @Date 2014. 3. 7.
     * @Return HashMap<String, String>
     * @Param String url
     * @param int timeout ( second )
     * @param String params ( JSON )
     * @Description REST 전송중 PUT 방식으로 데이터 전송하고 응답데이터와 상태코드를 HashMap으로 리턴함 ( response, status ) / PUT이지만 응답을 받아옴 
     */ 
    public HashMap<String, String> restPutExchange( String url, String params, int timeout ) throws Exception {
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        ((SimpleClientHttpRequestFactory) restTemplate.getRequestFactory()).setConnectTimeout(1000*timeout);
        
        HttpEntity entity = new HttpEntity(params, headers);
        ResponseEntity<String> response_entity  = restTemplate.exchange(url, org.springframework.http.HttpMethod.PUT, entity, String.class );
        
        String response = response_entity.getBody();
        MediaType contentType = response_entity.getHeaders().getContentType();
        String statusCode = response_entity.getStatusCode().toString();

        HashMap<String, String> responseData= new HashMap<String, String>();
        responseData.put("status", statusCode );
        responseData.put("response", response );
        
        return responseData;
    }   
    
    /**
     * @Name restGet
     * @Date 2014. 3. 18.
     * @Return HashMap<String, String>
     * @Param String url ( http://example.com/exampleurl/{param1}/exampleurl/{param2} )
     * @param HashMap<String, String> ( param1=value, param2=value )
     * @param int timeout ( second )
     * @Description REST 전송중 POST 방식으로 데이터 전송하고 응답데이터와 상태코드를 HashMap으로 리턴함 ( response, status )
     */ 
    public HashMap<String, String> restGet( String url, HashMap params, int timeout ) throws Exception {
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        ((SimpleClientHttpRequestFactory)restTemplate.getRequestFactory()).setConnectTimeout(1000*timeout);
        
        HttpEntity entity = new HttpEntity(params, headers);
        ResponseEntity<String> response_entity = restTemplate.getForEntity(url, String.class, params );
        
        String response = response_entity.getBody();
        MediaType contentType = response_entity.getHeaders().getContentType();
        HttpStatus statusCode = response_entity.getStatusCode();

        HashMap<String, String> responseData= new HashMap<String, String>();
        responseData.put("status", String.valueOf(statusCode.value()) );
        responseData.put("response", response );
        
        return responseData;
    }

    /**
     * @Name restDelete
     * @Date 2014. 3. 19.
     * @Return void
     * @Param String url ( http://example.com/exampleurl/{param1}/exampleurl/{param2} )
     * @param HashMap<String, String> ( param1=value, param2=value )
     * @param int timeout ( second )
     * @Description REST 전송중 DELETE 방식으로 데이터 전송함. 리턴은 VOID
     */     
    public void restDelete( String url, HashMap params, int timeout ) throws Exception {
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        ((SimpleClientHttpRequestFactory)restTemplate.getRequestFactory()).setConnectTimeout(1000*timeout);
        
        HttpEntity entity = new HttpEntity(params, headers);
        restTemplate.delete(url, params );
        
    }
    
    /**
     * @Name restDelete
     * @Date 2014. 3. 19.
     * @Return void
     * @Param String url ( http://example.com/exampleurl/mmmm )
     * @param int timeout ( second )
     * @Description REST 전송중 DELETE 방식으로 데이터 전송함. 리턴은 VOID ( URL에 삽입할 파라미터가 없을떄 )
     */     
    public void restDelete( String url,  int timeout ) throws Exception {
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        ((SimpleClientHttpRequestFactory)restTemplate.getRequestFactory()).setConnectTimeout(1000*timeout);
        
        restTemplate.delete(url );
        
    }
}
