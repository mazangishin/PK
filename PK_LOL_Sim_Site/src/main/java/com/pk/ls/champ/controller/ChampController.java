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
import com.pk.ls.util.FileUtils;
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
		List<Map<String, Object>> champList = 
			(List<Map<String, Object>>)champListMap.get("champList");
		
		
		
		//모델에 태워서 보냄
		model.addAttribute("champList", champList);
		model.addAttribute("pagingMap", pagingMap);

		
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
		model.addAttribute("champVo", champVo);
		
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
		// 사용자 정보 추출
		MemberVo memberVo = (MemberVo) httpSession.getAttribute("memberVo");
		String distinguish = "";
		
		log.debug("로그인 된 ID의 권한 정보 : " + memberVo.getAuthority());
		// 사용자가 관리자인가 아닌가 판단
		if (memberVo.getAuthority().equals("Y")) {
			// 관리자라면 생성 페이지로
			distinguish = "/champ/champCreate";
		}else{
			// 아니라면 메인페이지로
			distinguish = "/mainPage";
		}
		return distinguish;
	}
	
	// 챔피언 생성 시 기본 정보를 세션에 저장
	@RequestMapping(value="/champ/champVoSave.hm", method=RequestMethod.POST)
	public String champVoSave(ChampVo champVo, HttpSession httpSession, 
			HttpServletRequest request, Model model,
			MultipartHttpServletRequest multipartHttpServletRequest) {
		
		log.debug("챔피언 기본 정보를 입력 받습니다. : {}",  champVo);
		
		// 챔피언 기본 정보와 이미지 파일의 정보를 저장한다.
		request.setAttribute("champVo", champVo);
		httpSession.setAttribute("_fileRequest_", multipartHttpServletRequest);
		// 사용자의 정보를 추출
		MemberVo memberVo = (MemberVo) httpSession.getAttribute("memberVo");
		String distinguish = "";
		// 사용자가 관리자인가 아닌가
		if (memberVo.getAuthority().equals("Y")) {
			// 사용자가 관리자라면 챔피언 레벨별 정보 생성 페이지로
			distinguish = "/champ/champLevelInput";
		}else{
			// 아니라면 메인페이지로
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
		
		// 사용자의 정보를 추출
		MemberVo memberVo = (MemberVo) httpSession.getAttribute("memberVo");
		String distinguish = "";
		
		// 사용자가 관리자인가 아닌가
		if (memberVo.getAuthority().equals("Y")) {
			// 사용자가 관리자라면 
			
			try {
				// 챔피언 기본 정보와 이미지 파일 테이블에 값을 입력
				champService.champCreate(champVo, multipartHttpServletRequest);
				System.out.printf("챔피언 기본 정보를 생성했습니다. {}", champVo);
				// 챔피언 레벨별 정보를 입력
				champLevelVo.setChampionNumber(champVo.getChampionNumber());
				champLevelService.champLevelCreate(champLevelVo);
				System.out.printf("챔피언 레벨별 정보를 생성했습니다. {}", champLevelVo);
				// 담고 있던 정보를 삭제한다
				multipartHttpServletRequest.removeAttribute("_fileRequest_");
				httpServletRequest.removeAttribute("champVo");
			} catch (Exception e) {
				System.out.println("오류발생");
				e.printStackTrace();
			}
			// 성공 메시지를 출력하는 페이지로
			distinguish = "/champ/successPage";
		}else{
			// 아니라면 메인페이지로
			distinguish = "/mainPage";
		}
		
		return distinguish;
	}
	
	// 챔피언 정보 수정 페이지 이동 메서드
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/champ/champUpdate.hm")
	public String champUpdate(HttpSession httpSession, Model model,
			HttpServletRequest httpServletRequest, int championNumber) {

		log.debug("챔피언 정보 수정 페이지입니다. {}", championNumber);
		
		MemberVo memberVo = (MemberVo)httpSession.getAttribute("memberVo");
		String distinguish = "";
		// 사용자가 관리자인가 아닌가
		if (memberVo.getAuthority().equals("Y")) {
			Map<String, Object> champMap = (Map<String, Object>) 
					champService.champSelectOne(championNumber);
			// 챔피언의 정보를 가져온다 - 기본 정보, 이미지파일, 레벨별 정보
			ChampVo champVo = (ChampVo) champMap.get("champVo");
			Map<String, Object> fileName = 
					(Map<String, Object>) champMap.get("fileName");
			List<Map<String, Object>> champLevelVoList = 
					champLevelService.champLevelSelectList(championNumber);
			
			model.addAttribute("champVo", champVo);
			model.addAttribute("fileName", fileName);
			model.addAttribute("champLevelVoList", champLevelVoList);
			
			distinguish = "/champ/champUpdateForm";
		}else{
			// 아니라면 메인페이지로
			distinguish = "/mainPage";
		}
		return distinguish;
	}

	// 챔피언 정보 수정 메서드
	@RequestMapping(value = "/champ/champUpdateCtr.hm", method = RequestMethod.POST)
	public String champUpdateCtr(HttpSession httpSession, ChampVo champVo, 
			MultipartHttpServletRequest multipartHttpServletRequest, 
			Model model) {
		
		log.debug("챔피언 정보를 업데이트 합니다. 현재 챔피언의 정보 : {} 챔피언 이미지의 고유 번호 : {}",
				champVo);
		
		// 사용자의 정보 추출 
		MemberVo memberVo = (MemberVo) httpSession.getAttribute("memberVo");
		String distinguish = "";
		
		// 사용자가 관리자인가 아닌가
		if (memberVo.getAuthority().equals("Y")) {
			// 사용자가 관리자라면
			// 추출 준비
			int resultNum = 0;
			int championNumber = 0;
			// 챔피언 고유 번호를 추출한다
			championNumber = champVo.getChampionNumber();
			
			try {
				// 챔피언의 기본 정보를 업데이트한다
				resultNum = champService.champUpdateOne
						(champVo, multipartHttpServletRequest);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 데이터베이스에서 챔피언 정보가 수정이 됐는가
			if (resultNum > 0) {
				// 수정이 됐다면
				// 챔피언 레벨별 스테이터스 DB테이블에 반영할 준비 (성장치는 건드리지 않고 수정된 기본 정보만
				// 반영하는 것)
				int championLevel = 1;
				Map<String, Object> selectMap = new HashMap<String, Object>();
				
				selectMap.put("championNumber", championNumber);
				selectMap.put("championLevel", championLevel);
				
				// 수정된 챔피언의 기본 정보를 불러온다
				Map<String, Object> champAndFileMap = 
						champService.champSelectOne(championNumber);
				ChampVo resultVo = (ChampVo) champAndFileMap.get("champVo"); 
				
				// 수정된 챔피언의 고유 번호를 바탕으로 해당 챔피언의 레벨별 정보를 불러온다 
				ChampLevelVo champLevelVo =
						champLevelService.champLevelSelectOne(selectMap);
				// 수정된 기본 정보로 바꿔주고
				champLevelVo.setAd(resultVo.getAd());
				champLevelVo.setAp(resultVo.getAp());
				champLevelVo.setHp(resultVo.getHp());
				champLevelVo.setMp(resultVo.getMp());
				// 업데이트
				champLevelService.champLevelUpdate(champLevelVo);
				
				// 성장치까지 수정할 것을 대비해서 모델에 기본 정보를 태운다
				model.addAttribute("champVo", resultVo);
				
				log.debug("챔피언의 정보가 성공적으로 수정되었습니다. 수정된 정보 :, {}", resultVo);
				
				// 선택화면으로 넘어간다
				distinguish = "/champ/distractor";
				
			}else if (resultNum == 0){
				log.debug("정보 수정 실패");
			}
		} else {
			// 사용자가 관리자가 아닐 때
			log.debug("사용자가 챔피언의 정보를 수정할 수 있는 권한이 없습니다.");
			// 메인 페이지로
			distinguish = "/mainPage";
		}
		return distinguish;
	}
	

	// 챔피언 레벨별 정보 수정 화면 메서드
	@RequestMapping(value="/champ/champLevelUpdate.hm", method = RequestMethod.GET)
	public String champLevelUpdate(ChampVo champVo, Model model) {
		log.debug("champLevelUpdate 접속  - 챔피언의 정보 : {}", champVo);
		
		// 수정할 챔피언의 이미지를 불러온다
		List<Map<String, Object>> champImage = 
				champService.imageSelect(champVo.getChampionNumber());
		String imgName = (String) champImage.get(0).get("STORED_FILE_NAME");
		// champVo에 넣자
		champVo.setSTORED_FILE_NAME(imgName);
		
		// 수정할 챔피언의 정보를 불러와 모델에 담아서 보낸다
		model.addAttribute("champVo", champVo);

		// 수정할 챔피언의 레벨별 정보를 불러와서 모델에 담아 보낸다
		List<Map<String, Object>> champLevelVoList = 
		champLevelService.champLevelSelectList(champVo.getChampionNumber());
		model.addAttribute(champLevelVoList);
		
		return "/champ/champLevelUpdateForm";
	}
	
	// 챔피언 레벨별 정보 수정 작동 메서드
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/champ/champLevelUpdateCtr.hm", method=RequestMethod.POST)
	public String champLevelUpdateCtr(Model model, HttpSession httpSession,
			HttpServletRequest httpServletRequest, ChampVo champVo,
			int apGrowth, int adGrowth, int hpGrowth, int mpGrowth) {
		log.debug("champLevelUpdateCtr 체크, 챔피언의 기본 정보 : {}, champVo");
		
		// 사용자의 정보를 추출
		MemberVo memberVo = (MemberVo) httpSession.getAttribute("memberVo");
		String distinguish = "";
		// 사용자가 관리자인가 아닌가
		if (memberVo.getAuthority().equals("Y")) {
			
			// 결과 확인용 int 변수
			int resultNum = 0;
			// 챔피언 고유 번호 
			int championNumber = 0;
			// 챔피언 레벨 
			int championLevel = 0;
			// 챔피언 레벨 설정
			championLevel = 1;
			
			// db에서 levelVo 를 뽑아 올 때 쓸 매개변수 선언
			Map<String, Object> selectMap = new HashMap<>();
			// 챔피언 고유 번호 추출
			championNumber = champVo.getChampionNumber();
			// 맵에 챔피언의 고유 번호와 레벨을 담는다
			selectMap.put("championNumber", championNumber);
			selectMap.put("championLevel", championLevel);
			
			// 챔피언의 레벨별 정보를 추출
			ChampLevelVo champLevelVo = champLevelService.champLevelSelectOne(selectMap);
			
			champLevelVo.setHpGrowth(hpGrowth);
			champLevelVo.setMpGrowth(mpGrowth);
			champLevelVo.setApGrowth(apGrowth);
			champLevelVo.setAdGrowth(adGrowth);
			
			log.debug("현재 champLevelVo의 데이터 : {}", champLevelVo);
			
			try {
				// 챔피언 레벨별 정보 수정
				resultNum = champLevelService.champLevelUpdate(champLevelVo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 데이터베이스에서 수정이 됐는가
			if (resultNum > 0) {
				// 수정된 정보를 불러온다
				List<Map<String, Object>> resultList = 
						champLevelService.champLevelSelectList(championNumber);
				// 로그로 출력 이후 성공메시지 페이지로 
				log.debug("챔피언의 정보가 성공적으로 수정되었습니다. 수정된 정보 :, {}", resultList);
				distinguish = "/champ/successPage";
				
			}else if (resultNum == 0){
				// 실패하면 로그만 남긴다.
				log.debug("정보 수정 실패");
			}
		} else {
			// 사용자가 관리자가 아니라면 메인 페이지로
			log.debug("사용자가 챔피언의 정보를 수정할 수 있는 권한이 없습니다.");
			distinguish = "/mainPage";
		}
		return distinguish;
	}
	
	// 챔피언 정보 삭제 메서드
	@RequestMapping(value = "/champ/champDeleteCtr.hm", method = RequestMethod.GET)
	public String champDelete(@RequestParam(value = "championNumber") int championNumber,
			HttpSession httpSession, Model model) {
		log.debug("챔피언을 삭제합니다. 삭제할 챔피언의 고유번호: " + championNumber);
		// 사용자의 정보를 추출
		MemberVo memberVo = (MemberVo) httpSession.getAttribute("memberVo");
		String distinguish = "";
		// 사용자가 관리자인가 아닌가
		if (memberVo.getAuthority().equals("Y")) {
			// 사용자가 관리자라면
			try {
				// 챔피언의 정보를 지운다
				champLevelService.champLevelDelete(championNumber);
				champService.champDelete(championNumber);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 챔피언 리스트로 돌아감
			log.debug("성공적으로 챔피언의 정보를 삭제했습니다.");
			distinguish = "redirect:/champ/champList.hm";
			
		}else{
			// 사용자가 관리자가 아니라면 메인 페이지로
			log.debug("사용자가 챔피언의 정보를 삭제할 권한이 없습니다.");
			distinguish = "/mainPage";
		}
		return distinguish;
	}
	
}
