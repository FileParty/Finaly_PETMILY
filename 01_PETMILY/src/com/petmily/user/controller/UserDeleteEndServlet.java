package com.petmily.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.user.model.service.UserService;


@WebServlet("/user/DeleteEnd")
public class UserDeleteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserDeleteEndServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		회원정보 삭제하는 로직
		String id = request.getParameter("userId"); // 유저 아이디
		
//		회원탈퇴하기 위한 service 연결
		int result = new UserService().userDelete(id); // 결과값 int형
		
//		응답페이지 구성
		String msg = "";
		String loc = "";
		
		if(result>0) {
//			회원탈퇴 완료
			msg = "회원탈퇴 처리가 완료되었습니다.";
//			로그아웃 처리가 되면서 메인화면으로 전환한다
			loc = "/log-out"; // 로그아웃 처리가 되어야 한다.  (중요)
		}
		else {
//			회원탈퇴 실패
			msg = "회원탈퇴 처리가 실패되었습니다.";
//			회원탈퇴 화면으로 보낸다
			loc = "/user/Delete?userId="+id; // 유저아이디와 반드시 같이 보낸다
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
