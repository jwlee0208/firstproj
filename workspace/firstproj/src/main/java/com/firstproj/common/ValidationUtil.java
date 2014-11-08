package com.firstproj.common;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

public class ValidationUtil extends ValidationUtils{
    /**
     * 일반 전화번호 체크
     */
    static final String REG_EX_NORMAL_PHONE_NO  = "^\\d{2,3}"+"-"+"\\d{3,4}"+"-"+"\\d{4}$";   
    /**
     * 핸드폰 전화번호 체크
     */
    static final String REG_EX_CELL_PHONE_NO    = "^01(?:[0-9])"+"-"+"(?:\\d{3}|\\d{4})"+"-"+"\\d{4}$";
    /**
     * 이메일 정규식 체크
     */
    static final String REG_EX_EMAIL            = "^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\\.[0-9a-zA-Z_-]+){1,2}$";
   
    /**
     * 정규식 체크
     * @param errors
     * @param field
     * @param errorCode
     * @param errorArgs
     * @param defaultMessage
     * @param regEx
     */
    public void isNomalPhoneNumber(Errors errors, String field, String errorCode, Object[] errorArgs, String defaultMessage, String regEx) {
        if(!Pattern.matches(regEx, errors.getFieldValue(field).toString())){
            errors.rejectValue(field, errorCode, errorArgs, defaultMessage);
        }
    }
}
