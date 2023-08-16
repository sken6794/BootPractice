package com.practice.myweb.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.practice.myweb.command.NoticeVO;
import com.practice.myweb.util.Criteria;

@Mapper
public interface NoticeMapper {
	int registNotice(NoticeVO vo);
	int deleteNotice(String bno);
	int updateNotice(NoticeVO vo);
	ArrayList<NoticeVO> getList(@Param("writer") String writer, @Param("cri") Criteria cri);
	int getTotal(@Param("writer") String writer, @Param("cri") Criteria cri);
	NoticeVO getDetail(String bno);
	String getToday();
}
