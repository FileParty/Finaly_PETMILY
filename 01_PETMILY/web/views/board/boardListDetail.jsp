<%@page import="com.petmily.common.filter.LoginUserFilter"%>
<%@page import="java.util.ArrayList"%>
<%@page import=" com.petmily.reservation.model.vo.ReservationPetCode"%>
<%@page import=" com.petmily.reservation.model.vo.PetReservation"%>
<%@page import="javafx.geometry.Pos"%>
<%@page import=" com.petmily.pet.model.vo.PetInfo"%>
<%@page import=" com.petmily.review.model.vo.ReviewPetSitter"%>
<%@page import=" com.petmily.board.model.vo.boardImg"%>
<%@page import=" com.petmily.petsitter.model.vo.PetSitterCertificate"%>
<%@page import=" com.petmily.board.model.vo.PlusOptionService"%>
<%@page import="java.util.List"%>
<%@page import="com.petmily.user.model.vo.User"%>
<%@page import=" com.petmily.petsitter.model.vo.PetSitter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>

<%@ page import="com.petmily.board.model.vo.PetSitterBoard" %>
      
<%@include file="/views/common/header.jsp" %>
      
<%

	/* String bFlag = ""; */
	
	
	String userId = loginUser.getUserId();
	List<String> dsList = (List)request.getAttribute("dsList");
	PetSitterBoard boardT = (PetSitterBoard)request.getAttribute("boardT");
	boolean certificateFlag = (boolean)request.getAttribute("certificateFlag");
	PetSitter sitterT = (PetSitter)request.getAttribute("sitterT");
	User userT = (User)request.getAttribute("userInfoT");
	List<PlusOptionService> pOServiceList = (List)request.getAttribute("pOServiceList");
	List<PetSitterCertificate> certificateT = (List)request.getAttribute("certificateT");
	List<String> BoardImgs = (List)request.getAttribute("boardImgs");
	boolean bookmarkFlag = (boolean)request.getAttribute("bookmark");
	List<ReviewPetSitter> reviews = (List)request.getAttribute("reviews");
	List<PetInfo> petsInfos = (List)request.getAttribute("petsInfo");
	PetReservation reservation = new PetReservation();
	List<ReservationPetCode> rPetCodeT = new ArrayList<ReservationPetCode>();
	
	int count = 0;;
	
	
	/* ---- 슬기 ↓ 연관 jsp : userInfo.jsp */
	
	String pstId = request.getParameter("PetsitterId");
	

%>



