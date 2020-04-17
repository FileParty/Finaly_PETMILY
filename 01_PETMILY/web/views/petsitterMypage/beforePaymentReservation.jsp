<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="java.util.List,com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageReservation" %>

<%@ include file="/views/common/header.jsp" %>


<%
	int count=1;
	List<PetsitterMypageReservation> list=(List)request.getAttribute("list");
%>

<style>
   *{   
       
        box-sizing: border-box;
        font-family: 'Noto Sans KR', sans-serif;
    }
    html, body,section,form {
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
        height: 100%;
    }
    .menu{
            width: 230px;
            /* border: 1px solid yellow; */
            margin-top: 150px;
            height: 100%;
            
        }
    #menu{
        width: 230px;
        position : fixed;
        height: 100%;
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
        a:link { color: black; text-decoration: none;}
        a:visited { color: gray; text-decoration: none;}
        a:hover { color: black; text-decoration: underline;}
    .vl {   width: 1px;
            margin-top: 0px;
            border-left: 1px solid lightgrey;
            height: 100%;
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
    hr{
            margin-left: 0;
            width: 10%;
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
		text-align: center;
    }

    th{
        width: 150px;
        font-size: 12px;
        text-align: center;
        background-color: rgb(189, 188, 188);
        color: grey;
        border-right: 1px solid white;
    }

</style>

	    <section>
	        <div class="container">
	            <form action="<%=request.getContextPath()%>/sitter/write?userId=sebin" method="post" onsubmit="return test();" enctype="multipart/form-data">
		            <div class="row">
		            	<div class="col-2 menu">
		                    <div id="menu">
		                        <ul type="none">
		                            <li class="title">회원정보</li>
		                            <hr class="hr-line"/>
		                            <li class="content"><a href=""> - 회원정보 수정</a></li>
		                            <li class="content"><a href=""> - 회원 탈퇴</a></li>
		                            <br/>
		                            
		                            <li class="title">작성글</li>
		                            <hr class="hr-line"/>
		                            <li class="content"><a href=""> - 작성글 보기</a></li>
		                            <li class="content"><a href=""> - 작성한 비밀 후기 보기</a></li>
		        					</br>
		                            
		                            <li class="title">예약</li>
		                            <hr class="hr-line"/>
		                            <li class="content"><a href=""> - 요약 현황</a></li>
		                            <li class="content"><a href=""> - 결제 전 예약</a></li>
		                            <li class="content"><a href=""> - 결제 완료 예약</a></li>
		                            <li class="content"><a href=""> - 내 예약 일정</a></li>
		                            <li class="content"><a href=""> - 채팅</a></li>
		                            <br/>
		                            
		                            <li class="title">정산</li>
		                            <hr class="hr-line"/>
		                            <li class="content"><a href=""> - 이번 달 정산 현황</a></li>
		                            <li class="content"><a href=""> - 이전 정산 보기</a></li>
		                            <br/>
		                            
		                            <li class="title">자격증</li>
		                            <hr class="hr-line"/>
		                            <li class="content"><a href=""> - 보유 자격증 목록</a></li>
		                            <li class="content"><a href=""> - 자격증 추가</a></li>
		                            <br/>
		                            
		                        </ul>
		                    </div>
		                </div>
	            		<div class="vl"></div>
		            	<div class="col-9" style="padding:0;">
		                <div class="row top-div" style="height: 200px;overflow: hidden;">
		                    <img class="top-img" style="width: 100%; margin-top: -230px;" src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
		                </div>
		                <ul class="breadcrumb">
		                    <li class="breadcrumb-item">결제 전 예약</li>
		                </ul>
		                   <!-- 콘텐츠 영역 -->
			                   <table id="enrollTB">
								
			                    <tr class="tr-blank">
			                        <th class="no">No</th>
			            			<th class="cho">선택</th>
			                        <th class="ckDate">체크 인</th>
			                        <th class="ckDate">체크 아웃</th>
			                        <th class="name">요청자 명</th>
			                        <th class="read">펫 프로필 열람</th>
			                        <th class="read">비밀 후기 열람</th>
			                        <th>요청 상세</th>
			                        <th class="state">상태</th>
			                        <th>채팅</th>
			                    </tr>
			                    <%if(list!=null){ %>
			                    <%for(PetsitterMypageReservation pmr:list){ %>
			                    <tr>
			                    	<td class="no"><%=count++ %></td>
			                    	<td class="cho"><form><input type="checkbox" name="" value=""></form></td>
			                    	<td class="ckDate"><%=pmr.getCheckInDate() %></td>
			                    	<td class="ckDate"><%=pmr.getCheckOutDate() %></td>
			                    	<td class="name"><%=pmr.getUserName() %></td>
			                    	<td class="read"><div class="p-1"><button type="button" class="btn" >열람</button></div></td>
			                    	<td><div class="p-1"><button id="secretReview" type="button" class="btn" data-toggle="modal" data-target="#secretReviewModal" value=<%=pmr.getUserId() %>>열람</button></div></td>
			                    	<td><div class="p-1"><button type="button" class="btn" id="requestDetail" class="btn" data-toggle="modal" data-target="#requestDetailModal" value=<%=pmr.getPlusQuestions() %> >상세 요청 확인</button></div></td>
			                    	<td class="state"><%=pmr.getResType() %></td>
			                    	<td><div class="p-1"><button type="button" class="btn">채팅</button></div></td>
			                    </tr>
			                 	<%} }%>
			                </table>
		                	
		                	
		                	<!-- 비밀후기 모달 -->
		                	  <div class="modal" id="secretReviewModal">
							    <div class="modal-dialog">
							      <div class="modal-content">
							      
							        <!-- Modal Header -->
							        <div class="modal-header">
							          <h4 class="modal-title ">비밀 후기 열람</h4>
							          <button type="button" class="close" data-dismiss="modal">&times;</button>
							        </div>
							        
							        <!-- Modal body -->
							        <div class="modal-body" id="secretReviewModalBody">
							          
							        </div>
							        
							        <!-- Modal footer -->
							        <div class="modal-footer">
							          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							        </div>
							        
							      </div>
							    </div>
							  </div>
							  
							  <!-- 상세요청 모달 -->
		                	  <div class="modal" id="requestDetailModal">
							    <div class="modal-dialog">
							      <div class="modal-content">
							      
							        <!-- Modal Header -->
							        <div class="modal-header">
							          <h4 class="modal-title ">요청 상세</h4>
							          <button type="button" class="close" data-dismiss="modal">&times;</button>
							        </div>
							        
							        <!-- Modal body -->
							        <div class="modal-body" id="modalBody">
							         
							        </div>
							        
							        <!-- Modal footer -->
							        <div class="modal-footer">
							          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							        </div>
							        
							      </div>
							    </div>
							  </div>
		                	
			                <div>
			                	<br>
				                <button action="#" class="btn">결제 거절</button>
				                <button action="#" class="btn">결제 진행</button>
							</div>
		                </div>
	            </div>
	        </form>
        </div>
    </section>
    
    <style>
	.no{
		width:40px;
	}
	
	.name{
		width:100px;
	}
	.state{
		width:80px;
	}
	.read{
		width:100px;
	}
	.ckDate{
		width:130px;
	}
	.cho{
		width:60px;
	}
	.btn {
	  
	  border-radius: 29.5px;
	  border: solid 1px #808080;
	  background-color: #f0f0f0;
	  font-size:13px;
	  height:30px;
	}
	
</style>

<script>
	$(function(){
		
		$("#secretReview").click((e)=>{
			//console.log($(this).val());
			$.ajax({
				url:"<%=request.getContextPath()%>/petsitter/mypage/userReviewList",
				data:{userId:$(e.target).val()},
				error:function(){
	  				alert("실패");
	  				console.log($(this).val());
	  			},
	  			success:data=>{
	  				$("#secretReviewModalBody").html(data);
	  			}
			});
		});
	});
	
	$(function(){
		
		$("#requestDetail").click(()=>{
		
			$.ajax({
				url:"<%=request.getContextPath()%>/petsitter/mypage/requestDetail",
				data:{userId:$(this).val()},
				error:function(){
	  				alert("실패");
	  				console.log($(this).val());
	  			},
	  			success:data=>{
	  				$("#requestDetailModal").html(data);
	  			}
			});
			
		});
	});
	
	
</script>

<%@ include file="/views/common/footer.jsp" %>