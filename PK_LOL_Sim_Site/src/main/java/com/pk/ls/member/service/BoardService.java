package com.pk.ls.member.service;

import java.util.List;

import com.pk.ls.member.vo.BoardVo;

public interface BoardService {
	
	public List<BoardVo> boardSelectList(String key, String scText,int start,int end);
	
	public int memberSelectTotalCount(String key, String scText);//토탈 카운트

	public BoardVo boardInfoList(int no);//게시판 상세
	
	public int boardUpdate(String content, int board_Number,String boardTitle2);//게시글 수정
}
