package com.petmily.reservation.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.reservation.model.vo.PetReservation;
import com.petmily.reservation.service.ReservationService;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class UserReservationRequestServlet
 */
@WebServlet("/user/request")
public class UserReservationRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReservationRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
	    String userId = ((User)session.getAttribute("loginUser")).getUserId();
		String type = request.getParameter("type");
		
		
		List<PetReservation> list= new ReservationService().requestRev(userId);
		int num[] = new int[list.size()];
		
		if(type!=null) { 
		switch(type) {
		case "btn" : 
						Collections.sort(list,(i,j)->j.getReservationCode()-i.getReservationCode());
						request.setAttribute("list", list);
						request.getRequestDispatcher("/views/userReservation/userRequest.jsp").forward(request, response);
							break;
		case "btn1" : 
						Collections.sort(list,(i,j)->i.getReservationCode()-j.getReservationCode());
						request.setAttribute("list", list);
						request.getRequestDispatcher("/views/userReservation/userRequest.jsp").forward(request, response);
							break;
		case "btn2" : 
						Collections.sort(list,(i,j)->i.getCheckIn().compareTo(j.getCheckIn()));
						request.setAttribute("list", list);
						request.getRequestDispatcher("/views/userReservation/userRequest.jsp").forward(request, response);
							break;
		case "btn3" : 
						Collections.sort(list,(i,j)->j.getCheckIn().compareTo(i.getCheckIn()));
						request.setAttribute("list", list);
						request.getRequestDispatcher("/views/userReservation/userRequest.jsp").forward(request, response);
							break;
		case "btn4" : 
						Collections.sort(list,(i,j)->j.getPrice()-i.getPrice());
						request.setAttribute("list", list);
						request.getRequestDispatcher("/views/userReservation/userRequest.jsp").forward(request, response);
						break;
		case "btn5" :
						Collections.sort(list,(i,j)->i.getPrice()-j.getPrice());
						request.setAttribute("list", list);
						request.getRequestDispatcher("/views/userReservation/userRequest.jsp").forward(request, response);
						break;
		}
		
		}else { 
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/userReservation/userRequest.jsp").forward(request, response);
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
