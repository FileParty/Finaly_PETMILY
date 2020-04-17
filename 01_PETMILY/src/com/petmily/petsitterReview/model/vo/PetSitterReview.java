package com.petmily.petsitterReview.model.vo;

public class PetSitterReview {
	
	private int sitterReviewNo;
	private String userId;
	private int rsCode;
	private String sitterId;
	private String reviewTxt;
	private int reviewStar;
	private String reviewDate;
	public PetSitterReview() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PetSitterReview(int sitterReviewNo, String userId, int rsCode, String sitterId, String reviewTxt,
			int reviewStar, String reviewDate) {
		super();
		this.sitterReviewNo = sitterReviewNo;
		this.userId = userId;
		this.rsCode = rsCode;
		this.sitterId = sitterId;
		this.reviewTxt = reviewTxt;
		this.reviewStar = reviewStar;
		this.reviewDate = reviewDate;
	}
	public int getSitterReviewNo() {
		return sitterReviewNo;
	}
	public void setSitterReviewNo(int sitterReviewNo) {
		this.sitterReviewNo = sitterReviewNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getRsCode() {
		return rsCode;
	}
	public void setRsCode(int rsCode) {
		this.rsCode = rsCode;
	}
	public String getSitterId() {
		return sitterId;
	}
	public void setSitterId(String sitterId) {
		this.sitterId = sitterId;
	}
	public String getReviewTxt() {
		return reviewTxt;
	}
	public void setReviewTxt(String reviewTxt) {
		this.reviewTxt = reviewTxt;
	}
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	@Override
	public String toString() {
		return "PetSitterReview [sitterReviewNo=" + sitterReviewNo + ", userId=" + userId + ", rsCode=" + rsCode
				+ ", sitterId=" + sitterId + ", reviewTxt=" + reviewTxt + ", reviewStar=" + reviewStar + ", reviewDate="
				+ reviewDate + "]";
	}
	
}
