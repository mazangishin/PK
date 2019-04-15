package com.pk.ls.member.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pk.ls.member.vo.MemberVo;

public interface MemberService {

	public void memberRegister(MemberVo memberVo, 
			MultipartHttpServletRequest multipartHttpServletRequest);

	

}
