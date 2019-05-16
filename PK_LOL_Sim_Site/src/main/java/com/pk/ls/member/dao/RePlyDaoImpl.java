package com.pk.ls.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pk.ls.member.vo.RePlyVo;

@Repository
public class RePlyDaoImpl implements RePlyDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.pk.ls.board.";
	
	@Override
	public int rePlyWrite(int reply_number,int member_number,String re_comment,String is_reply_comm,int is_reply_comm_num)
	{
		Map<String, Object> map = new HashMap<>();//맵생성
		
		map.put("reply_board_number", reply_number);
		map.put("member_number", member_number);
		map.put("re_comment", re_comment);
		map.put("is_reply_comm", is_reply_comm);//댓글의 댓글인감?
		map.put("is_reply_comm_num", is_reply_comm_num);//대댓글의 번호
		return sqlSession.insert(namespace + "rePlyWrite", map);
		
	}
	
	@Override
	public List<RePlyVo> rePlyList(int reply_board_number){
		return sqlSession.selectList(namespace + "rePlyList", reply_board_number);
	}
	
	@Override
	public List<RePlyVo> rePlyList2(int reply_board_number){
		return sqlSession.selectList(namespace + "rePlyList2", reply_board_number);
	}
	
	@Override
	public int rePlyCount(int reply_board_number) {
		return sqlSession.selectOne(namespace + "rePlyCount", reply_board_number);
	}
	@Override
	public int rePlyDel(int reply_board_number) {
		return sqlSession.delete(namespace + "rePlyDel", reply_board_number);
	}
}
