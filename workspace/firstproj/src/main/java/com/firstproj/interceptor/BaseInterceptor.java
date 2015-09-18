package com.firstproj.interceptor;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.apache.bcel.classfile.Constant;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.firstproj.common.CommonConstant;
import com.firstproj.common.util.AES256Util;
import com.firstproj.user.dto.UserDto;
import com.mysql.jdbc.Constants;



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
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception{
        
    }
}
