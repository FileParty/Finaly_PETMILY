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


@WebServlet("/user/Update")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserUpdateServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		회원정보 수정하는 화면으로 전환
//		로그인 된 유저만 사용할 수 있도록 조건을 걸어야 한다.
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")==null) { // 로그인 로직에서 set 처리 완료
//			잘못된 접근 처리
			request.setAttribute("msg","잘못된 접근입니다.");
			request.setAttribute("loc", ""); // 메인으로 이동
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		else {
			String id = request.getParameter("userId");
			System.out.println("회원정보수정 화면으로 이동하기 위해 확인하는 id 값 : "+id);
			
//			북마크 테이블 가져오기
//			DB에서 id와 동일한 정보를 가져온다
//			아이디가 현재 로그인된 아이디인 계정의 북마크된 내용을 가져온다.
			User u = new UserService().userSelect(id);
			System.out.println("정보수정하기 위해 먼저 뿌려져야 하는 회원정보. dao에서 user값을 잘 가져왔는가? : "+u);
			
//			가져온 내용을 저장하고 아이디값과 함께 매핑값을 보낸다.
			request.setAttribute("user", u);
			request.getRequestDispatcher("/views/user/userUpdateInfo.jsp").forward(request, response);
			
		}
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
