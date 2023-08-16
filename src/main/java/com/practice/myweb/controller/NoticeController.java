package com.practice.myweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.practice.myweb.command.NoticeVO;
import com.practice.myweb.service.NoticeService;
import com.practice.myweb.util.Criteria;
import com.practice.myweb.util.PageVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/notice_list")
	public String ntlist(Model model, Criteria cri) {
		String writer = "admin";
		PageVO page = new PageVO(cri, noticeService.getTotal(writer, cri));
		model.addAttribute("list", noticeService.getList(writer, cri));
		model.addAttribute("page",page);
		return "notice/notice_list";
	}
	
	@GetMapping("/notice_view")
	public String notice_view(@RequestParam("bno") String bno, Model model) {
		
		model.addAttribute("vo", noticeService.getDetail(bno));
		
		return "notice/notice_view";
	}
	
	@GetMapping("/notice_write")
	public String notice_write(Model model) {
		
		String writer = "admin";
		model.addAttribute("writer", writer);
		return "notice/notice_write";
	}
	
	@PostMapping("/writeForm")
	public String writeForm(NoticeVO vo,RedirectAttributes re) {
		
		int result = noticeService.registNotice(vo);
		if(result == 1) {
			re.addFlashAttribute("msg","성공적으로 글을 등록하였습니다.");
		} else {
			re.addFlashAttribute("msg","글을 등록하는 과정에 문제가 발생하였습니다.");
		}
		
		
		return "redirect:/notice/notice_list";
	}
	
	@GetMapping("/modifyForm")
	public String modifyForm(@RequestParam("bno") String bno, Model model) {
		
		
		model.addAttribute("vo", noticeService.getDetail(bno));
		System.out.println(noticeService.getDetail(bno).getBno());
		
		return "notice/notice_write";
	}
	
	@PostMapping("/updateForm")
	public String updateForm(NoticeVO vo,RedirectAttributes re) {
		
		int result = noticeService.updateNotice(vo);
		if(result == 1) {
			re.addFlashAttribute("msg","성공적으로 글을 수정하였습니다.");
		} else {
			re.addFlashAttribute("msg","글을 등록하는 과정에 문제가 발생하였습니다.");
		}
		
		
		return "redirect:/notice/notice_list";
	}
	
	@GetMapping("/deleteForm")
	public String deleteForm(@RequestParam("bno") String bno, RedirectAttributes re) {
		
		
		int result = noticeService.deleteNotice(bno);
		if(result == 1) {
			re.addFlashAttribute("msg","글을 삭제하였습니다.");
		} else {
			re.addFlashAttribute("msg","글을 삭제하는데 문제가 발생하였습니다.");
		}
		
		return "redirect:/notice/notice_list";
	}
}
