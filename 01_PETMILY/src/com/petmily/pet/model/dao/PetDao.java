package com.petmily.pet.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.petmily.board.model.dao.BoardDao;
import com.petmily.pet.model.vo.Pet;
import static com.petmily.common.JDBCTemplate.close;

public class PetDao {

	private Properties prop = new Properties();

	public PetDao() {
		try {
			String path = BoardDao.class.getResource("/sql/pet/pet-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int petprofileinsert(Connection conn, Pet pet, String id) {
		
		int result = 0;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("insertPet");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pet.getPetName());
			pstmt.setString(3, pet.getPetGender());
			pstmt.setString(4, pet.getPetKind());
			pstmt.setString(5, pet.getPetWeight());
			pstmt.setString(6, pet.getPetAge());
			pstmt.setString(7, pet.getPetAffinity());
			pstmt.setString(8, pet.getPetNeutralization());
			pstmt.setString(9, pet.getPetDisease());
			pstmt.setString(10,pet.getPetDiseaseTxt());
			pstmt.setString(11, pet.getPetSeparation());
			pstmt.setString(12, pet.getPetSeparationTxt());
			pstmt.setString(13, pet.getPetUrine());
			pstmt.setString(14, pet.getPetUrineTxt());
			pstmt.setString(15, pet.getPetIndoor());
			pstmt.setString(16, pet.getPetIndoorTxt());
			pstmt.setString(17, pet.getPetHowling());
			pstmt.setString(18, pet.getPetHowlingTxt());
			pstmt.setString(19, pet.getHeartDisease());
			pstmt.setString(20, pet.getVaccine());
			pstmt.setString(21, pet.getCorona());
			pstmt.setString(22, pet.getKennel());
			pstmt.setString(23, pet.getHospitalName());
			pstmt.setString(24, pet.getHospitalPhone());
			pstmt.setString(25, pet.getHospitalZip());
			pstmt.setString(26, pet.getHospitalAddress());
			pstmt.setString(27, pet.getDetail());
			pstmt.setString(28, pet.getPetImg());
			pstmt.setString(29, pet.getRegistration());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
		
		
	}
	


public List<Pet> petprofile(Connection conn, String user) {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<Pet> list = new ArrayList();
	String sql=prop.getProperty("selectpetprofile");
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			Pet p = new Pet();
			p.setPetCode(rs.getInt("pet_code"));
			p.setUserId(rs.getString("user_id"));
			p.setPetName(rs.getString("pet_name"));
			p.setPetGender(rs.getString("pet_gender"));
			p.setPetKind(rs.getString("pet_kind"));
			p.setPetWeight(rs.getString("pet_weight"));
			p.setPetAge(rs.getString("pet_age"));
			p.setPetAffinity(rs.getString("pet_affinity"));
			p.setPetNeutralization(rs.getString("pet_neutralization"));
			p.setPetDisease(rs.getString("pet_disease"));
			p.setPetDiseaseTxt(rs.getString("pet_disease_text"));
			p.setPetSeparation(rs.getString("pet_separation"));
			p.setPetSeparationTxt(rs.getString("pet_separation_text"));
			p.setPetUrine(rs.getString("pet_urine"));
			p.setPetUrineTxt(rs.getString("pet_urine_text"));
			p.setPetIndoor(rs.getString("pet_indoor_marking"));
			p.setPetIndoorTxt(rs.getString("pet_indoor_marking_text"));
			p.setPetHowling(rs.getString("pet_howling"));
			p.setPetHowlingTxt(rs.getString("pet_howling_text"));
			p.setHeartDisease(rs.getString("heart_disease"));
			p.setVaccine(rs.getString("vaccine"));
			p.setCorona(rs.getString("corona_enteritis"));
			p.setKennel(rs.getString("kennel_corp"));
			p.setHospitalName(rs.getString("animal_hospital_name"));
			p.setHospitalPhone(rs.getString("animal_hospital_phone"));
			p.setHospitalZip(rs.getString("animal_hospital_zip_code"));
			p.setHospitalAddress(rs.getString("animal_hospital_address"));
			p.setPetImg(rs.getString("pet_img_filename"));
			p.setRegistration(rs.getString("pet_registration_values"));
			p.setDetail(rs.getString("ah_detailed_address"));
			
			list.add(p);
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}return list;
}

public Pet petProfileDetail (Connection conn, String user, int no) {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Pet p = null;
	String sql=prop.getProperty("selectdetail");
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);		
		pstmt.setString(2, user);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			p = new Pet();
			p.setPetCode(rs.getInt("pet_code"));
			p.setUserId(rs.getString("user_id"));
			p.setPetName(rs.getString("pet_name"));
			p.setPetGender(rs.getString("pet_gender"));
			p.setPetKind(rs.getString("pet_kind"));
			p.setPetWeight(rs.getString("pet_weight"));
			p.setPetAge(rs.getString("pet_age"));
			p.setPetAffinity(rs.getString("pet_affinity"));
			p.setPetNeutralization(rs.getString("pet_neutralization"));
			p.setPetDisease(rs.getString("pet_disease"));
			p.setPetDiseaseTxt(rs.getString("pet_disease_text"));
			p.setPetSeparation(rs.getString("pet_separation"));
			p.setPetSeparationTxt(rs.getString("pet_separation_text"));
			p.setPetUrine(rs.getString("pet_urine"));
			p.setPetUrineTxt(rs.getString("pet_urine_text"));
			p.setPetIndoor(rs.getString("pet_indoor_marking"));
			p.setPetIndoorTxt(rs.getString("pet_indoor_marking_text"));
			p.setPetHowling(rs.getString("pet_howling"));
			p.setPetHowlingTxt(rs.getString("pet_howling_text"));
			p.setHeartDisease(rs.getString("heart_disease"));
			p.setVaccine(rs.getString("vaccine"));
			p.setCorona(rs.getString("corona_enteritis"));
			p.setKennel(rs.getString("kennel_corp"));
			p.setHospitalName(rs.getString("animal_hospital_name"));
			p.setHospitalPhone(rs.getString("animal_hospital_phone"));
			p.setHospitalZip(rs.getString("animal_hospital_zip_code"));
			p.setHospitalAddress(rs.getString("animal_hospital_address"));
			p.setPetImg(rs.getString("pet_img_filename"));
			p.setRegistration(rs.getString("pet_registration_values"));
			p.setDetail(rs.getString("ah_detailed_address"));
			
			
			
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}
	return p;
}

