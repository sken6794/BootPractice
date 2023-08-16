package com.practice.myweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.practice.myweb.command.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	@Override
	public int registUser(UserVO vo) {
		return userMapper.registUser(vo);
	}

	@Override
	public UserVO getUser(UserVO vo) {
		return null;
	}

}
