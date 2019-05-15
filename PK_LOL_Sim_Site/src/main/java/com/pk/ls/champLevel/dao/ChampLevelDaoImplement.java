package com.pk.ls.champLevel.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.ls.champLevel.vo.ChampLevelVo;

@Repository
public class ChampLevelDaoImplement implements ChampLevelDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.pk.ls.champLevel.";

	@Override
	public ChampLevelVo champLevelSelectOne(Map<String, Object> keyWordmap) {
		return sqlSession.selectOne(namespace + "champLevelSelectOne", keyWordmap);
	}

	@Override
	public List<Map<String, Object>> champLevelSelectList(int championNumber) {
		return sqlSession.selectList(namespace + "champLevelSelectList", championNumber);
	}
	
	@Override
	public int champLevelCreate(ChampLevelVo champLevelVo) {
		return sqlSession.insert(namespace + "champLevelCreate", champLevelVo);
	}

	@Override
	public int champLevelUpdate(ChampLevelVo champLevelVo) {
		return sqlSession.update(namespace + "champLevelUpdate", champLevelVo);
	}

	@Override
	public int champLevelDelete(int championNumber) {
		return sqlSession.delete(namespace + "champLevelDelete", championNumber);
	}

}
