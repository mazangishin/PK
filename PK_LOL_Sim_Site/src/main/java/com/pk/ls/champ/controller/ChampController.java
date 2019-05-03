package com.pk.ls.champ.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.pk.ls.champ.service.ChampService;
import com.pk.ls.champ.vo.ChampVo;
import com.pk.ls.champLevel.service.ChampLevelService;
import com.pk.ls.champLevel.vo.ChampLevelVo;
import com.pk.ls.member.vo.MemberVo;
import com.pk.ls.util.Paging;

@Controller
public class ChampController {
	
	private static final Logger log = LoggerFactory.getLogger(ChampController.class);

	@Autowired
	private ChampService champService;
	
	@Autowired
	private ChampLevelService champLevelService;
	
	// 챔피언 리스트 화면 출력 메서드
	@RequestMapping(value = "/champ/champList.hm", method=RequestMethod.GET)
	public String champList(@RequestParam(defaultValue ="1") int curPage,
			@RequestParam(defaultValue ="top") String position, Model model,
			HttpSession session) {
		
		log.debug("챔피언 목록을 표시합니다. 현재 출력 중인 포지션은 : " + position + "입니다.");
		
		// 페이징 준비
        int totalCount = champService.champPositionTotalCount(position);
		Paging champPaging = new Paging(totalCount, curPage);
		int start = champPaging.getPageBegin();
		int end = champPaging.getPageEnd();

		// 포지션 별로 1~4번까지 row를 가져옴
		Map<String, Object> champListMap = 
				champService.champList(position, start, end);
		Map<String, Object> pagingMap = new HashMap<>();
		
		// 총 챔피언의 수와 시작 페이지, 끝 페이지를 저장
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("champPaging", champPaging);

		// 리스트에 보여 줄 파일과 챔피언의 정보를 추출해서 따로 담는다.
		List<Map<String, Object>> fileList = 
				(List<Map<String, Object>>)champListMap.get("fileList");
		
		List<Map<String, Object>> champList = 
				(List<Map<String, Object>>)champListMap.get("champList");
		
		//모델에 태워서 보냄
		model.addAttribute("champList", champList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("fileList", fileList);
		
		
		return "/champ/champList";
	}
	
	// 챔피언 개별 정보 출력 메서드
	@RequestMapping(value="/champ/champDetailView.hm", method=RequestMethod.GET)
	public String champSelectOne(int championNumber, 
			HttpServletRequest httpServletRequest, Model model) {
		log.debug("챔피언 개별 정보를 출력합니다.");

		// 해당 챔피언의 정보를 가져온다. 이미지 포함
		Map<String, Object> champSelectMap = new HashMap<String, Object>();
		champSelectMap = champService.champSelectOne(championNumber);
		
		// 맵에서 챔피언의 정보를 꺼낸다
		ChampVo champVo = (ChampVo)champSelectMap.get("champVo");
		// 맵에서 이미지 파일 정보를 꺼낸다.
		Map<String, Object> fileName = (Map<String, Object>) champSelectMap.get("fileName");
		
		// 레벨별 능력치를 가져온다.
		List<Map<String, Object>> champLevelVoList =  
				(List<Map<String, Object>>)
				champLevelService.champLevelSelectList(championNumber);
		
		// 보낸다
		httpServletRequest.setAttribute("champVo", champVo);
		httpServletRequest.setAttribute("fileName", fileName);
		httpServletRequest.setAttribute("champLevelVoList", champLevelVoList);
		
		return "/champ/champDetailView";
	}
	
	// 챔피언 개별 정보 페이지에서 select - option 박스에서 옵션을 선택하면 해달 레벨에 현재 챔피언이 가지는
	// 능력치를 보여주게 된다.
	@RequestMapping(value="/champ/levelSelect.hm", method=RequestMethod.GET)
	public String levelSelect(int level, Model model,
			HttpServletRequest httpServletRequest) {
		log.debug("사용자가 챔피언 레벨을 선택했습니다. 레벨:, {}", level);
		
		Map<String, Object> champMap = new HashMap<String, Object>();
		
		// 챔피언 정보 꺼내고
		ChampVo champVo = (ChampVo)httpServletRequest.getAttribute("champVo");
		// 챔피언 레벨별 정보 꺼내고
		ChampLevelVo champLevelVo = 
				(ChampLevelVo)httpServletRequest.getAttribute("champLevelVo");

		// 확인
		log.debug("현재 로드된 챔피언 정보 :, {}, {}", champVo, champLevelVo);
		
		// 챔피언 고유 번호와 레벨을 입력하면 
		int championNumber = champVo.getChampionNumber();
		int championLevel = champLevelVo.getChampionLevel();
		
		champMap.put("championNumber", championNumber);
		champMap.put("championLevel", championLevel);
		
		// 그 데이터값을 토대로 sql에서 해달 레벨을 추출해낸다.
		champLevelService.champLevelSelectOne(champMap);
		
		return "/champ/champDetailView";	
	}

	// 챔피언 생성 페이지 이동 메서드
	@RequestMapping(value="/champ/champCreate.hm", method=RequestMethod.GET)
	public String champCreate(HttpSession httpSession, ChampVo champVo, 
			Model model) {
		log.debug("챔피언 생성 페이지로 이동합니다.");
		
		MemberVo memberVo = (MemberVo) httpSession.getAttribute("memberVo");
		String distinguish = "";
		
		log.debug("로그인 된 ID의 권한 정보 : " + memberVo.getAuthority());
		
		if (memberVo.getAuthority().equals("Y")) {
			distinguish = "/champ/champCreate";
		}else{
			distinguish = "/mainPage";
		}
		
		return distinguish;
	}
	
	// 챔피언 생성 시 기본 정보를 세션에 저장
	@RequestMapping(value="/champ/champVoSave.hm", method=RequestMethod.POST)
	public String champVoSave(ChampVo champVo, HttpSession httpSession
			, HttpServletRequest request
			, MultipartHttpServletRequest
			multipartHttpServletRequest, Model model) {
		
		log.debug("챔피언 기본 정보를 입력 받습니다. : {}",  champVo);
		
		request.setAttribute("champVo", champVo);
		httpSession.setAttribute("_fileRequest_", multipartHttpServletRequest);
		
		MemberVo memberVo = (MemberVo) httpSession.getAttribute("memberVo");
		String distinguish = "";
		
		if (memberVo.getAuthority().equals("Y")) {
			distinguish = "/champ/champLevelInput";
		}else{
			distinguish = "/mainPage";
		}
		
		return distinguish;				
	}
		
	// 챔피언 레벨 별 정보까지 생성 후, DB에 반영하는 메서드
	@RequestMapping(value = "/champ/champCreateCtr.hm", method=RequestMethod.POST)
	public String champCreateCtr(ChampVo champVo, ChampLevelVo champLevelVo,
			HttpServletRequest httpServletRequest, HttpSession httpSession,
			MultipartHttpServletRequest multipartHttpServletRequest,
			Model model) {
		
		log.debug("챔피언 레벨별 정보 페이지입니다. 현재 저장된 챔피언의 정보 : {}, {}",
				champVo, champLevelVo);	
		log.debug("챔피언 이미지 파일의 정보: {}", multipartHttpServletRequest);
		
		MemberVo memberVo = (MemberVo) httpSession.getAttribute("memberVo");
		String distinguish = "";
		
		if (memberVo.getAuthority().equals("Y")) {
			distinguish = "/champ/successPage";
		}else{
			distinguish = "/mainPage";
		}
		
		try {
			
			// 챔피언 기본 정보와 이미지 파일 테이블에 값을 입력
			champService.champCreate(champVo, multipartHttpServletRequest);
			System.out.printf("챔피언 기본 정보를 생성했습니다. {}", champVo);
			
			// 챔피언 레벨별 정보를 입력
			champLevelVo.setChampionNumber(champVo.getChampionNumber());
			champLevelService.champLevelCreate(champLevelVo);
			System.out.printf("챔피언 레벨별 정보를 생성했습니다. {}", champLevelVo);
			
			multipartHttpServletRequest.removeAttribute("_fileRequest_");
			httpServletRequest.removeAttribute("champVo");
			
		} catch (Exception e) {
			System.out.println("오류발생");
			e.printStackTrace();
		}
		
		return distinguish;
	}
	
	// 챔피언 정보 수정 페이지 이동 메서드
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/champ/champUpdateCtr.hm")
	public String champUpdate(HttpSession httpSession, int championNumber, 
			Model model) {
		log.debug("Welcome memberUpdate enter! - {}", championNumber);

		MemberVo memberVo = (MemberVo) httpSession.getAttribute("memberVo");
		String distinguish = "";
		
		if (memberVo.getAuthority().equals("Y")) {
			distinguish = "/champ/champUpdateForm";
		}else{
			distinguish = "/mainPage";
		}
		
		Map<String, Object> map = champService.champSelectOne(championNumber);

		ChampVo champVo = (ChampVo) map.get("champVo");
		List<Map<String, Object>> fileList = 
				(List<Map<String, Object>>)map.get("fileList");

		model.addAttribute("champVo", champVo);
		model.addAttribute("fileList", fileList);

		return distinguish;
	}

	
	// 챔피언 정보 수정 메서드
	@RequestMapping(value = "/champ/champUpdateCtr.do", method = RequestMethod.POST)
	public String champUpdateCtr(HttpSession httpSession, ChampVo champVo, 
			MultipartHttpServletRequest multipartHttpServletRequest, 
			@RequestParam(value="file_Index", defaultValue="-1") int file_Index, 
			Model model) {
		
		log.debug("챔피언 정보를 업데이트 합니다. 현재 챔피언의 정보 : {} 챔피언 이미지의 고유 번호 : {}",
				champVo, file_Index);

		MemberVo memberVo = (MemberVo) httpSession.getAttribute("memberVo");
		String distinguish = "";
		
		if (memberVo.getAuthority().equals("Y")) {
			distinguish = "/common/successPage";
		}else{
			distinguish = "/mainPage";
		}
		
		int resultNum = 0;
		try {
			resultNum = champService.champUpdateOne
					(champVo, multipartHttpServletRequest, file_Index);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 데이터베이스에서 회원정보가 수정이 됐는가
		if (resultNum > 0) {
			
		}

		return distinguish;
	}

	// 챔피언 정보 삭제 메서드
	@RequestMapping(value = "/champ/champDeleteCtr.do", method = RequestMethod.GET)
	public String champDelete(@RequestParam(value = "champNumber") int champNumber,
			HttpSession httpSession, Model model) {
		log.debug("챔피언을 삭제합니다. 삭제할 챔피언의 고유번호: " + champNumber);

		MemberVo memberVo = (MemberVo) httpSession.getAttribute("memberVo");
		String distinguish = "";
		
		if (memberVo.getAuthority().equals("Y")) {
			distinguish = "redirect:/champ/champList.hm";
		}else{
			distinguish = "/mainPage";
		}
		
		try {
			champService.champDelete(champNumber);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return distinguish;
	}
	
}
