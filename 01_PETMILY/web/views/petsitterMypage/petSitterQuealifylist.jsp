<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<style>
	*{   
	       
	        box-sizing: border-box;
	        font-family: 'Noto Sans KR', sans-serif;
	    }
	    html, body,section {
	          height: 100%;
	      }
	    .col-9{
	        height: 100%;
	        /* overflow: hidden; */
	    }
	    .container{
	        height: 100%;
	        padding: 0;
	        width: 1366px;
	        margin-left: auto;
	        margin-right: auto;
	        /* border: 1px solid red; */
	 
	    }
	    .top-div{
	    	overflow: hidden;
	    }
	    .row{
	        padding: 0;
	        margin: 0;
	    }
	    .menu{
	            width: 230px;
	            /* border: 1px solid yellow; */
	            margin-top: 50px;
	
	        }
	    #menu{
	        width: 230px;
	        /* position : fixed; */
	    }
	    ul{
	        padding-inline-start:0;
	    }
	    .title{
	        font-size: 14px;
	    }
	    .content{
	        font-size: 12px;
	        margin-bottom: 5px;
	    }
	    
	    /* ---------- 슬기 작업 css ----------- */
	    a.menu_a {
	    	color: gray;
	    	text-decoration: none;
	    }
	    
	    .breadcrumb .active {
        	color: white;
	    }
	    
	    .breadcrumb{
	
	        background-color: #ffcc33;
	        /* z-index: 500px !important; */
	        /* position: fixed; */
	        height: 40px;
	        width: 100%;
	        border-radius: 0%;
	    }
	    
	    .breadcrumb-item{
	        line-height: 16px;
	        font-size: 12px;
	    }
	    
	    
	    .breadcrumb .active {
        	color: white;
   		}
</style>

<section>
        <div class="container">
            
            <div class="row">
	            <div class="col-1 menu">
	                    <div id="menu">
	                        <ul type="none">
								<li class="title">회원정보</li>
								<hr class="hr-line"/>
								<li class="content"><a class="menu_a" href=""> - 회원정보 수정</a></li>
								<li class="content"><a class="menu_a" href=""> - 회원 탈퇴</a></li>
								<br/>
								<li class="title">작성글</li>
								<hr class="hr-line"/>
								<li class="content"><a class="menu_a" href="<%=request.getContextPath()%>/sitter/Detail"> - 작성글 보기</a></li>
								<li class="content"><a class="menu_a" href=""> - 작성한 비밀 후기 보기</a></li>
								</br>
								<li class="title">예약</li>
								<hr class="hr-line"/>
								<li class="content"><a class="menu_a" href=""> - 요약 현황</a></li>
								<li class="content"><a class="menu_a" href=""> - 결제 전 예약</a></li>
								<li class="content"><a class="menu_a" href=""> - 결제 완료 예약</a></li>
								<li class="content"><a class="menu_a" href=""> - 내 예약 일정</a></li>
								<li class="content"><a class="menu_a" href=""> - 채팅</a></li>
								<br/>
								<li class="title">정산</li>
								<hr class="hr-line"/>
								<li class="content"><a class="menu_a" href=""> - 이번 달 정산 현황</a></li>
								<li class="content"><a class="menu_a" href="<%=request.getContextPath()%>/sitter/settled"> - 이전 정산 보기</a></li>
								<br/>
								<li class="title">자격증</li>
								<hr class="hr-line"/>
								<li class="content"><a class="menu_a" href="<%=request.getContextPath()%>/sitter/certificate"> - 보유 자격증 목록</a></li>
								<li class="content"><a class="menu_a" href="<%=request.getContextPath()%>/sitter/AddCertificate"> - 자격증 추가</a></li>
								<br/>
							</ul>
	                    </div>
	                </div>
	            <div class="vl"></div>
	            
	            <!-- 우측 컨텐츠 -->
	            <div class="col-9" style="padding: 0;">
	            	<div class="row top-div" style="height: 200px;overflow: hidden;">
	                    <img class="top-img" style="width: 100%; margin-top: -230px;" src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
	                </div>
	                <ul class="breadcrumb">
	                    <li class="breadcrumb-item">정산</li>
	                    <li class="breadcrumb-item active">이전 정산 보기</li>
	                </ul>
	                
	                
	            </div>
            
			</div>
		
	</div>
</section>            
<!-- 슬기 작업 -->
<%@ page import="com.petmily.petsitter.settled.model.vo.*, java.util.List"%>
<%
	List<PetReservation> list = (List)request.getAttribute("list");
	System.out.println("이전 정산 보기를 가져오는가... -> "+list);
	
	int count=1;
	
%>

