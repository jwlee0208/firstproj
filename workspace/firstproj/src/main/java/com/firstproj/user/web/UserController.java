package com.firstproj.user.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import net.sf.json.JSONObject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.firstproj.common.validate.JsonResponse;
import com.firstproj.user.dto.UserDto;
import com.firstproj.user.service.UserServiceImpl;
import com.firstproj.user.validate.UserValidator;

@Controller
@RequestMapping(value="/user")
@SessionAttributes("userInfo")
public class UserController {
	@Resource(name="UserServiceImpl")
	private UserServiceImpl userService;
	
	@RequestMapping(value="/regist")
	public String registUser(Model model, HttpServletRequest request) throws Exception{
	    
        String referer = request.getHeader("Referer");
System.out.println(" >>> REFER : " + referer);              
        model.addAttribute("prevPage", referer);
	    
		return "/user/regist";
	}
	
	@RequestMapping(value="/regist.json")
	@ResponseBody
	public JSONObject registUser(Model model, @Valid @ModelAttribute UserDto userDto, BindingResult result) throws Exception{

	    JSONObject    returnObj    = new JSONObject();
		String        resultCode   = "REGIST_0000";
		String        resultMsg    = "";
		
		int           registResult = 0;
		
		if(result.hasErrors()){
			resultCode   = "REGIST_0001"; 	
			resultMsg    = "invalid_parameter";
		}else{
			
			String hashedPassword = BCrypt.hashpw(userDto.getPasswd(), BCrypt.gensalt());
			
			userDto.setPasswd(hashedPassword);
			
			registResult = this.userService.insertUserInfo(userDto);
			
			if(registResult > 0){
				resultCode  = "REGIST_0002";
				resultMsg   = "duplicated_user";
			}else{
				resultCode  = "REGIST_0000";
				resultMsg   = "complelted";				
			}
		}
		returnObj.put("returnCode", resultCode);
		returnObj.put("resultMsg", resultMsg);
		
		return returnObj;
	}
	
    @RequestMapping(value="/registAction")
    @ResponseBody	
    public JsonResponse registUser2(Model model, HttpServletRequest request, @ModelAttribute UserDto userDto, BindingResult result) throws Exception{
                
        JsonResponse returnObj = new JsonResponse();
        
        UserValidator.insertValidate(result, userDto);
        
        String resultCode   = "REGIST_0000";
        String resultMsg    = "";
        
        int    registResult = 0;
        
        if(result.hasErrors()){
            resultCode = "REGIST_0001";     
            
            returnObj.setStatus(resultCode);
            returnObj.setResult(result.getAllErrors());
        }else{
            
            String hashedPassword = BCrypt.hashpw(userDto.getPasswd(), BCrypt.gensalt());
            
            userDto.setPasswd(hashedPassword);
            
            UserDto duplicatedUser = this.userService.selectUserInfo(userDto);
            
            if(duplicatedUser == null){
                registResult = this.userService.insertUserInfo(userDto);
               
                if(registResult > 0){                    
                    resultCode  = "REGIST_0000";
                    resultMsg   = "complelted";               

                }else{
                    resultCode  = "REGIST_0002";
                    resultMsg   = "insert_error";
                }

            }else{
                resultCode  = "REGIST_0003";
                resultMsg   = "duplicated_user";
            }
            
            returnObj.setStatus(resultCode);
            returnObj.setResult(resultMsg);

        }

        model.addAttribute("userInfo", this.userService.selectUserInfo(userDto));
        return returnObj;
    }
	
}
