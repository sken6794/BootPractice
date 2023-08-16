package com.practice.myweb.service;

import com.practice.myweb.command.UserVO;

public interface UserService {
	int registUser(UserVO vo);
	UserVO getUser(UserVO vo);
	
}
