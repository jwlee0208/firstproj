package com.firstproj.user;

import javax.annotation.Resource;
import javax.validation.Valid;

import net.sf.json.JSONObject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firstproj.common.validate.JsonResponse;
import com.firstproj.common.validate.ValidationUtil;
import com.firstproj.user.dto.UserDto;
import com.firstproj.user.service.UserServiceImpl;
import com.firstproj.user.validate.UserValidator;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Resource(name="UserServiceImpl")
	private UserServiceImpl userService;
	
	@RequestMapping(value="/regist.page")
	public String registUser() throws Exception{
		return "/user/regist";
	}
	
	@RequestMapping(value="/regist.json")
	@ResponseBody
	public JSONObject registUser(Model model, @Valid @ModelAttribute UserDto userDto, BindingResult result) throws Exception{

	    JSONObject returnObj = new JSONObject();
		String resultCode = "REGIST_0000";
		String resultMsg = "";
		
		int registResult = 0;
		
		if(result.hasErrors()){
			resultCode = "REGIST_0001"; 	
			resultMsg = "invalid_parameter";
		}else{
			
			String hashedPassword = BCrypt.hashpw(userDto.getPasswd(), BCrypt.gensalt());
			
			userDto.setPasswd(hashedPassword);
			
			registResult = this.userService.insertUserInfo(userDto);
			
			if(registResult > 0){
				resultCode = "REGIST_0002";
				resultMsg = "duplicated_user";

			}else{
				resultCode = "REGIST_0000";
				resultMsg = "complelted";				
			}
		}
		returnObj.put("returnCode", resultCode);
		returnObj.put("resultMsg", resultMsg);
		
		return returnObj;
	}
	
    @RequestMapping(value="/regist")
    @ResponseBody	
    public JsonResponse registUser2(Model model, @ModelAttribute UserDto userDto, BindingResult result) throws Exception{
                
        JsonResponse returnObj = new JsonResponse();
        
        UserValidator.insertValidate(result, userDto);
        
//        ValidationUtil.rejectIfEmpty(result, "userId", "user.regist.userId.empty", "아이디가 입력되지 않았습니다.");
//        if(!StringUtils.isEmpty(userDto.getUserId())){
//            ValidationUtil.rejectIfNotRegEx(result, "userId", "user.regist.userId.regex", "아이디는 영문과 숫자만 사용가능합니다.", ValidationUtil.REG_EX_ENG_NUM);
//        }
//                
//        ValidationUtils.rejectIfEmpty(result, "userNm", "user.regist.userNm.empty", "이름이 입력되지 않았습니다.");        
//        
//        ValidationUtils.rejectIfEmpty(result, "passwd", "user.regist.passwd.empty", "비밀번호가 입력되지 않았습니다.");
//        
//        if(StringUtils.hasLength(userDto.getPhoneNo())){
//            ValidationUtil.rejectIfNotRegEx(result, "phoneNo", "user.regist.phoneNo.regex", "전화번호 형식에 맞지 않습니다.", ValidationUtil.REG_EX_CELL_PHONE_NO);
//        }
//        
//        ValidationUtils.rejectIfEmpty(result, "email", "user.regist.email.empty", "이메일이 입력되지 않았습니다.");
//        ValidationUtil.rejectIfNotRegEx(result, "email", "user.regist.email.unregex", "이메일 형식이 맞지 않습니다.", ValidationUtil.REG_EX_EMAIL);
        
        String resultCode = "REGIST_0000";
        String resultMsg = "";
        
        int registResult = 0;
        
        if(result.hasErrors()){
            resultCode = "REGIST_0001";     
//            resultMsg = "invalid_parameter";
            
            returnObj.setStatus(resultCode);
            returnObj.setResult(result.getAllErrors());
        }else{
            
            String hashedPassword = BCrypt.hashpw(userDto.getPasswd(), BCrypt.gensalt());
            
            userDto.setPasswd(hashedPassword);
            
            registResult = this.userService.insertUserInfo(userDto);
            
            if(registResult > 0){
                resultCode = "REGIST_0002";
                resultMsg = "duplicated_user";

            }else{
                resultCode = "REGIST_0000";
                resultMsg = "complelted";               
            }

            returnObj.setStatus(resultCode);
            returnObj.setResult(resultMsg);

        }

        return returnObj;
    }
	
}