public int petprofileeidt(Connection conn,Pet pet,String id,int no) {
	int result = 0;
	PreparedStatement pstmt =null;
	String sql = prop.getProperty("editPet");
	try {
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, pet.getPetName());
		pstmt.setString(2, pet.getPetGender());
		pstmt.setString(3, pet.getPetKind());
		pstmt.setString(4, pet.getPetWeight());
		pstmt.setString(5, pet.getPetAge());
		pstmt.setString(6, pet.getPetAffinity());
		pstmt.setString(7, pet.getPetNeutralization());
		pstmt.setString(8, pet.getPetDisease());
		pstmt.setString(9,pet.getPetDiseaseTxt());
		pstmt.setString(10, pet.getPetSeparation());
		pstmt.setString(11, pet.getPetSeparationTxt());
		pstmt.setString(12, pet.getPetUrine());
		pstmt.setString(13, pet.getPetUrineTxt());
		pstmt.setString(14, pet.getPetIndoor());
		pstmt.setString(15, pet.getPetIndoorTxt());
		pstmt.setString(16, pet.getPetHowling());
		pstmt.setString(17, pet.getPetHowlingTxt());
		pstmt.setString(18, pet.getHeartDisease());
		pstmt.setString(19, pet.getVaccine());
		pstmt.setString(20, pet.getCorona());
		pstmt.setString(21, pet.getKennel());
		pstmt.setString(22, pet.getHospitalName());
		pstmt.setString(23, pet.getHospitalPhone());
		pstmt.setString(24, pet.getHospitalZip());
		pstmt.setString(25, pet.getHospitalAddress());
		pstmt.setString(26, pet.getDetail());
		pstmt.setString(27, pet.getPetImg());
		pstmt.setString(28, pet.getRegistration());
		pstmt.setString(29, id);
		pstmt.setInt(30, no);
		
		result = pstmt.executeUpdate();
	
	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;


}
}
