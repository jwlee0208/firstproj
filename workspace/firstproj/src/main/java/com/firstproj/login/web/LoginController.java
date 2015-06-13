package com.firstproj.login.web;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang.LocaleUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.firstproj.user.dto.UserDto;
import com.firstproj.user.service.UserServiceImpl;

@Controller
@SessionAttributes("userInfo")
public class LoginController {
	
    final Log log = LogFactory.getLog("LoginController.class");
    
	@Resource(name="UserServiceImpl")
	private UserServiceImpl userService;
	
	@RequestMapping(value="/")
	public String index() throws Exception{
		return "redirect:/home.page";
	}
	
	@RequestMapping(value="/login")
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		
		String referer = request.getHeader("Referer");
		
		if(null != request.getParameter("redirectPage")){
		    referer = request.getParameter("redirectPage");
		}
		
		if(StringUtils.isEmpty(referer)){
			referer="/";
		}
		
		log.info(" >>> REFER : " + referer);				

		model.addAttribute("prevPage", referer);
		return "/login";
	}
	
	@RequestMapping(value="/loginProcess.json")
	@ResponseBody
	public JSONObject loginProcess(HttpServletRequest request, HttpServletResponse response, Model model, UserDto userDto, HttpSession session) throws Exception{
		JSONObject 	checkResult = new JSONObject();
		// Return Code/Message Data
		String 		resultCode 	= "LOGIN_0000";
		String 		resultMsg 	= "";
		
		String 		passwd 		= userDto.getPasswd();
		// 아이디 값을 이용, db에 저장된 개인 정보 중 passwd를 가져온다.
		UserDto 	userInfo 	= this.userService.selectUserInfo(userDto);
		
		if(userInfo == null){
			userInfo = new UserDto();
			resultCode 	= "LOGIN_0001";
			resultMsg 	= "Not registed UserId. Please, Join us.";
		}else{
			// 입력된 passwd와 비교한다.
			String 	hashedPasswd = userInfo.getPasswd();	// BCrypt.hashpw(passwd, BCrypt.gensalt(15));			
			boolean isOk 		 = BCrypt.checkpw(passwd, hashedPasswd);
			
			if(isOk){
				resultCode 	= "LOGIN_0000";
				resultMsg 	= "checked";
			}else{
				resultCode 	= "LOGIN_0002";
				resultMsg 	= "This password is invalid.Please, Check out password";
			}
			
			Locale language = null;
			
			if(StringUtils.isEmpty(userInfo.getLanguage())){
			    language = Locale.ENGLISH;
			}else{
			    language = LocaleUtils.toLocale(userInfo.getLanguage());
			}
			log.info("[ LoginController.loginProcess ] locale : " + language.toString());
			log.info("[ LoginController.loginProcess ] session : " + (session != null));
			session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, language);
		}
		
//		log.info("[ LoginController.loginProcess ] session : " + (session != null));
		checkResult.put("resultCode"	, resultCode);
		checkResult.put("resultMsg"		, resultMsg);
		
		model.addAttribute("userInfo"	, userInfo);
		return checkResult;
	}
	@RequestMapping(value="/logout.page")
	public String logout(@ModelAttribute UserDto userDto, HttpSession session, SessionStatus status) {
		
		status.setComplete();
		session.removeAttribute("userInfo");
		
		return "redirect:/home.page";
	}
}
