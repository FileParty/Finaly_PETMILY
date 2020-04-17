package com.petmily.petsitter.settled.model.vo;

import java.util.Date;

public class PetReservation {
//	펫시터 예약테이블
	private int reservationCode; // RESERVATION_CODE(예약테이블 코드)
	private String petSitterId; // PET_SETTER_ID(펫시터 아이디)
	private String checkOutDate; // CHECKOUT_DATE(체크아웃 날짜)
	private int numAll; // 결제 건수
	private int price; // PRICE(합계금액)
	private int fees; // 수수료
	
	public PetReservation() { } 

	public PetReservation(int reservationCode, String petSitterId, String checkOutDate, int numAll, int price,
			int fees) {
		super();
		this.reservationCode = reservationCode;
		this.petSitterId = petSitterId;
		this.checkOutDate = checkOutDate;
		this.numAll = numAll;
		this.price = price;
		this.fees = fees;
	}



	public int getReservationCode() {
		return reservationCode;
	}

	public void setReservationCode(int reservationCode) {
		this.reservationCode = reservationCode;
	}

	public String getPetSitterId() {
		return petSitterId;
	}

	public void setPetSitterId(String petSitterId) {
		this.petSitterId = petSitterId;
	}

	public String getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public int getNumAll() {
		return numAll;
	}

	public void setNumAll(int numAll) {
		this.numAll = numAll;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getFees() {
		return fees;
	}

	public void setFees(int fees) {
		this.fees = fees;
	}

	@Override
	public String toString() {
		return "PetReservation [reservationCode=" + reservationCode + ", petSitterId=" + petSitterId + ", checkOutDate="
				+ checkOutDate + ", numAll=" + numAll + ", price=" + price + ", fees=" + fees + "]";
	}

	
}
