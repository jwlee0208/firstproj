/**
 * 1. FileName	: AuthenticationInterceptor.java
 * 2. Package	: com.firstproj.interceptor
 * 3. Comments	: 	
 * 4. Author	: leejinwon
 * 5. DateTime	: 2014. 8. 28. 오후 6:04:21
 * 6. History	:
 * -----------------------------------------------------------------
 *	Date		 |	Name			|	Comment
 * -------------  -----------------   ------------------------------
 * 2014. 8. 28.		 | leejinwon			|	최초작성
 * -----------------------------------------------------------------
 **/

package com.firstproj.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.firstproj.user.dto.UserDto;

@Component
public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		String uri = request.getRequestURI();
		
		if(!uri.endsWith("login") && !uri.endsWith("logout.page") && !uri.endsWith("regist") && !uri.endsWith("registPlayer.page")){
			UserDto userInfo = (UserDto) request.getSession().getAttribute("userInfo");
			
			if(null == userInfo){
//				response.sendRedirect("/board/list.page");
//				return false;
			}		
		}
		
		return true;
	}
}


