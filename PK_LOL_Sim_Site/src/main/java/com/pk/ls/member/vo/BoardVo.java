package com.pk.ls.member.vo;
import java.util.Date;
public class BoardVo {
	
	private int board_Number;
	private String title ="";
	private String content ="";
	private Date create_Date;
	private Date modified_Date;
	private int member_Number;
	private String member_id;
	
	private int commet_Num;
	
	

	public BoardVo() {
		super();
	}
	
	public BoardVo(int board_Number,String title,String content,Date create_Date,
			Date modified_Date, int member_Number, String member_id) {
		super();
		
		this.board_Number=board_Number;
		this.content=content;
		this.title=title;
		this.create_Date=create_Date;
		this.modified_Date=modified_Date;
		this.member_Number=member_Number;
		this.member_id=member_id;
	}
	
	
	public int getBoard_Number() {
		return board_Number;
	}
	public void setBoard_Number(int board_Number) {
		this.board_Number = board_Number;
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
	public Date getCreate_Date() {
		return create_Date;
	}
	public void setCreate_Date(Date create_Date) {
		this.create_Date = create_Date;
	}
	public Date getModified_Date() {
		return modified_Date;
	}
	public void setModified_Date(Date modified_Date) {
		this.modified_Date = modified_Date;
	}
	public int getMember_Number() {
		return member_Number;
	}
	public void setMember_Number(int member_Number) {
		this.member_Number = member_Number;
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public int getCommet_Num() {
		return commet_Num;
	}

	public void setCommet_Num(int commet_Num) {
		this.commet_Num = commet_Num;
	}
	
	@Override
	public String toString() {
		return "BoardVo [board_Number=" + board_Number + ", title=" + title + ", content=" + content + ", create_Date="
				+ create_Date + ", modified_Date=" + modified_Date + ", member_Number=" + member_Number + "]";
	}
	
	
}
