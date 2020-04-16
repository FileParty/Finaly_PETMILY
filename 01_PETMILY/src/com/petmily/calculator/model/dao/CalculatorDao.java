package com.petmily.calculator.model.dao;

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

import com.petmily.calculator.model.vo.Calculator;



public class CalculatorDao {
	
	private Properties prop=new Properties();
	
	public CalculatorDao() {
		
		try {
			String path=CalculatorDao.class.getResource("/sql/sitter/sitter-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Calculator> selectCalculator (Connection conn,String userId){
		
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Calculator c = null;
		List<Calculator> list = new ArrayList();
		String sql = prop.getProperty("sitterCalculator");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				c = new Calculator();
				
				c.setCheckIn(rs.getString("CHECKIN_DATE"));
				c.setCheckOut(rs.getString("CHECKOUT_DATE"));
				c.setPrice(rs.getInt("PRICE"));
				c.setPriceEndDate(rs.getString("PRICE_END_DATE"));
				c.setUserName(rs.getString("USER_NAME"));

				list.add(c);
			}
			System.out.println("dao"+list);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}
	
	public List<Calculator> selectCalculator(Connection conn, String userId, int month){
		
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Calculator c = null;
		List<Calculator> list = new ArrayList();
		String sql = prop.getProperty("sitterCalculatorMonth");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, month);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				c = new Calculator();
				
				c.setCheckIn(rs.getString("CHECKIN_DATE"));
				c.setCheckOut(rs.getString("CHECKOUT_DATE"));
				c.setPrice(rs.getInt("PRICE"));
				c.setPriceEndDate(rs.getString("PRICE_END_DATE"));
				c.setUserName(rs.getString("USER_NAME"));

				list.add(c);
			}
			System.out.println("dao"+list);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

}
