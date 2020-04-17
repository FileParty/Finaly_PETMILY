package com.petmily.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.petmily.board.model.vo.PetSitterBoard;
import com.petmily.board.service.BoardService2;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class SitterWriterServlet
 */
@WebServlet("/sitter/writeEnd")
public class SitterWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitterWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
	    String userId = ((User)session.getAttribute("loginUser")).getUserId();
		String path = getServletContext().getRealPath("/upload/board/");
		int maxSize = 1024*1024*10;
		MultipartRequest mr = new MultipartRequest(request, path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		//게시판테이블
		String title =mr.getParameter("title");
		String intro = mr.getParameter("introduce");
		int small= 0;
		int middle=0;
		int big=0;
		int small1=0;
		int middle1=0;
		int big1=0;
		int oneWay=0;
		int allWay=0;
		int sale=0;
		int count=0;
		
		if(!(mr.getParameter("small")).equals("")) {
		 small = Integer.parseInt(mr.getParameter("small"));
		}if(!(mr.getParameter("middle")).equals("")) {
		 middle = Integer.parseInt(mr.getParameter("middle"));
		}if(!(mr.getParameter("big")).equals("")) {
			 big = Integer.parseInt(mr.getParameter("big"));
		}if(!(mr.getParameter("small1")).equals("")) {
			 small1 = Integer.parseInt(mr.getParameter("small1"));
		}if(!(mr.getParameter("middle1")).equals("")) {
			 middle1 = Integer.parseInt(mr.getParameter("middle1"));
		}if(!(mr.getParameter("big1")).equals("")) {
			 big1 = Integer.parseInt(mr.getParameter("big1"));
		}if(!(mr.getParameter("oneWay")).equals("")) {
			 oneWay = Integer.parseInt(mr.getParameter("oneWay"));
		}if(!(mr.getParameter("allWay")).equals("")) {
			 allWay = Integer.parseInt(mr.getParameter("allWay"));
		}if(!(mr.getParameter("sale")).equals("")) {
			 sale = Integer.parseInt(mr.getParameter("sale"));
		}if(!(mr.getParameter("count")).equals("")) {
			 count = Integer.parseInt(mr.getParameter("count"));
		}
		
		
		String address = mr.getParameter("map");
		String comment = mr.getParameter("comment");
		String[] pType = mr.getParameterValues("plusOption");
		String[] dType = mr.getParameterValues("defaultOption");
	
		
		String str = "";
		String file="";
		List<String> list = new ArrayList();
		List<String> plusO = new ArrayList<String>();
		List<String> defaultO = new ArrayList<String>();
		System.out.println(count);
		for(int i=0;i<count;i++) {
			str="file"+(i+1);
			file=mr.getFilesystemName(str);
			list.add(file);
			System.out.println(str);
			System.out.println(file);
		}
		for(String p : pType) {
			plusO.add(p);
		}
		for(String d : dType) {
			defaultO.add(d);
		}
		
			PetSitterBoard pb = new PetSitterBoard(0,userId,title,intro,small,middle,big,address,comment,"N","Y",small1,middle1,big1,oneWay,allWay,sale,list,defaultO,plusO);
	
		
			int result = new BoardService2().boardInsert(pb);
		String msg = "";
		String loc = "";
		if(result>0) {
		msg="게시글 등록 성공하였습니다.";
		loc="/views/petsitterMypage/petSitterInfo.jsp";
		
		}else {
			msg="게시글 등록을 실패 하였습니다.";
			loc="/views/common/msg.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
