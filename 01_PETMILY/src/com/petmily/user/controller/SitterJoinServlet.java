package com.petmily.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/apply/joinChange")
public class SitterJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SitterJoinServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		펫시터 지원 - 회원가입 화면으로 이동하는 로직
		request.getRequestDispatcher("/views/sitter/sitterJoin.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
