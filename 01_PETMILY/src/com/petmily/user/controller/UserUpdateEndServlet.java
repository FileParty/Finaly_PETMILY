package com.petmily.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.user.model.service.UserService;
import com.petmily.user.model.vo.User;


@WebServlet("/user/UpdateEnd")
public class UserUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public UserUpdateEndServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		회원정보 수정하는 로직
		String id = request.getParameter("userId"); // 아이디
		String email = request.getParameter("email"); // 이메일
		String phone = request.getParameter("phone"); // 휴대번호
		String postNum = request.getParameter("postNum"); // 우편번호
		String address = request.getParameter("address"); //  도로명 주소
		String detailAddress = request.getParameter("detail"); // 상세주소
		String pw = request.getParameter("nowpw"); // 현재 비밀번호
		String newPw = request.getParameter("newpw"); // 새 비밀번호
		
		System.out.println("UserUpdateEndServlet id 값 : "+id);
		System.out.println("UserUpdateEndServlet email 값 : "+email);
		System.out.println("UserUpdateEndServlet phone 값 : "+phone);
		System.out.println("UserUpdateEndServlet postNum 값 : "+postNum);
		System.out.println("UserUpdateEndServlet address 값 : "+address);
		System.out.println("UserUpdateEndServlet detailAddress 값 : "+detailAddress);
		System.out.println("UserUpdateEndServlet pw 값 : "+pw);
		System.out.println("UserUpdateEndServlet newPw 값 : "+newPw);
		
//		정보 수정하기 위해 service로 데이터를 보낸다(아이디, 새 비밀번호, 이메일, 휴대폰, 우편번호, 도로명주소, 상세주소
		int result = new UserService().userUpdate(id, newPw, email, phone, postNum, address, detailAddress);
		
//		응답페이지
		String msg = "";
		String loc = "";
		
//		저장이 잘 되었는지에 대한 안내글 로직
		if(result>0) {
			msg = "회원정보가 수정되었습니다";
			// 일반 사용자 마이페이지 - 대시보드 화면으로 전환하는 기능을 가진 서블릿으로 이동하는 매핑값
			loc = "/common/Info?userId="+id; 
		}
		else {
			msg = "회원정보 수정이 실패되었습니다. 다시 진행해주세요.";
			// 일반 사용자 마이페이지 - 회원정보 - 회원정보 수정 화면으로 전환하는 기능을 가진 서블릿으로 이동하는 매핑값
			loc = "/user/Update?userId="+id; 
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