<link href="<%=request.getContextPath() %>/css/PST.css" rel="stylesheet">


    <section>
    
    <input type="hidden" name="sitterId" value="<%=sitterT.getPetSitterId()%>">
    <input type="hidden" name="boardCode" value="<%=boardT.getBoardNo()%>">

    
    <div class="row no-gutters" id="main_img">

            <div class="col-lg-8" style="height: 100%;">

                <div style="width: 100%; height: 100%; overflow: hidden;">

					<%if(BoardImgs.size()>0) {%>
                    	<img onclick="main_img_view();" src="<%=request.getContextPath()%>/img/boardMain/<%=BoardImgs.get(0) %>" alt="" width="100%">
					<%} %>
                </div>

            </div>


            <div class="col-lg-4" style="height: 100%;">
                <div style="width: 100%; height: 50%; overflow: hidden;">
                
					<%if(BoardImgs.size()>1) {%>
                    	<img onclick="main_img_view();" src="<%=request.getContextPath()%>/img/boardMain/<%=BoardImgs.get(1) %>" alt="" width="100%">
                    <%} %>

                </div>

                <div style="width: 100%; height: 50%; overflow: hidden;">

					<%if(BoardImgs.size()>2){ %>
                    	<img onclick="main_img_view();" src="<%=request.getContextPath()%>/img/boardMain/<%=BoardImgs.get(2) %>" alt="" width="100%">
                    <%} %>
					
                </div>
            </div>

        </div>

        <div style="height: 10px;"></div>

        <div class="row" id="main_content">

            <div class="col-lg-6 main_content_01">

				<%if(!bookmarkFlag){%>
	                <img id="bookmark" onclick="bookmark();"src="<%=request.getContextPath()%>/img/bookmark/bookmarkBlack.png" alt=""
	                width="50px" height="50px">
                <%} else{%>
                <img id="bookmark" onclick="bookmark();"src="<%=request.getContextPath()%>/img/bookmark/bookmarkRed.png" alt=""
	                width="50px" height="50px">
               	<% }%>
               	
                <p style="display: inline;margin-left: 50px; font-size:24px; vertical-align: middle;"><%=boardT.getBoardTitle() %></p>

                

            </div>

            <div class="col-lg-6 main_content_01">

				
                <button id="bline_process" class="btn btn-secondary button_radius" style="margin-left: 70%;">블라인드 처리</button>

            </div>

			<div class="col-lg-6 main_content_02" >
                <div id="main_content_02_info" class="row no-gutters" style="width:100%; height:100%">
                
                	<div class="col-lg-4" style="width:120px; height:120px">
                	
	                	<div id="profile">
	                		<img src="<%=request.getContextPath() %>/img/profile/sitterT" alt=""
	                        width="100%" height="100%">
                        </div>
                	
                	</div>
                	
                	<div class="col-lg-8" style="height: 100%;">
                	
                		<table style="width:250px; height:50%; margin-left: 50%;transform: translateX(-50%); margin-top: 50px;">
                            <tr>
                            	<%if(certificateFlag) {%>
	                                <td><button>프로 펫시터</button></td>
	                                <td><%=userT.getUserName().substring(0,1)%>*<%=userT.getUserName().substring(2)%> 펫시터</td>
                                <%} else{%>
                                	<td colspan="2"><%=userT.getUserName().substring(0,1)%>*<%=userT.getUserName().substring(2)%></td>
                                <%} %>
                                
                            </tr>
                            <tr>
                                <td colspan="2"><%=userT.getAddress() %></td>
                            </tr>
                        </table>
                	
                	</div>
                
                </div>
            </div>

            <div class="col-lg-6 main_content_02">

                <div id="main_content_02_calendar">

                    <p class="sub_title">예약 가능 날짜</p>

                    <svg class="bi bi-chevron-left" width="30px" height="30px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="margin-left:28px"> 
                        <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 010 .708L5.707 8l5.647 5.646a.5.5 0 01-.708.708l-6-6a.5.5 0 010-.708l6-6a.5.5 0 01.708 0z" clip-rule="evenodd"/>
                    </svg>

                    <p style="display: inline; vertical-align: top; font-size:20px; padding-left: 150px; padding-right: 150px;">2020년 2월</p>

                    <svg class="bi bi-chevron-right" width="30px" height="30px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="   M4.646 1.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L10.293 8 4.646 2.354a.5.5 0 010-.708z" clip-rule="evenodd"/>
                    </svg>

                    <div id="temporary1">









                    </div>

                </div>
                
            </div>

            <div class="row col-lg-12 no-gutters" style="height: 30px; margin-top: 30px;">

                <div class="col-lg-6 no-gutters main_content_03">

                    <button onclick="info();">
                        <p class="sub_title">펫시터 정보</p>
                    </button>

                </div>

                <div class="col-lg-6 no-gutters main_content_03">

                    <button onclick="review();">
                        <p class="sub_title">후기</p>
                    </button>

                </div>

            </div>


            <div class="col-lg-6 main_content_04 info" style="border-right: 1px solid black;">

                <div class="main_content_04_sub">

                    <p class="sub_title"><%=userT.getUserName().substring(0,1)%>*<%=userT.getUserName().substring(2)%> 펫 시터 님을 소개합니다.</p>                    
                    <div class="write_space" style=""overflow:hidden; word-break:break-all"><%=boardT.getBoardInfo() %></div>

					<%if(certificateFlag){%>
                    	<p class="sub_title">자격증 및 교육 수료</p>

	                    <table id="certificate">
	
	                        <tr><!-- https://www.icqa.or.kr/cn/data/editor/1807/cd5a1aca61481dbfad1f1be4de961b59_1532498782_3776.jpg -->
	                            <td rowspan="3"><img src="<%=request.getContextPath() %>/img/certificate/<%=certificateT.get(0).getCertificateFilename()%>" width="200px" height="130px"></td>
	                            <td><%=certificateT.get(0).getCertificateName() %></td>                            
	                        </tr>
	
	                        <tr>                            
	                            <td><%=certificateT.get(0).getCertificationNmae() %>에서 발급</td>
	                        </tr>
	
	                        <tr>
	                            <td><%=certificateT.get(0).getDateOfAcquisition() %> 발급</td>
	                        </tr>
	
	
	                    </table>
					<%} %>
                    
                    

                </div>

            </div>

            <div class="col-lg-6 main_content_04 info" style="margin-bottom:100px;">

                <div class="main_content_04_sub">

                    <p class="sub_title">이용 요금</p>

                    <table id="price">
                        <tr>
                            <th>반려 동물 유형</th>
                            <th>1박 케어</th>
                        </tr>
                        <tr>
                            <td>소형견</td>
                            <td><%=boardT.getSmallPrice() %>원</td>
                        </tr>
                        <tr>
                            <td>중형견</td>
                            <td><%=boardT.getMiddlePrice() %>원</td>
                        </tr>
                        <tr>
                            <td>대형견</td>
                            <td><%=boardT.getBigPrice() %>원</td>
                        </tr>
                    </table>
                    
                    <table id="price_discription">
                        <tr>
                            <td>반려동물추가비</td>
                            <td style="text-align: right;">10,000원 할인</td>
                        </tr>
                        <tr><td></td></tr>
                        <tr><td></td></tr>
                        <tr><td></td></tr>
                        <tr>
                            <td>공휴일 연휴 할증비</td>
                            <td style="text-align: right;">기본 요금에서 10,000원 할증</td>
                        </tr>
                    </table>

                    <table id="location">
                        <tr>
                            <td style="text-align: center;"><p class="sub_title">펫시터 위치</p></td>
                            <td rowspan="2" style="text-align: right;"><img src="https://www.hanchao.com/company/kr/img/map_img01.jpg" width="200px" height="100px"></td>
                        </tr>
                        <tr>
                            <td style="text-align: center;"><%=boardT.getBoardAddress() %><br><%=boardT.getBoardAddressContent() %></td>
                        </tr>
                    </table>

                </div>

            </div>

            <div class="col-lg-12 info"><p class="sub_title">기본 제공 서비스</p></div>
            <div class="col-lg-1 info"></div>

            <div class="row col-lg-10 info" id="default_service">

                

                    
                <!-- <table style="display: inline;">
                    
                    <tr>
                        <td rowspan="2">

                            <img style="vertical-align: middle;" src="https://cdns.iconmonstr.com/wp-content/assets/preview/2017/240/iconmonstr-medical-11.png" width="40px" height="30px" style="margin-top: 20px">

                        </td>
                        <td>실내 놀이</td>
                    </tr>

                    <tr>
                        <td>터그놀이, 노즈워크 등</td>
                    </tr>

                </table> -->

				<%for(String s : dsList){%>
	                <div class="service_sub col-lg-2">
	                    <table>
	
	                        <tr>
	                            <td>
	    
	                                <img src="https://cdns.iconmonstr.com/wp-content/assets/preview/2017/240/iconmonstr-medical-11.png" width="40px" height="30px">
	    
	                            </td>
	                            <td style="text-align: right;"><%=s %></td>
	                        </tr>
	  
	    
	                    </table>
	                </div>
                <%} %>
                
            </div>

            <div class="col-lg-1 info" ></div>


            <div class="col-lg-12 info"><p class="sub_title">이용 가능한 추가 옵션</p></div>
            <div class="col-lg-1 info"></div>

            <div class="row col-lg-10 info" id="add_service">

				<%for(PlusOptionService pos : pOServiceList){%>
	                <div class="service_sub col-lg-2">
	                    <table>
	
	                        <tr>
	                            <td>
	    
	                                <img src="https://cdns.iconmonstr.com/wp-content/assets/preview/2017/240/iconmonstr-medical-11.png" width="40px" height="30px">
	    
	                            </td>
	                            <td style="text-align: right;"><%=pos.getPlusOptionType() %></td>
	                        </tr>
	                    </table>
	                </div>  
                <%} %>

            </div>

            <div class="col-lg-1 info"></div>

        </div>

        <div class="row" id="review_con" style="display:none;">
        <%for(ReviewPetSitter review : reviews) {%>    
            <div class="col-lg-1"></div>
            
            

            <div class="col-lg-10 row review">
                
                
	                <div class="col-lg-12">
	
	                    <style>
	                        #review tbody{
	                            width:100%;
	                        }    
	                        #review td{
	                            width:300px;
	                        }
	                    </style>
	
	                    <table style="margin-top: 20px; width:100%; word-break:break-all">
	                        <tr>
	                        
	                        	<td>
	                        		<!-- userId 계정 탈퇴 시 다른 테이블에 해당 값 다 없애는거 설정바꿔야댐 -->
	                        		<%if(review.getUserId()!=null){%>
		                        		<%=review.getUserId().substring(0,3)%>*****<br><%=review.getReviewDate() %>
		                        	<%} %>
	                        	</td>
	                        	
