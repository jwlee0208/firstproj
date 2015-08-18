package com.firstproj.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.firstproj.board.dto.BoardArticleDto;
import com.firstproj.board.dto.BoardDto;

@Component
public class BoardArticleInterceptor extends HandlerInterceptorAdapter {    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        
        return true;
    }
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception{
        
        String title        = "Developer's Blog - Nevertheless Keep Going";
        String description  = "Developer's Blog";
        String content      = "Developer's Blog";
        String authorNm     = "lee jinwon";
        String filePath     = "";
        String url          = "";
        
        String uri          = request.getRequestURI();
        
        if(!mav.isEmpty()){
            Map<String, Object> model = mav.getModel();
            
            if(uri.indexOf("view") > 0){
                if((!model.isEmpty()) && model.containsKey("contentInfo")){
                    BoardArticleDto contentInfo = (BoardArticleDto)model.get("contentInfo");
                    
                    if(contentInfo != null){
                        title       = contentInfo.getTitle();
                        content     = contentInfo.getContentText();
                        authorNm    = contentInfo.getAuthorNm();
                        filePath    = contentInfo.getFilePath();
                        url         = request.getRequestURL().toString();
                        
                        if(!content.isEmpty() && content.length() > 50){
                            content = content.substring(0, 50);
                        }
                        description = content;
                    }
                }else{
                    System.out.println("N/A");
                }                
            }else if(uri.indexOf("list") > 0){
                if((!model.isEmpty()) && model.containsKey("boardInfo")){
                    BoardDto boardInfo = (BoardDto)model.get("boardInfo");
                    if(boardInfo != null){
                        title       = boardInfo.getBoardName();
                        content     = boardInfo.getBoardName();
                        url         = request.getRequestURL().toString();
                        description = boardInfo.getBoardName();
                    }
                }else{
                    System.out.println("N/A");
                }
            }
        }
        request.setAttribute("title"        , title);
        request.setAttribute("content"      , content);
        request.setAttribute("description"  , description);
        request.setAttribute("authorNm"     , authorNm);
        request.setAttribute("filePath"     , filePath);
        request.setAttribute("url"          , url);
    }
}
