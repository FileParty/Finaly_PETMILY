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

/**
 * Servlet implementation class PetSitterReviewDetailServlet
 */
@WebServlet("/sitter/reviewDetail")
public class PetSitterReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetSitterReviewDetailServlet() {
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
		int no = Integer.parseInt(request.getParameter("no"));
		PetSitterReview psr =new PetSitterReviewService().selectPetSitterReviewDetail(no);
		request.setAttribute("psr", psr);
		request.getRequestDispatcher("/views/sitter/sitterReviewDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
