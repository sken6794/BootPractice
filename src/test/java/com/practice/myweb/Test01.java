package com.practice.myweb;

import java.time.LocalDateTime;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.practice.myweb.command.NoticeVO;
import com.practice.myweb.service.NoticeMapper;

@SpringBootTest
public class Test01 {
	
	@Autowired
	NoticeMapper noticeMapper;
	
	@Test
	public void insert1() {
		for(int i = 1; i<=100; i++) {
			NoticeVO vo = new NoticeVO(null, "test"+i, "admin", LocalDateTime.now(), "내용test"+i, null);
			
			noticeMapper.registNotice(vo);
		}
	}
}
