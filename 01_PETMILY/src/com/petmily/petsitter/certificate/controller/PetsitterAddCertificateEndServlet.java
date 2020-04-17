package com.petmily.petsitter.certificate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.petmily.petsitter.certificate.service.SitterCertificateService;
import com.petmily.petsitter.model.vo.PetSitterCertificate;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class PetsitterAddCertificateEndServlet
 */
@WebServlet("/sitter/AddCertificateEnd")
public class PetsitterAddCertificateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterAddCertificateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path = getServletContext().getRealPath("/upload/board");
		int maxSize = 1024*1024*10;
		MultipartRequest mr = new MultipartRequest(request, path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		 HttpSession session = request.getSession();
	     String userId = ((User)session.getAttribute("loginUser")).getUserId();
		
		
		
		String certificateName = mr.getParameter("certificateName");
		String certificationName = mr.getParameter("certificationName");
		String date = mr.getParameter("date");
		String date1 = mr.getParameter("date1");
		String file = mr.getFilesystemName("file");
			
<<<<<<< HEAD
		PetSitterCertificate pc = null;//new PetSitterCertificate(userId,certificateName,certificationName,date,date1,file,"");
		int result = 0;//new SitterCertificateService().insertCertificate(pc);
=======
		PetSitterCertificate pc = new PetSitterCertificate(userId,certificateName,certificationName,date,date1,file,"");
		int result = new  SitterCertificateService().insertCertificate(pc);
>>>>>>> refs/heads/ysk
		
		String msg = "";
		String loc = "";
		if(result > 0) {
			msg = "자격증이 추가 되었습니다.";
			loc = "/views/petsitterMypage/petSitterInfo.jsp";
		}else {
			msg = "자격증 추가를 실패했습니다.";
			loc = "/views/userReservation/addCertificate.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
