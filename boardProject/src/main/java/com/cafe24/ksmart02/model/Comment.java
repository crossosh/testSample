package com.cafe24.ksmart02.model;

public class Comment {
	
	private int commentNo;
	private int articleNo;
	private String commentContent;
	private String commentWriter;
	private String commentPw;
	private String commentDate;
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentWriter() {
		return commentWriter;
	}
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}
	public String getCommentPw() {
		return commentPw;
	}
	public void setCommentPw(String commentPw) {
		this.commentPw = commentPw;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", articleNo=" + articleNo + ", commentContent=" + commentContent
				+ ", commentWriter=" + commentWriter + ", commentPw=" + commentPw + ", commentDate=" + commentDate
				+ "]";
	}
	
	
	
	
	
	
	
}
