package com.petmily.pet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.pet.model.vo.Pet;
import com.petmily.pet.service.PetService;
import com.petmily.user.model.service.UserService;
import com.petmily.user.model.vo.UserBookMarkBoard;

/**
 * Servlet implementation class PetProfileServlet
 */
@WebServlet("/user/petprofile")
public class PetProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		HttpSession session = request.getSession();
		
//		if(session.getAttribute("loginUser")==null) {
////			잘못된 접근 처리
//			request.setAttribute("msg","잘못된 접근입니다.");
//			request.setAttribute("loc", ""); // 메인으로 이동
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//		}
//		else {
			String id = request.getParameter("userId");
			id = "sebin";
			System.out.println("회원정보수정 화면으로 이동하기 위해 확인하는 id 값 : "+id);
//			
////			DB에서 id와 동일한 정보를 가져온다
			List<Pet> list = new PetService().petProfile(id);
			System.out.println("회원 펫 정보 : "+list);
			System.out.println(id);
			
////			가져온 내용을 저장하고 아이디값과 함께 매핑값을 보낸다.
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/user/petProfile.jsp").forward(request, response);
		}
			
	//		
//		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
