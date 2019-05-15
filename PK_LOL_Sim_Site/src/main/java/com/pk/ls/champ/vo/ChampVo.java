package com.pk.ls.champ.vo;

public class ChampVo {

	private int championNumber;
	private String championName;
	private String championNick;
	private String position;
	private int hp;
	private int mp;
	private int ad;
	private int ap;
	private String STORED_FILE_NAME;
	
	private String stored_file_name;
	
	

	public ChampVo() {

	}

	public ChampVo(int championNumber, String championName, String championNick, String position,
			int hp, int mp, int ad, int ap, String STORED_FILE_NAME) {
		super();
		this.championNumber = championNumber;
		this.championName = championName;
		this.championNick = championNick;
		this.position = position;
		this.hp = hp;
		this.mp = mp;
		this.ad = ad;
		this.ap = ap;
	}

	public int getChampionNumber() {
		return championNumber;
	}

	public void setChampionNumber(int championNumber) {
		this.championNumber = championNumber;
	}

	public String getChampionName() {
		return championName;
	}

	public void setChampionName(String championName) {
		this.championName = championName;
	}

	public String getChampionNick() {
		return championNick;
	}

	public void setChampionNick(String championNick) {
		this.championNick = championNick;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
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
	
	public String getStored_file_name() {
		return stored_file_name;
	}

	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}

	public String getSTORED_FILE_NAME() {
		return STORED_FILE_NAME;
	}

	public void setSTORED_FILE_NAME(String STORED_FILE_NAME) {
		this.STORED_FILE_NAME = STORED_FILE_NAME;
	}

	@Override
	public String toString() {
		return "ChampVo [championNumber=" + championNumber + ", championName="
				+ championName + ", championNick=" + championNick 
				+ ", position=" + position + ", hp=" + hp + ", mp=" + mp 
				+ ", ad=" + ad + ", ap=" + ap + ", STORED_FILE_NAME="
				+ STORED_FILE_NAME + "]";
	}


	
}
