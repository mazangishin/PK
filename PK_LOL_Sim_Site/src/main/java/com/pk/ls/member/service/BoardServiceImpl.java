package com.pk.ls.member.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pk.ls.member.service.BoardService;
import com.pk.ls.member.dao.BoardDao;
import com.pk.ls.member.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService{

	private static final Logger log = 
			LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	public BoardDao boardDao;
	
	
	
	@Override
	public List<BoardVo> boardSelectList(String key, String scText,int start,int end){
		return boardDao.boardSelectList(key,scText,start,end);
	}
	@Override
	public int memberSelectTotalCount(String key,String scText) {
		
		return boardDao.BoardTotalCount(key,scText);
	}
	
	
	@Override
	public BoardVo boardInfoList(int no) {
		return boardDao.boardInfoList(no);
	}//게시판 상세
	@Override
	public int boardUpdate(String content, int board_Number,String boardTitle2) {
		return boardDao.boardUpdate(content,board_Number,boardTitle2);
	}//게시글 수정
	
	@Override
	public int boardWrite(String boardTitle2,
			String boardText2, int writeNumber)//게시글 쓰기
	{
		return boardDao.boardWrite(boardTitle2, boardText2, writeNumber);
	}
	
}
