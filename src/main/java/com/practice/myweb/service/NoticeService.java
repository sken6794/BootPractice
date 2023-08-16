package com.practice.myweb.service;

import java.util.ArrayList;

import com.practice.myweb.command.NoticeVO;
import com.practice.myweb.util.Criteria;

public interface NoticeService {
	int registNotice(NoticeVO vo);
	int deleteNotice(String bno);
	int updateNotice(NoticeVO vo); 
	ArrayList<NoticeVO> getList(String writer, Criteria cri);
	int getTotal(String writer, Criteria cri);
	NoticeVO getDetail(String bno);
	String getToday();
}
