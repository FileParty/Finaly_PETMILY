package com.petmily.petsitterReview.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.petsitterReview.model.vo.PetSitterReview;
import com.petmily.petsitterReview.service.PetSitterReviewService;
import com.petmily.userReview.model.vo.UserReview;
import com.petmily.userReview.service.UserReviewService;

/**
 * Servlet implementation class PetSitterReviewServlet
 */
@WebServlet("/sitter/review")
public class PetSitterReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetSitterReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("userId");
		id = "petsitter1";
		List<PetSitterReview> list=new PetSitterReviewService().selectPetSitterReviewList(id);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/sitter/sitterReview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
