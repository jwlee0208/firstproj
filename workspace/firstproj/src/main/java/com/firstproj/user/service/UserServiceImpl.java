package com.firstproj.user.service;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.firstproj.common.CommonConstant;
import com.firstproj.common.util.AES256Util;
import com.firstproj.user.dao.UserDao;
import com.firstproj.user.dto.UserDto;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService{
    
    final Log logger = LogFactory.getLog(this.getClass());
    
	@Resource(name="UserDao")
	private UserDao userDao; 

	@Override
	public UserDto selectUserInfo(UserDto userDto) throws Exception{
		return this.userDao.selectUserInfo(userDto);
	}
	
	@Override
	public int insertUserInfo(UserDto userDto) throws Exception{
	    
	    if(userDto != null){
	        String     email       = userDto.getEmail();
	        String     phoneNo     = userDto.getPhoneNo();
	        AES256Util aes256util  = new AES256Util(CommonConstant.IV);
	        
	        if(!email.isEmpty()){
	            String     encEmail    = aes256util.encrypt(email);    
	            userDto.setEmail(encEmail);
	        }
	        if(!phoneNo.isEmpty()){
	            String     encPhoneNo  = aes256util.encrypt(phoneNo);
	            userDto.setPhoneNo(encPhoneNo);	            
	        }
	    }
	    
		return this.userDao.insertUserInfo(userDto);
	}
	
}
