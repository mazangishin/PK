package com.pk.ls.champLevel.dao;

import java.util.List;
import java.util.Map;

import com.pk.ls.champLevel.vo.ChampLevelVo;

public interface ChampLevelDao {

	public ChampLevelVo champLevelSelectOne(Map<String, Object> map);
	public List<Map<String, Object>> champLevelSelectList(int championNumber);
	public int champLevelCreate(ChampLevelVo champLevelVo);
	public int champLevelUpdate(ChampLevelVo champLevelVo);
	
}
