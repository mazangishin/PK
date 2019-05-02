package com.pk.ls.member.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.ls.member.vo.MemberVo;

@Repository
public class MemberDaoImplement implements MemberDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.pk.ls.member.";
	
	@Override
	public int memberRegister(MemberVo memberVo) {
		
		return sqlSession.insert(namespace + "memberRegister",
				memberVo);
	}

	@Override
	public MemberVo memberExist(Map<String, Object> paramMap) {

		return sqlSession.selectOne(namespace + "memberExist", paramMap);
	}

	@Override
	public MemberVo memberInfo(MemberVo memberVo) {

		return sqlSession.selectOne(namespace + "memberInfo", memberVo);
	}

	@Override
	public int memberUpdate(MemberVo memberVo) {

		return sqlSession.update(namespace + "memberUpdate", memberVo);
	}

	@Override
	public int memberDelete(int memberNumber) {
		
		return sqlSession.delete(namespace + "memberDelete", memberNumber);
	}



}