<%-- 	                        	<%if(userId.equals(sitterT.getPetSitterId())){%>
	                            	<td style="text-align: right;"><button id="bline_request" style="width:150px; height:30px; margin-bottom: 50px;">블라인드 요청</button></td>
	                            <%} else{%>
	                            	<td style="text-align: right;"><button id="bline_request" style="display:none; width:150px; height:30px; margin-bottom: 50px;">블라인드 요청</button></td>
	                            <%} %> --%>
	                            
	                        </tr>
	                        <tr>
	                            <td colspan="2"><%=review.getReviewText() %></td>
	                        </tr>
	                    </table>
	
	                </div>
	
					<%if(review.getReviewSend()!=null) {%>						
						
		                <div class="col-lg-2" style="height: 200px;">
		
		                    <div class="review_profile">
		                        <img src="<%=request.getContextPath() %>/img/profile/<%=sitterT.getPetSitterImg() %>" alt=""
		                        width="100%" height="100%">
		                    </div>
		
		                </div>
		    
		                    
		                <div class="col-lg-10">
		
		                    <div style="border:1px solid gray; width:100%; height: 100px; margin-top: 50px;"><%=review.getReviewSend()%></div>
		
		                </div>
		                
		                
		       		<%} else{%>
		       		
		                <div id="reply1_<%=review.getUserReviewNo()%>" class="col-lg-2" style="height: 200px; display:none">
		
		                    <div class="review_profile">
		                        <img src="<%=request.getContextPath() %>/img/profile/<%=sitterT.getPetSitterImg() %>" alt=""
		                        width="100%" height="100%">
		                    </div>
		
		                </div>
		    
		                    
		                <div id="reply2_<%=review.getUserReviewNo()%>" class="col-lg-10" style="display:none">
		
		                    <div id="reply_reCon_<%=review.getUserReviewNo() %>" style="border:1px solid gray; width:100%; height: 100px; margin-top: 50px;"><%=review.getReviewSend()%></div>
		
		                </div>
		       		
		       			<%if(userId.equals(sitterT.getPetSitterId())) {%>
		                	
		                	<div id="replyIn1_<%=review.getUserReviewNo() %>" class="col-lg-10">
		                		<textarea id="reply_con_<%=review.getUserReviewNo()%>" cols="87" rows="4" style=" margin-top: 20px; margin-left: 20px;"></textarea>
		                	</div>
		                	
							<div id="replyIn2_<%=review.getUserReviewNo() %>" class="col-lg-2"><button id="reply" style="margin-top: 20px;" onclick="replyUpdate('<%=review.getUserReviewNo()%>');">답글 입력</button></div>		                	
		                <%} %>
		       		
		       		<%} %>
	                
	                
	            </div>
	            
	
	            <div class="col-lg-1"></div>
	            <%} %>
	    	
        </div>
        
	    <div class="row" id="section_end1">
	        <div class="col-lg-10" style="height: 100%;">
	            
	        </div>
	
	        <div class="col-lg-2" style="height: 100%;">
	            <button id="reservation" class="btn btn-secondary button_radius" style="width: 150px; height: 60%; margin-top: 12.5px;">예약 하기</button>
	        </div>
	    </div>
	
	
	    <div class="row" id="section_end2">
	        <div class="col-lg-10" style="height: 100%;">
	            <div id="reservation_end_con" style="position: absolute; top:50%; transform: translateY(-50%); margin-left:30px;">날짜: ~~~~~~   소형견: 2 중형견: 0 대형견 0    추가옵션: 목욕, 약물복용, 등 합계금액: xxxx원</div>
	        </div>
	
	        <div class="col-lg-2" style="height: 100%;">
	             <button id="reservation_end" class="btn btn-secondary button_radius" style="width: 150px; height: 60%; margin-top: 12.5px;">예약 완료</button>
	        </div>
	 
	    </div>

    </section>







    <div id="reservation_modal" class="modal">
 
        <!-- Modal content -->
        <div class="modal-content" style="width:30%">

            <table>
                <tr>
                    <td style="width: 70px"></td>
                    <td style="text-align: center;">예약하기</td>
                    <td><span class="close">&times;</span></td>
                </tr>
            </table>

            <hr>

            <br>

            <div>체크 인 - 체크 아웃</div>
            <hr>
            <!-- 달력 api 완성 이후 작업 -->
            <div><input name="checkIn" style="width:40%; margin-right: 12px; margin-left: 12px;" type="date" onchange="checkInC();" id="checkIn"> ~ <input name="checkOut" style="width:40%; margin-right: 12px; margin-left: 12px;" type="date" id="checkOut" onchange="checkOutC();"></div>
            
            <br>
            
            <table>
                <tr>
                    <td>반려견 선택</td>
                   	<%for(PlusOptionService pos: pOServiceList) {%>
	                    <%if(pos.getPlusOptionType().equals("노견케어")) {%>
	                    <td style="text-align: right;">노견케어는 지원하지 않습니다.</td>
	                    
	                    <%break;} %>
                    <%} %>
                </tr>
            </table>
            <hr style="margin-top: 1px;">
            <div class="row" style="height:100%">
            	<%for(PetInfo petInfo : petsInfos) {%>
                	<div class="col-md-6"><button onclick="petDisplay('<%=petInfo.getPetCode()%>','<%=petInfo.getPetWeight() %>');"; style="width: 80%;margin-left: 50%;transform: translateX(-50%);"><%=petInfo.getPetName() %></button></div>
                	
                <%} %>
            </div>
            
            <br>
            
            <div id="addS" style="display:none">추가 옵션 선택</div>
		    <hr>

			<%for(PetInfo petInfo : petsInfos) {%>
				<div id="<%=petInfo.getPetCode()%>" style="display :none;">
		            
		            <table style="width:100%">
		            	<%for(PlusOptionService pos : pOServiceList) {%>
		            		<%if(pos.getPlusOptionType().equals("목욕가능")){ %>
		            			<%if(petInfo.getPetWeight().equals("소형")) {%>
				            		<tr>
					                    <td>목욕 / <%=petInfo.getPetName() %></td>
					                    <td style="text-align: right; margin-right: 30px; "><%=pos.getSmallPrice() %>원 <input onclick="bath_con('<%=-petInfo.getPetCode() %>','<%=petInfo.getPetWeight() %>', 'bath_<%=petInfo.getPetCode() %>');" id="-<%=petInfo.getPetCode() %>" type="checkbox"></td>
					                </tr>
					                <tr id='bath_<%=petInfo.getPetCode() %>' style="display:none;">
					                	<td style='width:75%'>
					                		<input id="bath_text_<%=petInfo.getPetCode() %>" type='text' placeholder='ex)산책 후 목욕 부탁드립니다. 50자 이내' style='width:100%'>
					                	</td>
					                	<td style='text-align:right; width:25%'>
					                		<input type='number' id='path_<%=-petInfo.getPetCode() %>' placeholder='횟수' style='width:100%'>
					                	</td>
					                </tr>
					         	<%}else if(petInfo.getPetWeight().equals("중형")) {%>
					         		<tr>
					                    <td>목욕 / <%=petInfo.getPetName() %></td>
					                    <td style="text-align: right; margin-right: 30px; "><%=pos.getMiddlePrice() %>원 <input onclick="bath_con('<%=-petInfo.getPetCode() %>','<%=petInfo.getPetWeight() %>', 'bath_<%=petInfo.getPetCode() %>');" id="<%=-petInfo.getPetCode() %>" type="checkbox"></td>
					                </tr>
					                <tr id='bath_<%=petInfo.getPetCode() %>' style="display:none;">
					                	<td style='width:75%'>
					                		<input id="bath_text_<%=petInfo.getPetCode() %>" type='text' placeholder='ex)산책 후 목욕 부탁드립니다. 50자 이내' style='width:100%'>
					                	</td>
					                	<td style='text-align:right; width:25%'>
					                		<input type='number' id='path_<%=-petInfo.getPetCode() %>' placeholder='횟수' style='width:100%'>
					                	</td>
					                </tr>
					         	<%} else{ %>
					         		<tr>
					                    <td>목욕 / <%=petInfo.getPetName() %></td>
					                    <td style="text-align: right; margin-right: 30px; "><%=pos.getBigPrice() %>원 <input onclick="bath_con('<%=-petInfo.getPetCode() %>','<%=petInfo.getPetWeight() %>', 'bath_<%=petInfo.getPetCode() %>');" id="<%=-petInfo.getPetCode() %>" type="checkbox"></td>
					                </tr>
					                <tr id='bath_<%=petInfo.getPetCode() %>' style="display:none;">
					                	<td style='width:75%'>
					                		<input id="bath_text_<%=petInfo.getPetCode() %>" type='text' placeholder='ex)산책 후 목욕 부탁드립니다. 50자 이내' style='width:100%'>
					                	</td>
					                	<td style='text-align:right; width:25%'>
					                		<input type='number' id='path_<%=-petInfo.getPetCode() %>' placeholder='횟수' style='width:100%'>
					                	</td>
					                </tr>
					         	<%} %>
			                <%break;} %>
		            	<%} %>
		            	
		            	<td><br></td>
	            	</table>
            	</div>
            <%} %>
            
            <hr>
            
            
            	<div style="height:100%">
            		<table style="width:100%">
		            	<%for(PlusOptionService pos : pOServiceList) {%>
		            		<%if(pos.getPlusOptionType().equals("약물복용")){ %>
			            		<tr id="medication1" style="display:none">
				                    <td>약물 복용</td>
				                    <td style="width: 294px; 
				                    text-align: right; margin-right: 30px;"><input onclick="medication_con();" id="Medication" type="checkbox"></td>
				                </tr>
			                <%break;} %>
		            	<%} %>		          
		            	
		            	<td><br></td>      
		
 						<%for(PlusOptionService pos : pOServiceList) {%>
							<%if(pos.getPlusOptionType().equals("집앞픽업")){ %>
				                <tr id="pickup" style="display:none">
				                    <td style="width:30%;">집 앞 픽업</td>
				                    <td style="width:260px; text-align: right; margin-right: 30px;">편도 <%=pos.getOneWayPrice() %>원 왕복 <%=pos.getAllWayPrice() %>원 <input onclick="pickup_con();" type="checkbox"></td>
				                </tr>
				                <tr id="pickup2" style="display:none">
				                    <td colspan="2">펫 시터에게 갈 때 <input class="pickup" type="radio" name="move"> &nbsp;&nbsp;&nbsp;집으로 돌아 갈 때 <input class="pickup" type="radio" name="move">&nbsp;&nbsp;&nbsp; 왕복 <input class="pickup" type="radio" name="move"></td>
				                </tr>
				                <tr id="pickup3" style="display:none">
				                	<td><br></td>
				                </tr>
			                <%} %>
		                <%} %>
		            </table>
	            </div>
            

            <div>추가 요청 및 문의 사항</div>
            <input id="plusQuestions" type="text" placeholder="300자 이내" style="width: 100%; line-height: 100px;">
            
            <br>

            <div><button onclick="receipt();" style="margin-left: 50%; transform: translateX(-50%);">영수증 확인</button></div>
            <hr>

            <table id="receipt_con" style="display:none;">
                
                <tr id="weight_tr">
                    <td id="t_weight">대중소</td>
                    <td style="text-align: right;" id="p_weight">해당금액</td>
                </tr>
                <%for(PlusOptionService pos : pOServiceList) {%>
					<%if(pos.getPlusOptionType().equals("목욕가능")){ %>
		                <tr id="pos_bath" style="display:none"> <!-- display-cell -->
		                    <td id="t_bath">목욕</td>
		                    <td style="text-align: right;" id="p_bath">해당금액</td>
		                </tr>
                	<%} %>
                
	                <%if(pos.getPlusOptionType().equals("집앞픽업")){ %>
		                <tr id="pos_pickup" style="display:none">
		                    <td id="t_pickup">집앞픽업</td>
		                    <td style="text-align: right;" id="p_pickup">해당금액</td>
		                </tr>
		           	<%} %>
		           	
		           	<%if(pos.getPlusOptionType().equals("추가할인")){ %>
		                <tr id="pos_sale" style="display:none">
		                    <td id="t_sale">추가할인</td>
		                    <td style="text-align: right;" id="p_sale">해당금액</td>
		                </tr>
		           	<%} %>
                <%} %>
                
                <tr>
                    <!-- <td id="t_date">날짜</td> -->
                    <td colspan="2" style="text-align: center;" id="p_date">*?</td>
                </tr>
            </table>

            <hr>

            <table id="receipt_total" style="display:none;">
                <tr>
                    <td>합계금액</td>
                    <td colspan="2" id="total_price" style="text-align: right;">해당금액</td>
                </tr>
            </table>

           
            <div><button style="margin-left: 50%; transform: translateX(-50%);" id="select_end">선택완료</button></div>

            
      </div>

    </div>

    <!-- The Modal -->
    <div id="bline_process_modal" class="modal">

        <!-- Modal content -->
        <div class="modal-content" style="height: 230px; margin-top: 15%; width:500px;">
            <table>
                <tr>
                    <td style="width: 70px"></td>
                    <td style="text-align: center;">블라인드 처리</td>
                    <td><span class="close">&times;</span></td>
                </tr>
            </table>

            <hr>

            <div class="row" style="height: 85px; margin-top:20px;">

                <div class="col-md-2"></div>
                <div class="col-md-8">사유<br>
                    <input id="bline_con" type="text" list="reason" style="width:110%" placeholder="사유 입력">
                    <datalist id="reason">
                        <option value="부적절한 게시글 기재"></option>
                        <option value="지속적으로 낮은 서비스 제공"></option>
                        <option value="기타"></option>
                    </datalist></div>                    
                <div class="col-md-2"></div>

            </div>

            <hr>

            <button onclick="bline_request_insert();" style="width:40%; margin-left: 50%; transform: translateX(-50%);">블라인드 처리</button>

        </div>

    </div>


    <!-- The Modal -->
    <div id="bline_request_modal" class="modal">

        <!-- Modal content -->
        <div class="modal-content" style="height: 230px; margin-top: 15%; width:500px;">
            <table>
                <tr>
                    <td style="width: 70px"></td>
                    <td style="text-align: center;">블라인드 요청</td>
                    <td><span class="close">&times;</span></td>
                </tr>
            </table>

            <hr>

            <div class="row" style="height: 85px; margin-top:20px;">

                <div class="col-md-2"></div>
                <div class="col-md-8">사유<br>
                    <input type="text" list="reason" style="width:110%" placeholder="사유 선택">
                    <datalist id="reason">
                        <option value="인신 공격 및 모욕"></option>
                        <option value="개인정보 유출"></option>
                        <option value="부적절한 내용"></option>
                        <option value="허위 사실 유포"></option>
                        <option value="기타"></option>
                    </datalist></div>                    
                <div class="col-md-2"></div>

            </div>

            <hr>

            <input type="button" value="블라인드 요청" style="width:40%; margin-left: 50%; transform: translateX(-50%);">

        </div>

    </div>

    <!-- The Modal -->
    <div id="reservation_end_modal" class="modal">

        <!-- Modal content -->
        <div class="modal-content" style="width: 30%;">
            <table>
                <tr>
                    <td style="width: 70px"></td>
                    <td style="text-align: center;">결제 수락 대기</td>
                    <td><span class="close">&times;</span></td>
                </tr>
            </table>

            <hr>

            <table style="text-align: center; margin-top: 70px;">
                <tr><td>총 결제 금액</td></tr>
                <tr><td id="re_end_price">xx0,000원</td></tr>
                <tr><td><a href="" onclick="resulvation_complete();" style="text-decoration: none;">>예약 상세 보기</a></td></tr>
            </table>

            <hr style="margin-top: 75px">

            <div class="row no-gutters" id="end_modal">

                <div class="col-md-6"><button onclick="resulvation_cancel();">예약 취소</button></div>
                <div class="col-md-6"><button onclick="resulvation_complete()">예약 완료</button></div>

            </div>

        </div>

    </div>

        <!-- The Modal -->
        <div id="img_modal" class="modal" >

            <!-- Modal content -->
            <div class="modal-content" style="width: 100%; height: 100%; margin: 0 0;">


                <div class="row" style="height: 100%;">

                    
                    <div class="col-lg-2" style="height: 100%;">
                    
                        <svg onclick="front_img();" class="bi bi-chevron-left" width="70px" height="70px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="margin-left:28px; margin-top:300px;"> 
                            <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 010 .708L5.707 8l5.647 5.646a.5.5 0 01-.708.708l-6-6a.5.5 0 010-.708l6-6a.5.5 0 01.708 0z" clip-rule="evenodd"/>
                        </svg>

                    </div>
                

                    
                    <div class="col-lg-8" style="height: 100%; margin-top: 60px">

                        <div style="width: 100%; height: 400px; ">
                            
                            <img id="modal_img" src="" width="100%" height="100%" >
                            
                        </div>

                        <div class="row no-gutters" style="height: 150px; margin-top: 50px; margin-left: 13px;">
                        
                            <div class="col-lg-12 row " style="height: 100%;">
                            
                            	<%for(String boardImg : BoardImgs) {%>
                            	
	                            	<%if(count<4) {%>
	                            		<%if(count==0) {%>
	                            			<div class="col-lg-3 modal_sub_img_none" style="height:100%; display:flex;"><img id="firstImg" data-index="0" onclick="small_image();" class="modal_sub_img" src="<%=request.getContextPath()%>/img/boardMain/<%=boardImg%>" width="100%" height="100%"></div>
	                            		<%} else{%>
	                            			<div class="col-lg-3 modal_sub_img_none" style="height:100%" display:flex;><img data-index=<%=count+1 %> onclick="small_image();" class="modal_sub_img" src="<%=request.getContextPath()%>/img/boardMain/<%=boardImg%>" width="100%" height="100%"></div>
	                            		<%} %>
	                            	<%}else{%>
	                            		<div class="col-lg-3 modal_sub_img_none" style="height:100%"><img data-index="<%=count+1 %>" onclick="small_image();" class="modal_sub_img" src="<%=request.getContextPath()%>/img/boardMain/<%=boardImg%>" width="100%" height="100%"></div>
	                            	<%} %>
	                            	<%count++;%>
                            	<%} %>

                                <!-- <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img id="firstImg" data-index="0" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/fd37e21adee1436c8b9341758eafe5d5.jpg" width="100%" height="100%"></div>
                                <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img data-index="1" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/cc06070da695433f92721c1c7ec4f08d.jpg" width="100%" height="100%"></div>
                                <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img data-index="2" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/fdd7ce476cb1458c88e67ea1ac5873c4.jpg" width="100%" height="100%"></div>
                                <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img data-index="3" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/83cf124a05ca4b2aad158d95c0f4d577.jpg" width="100%" height="100%"></div>
                                <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img data-index="4" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/6feeb5a1ed5741b8b196a746e8ccf38f.jpg" width="100%" height="100%"></div>
                                <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img data-index="5" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/6e95dd0cb42e424691c11461f2d5c58c.jpg" width="100%" height="100%"></div>
                                <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img data-index="6" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/c5cd9b95324142e7b023a2f0ce3a121c.jpg" width="100%" height="100%"></div>
 -->
                            </div>
                        
                        </div>

                    </div>

                    <div class="col-lg-2" style="height: 100%;">

                        <span class="close" style="text-align: right; font-size: 60px;">
                            &times;
                        </span>

                        <svg onclick="end_img();" class="bi bi-chevron-right" width="70px" height="70px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="margin-left:130px; margin-top:240px;">
                            <path fill-rule="evenodd" d="   M4.646 1.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L10.293 8 4.646 2.354a.5.5 0 010-.708z" clip-rule="evenodd"/>
                        </svg>

                    </div>

                </div>
    
            </div>

    
        </div>
        
       
        

