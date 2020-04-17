package com.petmily.petsitterMyPage.reservation.model.vo;

public class PetsitterMypageUserReview {
	
	private String userId;
	private String userName;
	private String petsitterId;
	private String reviewText;
	private int reviewStar;
	
	public PetsitterMypageUserReview() {
		// TODO Auto-generated constructor stub
	}

	public PetsitterMypageUserReview(String userId, String userName, String petsitterId, String reviewText,
			int reviewStar) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.petsitterId = petsitterId;
		this.reviewText = reviewText;
		this.reviewStar = reviewStar;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPetsitterId() {
		return petsitterId;
	}

	public void setPetsitterId(String petsitterId) {
		this.petsitterId = petsitterId;
	}

	public String getReviewText() {
		return reviewText;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

	public int getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

	@Override
	public String toString() {
		return "PetsitterMypageUserReview [userId=" + userId + ", userName=" + userName + ", petsitterId=" + petsitterId
				+ ", reviewText=" + reviewText + ", reviewStar=" + reviewStar + "]";
	}
	
	
	

}
