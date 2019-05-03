package com.pk.ls.member.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.pk.ls.member.dao.RePlyDao;
import com.pk.ls.member.vo.RePlyVo;


@Service
public class ReplyServiceImplement implements RePlyService{
	
	private static final Logger log = 
			LoggerFactory.getLogger(ReplyServiceImplement.class);
	
	@Autowired
	public RePlyDao rePlyDao;

	
	@Override
	public int rePlyWrite(int reply_number,int member_number,String re_comment,String is_reply_comm) {
		return rePlyDao.rePlyWrite(reply_number, member_number, re_comment,is_reply_comm);
	}
	
	@Override
	public List<RePlyVo> rePlyList(int reply_board_number){
		return rePlyDao.rePlyList(reply_board_number);
	}
	
	@Override
	public int rePlyCount(int reply_board_number) {
		return rePlyDao.rePlyCount(reply_board_number);
	}
	
	
}
