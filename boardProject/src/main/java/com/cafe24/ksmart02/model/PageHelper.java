package com.cafe24.ksmart02.model;

import java.util.ArrayList;
import java.util.List;

public class PageHelper {
	
	//페이지 변수
	private int nowPage; 	//지금페이지 
	private int linkPage;	//페이지 생산 (nowPage/limitLink)+1//꺼내올거
	private List<Integer> linkPages;	//링크 페이지 1....10 if(nowPage%limitLink != 0){for(int i=0; i<linkPage; i++) //꺼내올거
					//{linkPage[i] = i*linkPage} if(totalPage==linkPage[i]){break;}}
	private int limitLink; 	//링크페이지 제한
	private int movePage;	//이전 다음 페이지
	
	//리스트변수
	private int listOne; 	//페이지에 첫번쨰로 출력되는 리스트	(페이지에 비례해서 구해짐)//꺼내올거
	private int limitList; 	//리스트 제한	(사용자 정의)
	
	//토탈 갯수
	private int totalPage; 	//전체 페이지수 ((totalList-1)/limitList)+1 //꺼내올거
	private int totalList; 	//전체갯수	(쿼리로 구함)
	
	
	
	public PageHelper(){
		
	}
	
	public PageHelper(int nowPage,int totalList,int limitList,int limitLink,int movePage){//5,23,10,10,1
		this.nowPage 	= nowPage;
		this.totalList 	= totalList;
		this.limitList 	= limitList;
		this.limitLink 	= limitLink;

		
		
		
		this.listOne 	= ((nowPage*limitList)-limitList);
		
		this.totalPage 	= ((totalList-1)/limitList)+1;//3

		
		this.linkPages 	= new ArrayList<Integer>();
		this.linkPage 	= ((nowPage/limitLink)*limitLink)+1;
		//이전,다음 버튼 눌럿을 경우 now페이지에 값을 수정한다.
		
		//링크구하기
		if(nowPage%limitLink != 0){
			
			for(int i=0; i<limitLink; i++){
		
				this.linkPages.add(i,this.linkPage+i);
				if(this.totalPage==this.linkPages.get(i)){
					break;
				}
			}
			this.movePage = ((nowPage/this.limitLink)*this.limitLink)+1;
		}else{
			
			for(int i=0; i<limitLink; i++){
				
				this.linkPages.add(i,this.linkPage+i-limitLink);
				if(this.totalPage==this.linkPages.get(i)){
					break;
				}
			}
			this.movePage = nowPage-limitLink+1;
		}	

	}
	
	
	
	
	
	
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowPgae() {
		return nowPage;
	}
	public void setNowPgae(int nowPgae) {
		this.nowPage = nowPgae;
	}
	public int getLinkPage() {
		return linkPage;
	}
	public void setLinkPage(int linkPage) {
		this.linkPage = linkPage;
	}
	public List<Integer> getLinkPages() {
		return linkPages;
	}
	public void setLinkPages(List<Integer> linkPages) {
		this.linkPages = linkPages;
	}
	public int getLimitLink() {
		return limitLink;
	}
	public void setLimitLink(int limitLink) {
		this.limitLink = limitLink;
	}
	public int getListOne() {
		return listOne;
	}
	public void setListOne(int listOne) {
		this.listOne = listOne;
	}
	public int getLimitList() {
		return limitList;
	}
	public void setLimitList(int limitList) {
		this.limitList = limitList;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalList() {
		return totalList;
	}
	public void setTotalList(int totalList) {
		this.totalList = totalList;
	}
	public int getMovePage() {
		return movePage;
	}
	public void setMovePage(int movePage) {
		this.movePage = movePage;
	}
}
