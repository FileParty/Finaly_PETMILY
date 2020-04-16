package com.petmily.calculator.model.vo;

public class Calculator {
	
	private String userName;
	private String petSitterId;
	private String checkIn;
	private String checkOut;
	private int price;
	private String priceEndDate;
	
	public Calculator() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Calculator(String userName, String petSitterId, String checkIn, String checkOut, int price,
			String priceEndDate) {
		super();
		this.userName = userName;
		this.petSitterId = petSitterId;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.price = price;
		this.priceEndDate = priceEndDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPetSitterId() {
		return petSitterId;
	}

	public void setPetSitterId(String petSitterId) {
		this.petSitterId = petSitterId;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPriceEndDate() {
		return priceEndDate;
	}

	public void setPriceEndDate(String priceEndDate) {
		this.priceEndDate = priceEndDate;
	}

	@Override
	public String toString() {
		return "Calculator [userName=" + userName + ", petSitterId=" + petSitterId + ", checkIn=" + checkIn
				+ ", checkOut=" + checkOut + ", price=" + price + ", priceEndDate=" + priceEndDate + "]";
	}
	
	

}