<style>
	*{   
	       
	        box-sizing: border-box;
	        font-family: 'Noto Sans KR', sans-serif;
	    }
	    html, body,section {
	          height: 100%;
	      }
	    .col-9{
	        height: 100%;
	        /* overflow: hidden; */
	    }
	    .container{
	        height: 100%;
	        padding: 0;
	        width: 1366px;
	        margin-left: auto;
	        margin-right: auto;
	        /* border: 1px solid red; */
	 
	    }
	    .top-div{
	    	overflow: hidden;
	    }
	    
	    .vl {   width: 1px;
            margin-top: 0px;
            border-left: 1px solid lightgrey;
            /* height: 100%; */
        }
	    
	    .row{
	        padding: 0;
	        margin: 0;
	    }
	    .menu{
	            width: 230px;
	            /* border: 1px solid yellow; */
	            margin-top: 50px;
	
	        }
	    #menu{
	        width: 230px;
	        /* position : fixed; */
	    }
	    
	    hr{
            margin-left: 0;
            width: 10%;
        }
        
        .hr-line {
		    height: 2px;
		    color: #ffcc33;
		    background-color: #ffcc33;
		    border: none;
		}
	    
	    
	    ul{
	        padding-inline-start:0;
	    }
	    .title{
	        font-size: 14px;
	    }
	    .content{
	        font-size: 12px;
	        margin-bottom: 5px;
	    }
	    
	    table{
	        border-radius: 5px;
	        margin-left: auto;
	        margin-right: auto;
	        border-collapse: collapse;
	 	}
	    td{
	        border-top: 1px solid grey;
	        border-bottom: 1px solid grey;
	
	    }

	    th{
	        width: 150px;
	        font-size: 12px;
	        text-align: center;
	        background-color: rgb(189, 188, 188);
	        color: grey;
	        border-right: 1px solid white;
	    }
	    
	    
	    /* ---------- 슬기 작업 css ----------- */
	    a.menu_a {
	    	color: gray;
	    	text-decoration: none;
	    }
	    
	    .breadcrumb .active {
        	color: white;
	    }
	    
	    .breadcrumb{
	
	        background-color: #ffcc33;
	        /* z-index: 500px !important; */
	        /* position: fixed; */
	        height: 40px;
	        width: 100%;
	        border-radius: 0%;
	    }
	    
	    .breadcrumb-item{
	        line-height: 16px;
	        font-size: 12px;
	    }
	    
	    
	    .breadcrumb .active {
        	color: white;
   		}
</style>

<section>
        <div class="container">
            
            <div class="row">
	            <div class="col-2 menu">
	                    <div id="menu">
	                        <ul type="none">
								<li class="title">회원정보</li>
								<hr class="hr-line"/>
								<li class="content"><a class="menu_a" href=""> - 회원정보 수정</a></li>
								<li class="content"><a class="menu_a" href=""> - 회원 탈퇴</a></li>
								<br/>
								<li class="title">작성글</li>
								<hr class="hr-line"/>
								<li class="content"><a class="menu_a" href="<%=request.getContextPath()%>/sitter/Detail"> - 작성글 보기</a></li>
								<li class="content"><a class="menu_a" href=""> - 작성한 비밀 후기 보기</a></li>
								</br>
								<li class="title">예약</li>
								<hr class="hr-line"/>
								<li class="content"><a class="menu_a" href=""> - 요약 현황</a></li>
								<li class="content"><a class="menu_a" href=""> - 결제 전 예약</a></li>
								<li class="content"><a class="menu_a" href=""> - 결제 완료 예약</a></li>
								<li class="content"><a class="menu_a" href=""> - 내 예약 일정</a></li>
								<li class="content"><a class="menu_a" href=""> - 채팅</a></li>
								<br/>
								<li class="title">정산</li>
								<hr class="hr-line"/>
								<li class="content"><a class="menu_a" href=""> - 이번 달 정산 현황</a></li>
								<li class="content"><a class="menu_a" href="<%=request.getContextPath()%>/sitter/settled"> - 이전 정산 보기</a></li>
								<br/>
								<li class="title">자격증</li>
								<hr class="hr-line"/>
								<li class="content"><a class="menu_a" href="<%=request.getContextPath()%>/sitter/certificate"> - 보유 자격증 목록</a></li>
								<li class="content"><a class="menu_a" href="<%=request.getContextPath()%>/sitter/AddCertificate"> - 자격증 추가</a></li>
								<br/>
							</ul>
	                    </div>
	                </div>
	            <div class="vl"></div>
	            
	            <!-- 우측 컨텐츠 -->
	            <div class="col-9" style="padding: 0;">
	            	<div class="row top-div" style="height: 200px;overflow: hidden;">
	                    <img class="top-img" style="width: 100%; margin-top: -230px;" src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
	                </div>
	                <ul class="breadcrumb">
	                    <li class="breadcrumb-item">정산</li>
	                    <li class="breadcrumb-item active">이전 정산 보기</li>
	                </ul>
	                
	                <!-- 컨텐츠 내 테이블 영역 -->
	                <table id="enrollTB">

	                    <tr class="tr-blank">
	                        <th>no</th>
	            			<th>정산(월)</th>
	            			<th>결제 건수</th>
	                        <th>최종 정산 금액</th>
	                        <th>수수료</th>
	                    </tr>
	                    
	                    <% for(PetReservation pr : list) { %>
		                 <tr>
	                    	<!-- no -->
							<td>
								<p style="text-align: center;"><%= count++ %></p>
							</td>
							
							<td>
								<p style="text-align: center;"><%= pr.getCheckOutDate() %></p>
							</td>
							
							<!-- 결제 건수 --> 
							<td>
								<p style="text-align: center;"><%= pr.getNumAll()+"건" %></p>
							</td> 
							
							<!-- 최종 정산 금액-->
							<td>
								<p style="text-align: center;"><%= pr.getPrice()+"원" %></p>
							</td> 
							
							<!-- 수수료 -->
							<td>
								<p style="text-align: center;"><%= pr.getFees()+"원" %></p>
							</td> 
							
	                    </tr>
	                    <% } %>
               		</table>
                
              		<br><br><br>
				
					<!-- 페이징처리(일단 주석처리) -->
					<%-- <div style="padding-left: 370px;"><%=request.getAttribute("pageBar") %></div> --%>
	            </div>
            
			</div>
		
	</div>
</section>         

<br><br><br><br>   

<%@ include file="/views/common/footer.jsp" %>