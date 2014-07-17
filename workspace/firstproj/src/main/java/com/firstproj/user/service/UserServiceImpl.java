package com.firstproj.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.firstproj.user.dao.UserDao;
import com.firstproj.user.dto.UserDto;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService{
	@Resource(name="UserDao")
	private UserDao userDao; 

	@Override
	public UserDto selectUserInfo(UserDto userDto) throws Exception{
		return this.userDao.selectUserInfo(userDto);
	}
}
