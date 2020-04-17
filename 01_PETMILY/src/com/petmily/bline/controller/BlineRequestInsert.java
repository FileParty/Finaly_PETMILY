package com.petmily.bline.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.bline.service.BlineService;
import com.petmily.petsitterReview.service.PetSitterReviewService;

/**
 * Servlet implementation class BlineRequest
 */
@WebServlet("/blineRequestInsert.do")
public class BlineRequestInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlineRequestInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String userId = request.getParameter("userId");
		int boardCode = Integer.parseInt(request.getParameter("boardCode"));
		String blineText = request.getParameter("blineText");
		
		int count = new BlineService().blineCount(userId, boardCode);
		
		if(count>0) {
			response.getWriter().write("c");
			
		}else {
		
			boolean result = new BlineService().blineRequestInsert(userId, boardCode, blineText);
			
			
			if(result) {
				response.getWriter().write("t");
			}else {
				response.getWriter().write("f");
			}
		
		}
		
		
			
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
