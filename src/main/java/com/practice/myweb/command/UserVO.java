package com.practice.myweb.command;

import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserVO {
	private int uno;
	private String regdate;
	private String name;
	
	@Pattern(message = "비밀번호 형식에 맞춰서 작성 바람",regexp = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$")
	private String pw;
	
	@Pattern(message = "- 을 제외한 숫자만 11자리 입력",regexp = "[0-1]{3},[0-9]{8}")
	private String phone;
	private String gender;
	private String agree1;
	private String agree2;
	private String addr1;
	private String addr2;
	private String email_first ;
	private String email_second;
	private String birth;
	private String content;
}
