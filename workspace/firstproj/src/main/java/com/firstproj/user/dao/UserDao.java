package com.firstproj.user.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.firstproj.user.dto.UserDto;

@Repository("UserDao")
public class UserDao extends SqlSessionDaoSupport{
	
	public UserDto selectUserInfo(UserDto userDto) throws Exception{
		return getSqlSession().selectOne("sql.user.selectUserInfo", userDto);
	}
}
