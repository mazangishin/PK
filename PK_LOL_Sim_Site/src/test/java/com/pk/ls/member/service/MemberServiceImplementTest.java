package com.pk.ls.member.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pk.ls.member.dao.MemberDao;
import com.pk.ls.member.vo.MemberVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		"file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MemberServiceImplementTest{
	
	@Autowired
	public MemberServiceImplement memberServiceImplement;
	
	@Ignore
	@Test
	public void testMemberUpdate() {
		// 매개변수로 사용할 memberVo를 가져온다
		MemberVo memberVo = new MemberVo();
		// date 형식 ㅡㅡ 
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		Date sysdate = new Date();
		String time = formatter.format(sysdate);
		
		// memberVo에 값을 입력
		memberVo.setMemberNumber(3);
		memberVo.setMemberId("mazangishin1");
		memberVo.setPassword("1234");
		memberVo.setAuthority("N");
		memberVo.setEmail("mazangishin@naver.com");
		memberVo.setCreateDate(sysdate);
		memberVo.setModifiedDate(sysdate);
		
		// 서비스 임플먼트 실행!
		int afterImplement = memberServiceImplement.memberUpdate(memberVo);
		
		// 결과 비교
		Assert.assertEquals(1, afterImplement);		
	}

	@Ignore
	@Test
	public void testMemberInfo() {
		
		MemberVo memberVo = new MemberVo();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		Date sysdate = new Date();
		String time = formatter.format(sysdate);
		
		memberVo.setMemberNumber(3);
		memberVo.setMemberId("mazangishin1");
		memberVo.setPassword("1234");
		memberVo.setAuthority("N");
		memberVo.setEmail("mazangishin@naver.com");
		memberVo.setCreateDate(sysdate);
		memberVo.setModifiedDate(sysdate);
				
		MemberVo memberVo2 = memberServiceImplement.memberInfo(memberVo);
		
		Assert.assertEquals(3, memberVo2.getMemberNumber());
		Assert.assertEquals("mazangishin1", memberVo2.getMemberId());
		Assert.assertEquals("1234", memberVo2.getPassword());
	}
	
//	@Test
//	public void testMemberSelectList() {
//		
//		// 전체 조회는 특별한 경우가 아니면 입력할 내용이 없다.
//		// 범위
//		List<MemberVo> list = memberServiceImple.memberSelectList();
//		
		// 10명이 나올 것이라는 예측
//		Assert.assertEquals(10, list.size());
		// 회원이 한 명도 없는 경우 list == null;
//		Assert.assertNull(list);
//		Assert.assertTrue(1 <= list.size());
//	}
	
//	@Test
//	public void testMemberSelectList() {
//		
//	
//	MemberVo memberVo = new MemberVo(1, "홍길동", "s1@test.com", "dd", null, null);
//	memberServiceImple.meemberUpdate(memberVo);
//	MemberVo getMemberVo = memberSeviceImpl.memberSelectOne(memberVo.getNo);
//	
//	Assert.assertEquals(1, getMemberVo.getNo());
//	Assert.assertEquals("홍길동", getMemberVo.getName());
//	Assert.assertEquals("s1@test.com", getMemberVo.getEmail());
//
//	}
}
