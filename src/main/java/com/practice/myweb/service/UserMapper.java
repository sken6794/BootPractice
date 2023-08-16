package com.practice.myweb.service;

import org.apache.ibatis.annotations.Mapper;

import com.practice.myweb.command.UserVO;

@Mapper
public interface UserMapper {
	int registUser(UserVO vo);
	UserVO getUser(UserVO vo);
}
