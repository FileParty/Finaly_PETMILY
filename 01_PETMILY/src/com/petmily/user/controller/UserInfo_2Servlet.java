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


@WebServlet("/user/Info")
public class UserInfo_2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserInfo_2Servlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		새로 다시 만든 일반사용자 - 마이페이지
//		/user/Info 매핑값으로 처리한 서블릿이 많아서... 이렇게 하나 더 서블릿을 만들게 됨.!!! 2020.04.17

		
//		사용자 마이페이지 화면을 전환하는 기능
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
			System.out.println("마이페이지에 들어오는 id값 확인 : "+id);
			
//			DB에서 id와 동일한 정보를 가져온다
			User u = new UserService().userSelect(id);
			
//			가져온 데이터 저장
			request.setAttribute("user", u);
			request.getRequestDispatcher("/views/user/userInfo.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
