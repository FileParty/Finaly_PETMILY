package com.petmily.user.model.dao;

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

import com.petmily.user.model.vo.PetSitter2;
import com.petmily.user.model.vo.User;
import com.petmily.user.model.vo.UserBookMarkBoard;


public class UserDao {
	private Properties prop = new Properties();
	
//	湲곕낯 �깮�꽦�옄�뿉 �뙆�씪 寃쎈줈瑜� �꽑�뼵�븳�떎.
	public UserDao() {
		try {
			String path = UserDao.class.getResource("/sql/user/user-query.properties").getPath();
			prop.load(new FileReader(path));
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}// UserDao() 湲곕낯�깮�꽦�옄
	
	
	public int insertUserTable(Connection conn, PetSitter2 pss) {
		PreparedStatement pstmt=null;
		int result = 0 ;
		String sql=prop.getProperty("insertUserTable");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pss.getPetsitterId()); //?쉶?썝媛??엯 ?븘?씠?뵒
			pstmt.setString(2, pss.getPassword()); //?쉶?썝媛??엯 鍮꾨?踰덊샇
			pstmt.setString(3, pss.getSitterName()); //?쉶?썝媛??엯 ?씠由?
			pstmt.setString(4, pss.getSitterBday().replaceAll("-", "/"));//?쉶?썝媛??엯 ?쑕???룿
			pstmt.setString(5, pss.getSitterPhone());
			pstmt.setString(6, pss.getPostCode());//?쉶?썝媛??엯 二쇱냼 ?슦?렪踰덊샇
			pstmt.setString(7, pss.getSitterAddress()); //?쉶?썝媛??엯 二쇱냼
			pstmt.setString(8, pss.getAddressDetail()); //?쉶?썝媛??엯 ?긽?꽭二쇱냼
			pstmt.setString(9, pss.getSitterEmail()); //?쉶?썝媛??엯 ?씠硫붿씪
			pstmt.setString(10, String.valueOf(pss.getSitterGender())); //?쉶?썝媛??엯 ?꽦蹂?
			pstmt.setString(11, pss.getType()); //?쉶?썝媛??엯 ?떆?꽣 ???엯
			result=pstmt.executeUpdate();	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//?렖 ?떆?꽣 ?쉶?썝媛??엯 以? USER_PET_SITTER?뿉 ???븳 硫붿냼?뱶
	public int insertUserPetSitter(Connection conn, PetSitter2 pss) {
		PreparedStatement pstmt=null;
		int result = 0 ;
		String sql=prop.getProperty("insertPetSitter");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pss.getPetsitterId()); //?렖?떆?꽣 ?븘?씠?뵒
			pstmt.setString(2, pss.getCertificateYN()); //?렖?떆?꽣 ?옄寃⑹쬆 蹂댁쑀 ?뿬遺?
			pstmt.setString(3, pss.getPetSitterJob()); //?렖?떆?꽣 吏곸뾽
			pstmt.setString(4, pss.getPetSitterFamily()); //?렖?떆?꽣 媛?議? 援ъ꽦?썝
			pstmt.setString(5, pss.getPetSitterKeeppets()); //?렖?떆?꽣 諛섎젮?룞臾? 諛섎젮 寃쏀뿕 ?뿬遺?
			pstmt.setString(6, pss.getPetSitterActivity()); //?렖?떆?꽣 ?솢?룞 寃쎈젰
			pstmt.setString(7, pss.getAccountOwner()); //?렖?떆?꽣 ?젙?궛怨꾩쥖 怨꾩쥖二?
			pstmt.setString(8, pss.getBankName()); //?렖?떆?꽣 ?젙?궛怨꾩쥖 ???뻾紐?
			pstmt.setString(9, pss.getAccountNo()); //?렖?떆?꽣 ?젙?궛怨꾩쥖 怨꾩쥖踰덊샇
		//	pstmt.setString(10, ps.getType()); //?렖?떆?꽣 ?궗?슜?옄 ???엯(?렖?떆?꽣)
			pstmt.setString(11, pss.getSitterImg()); //?렖?떆?꽣 ?봽濡쒗븘 ?씠誘몄?
			result=pstmt.executeUpdate();	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
			return result;
	}
		
