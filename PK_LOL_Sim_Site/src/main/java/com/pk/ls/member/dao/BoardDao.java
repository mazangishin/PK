package com.pk.ls.member.dao;

import java.util.List;
import java.util.Map;

import com.pk.ls.member.vo.BoardVo;

public interface BoardDao {

	
	public List<BoardVo> boardSelectList(String key, String scText, int start,int end);
	
	public int BoardTotalCount(String key,String scText);//게시물 토탈 카운트 뽑기 

	public BoardVo boardInfoList(int no);//게시판 상세
	
	public int boardUpdate(String content, int board_Number,String boardTitle2);//게시글 수정
	
	public int boardWrite(String boardTitle2,String boardText2, int writeNumber);//게시글 쓰기
}