<script>

var flag = <%=bookmarkFlag%>;
var petWeightCodes = new Array();
var petWeights = new Array();
var big = 0;
var middle = 0;
var small = 0;

var b_big = 0;
var b_middle = 0;
var b_small = 0;


var weightCode = "";
var weightPrice = 0;
var bathCode = "";
var bathPrice = 0;
var pickupCode = "";
var pickupPrice = 0;
var pickup;
var petCodes = new Array();
var petSizes = new Array();
var petBaths = new Array();
var petBathTexts = new Array();
var s=0;
var m=0;
var b=0;







function bookmark(){
		
    	$.ajax({
    		type: "POST",
    		url: "<%=request.getContextPath()%>/BookmarkChange.do",
    		data: {"userId": "<%=request.getParameter("userId")%>", "sitterId": "<%=sitterT.getPetSitterId()%>", "bookmarkFlag": flag},
    		success: function(data){
    			flag = !flag;
    			
    		},
    		error: function(){
    			// jsp의 전역변수
    		}
    	});
    	
    	if(flag)
			event.target.src = "<%=request.getContextPath()%>/img/bookmark/bookmarkBlack.png";
		else
			event.target.src = "<%=request.getContextPath()%>/img/bookmark/bookmarkRed.png";
}

bline_process.onclick = function() {
    bline_process_modal.style.display = "block";
    $('body').css("overflow", "hidden");
}

