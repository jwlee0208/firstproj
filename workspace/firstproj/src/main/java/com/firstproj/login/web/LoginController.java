package com.firstproj.login.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.firstproj.user.dto.UserDto;
import com.firstproj.user.service.UserServiceImpl;

@Controller
@SessionAttributes("userInfo")
public class LoginController {
	
	@Resource(name="UserServiceImpl")
	private UserServiceImpl userService;
	
	@RequestMapping(value="/")
	public String index() throws Exception{
		return "redirect:/home.page";
	}
	
	@RequestMapping(value="/login")
	public String login() throws Exception{
		return "/login";
	}
	
	@RequestMapping(value="/loginProcess.json")
	@ResponseBody
	public JSONObject loginProcess(HttpServletRequest request, HttpServletResponse response, Model model, UserDto userDto) throws Exception{
		JSONObject checkResult = new JSONObject();
		
		String resultCode = "LOGIN_0000";
		String resultMsg = "";
		
		String passwd = userDto.getPasswd();
		// 아이디 값을 이용, db에 저장된 개인 정보 중 passwd를 가져온다.
		
		UserDto userInfo = this.userService.selectUserInfo(userDto);
		
//		System.out.println("userInfo : " + userInfo.toString() + "\nuserDto : " + userDto.toString() + "\ncandidate pw : " + passwd);
		
		
		if(null != userInfo){
			// 입력된 passwd와 비교한다.
			String hashedPasswd = userInfo.getPasswd();	// BCrypt.hashpw(passwd, BCrypt.gensalt(15));
			
//			String passwd = "11111111";
					
//			String hashedPasswd = BCrypt.hashpw(passwd, BCrypt.gensalt());		
			
			boolean isOk = BCrypt.checkpw(passwd, hashedPasswd);
			
			if(isOk){
				resultCode 	= "LOGIN_0000";
				resultMsg 	= "checked";
			
				
			}else{
				resultCode 	= "LOGIN_0002";
				resultMsg 	= "invalid_passwd";
			}
			
		}else{
			resultCode 	= "LOGIN_0001";
			resultMsg 	= "no_exist_user_id";
		}
		
		checkResult.put("resultCode", resultCode);
		checkResult.put("resultMsg", resultMsg);
		
		model.addAttribute("userInfo", userInfo);
		return checkResult;
	}
	@RequestMapping(value="/logout.page")
	public String logout(@ModelAttribute UserDto userDto, HttpSession session, SessionStatus status) {
		
		status.setComplete();
		session.removeAttribute("userInfo");
		
		return "redirect:/home.page";
	}
}
