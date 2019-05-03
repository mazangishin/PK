package com.pk.ls.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pk.ls.member.dao.MemberDaoImplement;
import com.pk.ls.member.service.BoardService;
import com.pk.ls.member.service.MemberServiceImplement;
import com.pk.ls.member.service.ReplyServiceImplement;
import com.pk.ls.member.util.Board_Page;
import com.pk.ls.member.util.Board_ReCount;
import com.pk.ls.member.vo.BoardVo;
import com.pk.ls.member.vo.MemberVo;
import com.pk.ls.member.vo.RePlyVo;
 
@Controller
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	
	
	@Autowired
	private ReplyServiceImplement replyServiceImplement;
	
	@Autowired
	private MemberServiceImplement memberServiceImplement;
	//게시글 목록 조회
	
	@RequestMapping(value="/board/list.hm")
	public String boardList(HttpSession session,
			@RequestParam(defaultValue ="1")int nowPage,
			@RequestParam(defaultValue ="title")String key,
			@RequestParam(defaultValue ="")String scText){
		
		log.debug("게시글 컨트롤러 입장");
		log.debug("현재페이지 값 : {}"
				, nowPage);
		log.debug("검색컬럼 : {}", key);
		log.debug("검색어 : {}", scText);
		
		
		 String scTextObj=scText;
		 int num=boardService.memberSelectTotalCount(key,scTextObj); 
		 log.debug(": {}", num);
		 Board_Page page=new Board_Page(num,nowPage);//총 페이지와 현재페이지
		 Board_ReCount board_ReCount = new Board_ReCount();//총 페이지와 현재페이지
		 
		 //받아올 게시물 
		 List<BoardVo> boardList = boardService.boardSelectList(key,scText,(page.getFirstObj()),page.getLastObj());
		
		 //받아올 게시물에 달린 리플 숫자
		for (int i = 0; i < boardList.size(); i++) {
			int t= replyServiceImplement.rePlyCount(boardList.get(i).getBoard_Number());
			boardList.get(i).setCommet_Num(t);
		}
		 
		 session.setAttribute("page", page);
		 session.setAttribute("boardList", boardList);
		 session.setAttribute("toCount", num);
		 session.setAttribute("scTextObj", scTextObj);
		log.debug(session.toString()+"끼얏효효효효효효효효효효훃ㄹ");
		 
		return "redirect:/mainPage.hm#4thpage";
		//return "forward:/mainPage.hm";
	}
	
	@RequestMapping(value="/board/info.hm")
	public String boardInfo(HttpSession session,@RequestParam(defaultValue ="0")String boardNum, Model model){
		
		
		  
		  log.debug("게시판 상세보기 입장"); 
		  log.debug(": {}", boardNum);
		
		  int bno=Integer.parseInt(boardNum);
		  int testnum2=0;
		  if(session.getAttribute("bnum")!=null)
		  {
			  testnum2 =(int)session.getAttribute("bnum");
		  }
		  
		  log.debug(": {}", bno);
		  log.debug(": {}", testnum2);
		  if(bno!=0)//기본값이 아닐때
			{
				session.setAttribute("bnum", bno);
			}
		  
		  if(bno==0)//기본값 일때
		  {
			  bno=testnum2;
		  }
		  
		 
		  
		  
		  List<RePlyVo>rePlyList =replyServiceImplement.rePlyList(bno);//댓글리스트
		  List<RePlyVo>re_rePlyList=replyServiceImplement.rePlyList2(bno);
		  
		  MemberVo membervo=new MemberVo();
		  
		  if(rePlyList!=null)
		  {
			  for (int i = 0; i < rePlyList.size(); i++) {
				  
				  membervo=memberServiceImplement.memberInfo2(rePlyList.get(i).getMember_number());
				  String name = membervo.getMemberId();
				  rePlyList.get(i).setMember_name(name);//이름 담음
			  } 
		  }
		  
		  if(re_rePlyList!=null)
		  {
			  for (int i = 0; i < re_rePlyList.size(); i++) {
				  
				  membervo=memberServiceImplement.memberInfo2(re_rePlyList.get(i).getMember_number());
				  String name = membervo.getMemberId();
				  re_rePlyList.get(i).setMember_name(name);//이름 담음
			  }
		  }
		 
		  
		  BoardVo binfo= boardService.boardInfoList(bno);//상세인포 가져오오오오오옴
		  
		  model.addAttribute("rePlyList", rePlyList);
		  model.addAttribute("re_rePlyList",re_rePlyList);//대댓글 리스트
		  model.addAttribute("binfo", binfo);//세션에 담음
		  
		 
		return "/board/boardinfo";
		//return "forward:/mainPage.hm";
		//return "forward:/mainPage.hm";
	}
	
	
	
	@RequestMapping(value="/board/update.hm")//게시물 수정페이지로 가기
	public String boardUpdate(HttpSession session,String boardNum,Model model){
		
		
		  log.debug("게시판 상세보기 입장"); 
		  log.debug(": {}", boardNum);
		 
		  int no=Integer.parseInt(boardNum);
		  log.debug(": {}", no);
		
		  BoardVo binfo= boardService.boardInfoList(no);//상세인포 가져오오오오오옴
		  session.setAttribute("binfo", binfo);//세션에 담음
		  log.debug(session.toString()+"게시물 상세정보");
		  
		  List<RePlyVo>rePlyList =replyServiceImplement.rePlyList(no);
		  
		  
		  
		  model.addAttribute("rePlyList", rePlyList);
		 
		return "/board/boardupdate";
		//return "forward:/mainPage.hm";
	}
	
	@RequestMapping(value="/board/updateok.hm")//게시물 수정페이지로 가기
	public String boardUpdateOk(HttpSession session,String boardNum,String boardText,String boardTitle2){
		
		
		  log.debug("게시판 수정시작"); 
		  log.debug(": {}", boardNum);
		  log.debug(": {}", boardText);
		  int no=Integer.parseInt(boardNum);
		  log.debug(": {}", no);
		int num= boardService.boardUpdate(boardText, no,boardTitle2);
		  log.debug("게시판내용 수정완료"); 
		  
		  if(num>0)
		  {
			  BoardVo binfo= boardService.boardInfoList(no);
			  session.setAttribute("binfo", binfo);
		  }
		  log.debug(session.toString()+"게시물 상세정보");
		
		 	return "/board/boardinfo";
		//return "forward:/mainPage.hm";
		 	
	}
	
	
}
