package com.petmily.petsitter.certificate.service;

import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.close;
import static com.petmily.common.JDBCTemplate.commit;
import static com.petmily.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.petmily.petsitter.certificate.model.dao.SitterCertificateDao;
import com.petmily.petsitter.model.vo.PetSitterCertificate;

public class SitterCertificateService {
	
	private SitterCertificateDao dao = new SitterCertificateDao();
	
	public List<PetSitterCertificate> selectCertificate(String id) {
		Connection conn = getConnection();
		List<PetSitterCertificate> list = dao.selectCertificate(conn,id);
		 close(conn);
		 return list;
	}
	public List<PetSitterCertificate> selectCertificate2(String id) {
		Connection conn = getConnection();
		List<PetSitterCertificate> list = dao.selectCertificate2(conn,id);
		 close(conn);
		 return list;
	}
	
	public int insertCertificate(PetSitterCertificate pc) {
		Connection conn = getConnection();
		int result = dao.insertCertificate(conn,pc);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