	//?렖 ?떆?꽣 ?쉶?썝媛??엯 以? PET_SITTER_CERTIFICATE 硫붿냼?뱶
	public int insertPetSitterCertificate(Connection conn, PetSitter2 pss) {
		PreparedStatement pstmt=null;
		int result = 0 ;
		String sql=prop.getProperty("insertPetSitterCertificate");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pss.getPetsitterId()); //?렖?떆?꽣 ?븘?씠?뵒
			pstmt.setString(2, pss.getCertificateName()); //?렖?떆?꽣 ?옄寃⑹쬆 ?씠由?
			pstmt.setString(3, pss.getIssuingOrg()); //?렖?떆?꽣 ?옄寃⑹쬆 諛쒓툒湲곌?
			pstmt.setString(4, pss.getCertiGetDate()); //?렖?떆?꽣 ?옄寃⑹쬆 諛쒓툒?씪
			pstmt.setString(5, pss.getCertiEndDate()); //?렖?떆?꽣 ?옄寃⑹쬆 留뚮즺?씪
			pstmt.setString(6, pss.getCertiImg()); //?렖?떆?꽣 ?옄寃⑹쬆 ?씠誘몄?
			result=pstmt.executeUpdate();	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//?렖?떆?꽣 ?쉶?썝媛??엯 以? RESIDENCE_TYPE ?뀒?씠釉붿뿉 ???븳 寃?
	public int insertResidenceType(Connection conn, PetSitter2 pss) {
		PreparedStatement pstmt=null;
		int result = 0 ;
		String sql=prop.getProperty("insertResidenceType");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pss.getPetsitterId()); //?렖?떆?꽣 ?븘?씠?뵒
			pstmt.setString(2, pss.getResidenceValue()); //嫄곗＜吏? ?쑀?삎
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
//	濡쒓렇�씤 濡쒖쭅 援ы쁽
//	�겢�씪�씠�뼵�듃媛� �엯�젰�븳 �뜲�씠�꽣媛� DB�뿉 ���옣�릺�뼱 �엳�뒗吏� �솗�씤�빐�빞 �븳�떎.
	public User userSelect(Connection conn, String user_id, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user = null;
		String sql = prop.getProperty("userSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setUserId(rs.getString("USER_ID")); // �쑀�� �븘�씠�뵒
				user.setPassword(rs.getString("PASSWORD")); // �쑀�� �뙣�뒪�썙�뱶
				user.setUserName(rs.getString("USER_NAME")); // �쑀�� �씠由�
				user.setUserBirth(rs.getString("USER_BIRTH_DAY")); // �쑀�� �깮�뀈�썡�씪
				user.setPhone(rs.getString("PHONE")); // �쑀�� �쑕��踰덊샇
				user.setZipCode(rs.getString("ZIP_CODE")); // �쑀�� �슦�렪踰덊샇
				user.setAddress(rs.getString("ADDRESS")); // �쑀�� 二쇱냼
				user.setDetailAddress(rs.getString("DETAILED_ADDRESS")); // �쑀�� �긽�꽭二쇱냼
				user.setEmail(rs.getString("EMAIL")); // �쑀�� �씠硫붿씪
				user.setGender(rs.getString("GENDER")); // �쑀�� �꽦蹂�
				user.setStatus(rs.getString("STATUS")); // �쑀�� �쉶�썝�깉�눜�뿬遺�
				user.setUserType(rs.getString("USER_TYPE")); // �쑀�� ���엯(�씪諛�, �렖�떆�꽣, 愿�由ъ옄)
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return user;
	}
	
	
	
	
//	회원가입 - 사용자 아이디 중복확인 로직
	public boolean userIdDuplicate(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		String sql = prop.getProperty("duplicate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true; // true�뒗 �씠�슜�씠 遺덇��뒫 ( �븘�씠�뵒媛� DB�뿉 �엳�쑝�땲, �궗�슜�븷 �닔 �뾾�떎! )
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		} 
		return flag;
	}
	
	
//	회원가입 - 휴대폰 번호 중복확인 로직
	public boolean phoneDuplicate(Connection conn, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		String sql = prop.getProperty("duplicatePhone");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phone);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true; // true�뒗 �씠�슜�씠 遺덇��뒫 ( �븘�씠�뵒媛� DB�뿉 �엳�쑝�땲, �궗�슜�븷 �닔 �뾾�떎! )
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		} 
		return flag;
	}
	
	
//	회원가입 - 이메일 중복확인 로직
	public boolean emailDuplicate(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		String sql = prop.getProperty("duplicateEmail");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true; // true�뒗 �씠�슜�씠 遺덇��뒫 ( �븘�씠�뵒媛� DB�뿉 �엳�쑝�땲, �궗�슜�븷 �닔 �뾾�떎! )
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		} 
		return flag;
	}
	
	
//	�쉶�썝媛��엯 濡쒖쭅
	public int userJoin(Connection conn, String id, String password, String name, String bday, String phone, String post, String address, String detailedAddress, String email, String gender) {
		PreparedStatement pstmt=null;
		int result = 0;
		String sql = prop.getProperty("userJoin");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id); 
			pstmt.setString(2, password); 
			pstmt.setString(3, name);
			pstmt.setString(4, bday); 
			pstmt.setString(5, phone); 
			pstmt.setString(6, post);
			pstmt.setString(7, address);
			pstmt.setString(8, detailedAddress);
			pstmt.setString(9, email);
			pstmt.setString(10, gender); 
			result=pstmt.executeUpdate();			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

