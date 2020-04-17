package com.petmily.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.user.model.service.UserService;
import com.petmily.user.model.vo.User;


@WebServlet("/joinEnd")
public class UserJoinEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserJoinEndServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		회원가입 로직
//		클라이언트가 입력한 값을 받아와서 DB에 저장한다
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("user_Id"); // 유저 아이디
		String password = request.getParameter("password"); // 유저 비밀번호
		String name = request.getParameter("user_name"); // 유저 이름
		String bday = request.getParameter("user_birth_day"); // 유저 생년월일		
		String phone = request.getParameter("phone"); // 유저 휴대폰 번호
		String post = request.getParameter("postNum"); // 유저 우편변호
		String address = request.getParameter("streetAddress"); // 유저 주소
		String detailedAddress = request.getParameter("addressInput"); // 유저 상세주소
		String email = request.getParameter("email"); // 유저 이메일
		String gender = request.getParameter("gender"); // 유저 성별
		
		System.out.println("회원가입 id :" + id);
		System.out.println("회원가입 pw :" + password);
		System.out.println("회원가입 bday :" + bday);
		System.out.println("회원가입 phone :" + phone);
		System.out.println("회원가입 post :" + post);
		System.out.println("회원가입 address :" + address);
		System.out.println("회원가입 detailedAddress :" + detailedAddress);
		System.out.println("회원가입 email :" + email);
		System.out.println("회원가입 gender :" + gender);
		
		int result = new UserService().userJoin(id, password, name, bday, phone, post, address, detailedAddress, email, gender);
		
		
//		응답페이지 작성
		String msg = "";
		String loc = "";
		if(result > 0) {
			// 회원가입 성공
			msg = "회원가입에 성공하였습니다. 메인화면으로 이동합니다.";
			loc = "/";
		}
		else {
			// 회원가입 실패 
			msg = "회원가입에 실패했습니다. 다시 진행하세요.";
			loc = "/join";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
