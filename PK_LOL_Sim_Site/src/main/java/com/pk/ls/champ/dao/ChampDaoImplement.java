package com.pk.ls.champ.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pk.ls.champ.vo.ChampVo;

@Repository
public class ChampDaoImplement implements ChampDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.pk.ls.champ.";
	
	// 챔피언 포지션 별로 보는 거
	@Override
	public List<ChampVo> champList(String position, int start, int end) {

		Map<String, Object> champMap = new HashMap<>();
		champMap.put("position", position);
		champMap.put("start", start);
		champMap.put("end", end);
		
		return sqlSession.selectList(namespace + "champList", champMap);
	}
	// 챔피언 리스트 페이징할 때 총 챔피언의 수를 구한다
	@Override
	public int champPositionTotalCount(String position) {
		
		Map<String, Object> positionMap = new HashMap();
		positionMap.put("position", position);

		return sqlSession.selectOne(namespace + "champPositionTotalCount", positionMap);
	}
	// 챔피언 등록
	@Override
	public int champCreate(ChampVo champVo) {

		return sqlSession.insert(namespace + "champCreate", champVo);
	}
	// 챔피언 하나 상세 보기
	@Override
	public ChampVo champSelectOne(int championNumber) {

		return sqlSession.selectOne(namespace + "champSelectOne", championNumber);
	}
	// 챔피언 정보 업데이트
	@Override
	public int champUpdateOne(ChampVo champVo) {

		return sqlSession.update(namespace + "champUpdateOne", champVo);
	}
	// 챔피언 삭제
	@Override
	public int champDelete(int championNumber) {

		return sqlSession.delete(namespace + "champDelete", championNumber);
	}
	// 챔피언 등록 시에 이미지 파일 등록
	@Override
	public void insertFile(Map<String, Object> map) {
			
		sqlSession.insert(namespace + "insertFile", map);
	}
	// 챔피언 리스트에 던져 줄 이미지 파일 리스트 가지고 오기
	@Override
	public List<Map<String, Object>> fileSelectList(int championNumber) {

		return sqlSession.selectList(namespace + "fileSelectList", championNumber);
	}
	// 챔피언 삭제 때 이미지 파일 같이 삭제
	@Override
	public int fileDelete(int championNumber) {

		return sqlSession.delete(namespace + "fileDelete", championNumber);
	}
	// 이미지 파일 저장 이름 불러오기
	@Override
	public Map<String, Object> fileSelectStoredFileName(int championNumber) {

		return sqlSession.selectOne(namespace + "fileSelectStoredFileName", championNumber);
	}

}
