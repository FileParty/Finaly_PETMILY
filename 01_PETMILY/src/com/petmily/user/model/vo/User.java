package com.petmily.user.model.vo;

import java.util.Date;

public class User {
	private String userId; //user_id
	private String password; //password
	private String userName; // user_name
	private String userBirth; // user_birth_day
	private String phone; // phone
	private String zipCode; // zip_code
	private String address; // address
	private String detailAddress; // detailed_address
	private String email; // email
	private String gender; // gender
	private String status; 
	private String userType;
	private String bellRes;
	private String bellChatt;
	private Date enrollDate;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String userId, String password, String userName, String userBirth, String phone, String zipCode,
			String address, String detailAddress, String email, String gender, String status, String userType,
			String bellRes, String bellChatt, Date enrollDate) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.userBirth = userBirth;
		this.phone = phone;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.email = email;
		this.gender = gender;
		this.status = status;
		this.userType = userType;
		this.bellRes = bellRes;
		this.bellChatt = bellChatt;
		this.enrollDate = enrollDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getBellRes() {
		return bellRes;
	}

	public void setBellRes(String bellRes) {
		this.bellRes = bellRes;
	}

	public String getBellChatt() {
		return bellChatt;
	}

	public void setBellChatt(String bellChatt) {
		this.bellChatt = bellChatt;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", userName=" + userName + ", userBirth="
				+ userBirth + ", phone=" + phone + ", zipCode=" + zipCode + ", address=" + address + ", detailAddress="
				+ detailAddress + ", email=" + email + ", gender=" + gender + ", status=" + status + ", userType="
				+ userType + ", bellRes=" + bellRes + ", bellChatt=" + bellChatt + ", enrollDate=" + enrollDate + "]";
	}
	
	
}
