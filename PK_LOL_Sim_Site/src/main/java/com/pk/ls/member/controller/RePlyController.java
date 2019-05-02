package com.pk.ls.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pk.ls.member.service.BoardServiceImpl;
import com.pk.ls.member.service.MemberServiceImplement;
import com.pk.ls.member.service.ReplyServiceImplement;
import com.pk.ls.member.vo.BoardVo;
import com.pk.ls.member.vo.MemberVo;
import com.pk.ls.member.vo.RePlyVo;



@Controller
public class RePlyController {
	private static final Logger log = LoggerFactory.getLogger(RePlyController.class);
	
	@Autowired
	private ReplyServiceImplement replyServiceImplement;
	
	@Autowired
	private BoardServiceImpl boardServiceImpl;
	
	@Autowired
	private MemberServiceImplement memberServiceImplement;
	
	@RequestMapping(value="/board/reply.hm")//리플달기
	public String rePlyWrite(HttpSession session,int mnum,int bnum,String comm,String is_re_comm,Model model){
		
		
		  log.debug("리플달꼬얌"); 
		  log.debug("회원넘버: {}", mnum);
		  log.debug("게시물넘버: {}", bnum);
		  log.debug("코멘트: {}", comm);
		  log.debug("답글단 애 이름: {}", is_re_comm);
		  										//게시글번호//회원번호//내용//대댓글
		  int num = replyServiceImplement.rePlyWrite(bnum, mnum, comm,is_re_comm);//글썼엉
		  MemberVo membervo=new MemberVo();
		  List<RePlyVo>rePlyList = replyServiceImplement.rePlyList(bnum);
		  
		  for (int i = 0; i < rePlyList.size(); i++) {
			  
			  membervo=memberServiceImplement.memberInfo(rePlyList.get(i).getMember_number());
			  String name = membervo.getMemberId();
			  rePlyList.get(i).setMember_name(name);//이름 담음
		}
		 
		  
		  BoardVo binfo= boardServiceImpl.boardInfoList(bnum);
		  
		  model.addAttribute("rePlyList",rePlyList);
		  model.addAttribute("binfo",binfo);
		  
		  log.debug("리플레이리스트",rePlyList );
		  log.debug("코멘트: {}", num);
		  
		return "/board/boardinfo";
		
	}
	
	
	
}
