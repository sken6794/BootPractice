package com.practice.myweb.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.practice.myweb.command.NoticeVO;
import com.practice.myweb.util.Criteria;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeMapper noticeMapper;
	
	@Override
	public int registNotice(NoticeVO vo) {
		// 
		return noticeMapper.registNotice(vo);
	}

	@Override
	public int deleteNotice(String bno) {
		
		return noticeMapper.deleteNotice(bno);
	}

	

	@Override
	public NoticeVO getDetail(String bno) {
		// TODO Auto-generated method stub
		return noticeMapper.getDetail(bno);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		// TODO Auto-generated method stub
		return noticeMapper.updateNotice(vo);
	}

	@Override
	public String getToday() {
		// TODO Auto-generated method stub
		return noticeMapper.getToday();
	}

	@Override
	public ArrayList<NoticeVO> getList(String writer, Criteria cri) {
		
		return noticeMapper.getList(writer, cri);
	}

	@Override
	public int getTotal(String writer, Criteria cri) {
		
		return noticeMapper.getTotal(writer, cri);
	}

}
