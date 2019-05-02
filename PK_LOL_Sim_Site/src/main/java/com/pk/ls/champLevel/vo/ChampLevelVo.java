package com.pk.ls.champLevel.vo;

public class ChampLevelVo {
	
	int rowNumber;
	int championNumber;
	int championLevel;
	int hp;
	int mp;
	int ad;
	int ap;
	int hpGrowth;
	int mpGrowth;
	int adGrowth;
	int apGrowth;
	
	public ChampLevelVo() {

	}
	
	public ChampLevelVo(int rowNumber, int championNumber, int championLevel,
			int hp, int mp, int ad, int ap,	int hpGrowth, int mpGrowth, 
			int adGrowth, int apGrowth) {
		super();
		this.rowNumber = rowNumber;
		this.championNumber = championNumber;
		this.championLevel = championLevel;
		this.hp = hp;
		this.mp = mp;
		this.ad = ad;
		this.ap = ap;
		this.hpGrowth = hpGrowth;
		this.mpGrowth = mpGrowth;
		this.adGrowth = adGrowth;
		this.apGrowth = apGrowth;
	}

	public int getRowNumber() {
		return rowNumber;
	}

	public void setRowNumber(int rowNumber) {
		this.rowNumber = rowNumber;
	}

	public int getChampionNumber() {
		return championNumber;
	}

	public void setChampionNumber(int championNumber) {
		this.championNumber = championNumber;
	}

	public int getChampionLevel() {
		return championLevel;
	}

	public void setChampionLevel(int championLevel) {
		this.championLevel = championLevel;
	}

	public int getHp() {
		return hp;
	}

	public void setHp(int hp) {
		this.hp = hp;
	}

	public int getMp() {
		return mp;
	}

	public void setMp(int mp) {
		this.mp = mp;
	}

	public int getAd() {
		return ad;
	}

	public void setAd(int ad) {
		this.ad = ad;
	}

	public int getAp() {
		return ap;
	}

	public void setAp(int ap) {
		this.ap = ap;
	}

	public int getHpGrowth() {
		return hpGrowth;
	}

	public void setHpGrowth(int hpGrowth) {
		this.hpGrowth = hpGrowth;
	}

	public int getMpGrowth() {
		return mpGrowth;
	}

	public void setMpGrowth(int mpGrowth) {
		this.mpGrowth = mpGrowth;
	}

	public int getAdGrowth() {
		return adGrowth;
	}

	public void setAdGrowth(int adGrowth) {
		this.adGrowth = adGrowth;
	}

	public int getApGrowth() {
		return apGrowth;
	}

	public void setApGrowth(int apGrowth) {
		this.apGrowth = apGrowth;
	}

	@Override
	public String toString() {
		return "champLevelVo [rowNumber=" + rowNumber + ", championNumber="
				+ championNumber + ", championLevel=" + championLevel + 
				", hp=" + hp + ", mp=" + mp + ", ad=" + ad + ", ap=" + ap 
				+ ", hpGrowth=" + hpGrowth + ", mpGrowth=" + mpGrowth 
				+ ", adGrowth=" + adGrowth + ", apGrowth=" + apGrowth + "]";
	}
}
