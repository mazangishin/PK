package com.pk.ls.champLevel.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pk.ls.champLevel.dao.ChampLevelDao;
import com.pk.ls.champLevel.vo.ChampLevelVo;
import com.pk.ls.util.FileUtils;

@Service
public class ChampLevelServiceImplment implements ChampLevelService{

	@Autowired
	ChampLevelDao champLevelDao;
	
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public ChampLevelVo champLevelSelectOne(Map<String, Object> map) {

		return champLevelDao.champLevelSelectOne(map);
	}

	@Transactional
	@Override
	public List<Map<String, Object>> champLevelSelectList(int championNumber) {

		return champLevelDao.champLevelSelectList(championNumber);
	}

	@Transactional
	@Override
	public void champLevelCreate(ChampLevelVo champLevelVo) {
		
		
		champLevelDao.champLevelCreate(champLevelVo);
		
		for (int i = 2; i <= 18; i++) {
			champLevelVo.setChampionLevel(i);
			champLevelVo.setHp(champLevelVo.getHp() + champLevelVo.getHpGrowth());
			champLevelVo.setMp(champLevelVo.getMp() + champLevelVo.getMpGrowth());
			champLevelVo.setAd(champLevelVo.getAd() + champLevelVo.getAdGrowth());
			champLevelVo.setAp(champLevelVo.getAp() + champLevelVo.getApGrowth());
		
			champLevelDao.champLevelCreate(champLevelVo);
		}
	}

	@Override
	public int champLevelUpdate(ChampLevelVo champLevelVo) {

		return champLevelDao.champLevelUpdate(champLevelVo);
	}

}
