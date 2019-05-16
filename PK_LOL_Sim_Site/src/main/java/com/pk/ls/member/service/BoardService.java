package com.pk.ls.member.service;

import java.util.List;

import com.pk.ls.member.vo.BoardVo;

public interface BoardService {
	
	public List<BoardVo> boardSelectList(String key, String scText,int start,int end);
	
	public int memberSelectTotalCount(String key, String scText);//토탈 카운트

	public BoardVo boardInfoList(int no);//게시판 상세
	
	public int boardUpdate(String content, int board_Number,String boardTitle2);//게시글 수정
	
	public int boardWrite(String boardTitle2,
			String boardText2, int writeNumber);//게시글 쓰기
	
	public int boardDel(int board_Number);//게시글 지우기
}
