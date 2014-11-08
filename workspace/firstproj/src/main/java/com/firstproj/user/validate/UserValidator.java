package com.firstproj.user.validate;


import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;

import com.firstproj.common.validate.BaseValidator;
import com.firstproj.common.validate.ValidationUtil;
import com.firstproj.user.dto.UserDto;

public class UserValidator extends BaseValidator{
    /**
     * insert validation
     * @param result
     * @param userDto
     */
    public static void insertValidate(BindingResult result, UserDto userDto){

        ValidationUtil.rejectIfEmpty(result, "userId", "user.regist.userId.empty", "아이디가 입력되지 않았습니다.");
        if(!StringUtils.isEmpty(userDto.getUserId())){
            ValidationUtil.rejectIfNotRegEx(result, "userId", "user.regist.userId.regex", "아이디는 영문과 숫자만 사용가능합니다.", ValidationUtil.REG_EX_ENG_NUM);
        }
                
        ValidationUtils.rejectIfEmpty(result, "userNm", "user.regist.userNm.empty", "이름이 입력되지 않았습니다.");        
        
        ValidationUtils.rejectIfEmpty(result, "passwd", "user.regist.passwd.empty", "비밀번호가 입력되지 않았습니다.");
        
        if(StringUtils.hasLength(userDto.getPhoneNo())){
            ValidationUtil.rejectIfNotRegEx(result, "phoneNo", "user.regist.phoneNo.regex", "전화번호 형식에 맞지 않습니다.", ValidationUtil.REG_EX_CELL_PHONE_NO);
        }
        
        ValidationUtils.rejectIfEmpty(result, "email", "user.regist.email.empty", "이메일이 입력되지 않았습니다.");
        if(!StringUtils.isEmpty(userDto.getEmail())){
            ValidationUtil.rejectIfNotRegEx(result, "email", "user.regist.email.regex", "이메일 형식에 맞지 않습니다.", ValidationUtil.REG_EX_EMAIL);
        }
        
        ValidationUtil.rejectIfNotRegEx(result, "email", "user.regist.email.unregex", "이메일 형식이 맞지 않습니다.", ValidationUtil.REG_EX_EMAIL);
    }
    
    /**
     * update validation
     * @param result
     * @param userDto
     */
    public static void updateValidate(BindingResult result, UserDto userDto){
        
    }
    
    /**
     * delete validation
     * @param result
     * @param userDto
     */
    public static void deleteValidate(BindingResult result, UserDto userDto){
        
    }



}
