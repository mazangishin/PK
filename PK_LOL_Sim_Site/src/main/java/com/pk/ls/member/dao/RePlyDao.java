package com.pk.ls.member.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.pk.ls.member.vo.BoardVo;
import com.pk.ls.member.vo.MemberVo;
import com.pk.ls.member.vo.RePlyVo;

public interface RePlyDao {

	public int rePlyWrite(int reply_number,int member_number,String re_comment,String is_reply_comm,int is_reply_comm_num);
	
	public List<RePlyVo> rePlyList(int reply_board_number);
	public List<RePlyVo> rePlyList2(int reply_board_number);
	public int rePlyCount(int reply_board_number);
}