//	-----------------------------------------------------------
	
//	회원정보 보기 로직
	public User userSelect(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User u = null;
		String sql = prop.getProperty("duplicate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				u = new User();
				u.setUserId(rs.getString("USER_ID"));
				u.setUserName(rs.getString("USER_NAME"));
				u.setUserBirth(rs.getString("USER_BIRTH_DAY"));
				u.setPhone(rs.getString("PHONE"));
				u.setZipCode(rs.getString("ZIP_CODE"));
				u.setAddress(rs.getString("ADDRESS"));
				u.setDetailAddress(rs.getString("DETAILED_ADDRESS"));
				u.setEmail(rs.getString("EMAIL"));
				u.setGender(rs.getString("GENDER"));
				u.setUserType(rs.getString("USER_TYPE"));
				u.setBellRes(rs.getString("BELL_RES"));
				u.setBellChatt(rs.getString("BELL_CHATT"));
				u.setEnrollDate(rs.getDate("ENROLL_DATE"));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return u;
	}
	
	
//	회원정보 수정 로직
	public int userUpdate(Connection conn, String id, String newPw, String email, String phone, String postNum, String address, String detailAddress) {
		PreparedStatement pstmt = null;
		int result= 0;
		String sql = prop.getProperty("userUpdate");
		try { 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPw);
			pstmt.setString(2, email); 
			pstmt.setString(3, phone); 
			pstmt.setString(4, postNum);
			pstmt.setString(5, address);
			pstmt.setString(6, detailAddress);
			pstmt.setString(7, id); // SQL 議곌굔臾�
			result = pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}
	
//	회원탈퇴 로직
	public int userDelete(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("userDelete");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); // SQL 議곌굔
			result = pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}
	
//	마이페이지 - 북마크 로직
	public List<UserBookMarkBoard> userBookMarkBoard(Connection conn, String id, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserBookMarkBoard ubm = null;
		List<UserBookMarkBoard> list = new ArrayList();
		String sql = prop.getProperty("userBookMarkBoard");
		try {
			pstmt = conn.prepareStatement(sql);
//			페이징 처리시, SQL문도 수정이 필요하다.
//			RNUM 처리를 위해 서브쿼리 수정이 필요하다.
			pstmt.setString(1, id);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			
			System.out.println("dao의 id :"+id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ubm = new UserBookMarkBoard();
				ubm.setBoardCode(rs.getInt("BCODE"));
				ubm.setPetSitterId(rs.getString("PSI"));
				ubm.setBoardTitle(rs.getString("BT"));
				ubm.setOnedaySprice(rs.getInt("OS"));
				ubm.setOnedayMprice(rs.getInt("OM"));
				ubm.setOnedayBprice(rs.getInt("OB"));
				ubm.setUserName(rs.getString("NA"));
				list.add(ubm);
			}
			
			System.out.println("dao에서 잘 담아졌는가(dao) : "+list);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
//	북마크 목록 페이징 처리 로직 
//	page bar 만들기(int totalData)
	public int selectBoardCount(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = prop.getProperty("selectBookMarkCount");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			rs.next();
			count= rs.getInt(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}


	public User userApiLogin(Connection conn, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user = null;
		String sql = prop.getProperty("apiUserSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setUserId(rs.getString("USER_ID")); // �쑀�� �븘�씠�뵒
				user.setPassword(rs.getString("PASSWORD")); // �쑀�� �뙣�뒪�썙�뱶
				user.setUserName(rs.getString("USER_NAME")); // �쑀�� �씠由�
				user.setUserBirth(rs.getString("USER_BIRTH_DAY")); // �쑀�� �깮�뀈�썡�씪
				user.setPhone(rs.getString("PHONE")); // �쑀�� �쑕��踰덊샇
				user.setZipCode(rs.getString("ZIP_CODE")); // �쑀�� �슦�렪踰덊샇
				user.setAddress(rs.getString("ADDRESS")); // �쑀�� 二쇱냼
				user.setDetailAddress(rs.getString("DETAILED_ADDRESS")); // �쑀�� �긽�꽭二쇱냼
				user.setEmail(rs.getString("EMAIL")); // �쑀�� �씠硫붿씪
				user.setGender(rs.getString("GENDER")); // �쑀�� �꽦蹂�
				user.setStatus(rs.getString("STATUS")); // �쑀�� �쉶�썝�깉�눜�뿬遺�
				user.setUserType(rs.getString("USER_TYPE")); // �쑀�� ���엯(�씪諛�, �렖�떆�꽣, 愿�由ъ옄)
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return user;
	}
}
