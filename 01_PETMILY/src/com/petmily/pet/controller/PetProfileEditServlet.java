package com.petmily.pet.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.petmily.pet.model.vo.Pet;
import com.petmily.pet.service.PetService;

/**
 * Servlet implementation class PetProfileEditServlet
 */
@WebServlet("/user/petprofile/edit")
public class PetProfileEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetProfileEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "오류![form:encType]");
			request.setAttribute("loc","/user/petprofile");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request,response);
			return;
		}
		
		String id = (String)request.getAttribute("userId");
		id = "sebin";
		
		
		String path = getServletContext().getRealPath("/upload/pet/");
		int maxSize=1024*1024*10;
		
		MultipartRequest mr = new MultipartRequest(request,path,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		int no = Integer.parseInt(mr.getParameter("no"));
		String petName = mr.getParameter("pname");
		String petGender = mr.getParameter("gender");
		String petKind = mr.getParameter("ptype");
		String petWeight = mr.getParameter("weight");
		String petAge = mr.getParameter("pday");
		String petAffinity = mr.getParameter("friendly");
		String petNeutralization = mr.getParameter("neutral");
		String petDisease = mr.getParameter("ill");
		
		String petDiseaseTxt="";
		String petSeparationTxt="";
		String petUrineTxt="";
		String petIndoorTxt="";
		String petHowlingTxt = "";
		String detail = "";
		
		try {
			petDiseaseTxt = mr.getParameter("illexplanation");
			petSeparationTxt = mr.getParameter("aexplanation");
			petUrineTxt = mr.getParameter("mexplanation");
			petIndoorTxt = mr.getParameter("mmexplanation");
			petHowlingTxt = mr.getParameter("bexplanation");
			detail = mr.getParameter("detail");
		}catch(NullPointerException e) {
			petDiseaseTxt="";
			petSeparationTxt="";
			petUrineTxt="";
			petIndoorTxt="";
			petHowlingTxt = "";
			detail = "";
		}
		
		String petSeparation = mr.getParameter("anxiety");
		
		String petUrine = mr.getParameter("menstruation");
		
		String petIndoor = mr.getParameter("mark");
		
		String petHowling = mr.getParameter("bark");
		
		File f=mr.getFile("upload");
		
		String heartDisease = mr.getParameter("drug");
		String vaccine = mr.getParameter("inoculation");
		String corona = mr.getParameter("inoculation2");
		String kennel = mr.getParameter("inoculation3");
		String hospitalName = mr.getParameter("hospital");
		String hospitalPhone = mr.getParameter("hnum");
		String hospitalZip = mr.getParameter("postNum");
		String hospitalAddress = mr.getParameter("address");
//		String detail = mr.getParameter("detail");
		String petImg = f==null?mr.getParameter("ori"):mr.getFilesystemName("upload");
		String registration = mr.getParameter("enroll");
		
		
		
//		Pet pet = new Pet(no,id,petName,petGender,petKind,petWeight,petAge,
//				petAffinity, petNeutralization,petDisease,petDiseaseTxt,petSeparation,
//				petSeparationTxt,petUrine,petUrineTxt, petIndoor,petIndoorTxt,
//				petHowling,petHowlingTxt,heartDisease,vaccine,corona,kennel,
//				hospitalName,hospitalPhone,hospitalZip,hospitalAddress
//				,petImg,registration,detail);
		
		Pet pet = new Pet();
			
				
				pet.setCorona(corona);
				pet.setDetail(detail);
				pet.setHeartDisease(heartDisease);
				pet.setHospitalAddress(hospitalAddress);
				pet.setHospitalName(hospitalName);
				pet.setHospitalPhone(hospitalPhone);
				pet.setHospitalZip(hospitalZip);
				pet.setKennel(kennel);
				pet.setPetAffinity(petAffinity);
				pet.setPetAge(petAge);
				pet.setPetCode(no);
				pet.setPetDisease(petDisease);
				pet.setPetDiseaseTxt(petDiseaseTxt);
				pet.setPetGender(petGender);
				pet.setPetHowling(petHowling);
				pet.setPetHowlingTxt(petHowlingTxt);
				pet.setPetImg(petImg);
				pet.setPetIndoor(petIndoor);
				pet.setPetIndoorTxt(petIndoorTxt);
				pet.setPetKind(petKind);
				pet.setPetName(petName);
				pet.setPetNeutralization(petNeutralization);
				pet.setPetSeparation(petSeparation);
				pet.setPetSeparationTxt(petSeparationTxt);
				pet.setPetUrine(petUrine);
				pet.setPetUrineTxt(petUrineTxt);
				pet.setPetWeight(petWeight);
				pet.setRegistration(registration);
				pet.setUserId(id);
				pet.setVaccine(vaccine);
		
		
		
		int result = new PetService().petprofileeidt(pet,id,no);
		
		String msg = "";
		String loc = "";
		if(result>0) {
			msg = "펫프로필 수정 성공";
			loc="/user/petprofile";
		}else {
			msg = "펫프로필 수정 실패";
			loc="/user/petprofile";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request,response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
