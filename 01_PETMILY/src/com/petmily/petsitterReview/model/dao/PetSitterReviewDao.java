package com.petmily.petsitterReview.model.dao;

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

import com.petmily.petsitterReview.model.vo.PetSitterReview;


public class PetSitterReviewDao {
	
	private Properties prop=new Properties();
	
	public PetSitterReviewDao() {
		
		try {
			String path=PetSitterReviewDao.class.getResource("/sql/sitterReview/sitterReview-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	
	public List<PetSitterReview> selectPetSitterReviewList(Connection conn, String id){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<PetSitterReview> list=new ArrayList<PetSitterReview>();
		
		String sql=prop.getProperty("selectSitterReviewList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				PetSitterReview psr =new PetSitterReview();
				
				psr.setSitterReviewNo(rs.getInt("pet_sitter_review_no"));
				psr.setUserId(rs.getString("user_id"));
				psr.setRsCode(rs.getInt("reservation_code"));
				psr.setSitterId(rs.getString("pet_sitter_id"));
				psr.setReviewTxt(rs.getString("review_text"));
				psr.setReviewStar(rs.getInt("review_star"));
				psr.setReviewDate(rs.getString("review_date"));

				
				list.add(psr);
		
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public PetSitterReview selectPetSitterReviewDetail(Connection conn,int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		PetSitterReview psr = null;
		
		String sql=prop.getProperty("selectSitterDetail");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				psr = new PetSitterReview();
				psr.setSitterReviewNo(rs.getInt("pet_sitter_review_no"));
				psr.setUserId(rs.getString("user_id"));
				psr.setRsCode(rs.getInt("reservation_code"));
				psr.setSitterId(rs.getString("pet_sitter_id"));
				psr.setReviewTxt(rs.getString("review_text"));
				psr.setReviewStar(rs.getInt("review_star"));
				psr.setReviewDate(rs.getString("review_date"));

			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return psr;
	}
	
	public boolean replyUpdate(Connection conn, int reviewNo, String replyCon) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("replyUpdate");
		boolean result = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, replyCon);
			pstmt.setInt(2, reviewNo);
			
			if(pstmt.executeUpdate()>0)
				result = true;
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
}
