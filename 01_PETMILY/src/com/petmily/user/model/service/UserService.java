package com.petmily.user.model.service;

import static com.petmily.common.JDBCTemplate.commit;
import static com.petmily.common.JDBCTemplate.close;
import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.petmily.user.model.dao.UserDao;
import com.petmily.user.model.vo.PetSitter2;
import com.petmily.user.model.vo.User;
import com.petmily.user.model.vo.UserBookMark;
import com.petmily.user.model.vo.UserBookMarkBoard;

public class UserService {
//	�쑀���� �뿰愿��엳�뒗 �꽌鍮꾩뒪 �쁺�뿭
	
	private UserDao dao = new UserDao();
	
	public int insertSitter(PetSitter2 pss) {
		Connection conn=getConnection();
		int result=dao.insertUserTable(conn,pss);
	    if(result>0) {
	    	result=dao.insertUserPetSitter(conn, pss);
	    	if(result>0) {
	    		result=dao.insertPetSitterCertificate(conn, pss);
	    		if(result>0) {
	    			result=dao.insertResidenceType(conn, pss);
	    			if(result>0) {
	    				commit (conn);
	    			}else {
		    			rollback(conn);
		    		}
	    		}else {
	    			rollback(conn);
	    		}
	    	}else{
	    		rollback(conn);
	    	}
	    	}else{
	    		rollback(conn);
	    	}
			return result;
	    }
	
	
//	로그인 로직
	public User userSelect(String user_id, String password) {
		Connection conn = getConnection();
		User user = dao.userSelect(conn, user_id, password);
		close(conn);
		return user;
	}
	
//	아이디 중복확인 로직
	public boolean userIdDuplicate(String userId) {
		Connection conn = getConnection();
		boolean flag = dao.userIdDuplicate(conn, userId);
		close(conn);
		return flag;
	}
	
//	휴대폰 중복확인 로직
	public boolean phoneDuplicate(String phone) {
		Connection conn = getConnection();
		boolean flag = dao.phoneDuplicate(conn, phone);
		close(conn);
		return flag;
	}
	
//	이메일 중복확인 로직
	public boolean emailDuplicate(String email) {
		Connection conn = getConnection();
		boolean flag = dao.emailDuplicate(conn, email);
		close(conn);
		return flag;
	}
	
//	회원가입 로직
	public int userJoin(String id, String password, String name, String bday, String phone, String post, String address, String detailedAddress, String email, String gender) {
		Connection conn = getConnection();
		int result = dao.userJoin(conn, id, password, name, bday, phone, post, address, detailedAddress, email, gender);
		close(conn);
		return result;
	}
	
	
	
//	------------------------------------------------
	
//	마이페이지 이동 로직
	public User userSelect(String id) {
		Connection conn = getConnection();
		User u = dao.userSelect(conn, id);
		close(conn);
		return u;
	}
	
//	회원정보 수정 로직
	public int userUpdate(String id, String newPw, String email, String phone, String postNum, String address, String detailAddress) {
		Connection conn = getConnection();
		int result = dao.userUpdate(conn, id, newPw, email, phone, postNum, address, detailAddress);
		
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
//	회원정보 삭제 로직
	public int userDelete(String id) {
		Connection conn = getConnection();
		int result = dao.userDelete(conn, id);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
//	북마크 로직
	public List<UserBookMarkBoard> userBookMarkList(String id, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<UserBookMarkBoard> list = dao.userBookMarkBoard(conn, id, cPage, numPerPage);
		close(conn);
		return list;
	}
	
//	북마크 목록 페이징 처리 로직
	public int selectBoardCount(String id) {
		Connection conn = getConnection();
		int count = dao.selectBoardCount(conn, id);
		close(conn);
		return count;
	}

	// API 이메일을 받아서 로그인
	public User apiLogin(String userEmail) {
		Connection conn = getConnection();
		User user = dao.userApiLogin(conn, userEmail);
		close(conn);
		return user;
	}
	
	
	
}
