package com.petmily.petsitterReview.service;

import static com.petmily.common.JDBCTemplate.close;
import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.commit;
import static com.petmily.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.petmily.petsitterReview.model.dao.PetSitterReviewDao;
import com.petmily.petsitterReview.model.vo.PetSitterReview;


public class PetSitterReviewService {
	
	private PetSitterReviewDao dao=new PetSitterReviewDao();
	
	public List<PetSitterReview> selectPetSitterReviewList(String id){
		
		Connection conn=getConnection();
		List<PetSitterReview> list=dao.selectPetSitterReviewList(conn,id);
		
		close(conn);
		//System.out.println(list);
		return list;
		
	}
	
	public PetSitterReview selectPetSitterReviewDetail(int no) {
		
		Connection conn=getConnection();
		PetSitterReview psr=dao.selectPetSitterReviewDetail(conn,no);
		
		close(conn);
		//System.out.println(list);
		return psr;
	}
	
	public boolean replyUpdate(int reviewNo, String replyCon) {
		Connection conn = getConnection();
		boolean result = dao.replyUpdate(conn, reviewNo, replyCon);
		
		if(result)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		return result;
	}
}