function petDisplay(petCode, weight){
	
	
	if(document.getElementById(petCode).style.display=="block"){
		$("#" + petCode).attr("style", "display :none;");
		petWeightCodes.splice(petWeightCodes.indexOf(petCode), 1);
		if(weight=="소형")
			small--;
		else if(weight=="중형")
			middle--;
		else
			big--;
		return;
	}
	
	if(weight=="소형")
		small++;
	else if(weight=="중형")
		middle++;
	else
		big++;
	
	petWeightCodes.push(petCode);
	
	
	
<%-- 	<%
		ReservationPetCode rPetCode = new ReservationPetCode();
		rPetCode.setPetCode(petInfo.getPetCode());
		rPetCode.setPetSize(petInfo.getPetWeight());
 	%> --%>
	
	
	$("#" + petCode).attr("style", "display :block; width:100%; height:100%;");
	
	
	$("#addS").attr("style", "display :table-row;");
	$("#medication1").attr("style", "display :table-row;");
	$("#pickup").attr("style", "display :table-row;");
	$("#pickup3").attr("style", "display :table-row;");
	
	
}



function bath_con(data, weight, id){
	/* var code = "<tr id='bath_content'><td style='width:80%'><input type='text' placeholder='ex)산책 후 목욕 부탁드립니다. 50자 이내' style='width:100%'></td><td style='text-align:right; width:20%'><input type='number' id='path_" + -data + "' placeholder='횟수' style='width:100%'></td></tr>";
	
	/* $("#" + data).parent().parent().after(code); */
	/* $("#" + data).parent().parent().after(code); */
	
	
	if(document.getElementById(data).checked==false){
		
		if(weight=="소형"){
			
		}
			/* console.log($("#path_" + -data).val()); */
			/* b_small--; */
			/* console.log($("#path_" + -data).val()); */
			/* console.log(document.getElementById("path_" + -data).innerHTML); */
		else if(weight=="중형")
			b_middle--;
		else
			b_big--;
		$("#" +id).attr("style", "display:none");
		return;
		
	}
	

	
	
	$("#" + id).attr("style", "display:table-row; width:100%;");
	
	if(weight=="소형")
		 b_small++;
	else if(weight=="중형")
		b_middle++;
	else
		b_big++;
	

	
}

