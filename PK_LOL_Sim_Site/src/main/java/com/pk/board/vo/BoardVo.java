package com.pk.board.vo;

import java.util.Date;

public class BoardVo {

	private int boardNumber;
	private String title;
	private String content;
	private Date createDate;
	private Date modifiedDate;
	private int memberNumber;
		
	public BoardVo() {
		super();
	}
	public BoardVo(int boardNumber, String title, String content, Date createDate, Date modifiedDate,
			int memberNumber) {
		super();
		this.boardNumber = boardNumber;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
		this.memberNumber = memberNumber;
	}
	
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	
	@Override
	public String toString() {
		return "BoardVo [boardNumber=" + boardNumber + ", title=" + title
				+ ", content=" + content + ", createDate=" + createDate 
				+ ", modifiedDate=" + modifiedDate + ", memberNumber=" 
				+ memberNumber + "]";
	}
	
}
