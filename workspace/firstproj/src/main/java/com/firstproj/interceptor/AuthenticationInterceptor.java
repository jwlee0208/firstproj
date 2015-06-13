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

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.LocaleUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.firstproj.user.dto.UserDto;

@Component
public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
    
    final Log log = LogFactory.getLog(this.getClass());
    
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		String uri = request.getRequestURI();
		log.info("[ AuthenticationInterceptor.perHandle() ] url : " + uri);
		if(!uri.endsWith("login") && !uri.endsWith("logout.page") && !uri.endsWith("regist") && !uri.endsWith("registPlayer.page")){
			UserDto userInfo = (UserDto) request.getSession().getAttribute("userInfo");
			
			if(null == userInfo){
//				response.sendRedirect("/board/list.page");
//				return false;
			}else{
// 			     log.info("[ AuthenticationInterceptor.perHandle() ] userInfo : " + userInfo.toString());
//		         Locale language = LocaleUtils.toLocale(userInfo.getLanguage());
//		         log.info("[ AuthenticationInterceptor.perHandle() ] locale : " + language.toString());
//		         if(StringUtils.isEmpty(userInfo.getLanguage())){
//		             language = Locale.ENGLISH;
//		         }
//		         
//		         HttpSession session = request.getSession();
//		         log.info("session is : " + (session == null));
		         
//		         request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, language);
			}
		}
		
		return true;
	}
}


