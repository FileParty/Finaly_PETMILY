package com.petmily.reservation.service;

import static com.petmily.common.JDBCTemplate.close;
import static com.petmily.common.JDBCTemplate.commit;
import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.petmily.pet.model.vo.Pet;
import com.petmily.reservation.model.dao.ReservationDao;
import com.petmily.reservation.model.vo.PetReservation;
import com.petmily.reservation.model.vo.ReservationPetCode;

public class ReservationService {
	
	  private ReservationDao dao = new ReservationDao();
	  
	  public List<PetReservation> requestRev(String id) {
		  Connection conn = getConnection();
		  List<PetReservation> list = dao.requestRev(conn,id);
		  for(int i=0;i<list.size();i++){
		  			list.set(i,dao.requestRevs(conn, id,list.get(i)));
		  			
		  }
		  System.out.println("서비스:"+list);
		  close(conn);
		  return list;

	  }
	  
	  public int requestCancel(int[] as) {
		  Connection conn = getConnection();
		  int result = 0;
		  for(int i=0;i<as.length;i++) {
			  result = dao.requestCancel(conn,as[i]);
		  }
		  if(result>0) commit(conn);
		  else rollback(conn);
		  return result;
	  }
	  
	  public List<PetReservation> reservation(String id) {
		  Connection conn = getConnection();
		  List<PetReservation> list = dao.reservation(conn,id);
		  for(int i=0;i<list.size();i++) {
			  list.set(i,dao.reservations(conn, id,list.get(i)));
		  }
		  System.out.println("플러스"+list);
		  
		  close(conn);
		 
		  return list;
	  }
	  
	  public PetReservation requestDetail(String id,int code) {
		  Connection conn = getConnection();
		  PetReservation pr = dao.requestDetail(conn,id,code);
		  close(conn);
		  return pr;
	  }
	  
	  public PetReservation requestDetails(String id) {
		  Connection conn = getConnection();
		  PetReservation pr = dao.requestDetails(conn,id);
		  close(conn);
		  return pr;
	  }
	  
	  public PetReservation addPay(int revNo) {
		  Connection conn = getConnection();
		  PetReservation pr = dao.addPay(conn,revNo);
		  close(conn);
		  return pr;
	  }
	  
	  public boolean insertReservation(PetReservation pr, List<ReservationPetCode> pcrList) {
		  Connection conn = getConnection();
		  
		  int codeHap1 = dao.getReservationCodesHap(conn);
		  
		  boolean result = dao.insertReservation(conn, pr);
		  		  
		  if(result) {
			  int codeHap2 = dao.getReservationCodesHap(conn);
			  
			  int reservationCode = codeHap2-codeHap1;
			  
			  result = dao.insertReservationSub(conn, pcrList, reservationCode);
			  
			  if(result)
				  commit(conn);
			  else
				  rollback(conn);
		  }
		  else
			  rollback(conn);
		  
		  close(conn);
		  
		  return result;
	  }
	  
	  public int getReservationCodesHap() {
		  Connection conn = getConnection();
		  int codeHap = dao.getReservationCodesHap(conn);
		  close(conn);
		  return codeHap;
		  
	  }
	  
	  public List<PetReservation> reservationEnd(String id) {
		  Connection conn = getConnection();
		  List<PetReservation> list = dao.reservationEnd(conn,id);
		  for(int i=0;i<list.size();i++){
		  			list.set(i,dao.reservationEnds(conn, id,list.get(i)));
		  			
		  }
		  System.out.println("dao:"+list);
		  close(conn);
		  return list;
	  }
	  
	  public PetReservation endRev(int code) {
		  Connection conn = getConnection();
		  PetReservation pr = dao.endRev(conn,code);
		  close(conn);
		  return pr;
	  }
	  
	  public int endSitting(int code) {
		  Connection conn = getConnection();
		  int result = dao.endSitting(conn,code);
		  if(result>0) {
			  result = dao.endSitting2(conn, code);
			  if(result>0) {
				  commit(conn);
			  }else {
				  rollback(conn);
			  }		 
			  }else {
				  rollback(conn);
			  }

		  close(conn);
		  return result;
	  }
	  
}
