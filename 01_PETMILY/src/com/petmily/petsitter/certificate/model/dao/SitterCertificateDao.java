package com.petmily.petsitter.certificate.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;


import static com.petmily.common.JDBCTemplate.close;

import com.petmily.petsitter.model.vo.PetSitterCertificate;


public class SitterCertificateDao {

	
	private Properties prop = new Properties();
	
	public SitterCertificateDao() {
		try {
			String path=SitterCertificateDao.class.getResource("/sql/petsitter/certificate-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<PetSitterCertificate> selectCertificate(Connection conn,String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PetSitterCertificate pc = null;
		List<PetSitterCertificate> list = new ArrayList<PetSitterCertificate>();
		String sql = prop.getProperty("selectCertificate");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id); 
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				pc= new PetSitterCertificate();
				pc.setCertificateName(rs.getString("CERTIFICATE_NAME"));
				pc.setCertificationNmae(rs.getString("CERTIFICATION_NAME"));
				pc.setDateOfAcquisition(rs.getString("DATE_OF_ACQUISITION"));
				pc.setExpirationDate(rs.getString("EXPIRATION_DATE"));
				pc.setCertificateFilename(rs.getString("CERTIFICATE_FILENAME"));
				pc.setResType(rs.getString("RES_TYPE"));
				list.add(pc);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public List<PetSitterCertificate> selectCertificate2(Connection conn,String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PetSitterCertificate pc = null;
		List<PetSitterCertificate> list = new ArrayList<PetSitterCertificate>();
		String sql = prop.getProperty("selectCertificate2");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id); 
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				pc= new PetSitterCertificate();
				pc.setCertificateName(rs.getString("CERTIFICATE_NAME"));
				pc.setCertificationNmae(rs.getString("CERTIFICATION_NAME"));
				pc.setDateOfAcquisition(rs.getString("DATE_OF_ACQUISITION"));
				pc.setExpirationDate(rs.getString("EXPIRATION_DATE"));
				pc.setCertificateFilename(rs.getString("CERTIFICATE_FILENAME"));
				pc.setResType(rs.getString("RES_TYPE"));
				list.add(pc);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int insertCertificate(Connection conn,PetSitterCertificate pc) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertCertificate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pc.getPetSitterId());
			pstmt.setString(2, pc.getCertificateName());
			pstmt.setString(3, pc.getCertificationNmae());
			pstmt.setString(4, pc.getDateOfAcquisition());
			pstmt.setString(5, pc.getExpirationDate());
			pstmt.setString(6, pc.getCertificateFilename());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
}
