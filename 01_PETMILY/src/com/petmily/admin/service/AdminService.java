package com.petmily.admin.service;

import static com.petmily.common.JDBCTemplate.close;
import static com.petmily.common.JDBCTemplate.commit;
import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.petmily.admin.model.dao.AdminDao;
import com.petmily.admin.model.vo.AdminPetsitter;
import com.petmily.admin.model.vo.AdminQuestion;
import com.petmily.admin.model.vo.AdminUser;
import com.petmily.admin.model.vo.ApplyUser;
import com.petmily.admin.model.vo.ApplyUserData;
import com.petmily.admin.model.vo.User;

public class AdminService {
	
	AdminDao dao = new AdminDao();
	
	public ArrayList<AdminUser> userList(int cPage, int numPerPage, String type) {
		
		Connection conn = getConnection();
		
		ArrayList<AdminUser> list = dao.userList(conn, cPage, numPerPage, type);
		close(conn);
		return list;
	}

	public int boardCount() {
		Connection conn = getConnection();
		int count = dao.userCount(conn);
		close(conn);
		return count;
	}

	public ArrayList<ApplyUser> applyList(int cPage, int numPerPage, String type) {
		Connection conn = getConnection();
		
		ArrayList<ApplyUser> list = dao.applyList(conn, cPage, numPerPage, type);
		close(conn);
		return list;
	}

	public int applyCount() {
		Connection conn = getConnection();
		int count = dao.applyCount(conn);
		close(conn);
		return count;
	}

	public ApplyUserData applyUser(String userId) {
		Connection conn = getConnection();
		ApplyUserData aud = dao.applyUserData(conn,userId);
		aud = dao.applyUserResVal(conn,aud);
		aud = dao.applyUserCerVal(conn,aud);
		close(conn);
		return aud;
	}

	public User userData(String userId) {
		Connection conn = getConnection();
		User u = dao.userData(conn, userId);
		close(conn);
		return u;
	}

	public int applyUpdate(String type, String userId) {
		Connection conn = getConnection();
		int result = dao.applyUpdate(conn, type, userId);
		if(result>0) {
			result = dao.applyCheck(conn, userId);
			// check에서 자격증 있는지 없는지 조회 후 user_pet_sitter테이블 업데이트
			result = dao.applyUpdateEnd(conn, type, userId, result);
			if(result>0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
		} else {
			rollback(conn);
		}
		return result;
	}

	public ArrayList<ApplyUser> cancelList(int cPage, int numPerPage, String type) {
		Connection conn = getConnection();
		ArrayList<ApplyUser> list = dao.cancelList(conn, cPage, numPerPage, type);
		close(conn);
		return list;
	}

	public int cancelCount() {
		Connection conn = getConnection();
		int count = dao.cancelCount(conn);
		close(conn);
		return count;
	}

	public ArrayList<AdminPetsitter> petsitterList(int cPage, int numPerPage, String type) {
		Connection conn = getConnection();
		ArrayList<AdminPetsitter> list = dao.petsitterList(conn, cPage, numPerPage, type);
		close(conn);
		return list;
	}

	public int petsitterCount() {
		Connection conn = getConnection();
		int count = dao.petsitterCount(conn);
		close(conn);
		return count;
	}

	public ArrayList<AdminPetsitter> petsitterCer(String userId) {
		Connection conn = getConnection();
		ArrayList<AdminPetsitter> list = dao.petsitterCer(conn, userId);
		close(conn);
		return list;
	}

	public ArrayList<AdminQuestion> question(int cPage, int numPerPage, String type) {
		Connection conn = getConnection();
		ArrayList<AdminQuestion> list = dao.question(conn, cPage, numPerPage, type);
		close(conn);
		return list;
	}

	public int questionCount() {
		Connection conn = getConnection();
		int count = dao.questionCount(conn);
		close(conn);
		return count;
	}

	public ArrayList adminMyPage() {
		Connection conn = getConnection();
		ArrayList<ArrayList> list = new ArrayList<ArrayList> ();
		list.add(dao.petsitterApply(conn));
		list.add(dao.userQuestion(conn));
		close(conn);
		return list;
	}

}
