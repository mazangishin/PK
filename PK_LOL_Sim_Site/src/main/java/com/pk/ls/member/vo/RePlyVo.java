package com.pk.ls.member.vo;

import java.util.Date;

public class RePlyVo {
	

	private int  reply_num;
	private int  reply_board_number;
	private String  re_comment;
	private String  is_reply_comm;
	private Date  create_date;
	private int  member_number;
	private String  member_name;
	
	
	
	

	public RePlyVo() {
		// TODO Auto-generated method stub
		super();
	}
	
	public RePlyVo(int reply_num,int reply_board_number,String re_comment,Date create_date,int member_number) {
		// TODO Auto-generated method stub
		super();
		this.reply_num = reply_num;
		this.reply_board_number = reply_board_number;
		this.re_comment = re_comment;
		this.create_date = create_date;
		this.member_number = member_number;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public int getReply_board_number() {
		return reply_board_number;
	}

	public void setReply_board_number(int reply_board_number) {
		this.reply_board_number = reply_board_number;
	}

	public String getRe_comment() {
		return re_comment;
	}

	public void setRe_comment(String re_comment) {
		this.re_comment = re_comment;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public int getMember_number() {
		return member_number;
	}

	public void setMember_number(int member_number) {
		this.member_number = member_number;
	}

	@Override
	public String toString() {
		return "RePlyVo [reply_num=" + reply_num + ", reply_board_number=" + reply_board_number + ", re_comment="
				+ re_comment + ", create_date=" + create_date + ", member_number=" + member_number + "]";
	}

	public String getIs_reply_comm() {
		return is_reply_comm;
	}

	public void setIs_reply_comm(String is_reply_comm) {
		this.is_reply_comm = is_reply_comm;
	}
	
	
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	
	


	
	
	
	
	
	
	
}
