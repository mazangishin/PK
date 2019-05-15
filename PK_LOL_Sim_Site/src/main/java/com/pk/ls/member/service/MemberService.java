package com.pk.ls.member.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pk.ls.member.vo.MemberVo;

public interface MemberService {

	public void memberRegister(MemberVo memberVo, 
			MultipartHttpServletRequest multipartHttpServletRequest);
	public MemberVo memberExist(Map<String, Object> paramMap);
	public MemberVo memberInfo(MemberVo memberVo);
	public int memberUpdate(MemberVo memberVo);
	public int memberDelete(int memberNumber);
	public String findMemberId(String email);
	public String findMemberPassword(String email, String id);

}
