package com.firstproj.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



public class BaseInterceptor extends HandlerInterceptorAdapter{
    final Log log = LogFactory.getLog(this.getClass());

    @Value("${build.type}")
    private String buildType;
    
    public void setValues(HttpServletRequest request){
        request.setAttribute("buildType", buildType);
    }
    
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        
        this.setValues(request);
        return true;
    }
}
