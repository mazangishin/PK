package com.pk.ls.member.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pk.ls.member.vo.MemberVo;

public interface MemberService {

	public void memberRegister(MemberVo memberVo, 
			MultipartHttpServletRequest multipartHttpServletRequest);
	public MemberVo memberExist(Map<String, Object> paramMap);
	public MemberVo memberInfo(int memberNumber);
	public int memberUpdate(MemberVo memberVo);
	public int memberDelete(int memberNumber);

}
