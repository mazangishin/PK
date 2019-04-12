package com.pk.ls.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.ls.member.vo.MemberVo;

@Repository
public class MemberDaoImplement implements MemberDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.pk.member.";
	
	@Override
	public int memberRegister(MemberVo memberVo) {
		
		return sqlSession.insert(namespace + "memberRegister",
				memberVo);
	}
	

}
