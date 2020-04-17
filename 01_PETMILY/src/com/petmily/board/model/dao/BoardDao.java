package com.petmily.board.model.dao;

import static com.petmily.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.petmily.board.model.vo.PetSitterBoard;
import com.petmily.board.model.vo.PlusOptionService;
import com.petmily.pet.model.vo.PetInfo;
import com.petmily.petsitter.model.vo.PetSitter;
import com.petmily.petsitter.model.vo.PetSitterCertificate;
import com.petmily.review.model.vo.ReviewPetSitter;
import com.petmily.user.model.vo.User;
import com.sun.prism.Presentable;

import oracle.jdbc.proxy.annotation.Pre;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		try {
			String path=BoardDao.class.getResource("/sql/sitter/sitter-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public PetSitterBoard getPetSitterBoardT(Connection conn, int boardCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("getSitterBoard");
		
		PetSitterBoard sitterBoardT = new PetSitterBoard(); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(boardCode);
			pstmt.setInt(1, boardCode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sitterBoardT.setBoardNo(rs.getInt("BOARD_CODE"));
				sitterBoardT.setUserId(rs.getString("USER_ID"));
				sitterBoardT.setBoardTitle(rs.getString("BOARD_TITLE"));
				sitterBoardT.setBoardInfo(rs.getString("BOARD_INFO"));
				sitterBoardT.setSmallPrice(rs.getInt("ONE_DAY_CARE_S_PRICE"));
				sitterBoardT.setMiddlePrice(rs.getInt("ONE_DAY_CARE_M_PRICE"));
				sitterBoardT.setBigPrice(rs.getInt("ONE_DAY_CARE_B_PRICE"));
				sitterBoardT.setBoardAddress(rs.getString("BOARD_ADDRESS"));
				sitterBoardT.setBoardAddressContent(rs.getString("BOARD_ADDRESS_COMMENT"));
				sitterBoardT.setBoardBlind(rs.getString("BOARD_BLIND"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return sitterBoardT;
	}
	
	public String getSitterId(Connection conn, int boardCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("getSitterId");
		
		String sitter = "";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardCode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) 
				sitter = rs.getString("USER_ID");
			
			
		}catch(SQLException e){
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return sitter;
	}
	
	public boolean bookmark(Connection conn, String userId, String sitterId) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("getbookmark");
				
		boolean bookmark = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, sitterId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				bookmark = true;
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return bookmark;
	}
	
	public boolean getCertificateFlag(Connection conn, String sitterId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("getCertificateFlag");
		
		boolean certificateFlag = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sitterId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("PET_CERTIFICATE_YN").equals("Y")) {
					certificateFlag = true;
				}
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return certificateFlag;
		
	}
	
	public List<PetSitterCertificate> getCertificate(Connection conn, String sitterId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("getCertificate");
		
		List<PetSitterCertificate> certificates = new ArrayList<PetSitterCertificate>();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sitterId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PetSitterCertificate cer = new PetSitterCertificate();
				cer.setPetSitterId(rs.getString("PET_SITTER_ID"));
				cer.setCertificateName(rs.getString("CERTIFICATE_NAME"));
				cer.setCertificationNmae(rs.getString("CERTIFICATION_NAME"));
				cer.setDateOfAcquisition(rs.getString("DATE_OF_ACQUISITION"));
				cer.setExpirationDate(rs.getString("EXPIRATION_DATE"));
				cer.setCertificateFilename(rs.getString("CERTIFICATE_FILENAME"));
				certificates.add(cer);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return certificates;
		
	}
	
	public List<ReviewPetSitter> getReviews(Connection conn, String sitterId){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("getReviews");
		
		List<ReviewPetSitter> reviews = new ArrayList<ReviewPetSitter>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sitterId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewPetSitter review = new ReviewPetSitter();
				review.setUserReviewNo(rs.getInt("USER_REVIEW_NO"));
				review.setUserId(rs.getString("USER_ID"));
				review.setReservationCode(rs.getInt("RESERVATION_CODE"));
				review.setPetSitterId(rs.getString("PET_SITTER_ID"));
				review.setReviewText(rs.getString("REVIEW_TEXT"));
				review.setReviewStar(rs.getInt("REVIEW_STAR"));
				review.setReviewDate(rs.getString("REVIEW_DATE"));
				review.setReviewType(rs.getString("REVIEW_TYPE"));
				review.setReviewBilnd(rs.getString("REVIEW_BLIND_TEXT"));
				review.setReviewSend(rs.getString("REVIEW_SEND_TEXT"));
				reviews.add(review);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return reviews;
		
	}
	
	public boolean bookmarkDelete(Connection conn, String userId, String sitterId) {
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("bookmarkDelete");
		
		boolean result = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, sitterId);
			
			if(pstmt.executeUpdate()>0) {
				result = true;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	public boolean bookmarkAdd(Connection conn, String userId, String sitterId) {
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("bookmarkAdd");
		
		boolean result = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, sitterId);
			
			if(pstmt.executeUpdate()==1) {
				result = true;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	public PetSitter getPetSitterT(Connection conn, String sitterId) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("getPetSitterT");
		
		PetSitter sitterT = null;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sitterId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sitterT = new PetSitter();
				sitterT.setPetSitterId(sitterId);
				sitterT.setCertificateYN(rs.getString("PET_CERTIFICATE_YN"));
				sitterT.setPetSitterJob(rs.getString("PET_SITTER_JOB"));
				sitterT.setPetSitterFamily(rs.getString("PET_SITTER_FAMILY"));
				sitterT.setPetSitterKeeppets(rs.getString("PET_SITTER_KEEP_PETS"));
				sitterT.setPetSitterActivity(rs.getString("PET_SITTER_ACTIVITY"));
				sitterT.setBankName(rs.getString("BANK_NAME"));
				sitterT.setAccountNumber(rs.getString("ACCOUNT_NUMBER"));
				sitterT.setPetSitterType(rs.getString("PET_SITTER_TYPE"));
				sitterT.setPetSitterImg(rs.getString("PET_SITTER_IMG"));
				
			}			
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return sitterT;
		
	}
	
	public User getUserInfoT(Connection conn, String sitterId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("getUserInfoT");
		
		User userInfoT = null;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sitterId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userInfoT = new User();
				userInfoT.setUserId(sitterId);
				userInfoT.setPassword(rs.getString("PASSWORD"));
				userInfoT.setUserName(rs.getString("USER_NAME"));
				userInfoT.setUserBirth(rs.getString("USER_BIRTH_DAY"));
				userInfoT.setPhone(rs.getString("PHONE"));
				userInfoT.setZipCode(rs.getString("ZIP_CODE"));
				userInfoT.setAddress(rs.getString("ADDRESS"));
				userInfoT.setDetailAddress(rs.getString("DETAILED_ADDRESS"));
				userInfoT.setEmail(rs.getString("EMAIL"));
				userInfoT.setGender(rs.getString("GENDER"));
				userInfoT.setStatus(rs.getString("STATUS"));
				userInfoT.setUserType(rs.getString("USER_TYPE"));
			}
			
			
		}catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return userInfoT;
		
	}
	
	public List<String> getDefaultService(Connection conn, int boardCode){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("getDefaultService");
		
		List<String> defaultServiceList = new ArrayList<String>();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardCode);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				defaultServiceList.add(rs.getString("DEFAULT_SERVICE_VALUES"));
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return defaultServiceList;
		
	}
	
	public List<PlusOptionService> getPOService(Connection conn, int boardCode) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("getPOService");
		
		List<PlusOptionService> pOService = new ArrayList<PlusOptionService>();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardCode);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				PlusOptionService temp = new PlusOptionService();
				temp.setBoardNo(boardCode);				
				temp.setPlusOptionType(rs.getString("PLUS_SERVICE_VALUES"));
				temp.setSmallPrice(rs.getInt("PLUS_SERVICE_SMALL_PRICE"));
				temp.setMiddlePrice(rs.getInt("PLUS_SERVICE_MEDIUM_PRICE"));
				temp.setBigPrice(rs.getInt("PLUS_SERVICE_BIG_PRICE"));
				temp.setOneWayPrice(rs.getInt("PLUS_SERVICE_ONE_WAY_PRICE"));
				temp.setAllWayPrice(rs.getInt("PLUS_SERVCIE_ROUND_TRIP_PRICE"));
				temp.setSalePrice(rs.getInt("PLUS_SERVICE_SAIL_PRICE"));
				pOService.add(temp);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return pOService;
		
	}
	
	public List<String> getBoardImg(Connection conn, int boardCode){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("getBoardImg");
		
		List<String> boardImgs = new ArrayList<String>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardCode);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String s = rs.getString("IMG_FILENAME");
				
				boardImgs.add(s);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return boardImgs;
		
	}
	
	public List<PetInfo> getPetInfoT(Connection conn, String userId){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("getPetInfoT");
		
		List<PetInfo> petsT = new ArrayList<PetInfo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PetInfo pet = new PetInfo();
				pet.setPetCode(rs.getInt("PET_CODE"));
				pet.setUserId(userId);
				pet.setPetName(rs.getString("PET_NAME"));
				pet.setPetWeight(rs.getString("PET_WEIGHT"));
				pet.setPetImgFilename(rs.getString("PET_IMG_FILENAME"));
				petsT.add(pet);
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return petsT;
		
		
		
	}

}
