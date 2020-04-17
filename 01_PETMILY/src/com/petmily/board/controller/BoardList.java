package com.petmily.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmily.board.model.vo.PetSitterBoard;
import com.petmily.board.model.vo.PlusOptionService;
import com.petmily.board.service.BoardService;
import com.petmily.pet.model.vo.PetInfo;
import com.petmily.petsitter.model.vo.PetSitter;
import com.petmily.petsitter.model.vo.PetSitterCertificate;
import com.petmily.review.model.vo.ReviewPetSitter;
import com.petmily.user.model.vo.User;

/**
 * Servlet implementation class BoardList
 */
@WebServlet("/BoardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		int boardCode = Integer.parseInt(request.getParameter("boardCode"));
//		String userId = (String)request.getParameter("userId");
		String userId = ((User)session.getAttribute("loginUser")).getUserId();
		
		PetSitterBoard sitterBoardT = new BoardService().getPetSitterBoardT(boardCode);		
		String sitterId = sitterBoardT.getUserId();
		PetSitter sitterT = new BoardService().getPetSitterT(sitterId);
		User userInfoT = new BoardService().getUserInfoT(sitterId);
		
//		String sitterName = new BoardService().getSitterName(sitterId);
		
		// bookmark check 여부 / check 시 true 
		boolean bookmark = new BoardService().bookmark(userId, sitterId);
		
		// 자격증 보유여부 / 보유 시 true
		boolean certificateFlag = new BoardService().getCertificateFlag(sitterId);
		
		
		// 자격증 보유시 자격증에 대한 정보들 list로 가져옴(다수일 가능성 => list 사용)
		if(certificateFlag) {
			List<PetSitterCertificate> certificateT = new BoardService().getCertificate(sitterId);
			request.setAttribute("certificateT", certificateT);
		}
		
		// 펫시터에 대한 리뷰 테이블 / 답글 포함
		List<ReviewPetSitter> reviews = new BoardService().getReviews(sitterId);
		
		// 기본제공 서비스
		List<String> defaultServiceList = new BoardService().getDefaultService(boardCode);
		List<PlusOptionService> pOServiceList = new BoardService().getPOService(boardCode);
		
		// 게시글 이미지
		List<String> boardImgs = new BoardService().getBoardImg(boardCode);
		
		// 사용자의 pet 정보
		List<PetInfo> petsST = new BoardService().getPetInfoT(userId);
		
		
		request.setAttribute("bookmark", bookmark);
		request.setAttribute("boardT", sitterBoardT);
		request.setAttribute("certificateFlag", certificateFlag);
		
		request.setAttribute("userId", userId);
		request.setAttribute("sitterT", sitterT);
		request.setAttribute("userInfoT", userInfoT);
		
		request.setAttribute("dsList", defaultServiceList);
		request.setAttribute("pOServiceList", pOServiceList);
		request.setAttribute("userId", userId);
		request.setAttribute("boardImgs", boardImgs);
		request.setAttribute("reviews", reviews);
		
		request.setAttribute("petsInfo", petsST);
		
		request.getRequestDispatcher("/views/board/boardListDetail.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
