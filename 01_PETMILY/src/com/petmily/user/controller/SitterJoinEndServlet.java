package com.petmily.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


import com.petmily.user.model.vo.PetSitter2;


/**
 * Servlet implementation class SitterJoinServlet
 */
@WebServlet("/apply/join")
public class SitterJoinEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitterJoinEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "글작성 오류! [form:encType]");
			request.setAttribute("loc", "/apply");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path = getServletContext().getRealPath("/upload/sitter/");
		int maxSize=1024*1024*10;
		
		//db에 저장할 값을 받아오기.
		
		MultipartRequest mr = new MultipartRequest(request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		String id = mr.getParameter("user_id"); //펫시터 아이디
		String password = mr.getParameter("password"); //펫시터 비번
		String file = mr.getFilesystemName("upload"); //펫시터 프로필 이미지
		String name = mr.getParameter("user_name"); //펫시터 이름
		String gender = mr.getParameter("gender");//성별
		String bday = mr.getParameter("user_birth_day"); //펫시터 생일
		String email = mr.getParameter("email");//펫시터 이메일
		String phone = mr.getParameter("phone");//펫시터 핸드폰 번호
		String post = mr.getParameter("postNum");// 펫시터 우편 번호
		String address = mr.getParameter("address");//펫시터 주소
		String detail = mr.getParameter("detail");// 펫시터 상세 주소
		String bank = mr.getParameter("bank");// 펫시터 계좌 은행명
		String account = mr.getParameter("account"); //펫시터 계좌번호
		String accountName = mr.getParameter("accountName");//펫시터 예금주
		String certificate = mr.getParameter("certificate");//자격증 유무
		String certiName = mr.getParameter("certiName");//펫시터 자격증 명
		String certiAgency = mr.getParameter("certiAgency"); //펫시터 자격증 인증기관
		String certiday = mr.getParameter("certiday");//펫시터 자격증 취득일자.
		String expireday = mr.getParameter("expireday"); //펫시터 자격증 만료일자.
		String limg = mr.getFilesystemName("liupload"); //펫시터 자격증 이미지
		String type = mr.getParameter("type");//사용자 타입 : 미승인펫시터
		
		
		PetSitter2 pss=
				new PetSitter2(id, password, file, name, email, bday, gender, phone, post, address, detail, 
						bank, account, accountName, certificate, certiName, certiAgency, 
						certiday, expireday, limg, type, null, null, null, null, null);
		
//		pss.setPetsitterId(id);
//		pss.setPassword(password);
//		pss.setSitterImg(file);
//		pss.setSitterName(name);
//		pss.setSitterGender(gender);
//		pss.setSitterBday(bday);
//		pss.setSitterEmail(email);
//		pss.setSitterPhone(phone);
//		pss.setPostCode(post);
//		pss.setSitterAddress(address);
//		pss.setAddressDetail(detail);
//		pss.setBankName(bank);
//		pss.setAccountNo(account);
//		pss.setAccountOwner(accountName);
//		pss.setCertificateYN(certificate);
//		pss.setCertificateName(certiName);
//		pss.setIssuingOrg(certiAgency);
//		pss.setCertiGetDate(certiday);
//		pss.setCertiEndDate(expireday);
//		pss.setCertiImg(limg);
//		pss.setType(type);
		
		System.out.println(pss);
		
		HttpSession session=request.getSession();
		session.setAttribute("petsitter", pss);
		RequestDispatcher rd=request.getRequestDispatcher("/views/sitter/sitterApplyForm.jsp");
		rd.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