function medication_con(){
	var code = "<tr id='medication_content'><td colspan='2'><input id='medication_con' style='width: 100%; type='text'; placeholder='ex) 포포에게 감기약(알약) 복용 부탁드립니다.'></td></tr>";

	$("#Medication").parent().parent().after(code);
	
	if(document.getElementById("Medication").checked==false)
		$("tr").remove("#medication_content");
	
}

function receipt(){
	
	if(document.getElementById("checkOut").value=="" || document.getElementById("checkIn").value==""){
    	alert("날짜를 지정해주세요");
    	return;
    }else if((big+middle+small)==0){
    	alert("반려견을 선택해주세요");
    	return;
    }
	
	if(document.getElementById("receipt_con").style.display=="table"){
		weightCode="";
		bathCode = "";
		pickupCode = "";
	}
	
	$("#receipt_con").attr("style", "display:table");
	$("#receipt_total").attr("style", "display:table");
	
	if(small>0)
		weightCode += "소형견 * " + small + " ";
	
	if(middle>0)
		weightCode += "중형견 * " + middle + " ";
	
	if(big>0)
		weightCode += "대형견 * " + big + " ";
	
	weightPrice = (<%=boardT.getBigPrice()%> * big) + (<%=boardT.getMiddlePrice()%> * middle) + (<%=boardT.getSmallPrice()%> * small);
	
	if(weightCode == ""){
		$("#weight_tr").attr("style", "display: none");
	}else{
		$("#weight_tr").attr("style", "display: table-row");
	}
	
	document.getElementById("t_weight").innerHTML = weightCode;
	document.getElementById("p_weight").innerHTML = numberWithCommas(weightPrice) + "원";
	
	
	

	<%for(PlusOptionService pos : pOServiceList){%>
		var temp_s = 0;
		var temp_m = 0;
		var temp_b = 0;
		<%if(pos.getPlusOptionType().equals("목욕가능")){%>
			<%for(PetInfo pet : petsInfos){%>
				if(document.getElementById("-<%=pet.getPetCode()%>").checked==true){
					if("<%=pet.getPetWeight()%>"=="소형"){
						temp_s += document.getElementById("path_-<%=pet.getPetCode()%>").value*1;
					}else if("<%=pet.getPetWeight()%>"=="중형"){
						temp_m += document.getElementById("path_-<%=pet.getPetCode()%>").value*1;
					}else{
						temp_b += document.getElementById("path_-<%=pet.getPetCode()%>").value*1;
					}
				}
			<%}%>
			bathPrice = (<%=pos.getBigPrice()%> * temp_b) + (<%=pos.getMiddlePrice()%> * temp_m) + (<%=pos.getSmallPrice()%> * temp_s);
			
		<%break;}%>
	
	<%}%>
	
 	if(temp_s>0){
 		bathCode += "목욕(소) * " + temp_s + " ";
 		s = temp_s;
 	}
 	
	
	if(temp_m>0){
		bathCode += "목욕(중) * " + temp_m + " ";
		m = temp_m;
	}
	
	if(temp_b>0){
		bathCode += "목욕(대) * " + temp_b + " ";
		b = temp_b;
	}
	
	
	/* -petCode.checked==true => path_-petcode.value */
	
	if(bathCode!=""){
		document.getElementById("pos_bath").style.display = "table-row";
	}
	document.getElementById("t_bath").innerHTML = bathCode;
	document.getElementById("p_bath").innerHTML = numberWithCommas(bathPrice) + "원";
	
	
	<%for(PlusOptionService pos : pOServiceList){%>
	
		<%if(pos.getPlusOptionType().equals("집앞픽업")){%>
		
			if(document.getElementById("pickup2").style.display=="table-row"){
			
				if(document.getElementsByClassName("pickup")[0].checked==true){
					pickupPrice = <%=pos.getOneWayPrice()%>;
					pickupCode = "*편도";
					pickup="편도";
				}else if(document.getElementsByClassName("pickup")[1].checked==true){
					pickupPrice = <%=pos.getOneWayPrice()%>;
					pickupCode = "*편도";
					pickup="편도";
				}else if(document.getElementsByClassName("pickup")[2].checked==true){
					pickupPrice = <%=pos.getAllWayPrice()%>;
					pickupCode = "*왕복";
					pickup="왕복";
				}
			}
					
		<%break;}%>
	
	<%}%>
	
	document.getElementById("t_pickup").innerHTML = "집앞픽업 " + pickupCode;
	
	
	document.getElementById("p_date").innerHTML = document.getElementById("checkIn").value + " ~ " + document.getElementById("checkOut").value;
	
	if(pickupPrice!=0){
		$("#pos_pickup").attr("style", "display:table-row");
		document.getElementById("p_pickup").innerHTML = numberWithCommas(pickupPrice) + "원";
	}
	
	if((big+middle+small)>1){
		document.getElementById("pos_sale").style.display = "table-row";
		document.getElementById("t_sale").innerHTML = "추가할인 * " + (big+middle+small-1);
		document.getElementById("p_sale").innerHTML = numberWithCommas(((big+middle+small)-1)*10000) + "원";
	}
	
	document.getElementById("total_price").innerHTML = numberWithCommas(((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000)) * dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value))) + "원";
			
	
		
