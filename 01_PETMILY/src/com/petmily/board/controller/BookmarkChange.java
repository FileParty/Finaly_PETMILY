package com.petmily.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.petmily.board.service.BoardService;

/**
 * Servlet implementation class BookmarkChange
 */
@WebServlet("/BookmarkChange.do")
public class BookmarkChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookmarkChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		boolean bFlag = Boolean.parseBoolean(request.getParameter("bookmarkFlag"));
		String userId = request.getParameter("userId");
		String sitterId = request.getParameter("sitterId");
		
		
		
		if(bFlag) {
			new BoardService().bookmarkDelete(userId, sitterId);
			response.getWriter().write("t");
		}else {
			new BoardService().bookmarkAdd(userId, sitterId);
			response.getWriter().write("f");
		}
		
//		new Gson().toJson(!bFlag,response.getWriter());
		
		// bFlag == false면  true로 변경!
//		request.setAttribute("bFlag", !bFlag);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
