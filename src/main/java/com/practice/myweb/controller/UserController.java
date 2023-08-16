package com.practice.myweb.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.practice.myweb.command.UserVO;
import com.practice.myweb.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/join")
	public String join() {
		
		return "user/join";
	}
	
	@RequestMapping("/login")
	public String login() {
		
		return "user/login";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		
		return "user/mypage";
	}
	
	@PostMapping("/joinForm")
	public String joinForm(@Valid @ModelAttribute UserVO vo, @RequestParam("pwcheck") String pwcheck,
						RedirectAttributes re, Errors errors) {
		
		if(!vo.getPw().equals(pwcheck)) {
			re.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			
			return "redirect:/user/join";
			
		} else {
			
			//int result = userService.registUser(vo);
			return "redirect:/user/login";//나중에 변경필요
		}
		
		
		
	}
}
