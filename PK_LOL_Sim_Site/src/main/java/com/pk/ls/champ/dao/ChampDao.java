package com.pk.ls.champ.dao;

import java.util.List;
import java.util.Map;

import com.pk.ls.champ.vo.ChampVo;

public interface ChampDao {
	// 챔피언 포지션 별로 보는 거
	public List<ChampVo> champList(String position, int start, int end);
	// 챔피언 리스트 페이징할 때 총 챔피언의 수를 구한다
	public int champPositionTotalCount(String position);
	// 챔피언 하나 상세 보기
	public ChampVo champSelectOne(int champNumber);
	// 챔피언 리스트에 던져 줄 이미지 파일 리스트 가지고 오기
	public List<Map<String, Object>> fileSelectList(int championNumber);
	// 챔피언 등록
	public int champCreate(ChampVo champVo);
	// 챔피언 등록 시에 이미지 파일 등록
	public void insertFile(Map<String, Object> map);
	// 챔피언 정보 업데이트
	public int champUpdateOne(ChampVo champVo);
	// 챔피언 삭제
	public int champDelete(int no);
	// 챔피언 삭제 때 이미지 파일 같이 삭제
	public int fileDelete(int championNumber);
	// 이미지 파일 저장 이름 불러오기
	public Map<String, Object> fileSelectStoredFileName(int championNumber);
}
