package com.firstproj.common.validate;

import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

public class ValidationUtil extends ValidationUtils{
    private static Log logger = LogFactory.getLog(ValidationUtil.class);
    /**
     * 일반 전화번호 체크
     */
    public static final String REG_EX_NORMAL_PHONE_NO  = "^\\d{2,3}"+"-"+"\\d{3,4}"+"-"+"\\d{4}$";   
    /**
     * 핸드폰 전화번호 체크
     */
//    public static final String REG_EX_CELL_PHONE_NO    = "^01(?:[0-9])"+"-"+"(?:\\d{3}|\\d{4})"+"-"+"\\d{4}$";
    public static final String REG_EX_CELL_PHONE_NO    = "^01(?:[0-9])"+"(?:\\d{3}|\\d{4})"+"\\d{4}$";
    /**
     * 이메일 정규식 체크
     */
    public static final String REG_EX_EMAIL            = "^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\\.[0-9a-zA-Z_-]+){1,2}$";
    /**
     * 한글 정규식 체크
     */
    public static final String REG_EX_KOREAN           = "^[ㄱ-ㅎ가-힣]*$";
    /**
     * 영어 정규식 체크
     */
    public static final String REG_EX_ENGLISH          = "^[a-zA-Z]*$";
    /**
     * 숫자 정규식 체크        
     */
    public static final String REG_EX_NUMERIC          = "^[0-9]*$";  
    
    public static final String REG_EX_ENG_NUM          = "^[a-zA-Z0-9]*$";
   
    /**
     * 정규식 체크
     * @param errors
     * @param field
     * @param errorCode
     * @param errorArgs
     * @param defaultMessage
     * @param regEx
     */
    public static void rejectIfNotRegEx(Errors errors, String field, String errorCode, String defaultMessage, String regEx) {
        Object value = errors.getFieldValue(field);
        if (value != null && StringUtils.hasLength(value.toString())) {
            if(!Pattern.matches(regEx, value.toString())){
                errors.rejectValue(field, errorCode, defaultMessage);
            }
        }
    }
    
    /**
     * 범위 체크
     * @param errors
     * @param field
     * @param errorCode
     * @param errorArgs
     * @param defaultMessage
     * @param minLength
     * @param maxLength
     */
    public static void rejectIfNotRangedNumber(Errors errors, String field, String errorCode, String defaultMessage, int minLength, int maxLength) {
        
    }
    /**
     * 최소 길이 체크
     * @param errors
     * @param field
     * @param errorCode
     * @param errorArgs
     * @param defaultMessage
     * @param minLength
     */
    public void rejectIfNotMinLength(Errors errors, String field, String errorCode, String defaultMessage, int minLength){
        Object value = errors.getFieldValue(field);
        if (value != null && StringUtils.hasLength(value.toString())) {
            if(value.toString().length() <= minLength){
                errors.rejectValue(field, errorCode, defaultMessage);
            }
        }

    }
    /**
     * 최대 길이 체크
     * @param errors
     * @param field
     * @param errorCode
     * @param errorArgs
     * @param defaultMessage
     * @param maxLength
     */
    public static void rejectIfNotMaxLength(Errors errors, String field, String errorCode, String defaultMessage, int maxLength){
        Object value = errors.getFieldValue(field);
        if (value != null && StringUtils.hasLength(value.toString())) {
            if(value.toString().length() >= maxLength){
                errors.rejectValue(field, errorCode, defaultMessage);
            }
        }
    }
    /**
     * 패스워드 체크
     * @param errors
     * @param field
     * @param chkField
     * @param errorCode
     * @param errorArgs
     * @param defaultMessage
     */
    public static void rejectIfNotMatchedPasswd(Errors errors, String field, String chkField, String errorCode, String defaultMessage){
        Object value = errors.getFieldValue(field);
        Object chkValue = errors.getFieldValue(chkField);
        if (value != null && StringUtils.hasLength(value.toString())) {
            if(chkValue != null && StringUtils.hasLength(chkValue.toString())){
                if(!value.equals(chkValue)){
                    errors.rejectValue(field, errorCode, defaultMessage);
                }
            }else{
                rejectIfEmpty(errors, chkField, errorCode);
            }
        }else{
            rejectIfEmpty(errors, field, errorCode);
        }
    }
}
