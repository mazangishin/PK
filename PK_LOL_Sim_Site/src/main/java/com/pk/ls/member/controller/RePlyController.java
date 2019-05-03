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
import org.springframework.web.bind.annotation.RequestParam;
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
	public String rePlyWrite(HttpSession session,int mnum,int bnum,String comm,String is_re_comm,@RequestParam(defaultValue ="0")int is_reply_comm_num,Model model){
		
		  log.debug("리플달꼬얌"); 
		  log.debug("회원넘버: {}", mnum);
		  log.debug("게시물넘버: {}", bnum);
		  log.debug("코멘트: {}", comm);
		  log.debug("답글단 애 이름: {}", is_re_comm);
		  log.debug("답글단 리플넘버",is_reply_comm_num); 
		  										    //게시글번호//회원번호//내용//대댓글   //댓글의 번호
		  int num = replyServiceImplement.rePlyWrite(bnum, mnum, comm,is_re_comm,is_reply_comm_num);//글썼엉
		  MemberVo membervo=new MemberVo();
		  List<RePlyVo>rePlyList = replyServiceImplement.rePlyList(bnum);//댓글 리스트
		  List<RePlyVo>re_rePlyList = replyServiceImplement.rePlyList2(bnum);//대댓글 리스트
		  
		  
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
		 
		  
		  BoardVo binfo= boardServiceImpl.boardInfoList(bnum);
		  session.setAttribute("bnum", bnum);//세션값
		  model.addAttribute("rePlyList",rePlyList);//댓글 리스트
		  model.addAttribute("re_rePlyList",re_rePlyList);//대댓글 리스트
		  model.addAttribute("binfo",binfo);
		  int testnum=(int)session.getAttribute("bnum");
		  log.debug("리플레이리스트",rePlyList );
		  log.debug("코멘트: {}", num);
		  log.debug("세션값: {}",testnum );
		return "redirect:/board/info.hm";
		// response.sendRedirect
		
	}
	
	
	
}
