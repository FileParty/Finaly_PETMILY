package com.petmily.petsitter.settled.model.dao;

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

import com.petmily.petsitter.settled.model.vo.PetReservation;
import com.petmily.user.model.dao.UserDao;
import com.petmily.user.model.vo.UserBookMarkBoard;

public class SitterDao {
	private Properties prop = new Properties();
	
//	기본 생성자에 파일 경로 불러오는 것 설정하기.
	public SitterDao() {
		try {
//			정산 파일에 넣어둠
			String path = UserDao.class.getResource("/sql/petsitterMypageReservation/petsitterMypageReservation-properties").getPath();
			prop.load(new FileReader(path));
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}// SitterDao
	
	
//	펫시터 마이페이지 - 이전 정산보기 로직
	public List<PetReservation> settledList(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PetReservation pr = null;
		List<UserBookMarkBoard> list = new ArrayList();
		String sql = prop.getProperty("sitterSettledList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			System.out.println("dao의 id :"+id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				pr = new PetReservation();
				pr.setReservationCode(rs.getInt("reservation_code")); // 예약 테이블코드
				pr.setCheckOutDate(rs.getDate("checkout_date")); // 체크아웃 날짜
				pr.setPrice(rs.getInt("price")); // 최종 정산금액
				pr.setFees(rs.getInt(""));
				
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
}
