package com.petmily.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmily.reservation.model.vo.PetReservation;
import com.petmily.reservation.service.ReservationService;

/**
 * Servlet implementation class UserReservationEndsServlet
 */
@WebServlet("/user/endRev")
public class UserReservationEndsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReservationEndsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int code = Integer.parseInt(request.getParameter("no"));
		System.out.println("들어옵ㅇㅇㅇ"+code);
		PetReservation pr = new ReservationService().endRev(code);
		System.out.println("서블릿ㅇㅇㅇ"+pr.getReservationCode());
		request.setAttribute("pr", pr);
		request.getRequestDispatcher("/views/userReservation/endPop.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
