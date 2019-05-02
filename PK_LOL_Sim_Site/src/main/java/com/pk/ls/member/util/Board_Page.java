package com.pk.ls.member.util;

import java.io.Serializable;

public class Board_Page implements Serializable{

	private int pageeee;//한페이지에 들어가는 게시물 숫자
	private int totalPageeeee;//총게시물의 숫자
	
	private int nowPage;//현재페이지번호
	private int allPage;//마지막페이지번호
	
	private int firstObj;//페이지에 띄울 첫 게시물 번호
	private int lastObj;//페이지에 띄울 마지막 게시물 번호
	
	private int blockStartPage;//블록의 첫번째 페이지
	private int blockEndPage;//블록의 마지막 페이지
	
	public Board_Page(int totalPageeeee,int nowPage)
	{
		super();
		this.pageeee=10;//한페이지에 들어가는 게시물 숫자는 일단 5개임
		this.totalPageeeee=totalPageeeee;//총 게시물의 숫자
		this.nowPage=nowPage;//현재페이지
	
		
		
		this.allPage = 0;
	   

	    allPage = (totalPageeeee / pageeee);//총페이지 숫자는 총게시물/페이지에 출력될 게시물숫자

	        if (totalPageeeee%pageeee!=0)//나누기 했는데 0이 아니다
	        {
	            allPage += 1;//페이지 숫자 1상승
	        }
		
	       
		movePage();//초기화를 하면서 1페이지로 시작한다
		BlockPage();
	}
	
	public void BlockPage() {
		// TODO Auto-generated method stub
		blockStartPage=(((int)(nowPage/10))*10)+1;
		if(blockStartPage>=10)
		{
			blockStartPage-=2;
		}
		blockEndPage=blockStartPage+9;
		if(allPage<blockEndPage) {
			int num=allPage;
			blockEndPage=num;
		}
	}
	
	
	public void movePage()//페이지 한칸 이동
	{
		/*
		 * if(nowPage==0) {
		 * 
		 * this.firstObj = ((nowPage-1) *pageeee); this.lastObj = (firstObj +
		 * pageeee)+1; }else {
		 */
			 
			 this.firstObj = ((nowPage-1) *pageeee);
			 this.lastObj = (firstObj + pageeee)-1;	
			
		//}
		
	}


	public int getPageeee() {
		return pageeee;
	}


	public void setPageeee(int pageeee) {
		this.pageeee = pageeee;
	}


	public int getTotalPageeeee() {
		return totalPageeeee;
	}


	public void setTotalPageeeee(int totalPageeeee) {
		this.totalPageeeee = totalPageeeee;
	}


	public int getNowPage() {
		return nowPage;
	}


	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}


	public int getAllPage() {
		return allPage;
	}


	public void setAllPage(int allPage) {
		this.allPage = allPage;
	}


	public int getFirstObj() {
		return firstObj;
	}


	public void setFirstObj(int firstObj) {
		this.firstObj = firstObj;
	}


	public int getLastObj() {
		return lastObj;
	}


	public void setLastObj(int lastObj) {
		this.lastObj = lastObj;
	}
	
	
	
	public int getblockStartPage() {
		return blockStartPage;
	}


	public void setblockStartPage(int blockStartPage) {
		this.blockStartPage = blockStartPage;
	}
	
	public int getblockEndPage() {
		return blockEndPage;
	}


	public void setblockEndPage(int blockEndPage) {
		this.blockEndPage = blockEndPage;
	}
	
	

}



