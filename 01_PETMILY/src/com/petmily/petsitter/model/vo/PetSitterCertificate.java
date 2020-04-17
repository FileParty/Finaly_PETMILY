package com.petmily.petsitter.model.vo;

public class PetSitterCertificate {

	private String petSitterId;
	private String certificateName;
	private String certificationNmae;
	private String dateOfAcquisition;
	private String expirationDate;
	private String certificateFilename;
	private String resType;
	public PetSitterCertificate() {
		// TODO Auto-generated constructor stub
	}
	public PetSitterCertificate(String petSitterId, String certificateName, String certificationNmae,
			String dateOfAcquisition, String expirationDate, String certificateFilename, String resType) {
		super();
		this.petSitterId = petSitterId;
		this.certificateName = certificateName;
		this.certificationNmae = certificationNmae;
		this.dateOfAcquisition = dateOfAcquisition;
		this.expirationDate = expirationDate;
		this.certificateFilename = certificateFilename;
		this.resType = resType;
	}
	public String getPetSitterId() {
		return petSitterId;
	}
	public void setPetSitterId(String petSitterId) {
		this.petSitterId = petSitterId;
	}
	public String getCertificateName() {
		return certificateName;
	}
	public void setCertificateName(String certificateName) {
		this.certificateName = certificateName;
	}
	public String getCertificationNmae() {
		return certificationNmae;
	}
	public void setCertificationNmae(String certificationNmae) {
		this.certificationNmae = certificationNmae;
	}
	public String getDateOfAcquisition() {
		return dateOfAcquisition;
	}
	public void setDateOfAcquisition(String dateOfAcquisition) {
		this.dateOfAcquisition = dateOfAcquisition;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	public String getCertificateFilename() {
		return certificateFilename;
	}
	public void setCertificateFilename(String certificateFilename) {
		this.certificateFilename = certificateFilename;
	}
	public String getResType() {
		return resType;
	}
	public void setResType(String resType) {
		this.resType = resType;
	}
	@Override
	public String toString() {
		return "PetSitterCertificate [petSitterId=" + petSitterId + ", certificateName=" + certificateName
				+ ", certificationNmae=" + certificationNmae + ", dateOfAcquisition=" + dateOfAcquisition
				+ ", expirationDate=" + expirationDate + ", certificateFilename=" + certificateFilename + ", resType="
				+ resType + "]";
	}
	
	
}
