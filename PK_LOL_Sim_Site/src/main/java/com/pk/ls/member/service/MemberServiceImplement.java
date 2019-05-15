package com.pk.ls.member.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pk.ls.member.dao.MemberDao;
import com.pk.ls.member.vo.MemberVo;

@Service
public class MemberServiceImplement implements MemberService{

	private static final Logger log = 
			LoggerFactory.getLogger(MemberServiceImplement.class);
	
	@Autowired
	public MemberDao memberDao;

	@Override
	public void memberRegister(MemberVo memberVo, MultipartHttpServletRequest multipartHttpServletRequest) {

		memberDao.memberRegister(memberVo);
		
	}

	@Override
	public MemberVo memberExist(Map<String, Object> paramMap) {

		return memberDao.memberExist(paramMap);
	}

	@Override
	public MemberVo memberInfo(MemberVo memberVo) {

		return memberDao.memberInfo(memberVo);
	}

	@Override
	public int memberUpdate(MemberVo memberVo) {

		return memberDao.memberUpdate(memberVo);
	}

	@Override
	public int memberDelete(int memberNumber) {

		return memberDao.memberDelete(memberNumber);
	}

	@Override
	public String findMemberId(String email) {

		return memberDao.findMemberId(email);
	}

	@Override
	public String findMemberPassword(String email, String id) {

		Map<String, Object> memberMap = new HashMap<String, Object>();
		
		memberMap.put("email", email);
		memberMap.put("id", id);
		
		return memberDao.findMemberPassword(memberMap);
	}
	
}
