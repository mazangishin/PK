package com.pk.member.vo;

import java.util.Date;

public class MemberVo {

	private int memberNumber;
	private String authority;
	private String memberId;
	private String eMail;
	private String password;
	private Date createDate;
	private Date modifiedDate;
	
	public MemberVo() {
		super();
	}
	public MemberVo(int memberNumber, String authority, String memberId, String eMail, String password, Date createDate,
			Date modifiedDate) {
		super();
		this.memberNumber = memberNumber;
		this.authority = authority;
		this.memberId = memberId;
		this.eMail = eMail;
		this.password = password;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
	}

	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	
	@Override
	public String toString() {
		return "MemberVo [memberNumber=" + memberNumber + ", authority=" 
				+ authority + ", memberId=" + memberId + ", eMail=" 
				+ eMail + ", password=" + password + ", createDate=" 
				+ createDate + ", modifiedDate=" + modifiedDate + "]";
	}
	
	
}
