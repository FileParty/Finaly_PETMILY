package com.petmily.userReview.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.userReview.service.UserReviewService;


@WebServlet("/user/reviewDetail")
public class UserReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserReviewDetailServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		[회원정보]-[작성후기]에서 작성글보기 눌렀을 때 화면이 전환된다.
		String id = request.getParameter("userId");
		String pstId = request.getParameter("PetsitterId");
		
		boolean flag = new UserReviewService().selectUserReviewDetail(id, pstId);
		
//		가져온 값 저장
		request.setAttribute("flag", flag);
		
//		응답페이지 구성
		request.getRequestDispatcher("/views/board/boardListDetail.jsp").forward(request, response); // 여기서 에러남 처리못함(2020.04.14 오후 8:29)
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
