package com.petmily.admin.model.vo;

public class AdminApplyDate {
	
	private String userName;
	private String userType;
	private String enrollData;
	
	public AdminApplyDate() {
		// TODO Auto-generated constructor stub
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getEnrollData() {
		return enrollData;
	}

	public void setEnrollData(String enrollData) {
		this.enrollData = enrollData;
	}

	@Override
	public String toString() {
		return "AdminApplyDate [userName=" + userName + ", userType=" + userType + ", enrollData=" + enrollData + "]";
	}
	
	

}
