package com.pk.ls.member.util;

import java.io.Serializable;
import java.util.List;

import com.pk.ls.member.vo.BoardVo;

public class Board_ReCount implements Serializable{

	public void Board_List_Set_ReCount(BoardVo bv,int num)//페이지 한칸 이동
	{
		
		bv.setCommet_Num(num);
	}
	
	
}
