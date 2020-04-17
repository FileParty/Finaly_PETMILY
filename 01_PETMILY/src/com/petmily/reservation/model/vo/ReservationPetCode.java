package com.petmily.reservation.model.vo;

public class ReservationPetCode {
	
	private String reservationCode;
	private int petCode;
	private String petSize;
	private int petBath;
	private String petBathText;
	
	
	public ReservationPetCode() {
		// TODO Auto-generated constructor stub
	}
	

	public ReservationPetCode(String reservationCode, int petCode, String petSize, int petBath, String petBathText) {
		super();
		this.reservationCode = reservationCode;
		this.petCode = petCode;
		this.petSize = petSize;
		this.petBath = petBath;
		this.petBathText = petBathText;
	}


	public String getPetBathText() {
		return petBathText;
	}


	public void setPetBathText(String petBathText) {
		this.petBathText = petBathText;
	}



	public String getReservationCode() {
		return reservationCode;
	}



	public void setReservationCode(String reservationCode) {
		this.reservationCode = reservationCode;
	}





	public int getPetCode() {
		return petCode;
	}





	public void setPetCode(int petCode) {
		this.petCode = petCode;
	}





	public String getPetSize() {
		return petSize;
	}





	public void setPetSize(String petSize) {
		this.petSize = petSize;
	}





	public int getPetBath() {
		return petBath;
	}





	public void setPetBath(int petBath) {
		this.petBath = petBath;
	}





	
	
	
	
	
	

}
