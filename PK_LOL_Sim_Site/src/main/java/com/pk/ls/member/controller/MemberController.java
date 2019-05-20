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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pk.ls.member.service.MemberService;
import com.pk.ls.member.vo.MemberVo;

@Controller
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	// 로그인 화면 메서드
	@RequestMapping(value = "/member/login.hm", method = RequestMethod.GET)
	public String memberLogin(HttpSession httpSession, Model model) {
		log.debug("login 페이지 이동");
		
		String firstPageUrl = "";
		MemberVo memberVo = (MemberVo) httpSession.getAttribute("memberVo");
		
		if (memberVo != null) {
			firstPageUrl = "/mainPage";
		}else if(memberVo == null) {
			firstPageUrl = "/member/login";
		}

		return firstPageUrl;
	}

	// 로그인 작동 메서드
	@RequestMapping(value = "/member/loginCtr.hm", method = RequestMethod.POST)
	public String memberLoginCtr(String memberId, String password, 
			HttpSession httpSession, Model model) {
		log.debug("login 합니다. 로그인을 시도한 사용자의 정보"
			+ "ID : " + memberId + "\tPW : " + password);

		// 맵에 로그인 정보 담기
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("memberId", memberId);
		paramMap.put("password", password);

		// 입력된 값을 가진 회원이 존재하는가 판별하는 sql문을 실행
		MemberVo memberVo = memberService.memberExist(paramMap);

		String viewUrl = "";
		if (memberVo != null) {
			// 회원이 존재한다면 세션에 담고
			// 회원 전체 조회 페이지로 이동
			httpSession.setAttribute("memberVo", memberVo);
			// 메인 페이지로 이동
			// 아직 메인페이지와 연동되지 않음
			viewUrl = "redirect:/mainPage.hm";
		} else {
			// 로그인 실패 페이지로 이동
			viewUrl = "/member/loginFail";
		}
		// 로그인에 성공했다면 메인페이지로 가고 실패했다면 로그인 실패 페이지로 이동하게 된다.
		return viewUrl;
	}

	@RequestMapping(value = "/member/logout.hm", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		log.debug("로그아웃 합니다.");

		// 세션의 객체들 파기
		session.invalidate();
		// 로그인 페이지로 이동
		return "redirect:/member/login.hm";
	}

	// 회원 가입 화면 메서드
	@RequestMapping(value = "/member/register.hm", method = RequestMethod.GET)
	public String memberAdd(Model model) {
		log.debug("회원가입으로 이동");

		return "/member/registerForm";
	}

	// 회원 가입 동작 메서드
	@RequestMapping(value = "/member/registerCtr.hm", method = RequestMethod.POST)
	public String memberAdd(MemberVo memberVo, 
			MultipartHttpServletRequest multipartHttpServletRequest, 
			Model model) {
		log.debug("회원가입 처리 완료" + memberVo);

		// 회원이 입력한 정보로 spl문을 조작하여 DB에 추가한다.
		memberService.memberRegister(memberVo, multipartHttpServletRequest);

		return "/member/successPage";
	}

	// 회원 정보 화면 메서드
	@RequestMapping(value="/member/memberInfo.hm", method=RequestMethod.GET)
	public String memeberInfo(HttpSession httpSession, Model model) {
		log.debug("회원 정보 페이지로 이동합니다.");
		
		// sql문을 조작해서 DB에서 가져온 값을 memberVo에 담고 세션에 태운다.
		MemberVo memberVo = memberService.memberInfo
				((MemberVo)httpSession.getAttribute("memberVo"));
		httpSession.setAttribute("memberVo", memberVo);

		// 모델에 담고 jsp 페이지로 ㄱㄱ
		model.addAttribute("memberVo", memberVo);
		
		return "/member/memberInfo";
	}

	// 회원 정보 수정 화면 메서드
	@RequestMapping(value="/member/memberUpdate.hm", method=RequestMethod.POST)
	public String memberUpdate(HttpSession httpSession, Model model) {
		
		// 세션에 있는 memberVo의 값을 담아옴
		MemberVo memberVo = (MemberVo)httpSession.getAttribute("memberVo");
		
		// 확인차 디버깅 돌리고 안에 정보 조회한 거 표기
		log.debug("회원 정보 수정 화면입니다, 회원 번호 :" + memberVo.getMemberNumber());
		
		// sql문 돌린 거 memberVo에 다시 담아서 모델에 태움
		memberVo = memberService.memberInfo(memberVo);
		model.addAttribute("memberVo", memberVo);
		
		// 회원 정보 수정 페이지로 가즈아ㅏㅏ
		return "/member/memberUpdate";
	}
	
	// 회원 정보 수정 작동 메서드
	@RequestMapping(value="/member/memberUpdateCtr.hm", method=RequestMethod.POST)
	public String memberUpdateCtr(HttpSession httpSession, MemberVo memberVo,
			@RequestParam(value="memberNumber") String memberNumber, Model model) {
		
		// 회원 정보 표기 로그
		log.debug("회원 정보를 수정합니다." + memberVo.toString());

		memberVo.setMemberNumber(Integer.parseInt(memberNumber));
		
		// sql문 조작 후 결과를 담는다.
		int resultNum = memberService.memberUpdate(memberVo);
		
		// 데이터베이스에서 회원정보가 수정이 됐는가 체크
		if(resultNum > 0) {
			
			MemberVo sessionMemberVo = 
					(MemberVo)httpSession.getAttribute("memberVo");
			// 세션에 객체가 존재하는지 여부
			if(sessionMemberVo != null) {
				// 세션의 값과 새로운 값이 일치하는지 여부
				if(sessionMemberVo.getMemberNumber() 
						== memberVo.getMemberNumber()) {
								
					httpSession.removeAttribute("memberVo");
					
					httpSession.setAttribute("memberVo", memberVo);
				}
			}
		}
		// 성공 페이지로 가즈아ㅏㅏ
		return "/member/successPage";
	}
	
	// 회원 탈퇴 작동 메서드
	@RequestMapping(value="/member/memberDelete.hm",
			method=RequestMethod.GET)
	public String memberDelete(@RequestParam(value="memberNumber") 
			String memberNumber, MemberVo memberVo, Model model, HttpSession session) {
		
		memberVo.setMemberNumber(Integer.parseInt(memberNumber));
		
		log.debug("회원 탈퇴를 수행합니다. 회원 번호", memberVo.getMemberNumber());
		
		memberService.memberDelete(memberVo.getMemberNumber());
		session.removeAttribute("memberVo");
		
		
		return "/member/successPage";
	}
	
	// 메인 화면 출력 메서드
	@RequestMapping(value = "/mainPage.hm", method = RequestMethod.GET)
	public String mainPage(Model model) {

		log.debug("메인페이지로 이동");

		return "/mainPage";
	}
	
	@RequestMapping(value = "/memberTest.hm", method = RequestMethod.GET)
	public String memberTest(Model model) {
		return "/memberTest";
	}
	
	@RequestMapping(value = "/member/findAccount.hm", method = RequestMethod.GET)
	public String memberFind(Model model) {
		return "/member/findAccount";
	}
	
	@RequestMapping(value = "/member/findId.hm", method=RequestMethod.POST)
	public String findId(Model model, String email) {
		
		String memberId = memberService.findMemberId(email);
		
		model.addAttribute("memberId", memberId);
		
		return "/member/findResult";
	}
	
	@RequestMapping(value = "/member/findPassword.hm", method=RequestMethod.POST)
	public String findPassword(Model model, String email, String id) {
		
		String memberPassword = memberService.findMemberPassword(email, id);
		
		if (memberPassword != null) {
			model.addAttribute("memberId", id);
			model.addAttribute("memberPassword", memberPassword);
		} else if (memberPassword == null) {
			id = null;
			memberPassword = null;
			
			model.addAttribute("memberId", id);
			model.addAttribute("memberPassword", memberPassword);
		}
		
		return "/member/findResult";
	}

}
