package com.pk.ls.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.ls.member.vo.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao{

	
	@Autowired
	SqlSessionTemplate sqlSession;
	String namespace = "com.pk.ls.board.";
	String namespace2 = "com.pk.ls.member.";

	
	@Override
	public List<BoardVo> boardSelectList(String key, String scText,int start,int end) {
		
		Map<String, Object> map = new HashMap<>();//맵생성
		map.put("key", key);
		map.put("scText", scText);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList(namespace+"boardSelectList", map);
	}
	
	@Override
	public int BoardTotalCount(String key,String scText) {
		Map<String, Object> map = new HashMap<>();//맵생성
		map.put("key", key);
		map.put("scText", scText);
		return sqlSession.selectOne(namespace+"boardListCount", map);
		
	
	}//게시물 토탈 카운트 뽑기
	
	
	
	@Override
	public BoardVo boardInfoList(int no){//게시판인포
		Map<String, Object> map = new HashMap<>();//맵생성
		map.put("no", no);
		return sqlSession.selectOne(namespace+"boardInfoList", map);
	}
	
	@Override
	public int boardUpdate(String content, int board_Number,String boardTitle2){//게시글 수정
		
		Map<String, Object> map = new HashMap<>();//맵생성
		map.put("content", content);
		map.put("board_Number", board_Number);
		map.put("title", boardTitle2);
		return sqlSession.update(namespace+"boardUpdate", map);
	}
	
	
	@Override
	public int boardDel(int board_Number)//게시글 지우기
	{
		Map<String, Object> map = new HashMap<>();//맵생성
		map.put("board_Number", board_Number);
		return sqlSession.delete(namespace+"boardDel", map);
	}
	
	
	@Override
	public int boardWrite(String boardTitle2,
			String boardText2, int writeNumber)//게시글 쓰기
	{
		Map<String, Object> map = new HashMap<>();//맵생성
		
		map.put("content", boardText2);
		map.put("title", boardTitle2);
		map.put("member_Number", writeNumber);
		
		return sqlSession.insert(namespace+"boardWrite", map);
		
		/*
		 <result column="TITLE" property="title" />
		<result column="CONTENT" property="content" />
		<result column="CREATE_DATE" property="create_Date"
			javaType="java.util.Date" />
		<result column="MODIFIED_DATE" property="modified_Date"
			javaType="java.util.Date" />
		<result column="MEMBER_NUMBER" property="member_Number"/>
		 * */
	}
}
