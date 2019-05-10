package com.pk.ls.champ.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pk.ls.champ.vo.ChampVo;

public interface ChampService {
	// 챔피언 포지션 별로 보는 거
	public  Map<String, Object> champList(String position, int start, int end);
	// 챔피언 리스트 페이징할 때 총 챔피언의 수를 구한다
		public int champPositionTotalCount(String position);
	// 챔피언 하나 상세 보기
	public Map<String, Object> champSelectOne(int champNumber);
	// 챔피언 등록
	public void champCreate(ChampVo champVo, MultipartHttpServletRequest 
			multipartHttpServletRequest) throws Exception;
	// 챔피언 정보 업데이트
	public int champUpdateOne(ChampVo champVo, MultipartHttpServletRequest
			multipartHttpServletRequest) throws Exception; 
	// 챔피언 삭제
	public int champDelete(int championNumber) throws Exception;
	// 챔피언 이미지 불러오기
	public List<Map<String, Object>> imageSelect(int championNumber);
}
