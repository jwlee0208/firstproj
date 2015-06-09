package com.firstproj.common.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springbyexample.web.servlet.view.tiles2.TilesUrlBasedViewResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
public class RequestInterceptor {
	
	final Log logger = LogFactory.getLog(this.getClass());
	
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
}
