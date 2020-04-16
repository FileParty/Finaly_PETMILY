package com.petmily.petsitter.settled.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.petsitter.settled.model.service.sitterService;
import com.petmily.user.model.vo.User;


@WebServlet("/sitter/settledEnd")
public class PetSitterSettledEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PetSitterSettledEndServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		펫시터 마이페이지 - 이전 정산보기 리스트 가져오는 기능
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser"); // 로그인한 유저의 계정(펫시터)
		boolean flag = loginUser.getUserType().equals("펫시터");
		
		if(flag) {
//			사용자 타입이 '펫시터'인 유저가 맞다면, dao에 접근하여 리스트를 가져오라.
			String id = loginUser.getUserId();
			List<> = new sitterService().settledList(id);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
