package com.practice.myweb.command;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeVO {
	private String bno;
	private String title;
	private String writer;
	private LocalDateTime regdate;
	private String content;
	private String hit;
}