<%-- 	path_<%=petInfo.getPetCode()%>
	 --%>
	 
	<%-- <%rPetCodeT = new ArrayList<ReservationPetCode>();%> --%>
	 
<%--  	<%for(PetInfo petInfo : petsInfos) {%>
		if(document.getElementById('<%=petInfo.getPetCode()%>').style.display!='none'){
			<%ReservationPetCode rp = new ReservationPetCode();%>
			if(<%=petInfo.getPetWeight()%>.equals("소형")){
				b_small += (document.getElementById(path_<%=petInfo.getPetCode()%>));
				console.log(document.getElementById(path_<%=petInfo.getPetCode()%>));
			}else if(<%=petInfo.getPetWeight()%>.equals("중형"){
				
			}else{
			/* 이부분고치자 */	
			}
			<%rp.setPetCode(petInfo.getPetCode());%>
			<%rp.setPetSize(petInfo.getPetWeight());%>
			<%rp.setPetBath(petBath);%>
			<%rPetCodeT.add(rp);%>
		}
	
	<%}%> --%>
	
	
	
	

	

	
	
	
	
	
}

function pickup_con(){
	
	if(document.getElementById("pickup2").style.display=="table-row"){
		$("#pickup2").attr("style", "display :none;");		
	}
	
	$("#pickup2").attr("style", "display :table-row;");
	
}

select_end.onclick = function(){
    var select_end1 = document.getElementById("section_end1");
    var select_end2 = document.getElementById("section_end2");

    

    
    
    if(document.getElementById("checkOut").value=="" || document.getElementById("checkIn").value==""){
    	alert("날짜를 지정해주세요");
    	return;
    }else if((big+middle+small)==0){
    	alert("반려견을 선택해주세요");
    	return;
    }
    else if(!isNaN(((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000))    
    		* dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value)))){
	    select_end2.style.display = "flex";
	    reservation_modal.style.display = "none";
	    $('body').css("overflow", "scroll");
    }
    
    
    
    if(select_end1.display != "none")
        select_end1.style.display = "none";
    
    receipt();
    
    var payment_content = "날짜: " + document.getElementById("checkIn").value + " ~ " + document.getElementById("checkOut").value + " / 소형견: " + small + " 중형견: " + middle + " 대형견: " + big;
    
    	if(bathCode!= "" || pickupCode!= ""){
    		payment_content += " / 추가옵션: ";
    	}
    
    	if(bathCode!= ""){
    		if(s>0)
    			payment_content += " 목욕(소) * " + s;
    		if(m>0)
    			payment_content += " 목욕(중) * " + m;
    		if(b>0)
    			payment_content += " 목욕(대) * " + b;
    	}
    	if(pickupCode!= ""){
    		if(document.getElementsByClassName("pickup")[2].checked==true)
    			payment_content += " 픽업(왕복)";
    		if(document.getElementsByClassName("pickup")[2].checked==true)
    			payment_content += " 픽업(편도)";
    	}

   	payment_content += " / 합계금액: " + numberWithCommas(((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000)) * dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value))) + "원";

   	
   	
   	
    document.getElementById("reservation_end_con").innerHTML=payment_content;
    
    document.getElementById("re_end_price").innerHTML = numberWithCommas(((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000)) * dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value))) + "원";
}

