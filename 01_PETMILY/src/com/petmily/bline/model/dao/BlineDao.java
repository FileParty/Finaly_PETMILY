package com.petmily.bline.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.petmily.common.JDBCTemplate.close;

import com.petmily.board.model.dao.BoardDao;

public class BlineDao {
	
	private Properties prop = new Properties();
	
	public BlineDao() {
		try {
			String path=BoardDao.class.getResource("/sql/bline/bline-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int blineCount(Connection conn, String userId, int boardCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("blineCount");
		
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, boardCode);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt("count(*)");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
		
	}
	
	public boolean blineRequestInsert(Connection conn, String userId, int boardCode, String blineText) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("blineRequestInsert");
		boolean result = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, boardCode);
			pstmt.setString(3, blineText);
				
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
