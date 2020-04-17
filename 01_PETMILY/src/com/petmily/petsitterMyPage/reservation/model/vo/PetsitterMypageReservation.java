package com.petmily.petsitterMyPage.reservation.model.vo;

import java.sql.Date;

public class PetsitterMypageReservation {

	private int reservationCode;
	private String userId;
	private String petsitterId;
	private int boardCode;
	private Date checkInDate;
	private Date checkOutDate;
	private String plusQuestions;
	private Date priceEndDate;
	private int price;
	private String resType;
	private String petMedication;
	private String petPickUp;
	private String userName;

	public PetsitterMypageReservation() {
		// TODO Auto-generated constructor stub
	}

	public PetsitterMypageReservation(int reservationCode, String userId, String petsitterId, int boardCode,
			Date checkInDate, Date checkOutDate, String plusQuestions, Date priceEndDate, int price, String resType,
			String petMedication, String petPickUp, String userName) {
		super();
		this.reservationCode = reservationCode;
		this.userId = userId;
		this.petsitterId = petsitterId;
		this.boardCode = boardCode;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.plusQuestions = plusQuestions;
		this.priceEndDate = priceEndDate;
		this.price = price;
		this.resType = resType;
		this.petMedication = petMedication;
		this.petPickUp = petPickUp;
		this.userName = userName;
	}

	public int getReservationCode() {
		return reservationCode;
	}

	public void setReservationCode(int reservationCode) {
		this.reservationCode = reservationCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPetsitterId() {
		return petsitterId;
	}

	public void setPetsitterId(String petsitterId) {
		this.petsitterId = petsitterId;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public Date getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}

	public Date getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public String getPlusQuestions() {
		return plusQuestions;
	}

	public void setPlusQuestions(String plusQuestions) {
		this.plusQuestions = plusQuestions;
	}

	public Date getPriceEndDate() {
		return priceEndDate;
	}

	public void setPriceEndDate(Date priceEndDate) {
		this.priceEndDate = priceEndDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getResType() {
		return resType;
	}

	public void setResType(String resType) {
		this.resType = resType;
	}

	public String getPetMedication() {
		return petMedication;
	}

	public void setPetMedication(String petMedication) {
		this.petMedication = petMedication;
	}

	public String getPetPickUp() {
		return petPickUp;
	}

	public void setPetPickUp(String petPickUp) {
		this.petPickUp = petPickUp;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "PetsitterMypageReservation [reservationCode=" + reservationCode + ", userId=" + userId
				+ ", petsitterId=" + petsitterId + ", boardCode=" + boardCode + ", checkInDate=" + checkInDate
				+ ", checkOutDate=" + checkOutDate + ", plusQuestions=" + plusQuestions + ", priceEndDate="
				+ priceEndDate + ", price=" + price + ", resType=" + resType + ", petMedication=" + petMedication
				+ ", petPickUp=" + petPickUp + ", userName=" + userName + "]";
	}
	
	
	
}
