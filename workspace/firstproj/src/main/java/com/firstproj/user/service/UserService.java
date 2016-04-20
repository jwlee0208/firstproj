package com.firstproj.user.service;

import com.firstproj.user.dto.UserDto;

public interface UserService {
	public UserDto selectUserInfo(UserDto userDto) throws Exception;
	public int insertUserInfo(UserDto userDto) throws Exception;
	public int modifyUserInfo(UserDto userDto) throws Exception;
}
