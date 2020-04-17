package com.petmily.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.user.model.service.UserService;
import com.petmily.user.model.vo.User;


@WebServlet("/user/Delete")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserDeleteServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		회원정보 - 회원탈퇴 화면으로 전환하는 기능
//		로그인 한 유저만 사용할 수 있도록 처리한다.
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser")==null) { // 로그인한 값이 없으면(로그인 안함)
//			잘못된 접근 처리
			request.setAttribute("msg","잘못된 접근입니다.");
			request.setAttribute("loc", ""); // 메인으로 이동
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		else { // 로그인한 값이 있으면(로그인 함)
//			페이지 전환
			String id = request.getParameter("userId");
			System.out.println("회원탈퇴하기 위해 가져온 id값 확인 : "+id);
			
//			DB에서 id와 동일한 정보를 가져온다
			User u = new UserService().userSelect(id);
			System.out.println("회원탈퇴하기위한 유저정보. dao에서 user값을 잘 가져왔는가? : "+u);
			
//			가져온 데이터 저장
			request.setAttribute("user", u);
			
//			회원탈퇴 화면으로 전환
			request.getRequestDispatcher("/views/user/UserDelete.jsp").forward(request, response);
			
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
