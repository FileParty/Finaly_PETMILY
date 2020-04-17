package com.petmily.userReview.model.dao;

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

import com.petmily.userReview.model.vo.UserReview;

public class UserReviewDao {
	
	private Properties prop=new Properties();
	
	public UserReviewDao() {
		
		try {
			String path=UserReviewDao.class.getResource("/sql/userReview/userReview-properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	
	public List<UserReview> selectUserReviewList(Connection conn,String userId){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<UserReview> list=new ArrayList<UserReview>();
		
		String sql=prop.getProperty("selectUserReviewList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				UserReview ur=new UserReview();
				
				ur.setUserReviewNo(rs.getInt("user_review_no"));
				ur.setUserId(rs.getString("user_id"));
				ur.setPetsitterName(rs.getString("user_name"));
				ur.setReservationCode(rs.getInt("reservation_code"));
				ur.setCheckIn(rs.getDate("checkin_date"));
				ur.setCheckOut(rs.getDate("checkout_date"));
				ur.setPetsitterId(rs.getString("pet_sitter_id"));
				ur.setReviewText(rs.getString("review_text"));
				ur.setReviewStar(rs.getInt("review_Star"));
				ur.setReviewDate(rs.getDate("review_date"));
				ur.setReviewType(rs.getString("review_type"));
				ur.setReviewBlindText(rs.getString("review_blind_text"));
				
				System.out.println(rs.getString("review_text"));
				
				list.add(ur);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
//	[회원정보]-[작성후기]에서 작성글보기 로직
	public boolean selectUserReviewDetail(Connection conn, String id, String pstId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		String sql = prop.getProperty("selectUserReviewDetail");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pstId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true;
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
}