function dateDiff(_date1, _date2) {
	
	var dateString1 = _date1;   
	var dateString2 = _date2;  
	  
	var dateArray1 = dateString1.split("-");
	var dateArray2 = dateString2.split("-");
	  
	var dateObj1 = new Date(dateArray1[0], Number(dateArray1[1])-1, dateArray1[2]);
	var dateObj2 = new Date(dateArray2[0], Number(dateArray2[1])-1, dateArray2[2]);  
	  
	var betweenDay = (dateObj1.getTime() - dateObj2.getTime())/1000/60/60/24;

	return betweenDay;
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


function checkOutC(){
	if(dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value)<1){
		document.getElementById("checkOut").value = "";
	}
}

function checkInC(){
	
	if(dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value)<1){
		document.getElementById("checkIn").value = "";
	}
}

var reservation_end_close = document.getElementsByClassName("close")[3];


var price = ((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000))
		* dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value));




reservation_end_close.onclick = function() {
	
    reservation_end_modal.style.display = "none";
    $('body').css("overflow", "scroll");
 	
}

function resulvation_cancel(){
	
	reservation_end_modal.style.display = "none";
	$('body').css("overflow", "scroll");
	
}

function resulvation_complete(){
	
	
    reservation_end_modal.style.display = "none";
    $('body').css("overflow", "scroll");
    
	<%for(PetInfo pet : petsInfos){%>
	
		if(document.getElementById("<%=pet.getPetCode()%>").style.display!="none"){
			petCodes.push(<%=pet.getPetCode()%>);
			petSizes.push("<%=pet.getPetWeight()%>");
			console.log("push 실행");
			
			if(document.getElementById("-<%=pet.getPetCode()%>").checked==true || (document.getElementById("path_-<%=pet.getPetCode()%>").value!="")){
				if(document.getElementById("path_-<%=pet.getPetCode()%>").value>0){
					petBaths.push(document.getElementById("path_-<%=pet.getPetCode()%>").value);
				}else{
					petBaths.push(0);
				}
				if(document.getElementById("bath_text_<%=pet.getPetCode()%>").value.length>0){
					console.log(document.getElementById("bath_text_<%=pet.getPetCode()%>").value.length);
					console.log(document.getElementById("bath_text_<%=pet.getPetCode()%>").value);
					petBathTexts.push(document.getElementById("bath_text_<%=pet.getPetCode()%>").value);
				}
				else{
					petBathTexts.push("");
				}
			}else{
				petBaths.push(0);
				petBathTexts.push("");
			}
			
		}
		
	<%}%>
	
	console.log(petBathTexts);
	
	if(document.getElementById('Medication').checked==false){
		medicine = "";
	}else{
		medicine = document.getElementById('medication_con').value;
	}

 
 	$.ajax({
		type: "POST",
		url: "<%=request.getContextPath()%>/insertReservation.do",
		data: {"sitterId": "<%=sitterT.getPetSitterId()%>", "boardCode": <%=boardT.getBoardNo()%>,
			"checkIn": document.getElementById('checkIn').value, "checkOut": document.getElementById('checkOut').value,
			"plusQuestions": document.getElementById('plusQuestions').value, "price": ((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000)) * dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value)),
			"medicine": medicine, "pickup": pickup, "petBathTexts": petBathTexts,
			"petCodes": petCodes, "petSizes": petSizes, "petBaths": petBaths},
		success: function(data){
			
			if(data=="t"){
				alert("예약 성공");
				location.replace("<%=request.getContextPath()%>/");
			}else{
				alert("예약 실패");
			}
			
			
		},
		error: function(){
			// jsp의 전역변수
			petCodes = new Array();
			petSizes = new Array();
			petBaths = new Array();
			petBathTexts = new Array();
			
			alert("예약에 실패하였습니다");
			
	        reservation_end_modal.style.display = "none";
	        $('body').css("overflow", "scroll");
	        
	        $('#section_end1').attr("style", "display:flex");
	        $('#section_end2').attr("style", "display:none");
	        
	        
	        
		}
	});
 	
}

function replyUpdate(reviewNo){
	console.log(document.getElementById("reply_con_" + reviewNo).value);
	
	$.ajax({
		type: "POST",
		url: "<%=request.getContextPath()%>/replyUpdate.do",
		data: {"reply_con": document.getElementById("reply_con_" + reviewNo).value,
				"review_no": reviewNo},
		success: function(data){
			
			if(data=="t"){
				
				
				
				$("#reply").parent().attr("style", "display:none");
				$("#reply_con_"+reviewNo).parent().attr("style", "display:none");
				/* document.getElementById("reply_con_" + reviewNo).value = reply_con; */
				$("#reply1_"+reviewNo).attr("style", "display:block");
				$("#reply2_"+reviewNo).attr("style", "display:block");
			/* 	$("#replyIn1_"+reviewNo).parent().attr("style", "display:none");
				$("#replyIn2_"+reviewNo).parent().attr("style", "display:none"); */
				
				document.getElementById("reply_reCon_" + reviewNo).innerHTML = document.getElementById("reply_con_" + reviewNo).value;
				

				
			}else{
				alert("답글입력에 실패하였습니다.");
			}
			
			
		},
		error: function(){
	        
			alert("답글입력에 실패하였습니다.");
	        
		}
		
	});
}

function bline_request_insert(){
	$.ajax({
		type: "POST",
		url: "<%=request.getContextPath()%>/blineRequestInsert.do",
		data: {"userId": "<%=userId%>", "boardCode": <%=boardT.getBoardNo()%>,
			"blineText": document.getElementById("bline_con").value},
		success: function(data){
			
			if(data=="t"){
				alert("블라인드 요청이 완료되었습니다.");
			}else if(data=="f"){
				alert("블라인드 요청이 실패하였습니다.");
			}else if(data=="c"){
				alert("이미 블라인드 요청한 글입니다.");
			}
			
		},
		error: function(){
			alert("블라인드 요청이 실패하였습니다.");
	        
		}
	});
	
	$("#bline_process_modal").attr("style", "display:none");
	$('body').css("overflow", "scroll");
	
} 

</script>

<%@include file="/views/common/footer.jsp" %>


<script src="js/PST.js"></script>