package com.petmily.bline.model.vo;

public class BlineRequest {
	
	private String userId;
	private int userReviewNo;
	private int boardCode;
	private String blineText;
	private String blineType;
	
	public BlineRequest() {
		// TODO Auto-generated constructor stub
	}

	public BlineRequest(String userId, int userReviewNo, int boardCode, String blineText, String blineType) {
		super();
		this.userId = userId;
		this.userReviewNo = userReviewNo;
		this.boardCode = boardCode;
		this.blineText = blineText;
		this.blineType = blineType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getUserReviewNo() {
		return userReviewNo;
	}

	public void setUserReviewNo(int userReviewNo) {
		this.userReviewNo = userReviewNo;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public String getBlineText() {
		return blineText;
	}

	public void setBlineText(String blineText) {
		this.blineText = blineText;
	}

	public String getBlineType() {
		return blineType;
	}

	public void setBlineType(String blineType) {
		this.blineType = blineType;
	}
	
	
	

}
