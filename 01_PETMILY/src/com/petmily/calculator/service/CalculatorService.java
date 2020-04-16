package com.petmily.calculator.service;

import static com.petmily.common.JDBCTemplate.close;
import static com.petmily.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.petmily.calculator.model.dao.CalculatorDao;
import com.petmily.calculator.model.vo.Calculator;



public class CalculatorService {
	private CalculatorDao dao=new CalculatorDao();
	
	public List<Calculator> selectCalculator (String userId){
		
		Connection conn=getConnection();
		List<Calculator> list=dao.selectCalculator(conn,userId);
		
		close(conn);
		//System.out.println(list);
		return list;
		
	}
	
	public List<Calculator> selectCalculatorMonth(String userId,int month){
		
		Connection conn=getConnection();
		List<Calculator> list=dao.selectCalculator(conn,userId,month);
		
		close(conn);
		//System.out.println(list);
		return list;
		
	}
}
