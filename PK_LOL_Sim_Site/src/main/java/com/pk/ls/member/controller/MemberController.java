package com.pk.ls.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	// 회원 가입 화면 메서드
	@RequestMapping(value="/member/register.hm", method=RequestMethod.GET)
	public String memberAdd(Model model) {
		log.debug("회원가입으로 이동");
		// 회원가입 페이지로 이동~
		return "/member/registerForm";
	}

	// 회원 가입 작동 메서드
	@RequestMapping(value="/member/registerCtr.hm",
			method=RequestMethod.POST)
	public String memberAdd(MemberVo memberVo
			, MultipartHttpServletRequest multipartHttpServletRequest
			, Model model) {
		log.debug("회원가입 처리 완료" + memberVo);
		// members 테이블에 입력된 값을 넣는다
		memberService.memberRegister(memberVo
				, multipartHttpServletRequest);
		// 로그인 페이지로 되돌아가기~
		return "redirect:/member/login.hm";
	}
	
	// 로그인 화면 메서드
	@RequestMapping(value="/member/login.hm", method=RequestMethod.GET)
	public String memberLogin(HttpSession httpSession, Model model) {
		log.debug("login 페이지 이동");
		
		return "/member/login";
	}
	
	// 로그인 작동 메서드
	@RequestMapping(value="/member/loginCtr.hm", method=RequestMethod.POST)
	public String memberLoginCtr(String id, String password, 
			HttpSession httpSession, Model model) {
		log.debug("login 합니다. 로그인을 시도한 사용자의 정보: " + id + password);
		
		// 맵에 로그인 정보 담기
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("id", id);
		paramMap.put("password", password);
		
		// 입력된 값을 가진 회원이 존재하는가 판별하는 sql문을 실행
		MemberVo memberVo = memberService.memberExist(paramMap);
		
		String viewUrl = "";
		if(memberVo != null) {
			// 회원이 존재한다면 세션에 담고 
			// 회원 전체 조회 페이지로 이동
			httpSession.setAttribute("memberVo", memberVo);
			// 메인 페이지로 이동
			viewUrl = "redirect:/mainPage.hm";
		}else {
			// 로그인 실패 페이지로 이동
			viewUrl = "/member/loginFail";
		}
		// 로그인에 성공했다면 메인페이지로 가고 실패했다면 로그인 실패 페이지로 이동하게 된다.
		return viewUrl;
	}
	
	@RequestMapping(value="/member/logout.hm", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		log.debug("로그아웃 합니다.");
		
		// 세션의 객체들 파기
		session.invalidate();
		return "redirect:/member/login.hm";
	}
	
}
