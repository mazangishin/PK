package com.pk.ls.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pk.ls.member.service.MemberService;
import com.pk.ls.member.vo.MemberVo;

@Controller
public class MemberController {

	private static final Logger log = 
			LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/member/register.hm", method=RequestMethod.GET)
	public String memberAdd(Model model) {
		log.debug("회원가입으로 이동");
		
		return "/registerForm";
	}

	@RequestMapping(value="/member/registerCtr.hm",
			method=RequestMethod.POST)
	public String memberAdd(MemberVo memberVo
			, MultipartHttpServletRequest multipartHttpServletRequest
			, Model model) {
		log.debug("회원가입 처리 완료" + memberVo);
		
		memberService.memberRegister(memberVo
				, multipartHttpServletRequest);
		
		return "redirect:/login.hm";
	}
	
	
}
