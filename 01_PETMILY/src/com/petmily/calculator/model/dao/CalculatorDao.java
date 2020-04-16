package com.petmily.calculator.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.Properties;

import com.petmily.reservation.model.vo.PetReservation;
import com.petmily.userReview.model.vo.UserReview;


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
	
	public List<PetReservation> selectCalculator (Connection conn,String userId){
		
		
	}

}
