package com.firstproj.user.service;

import com.firstproj.user.dto.UserDto;

public interface UserService {
	public UserDto selectUserInfo(UserDto userDto) throws Exception;
}
