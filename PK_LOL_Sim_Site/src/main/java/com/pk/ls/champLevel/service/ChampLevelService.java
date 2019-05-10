package com.pk.ls.champLevel.service;

import java.util.List;
import java.util.Map;

import com.pk.ls.champLevel.vo.ChampLevelVo;

public interface ChampLevelService {

	public ChampLevelVo champLevelSelectOne(Map<String, Object> map);
	public List<Map<String, Object>> champLevelSelectList(int championNumber);
	public void champLevelCreate(ChampLevelVo champLevelVo);
	public int champLevelUpdate(ChampLevelVo champLevelVo);
	public int champLevelDelete(int championNumber);
	
}
