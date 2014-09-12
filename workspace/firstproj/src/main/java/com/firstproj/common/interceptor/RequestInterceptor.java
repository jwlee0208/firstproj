package com.firstproj.common.interceptor;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.json.simple.JSONValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springbyexample.web.servlet.view.tiles2.TilesUrlBasedViewResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
public class RequestInterceptor {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private TilesUrlBasedViewResolver tilesUrlBasedViewResolver;		

	/**
	 * 모든 controller에서 확장자를 통한 Tiles2 환경설정 
	 */
	@Pointcut("execution(* com.firstproj..*Controller*.*(..))")
	public void afterConfiguresController() {}

	 /**
	 * @brief		Tiles2 Controller의 리턴형태 결정을 위한  
	 * @details	
	 * @param 	joinPoint
	 * @return		
	 */

	@After("afterConfiguresController()")
	public void _beforeTilesConfigures(JoinPoint joinPoint) throws Exception {
		String uri = null;
		
		tilesUrlBasedViewResolver.clearCache();
		tilesUrlBasedViewResolver.setTilesDefinitionName("default");
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		uri = request.getRequestURI();
				
//		if(uri.endsWith("page")){
//			tilesUrlBasedViewResolver.clearCache();
//			tilesUrlBasedViewResolver.setTilesDefinitionName("default");
//		} else if(uri.endsWith(".pop")){
//			tilesUrlBasedViewResolver.clearCache();
//			tilesUrlBasedViewResolver.setTilesDefinitionName("popup");
//        } else {
//			tilesUrlBasedViewResolver.clearCache();
//			tilesUrlBasedViewResolver.setTilesDefinitionName("popup");        	
//        }
		
//System.out.println("requestInterceptor result: " + uri.indexOf(".page") +", " + uri.indexOf("pop"));		
		
		if(uri.indexOf(".page") > 0){
			tilesUrlBasedViewResolver.clearCache();
			tilesUrlBasedViewResolver.setTilesDefinitionName("default");
		} else if(uri.indexOf(".pop") > 0){
			tilesUrlBasedViewResolver.clearCache();
			tilesUrlBasedViewResolver.setTilesDefinitionName("popup");
	    } else {
			tilesUrlBasedViewResolver.clearCache();
			tilesUrlBasedViewResolver.setTilesDefinitionName("popup");        	
	    }		
	}
	
//	private String getReturn(Map<?, ?> map)  throws Exception {
//		
//		StringBuffer sb = new StringBuffer();
//		Entry<?, ?> entry;
//		Set<?> set;
//		Iterator<?> it;
//		Object value = null;
//		String val = null;
//		int len = 1000;
//		
//		try {
//			set = map.entrySet();
//			it = set.iterator();
//			
//			while(it.hasNext()) {
//				entry = (Entry<?, ?>) it.next();
//				value = entry.getValue();
//
//				if(value instanceof String) {
//				    
//					if(((String) value).length() > len) {
//						value = ((String) value).substring(0, len);
//					}
//					sb.append("   " + entry.getKey() + ": " + value + "\n");
//				} else if (value != null){
//				    val = JSONValue.toJSONString(value);
//					
//					if(val.length() > len) {
//						val = val.substring(0, len);
//					}
//					sb.append("   class: "
//							+ value.getClass()
////							+ "\n"
//							+ "   "
//							+ val);
//				}
//			}
//			
//			
//			
//		} catch(Exception e) {
//			logger.error(ExceptionUtils.getStackTrace(e));
//
//		} finally {
//			entry = null;
//			set = null;
//		}
//		return sb.toString();
//	}
//
//	public static String getBody(HttpServletRequest request) throws IOException {
//
//	    String body = null;
//	    StringBuilder stringBuilder = new StringBuilder();
//	    BufferedReader bufferedReader = null;
//
//	    try {
//	        InputStream inputStream = request.getInputStream();
//	        if (inputStream != null) {
//	            bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
//	            char[] charBuffer = new char[128];
//	            int bytesRead = -1;
//	            while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
//	                stringBuilder.append(charBuffer, 0, bytesRead);
//	            }
//	        } else {
//	            stringBuilder.append("");
//	        }
//	    } catch (IOException ex) {
//	        throw ex;
//	    } finally {
//	        if (bufferedReader != null) {
//	            try {
//	                bufferedReader.close();
//	            } catch (IOException ex) {
//	                throw ex;
//	            }
//	        }
//	    }
//
//	    body = stringBuilder.toString();
//	    return body;
//	}	
}
