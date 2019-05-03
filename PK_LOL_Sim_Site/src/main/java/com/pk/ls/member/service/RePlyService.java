package com.pk.ls.member.service;
import java.util.List;

import com.pk.ls.member.vo.RePlyVo;;

public interface RePlyService {
	
	public int rePlyWrite(int reply_number,int member_number,String re_comment ,String is_reply_comm,int is_reply_comm_num);
	
	public List<RePlyVo> rePlyList(int reply_board_number);
	public List<RePlyVo> rePlyList2(int reply_board_number);
	public int rePlyCount(int reply_board_number);
}
