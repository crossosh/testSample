package com.cafe24.ksmart02.model;

import java.util.ArrayList;
import java.util.List;

public class PageHelper {
	
	//������ ����
	private int nowPage; 	//���������� 
	private int linkPage;	//������ ���� (nowPage/limitLink)+1//�����ð�
	private List<Integer> linkPages;	//��ũ ������ 1....10 if(nowPage%limitLink != 0){for(int i=0; i<linkPage; i++) //�����ð�
					//{linkPage[i] = i*linkPage} if(totalPage==linkPage[i]){break;}}
	private int limitLink; 	//��ũ������ ����
	private int movePage;	//���� ���� ������
	
	//����Ʈ����
	private int listOne; 	//�������� ù������ ��µǴ� ����Ʈ	(�������� ����ؼ� ������)//�����ð�
	private int limitList; 	//����Ʈ ����	(����� ����)
	
	//��Ż ����
	private int totalPage; 	//��ü �������� ((totalList-1)/limitList)+1 //�����ð�
	private int totalList; 	//��ü����	(������ ����)
	
	
	
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
		//����,���� ��ư ������ ��� now�������� ���� �����Ѵ�.
		
		//��ũ���ϱ�
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
