package com.petmily.bline.service;

import java.sql.Connection;

import static com.petmily.common.JDBCTemplate.close;
import static com.petmily.common.JDBCTemplate.commit;
import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.rollback;

import com.petmily.bline.model.dao.BlineDao;

public class BlineService {
	
	private BlineDao dao = new BlineDao();
	
	public int blineCount(String userId, int boardCode) {
		Connection conn = getConnection();
		int count = dao.blineCount(conn, userId, boardCode);
		close(conn);
		return count;
	}
	
	public boolean blineRequestInsert(String userId, int boardCode, String blineText) {
		Connection conn = getConnection();
		boolean result = dao.blineRequestInsert(conn, userId, boardCode, blineText);
		
		if(result)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		
		return result;
		
	}
	
	
	
	

}
