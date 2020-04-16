<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="com.petmily.user.model.vo.User" %>

<%
	User u = (User)request.getAttribute("user");
%>
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
        a:link { color: black; text-decoration: none;}
        a:visited { color: gray; text-decoration: none;}
        a:hover { color: black; text-decoration: underline;}
    .vl {   width: 1px;
            margin-top: 0px;
            border-left: 1px solid lightgrey;
            /* height: 100%; */
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
        margin-left: 50px;
        margin-top: 60px;
    }
 .notice{
    margin: 20px;
     font-size: 12px;
     background-color: rgb(196, 196, 196);
     padding:10px;
     border: 1px solid rgb(71, 71, 71);
 }
 .btn{
    padding-top: 5px;
    padding-bottom: 20px;
    font-size: 12px;
    border-radius: 25px;
	width: 100px;
	height: 30px;
 }
 
     table{
        border-radius: 5px;
        margin-left: auto;
        margin-right: auto;
        border-collapse: collapse;
 	}
    td{
    	font-size : 12px;
        border-top: 1px solid grey;
        border-bottom: 1px solid grey;
		text-align: center;
		line-height: 30px;
		vertical-align:middle; 
    }

    th{
    	font-weight: 500;
        width: 150px;
        font-size: 14px;
        text-align: center;
        line-height: 25px;
        background-color: rgb(189, 188, 188);
        color: grey;
        border-right: 1px solid white;
    }
    .txt_line {
    display: block;
    text-align : left;
    width:200px;
    padding:0 10px;
    overflow:hidden;
    text-overflow:ellipsis; white-space:nowrap; }
    
    button{
    line-height: 0px;
    font-size: 10px;
	color: #ffcc33;
	  width: 80px;
	  height: 20px;
	  border-radius: 20.5px;
	  border: solid 1px #ffcc33;
	  background-color: white;
	  vertical-align:middle; 
	  margin-bottom:3px;
	}

	button:hover{
	    color: white;
	    background-color: #ffcc33;
	}

</style>

<!-- 회원탈퇴 화면 -->
    <section>
        <div class="container">
            <form action="<%=request.getContextPath()%>/user/DeleteEnd" method="post" onsubmit="return test();">
            
            <!-- form을 넘기기 위해 hidden 처리한 input을 만듦. -->
            <input type="hidden" id="userId" name="userId" value="<%= u.getUserId() %>" >
            
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
                            <li class="content"><a href=""> > 작성한 비밀후기 보기</a></li>
                            <br/>
                            
                            <li class="title">예약</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href=""> - 예약 현황</a></li>
                            <li class="content"><a href=""> - 결제 전 예약</a></li>
                            <li class="content"><a href=""> - 결제 완료 예약</a></li>
                            <li class="content"><a href=""> - 내 예약 일정</a></li>
                            <li class="content"><a href=""> - 채팅</a></li>
                            <br/>
                            
                            <li class="title">정산</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href=""> > 이번 달 정산 현황</a></li>
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
                    <li class="breadcrumb-item">회원 정보</li>
                    <li class="breadcrumb-item active">회원 탈퇴</li>
                </ul>
                   <!-- 콘텐츠 영역 -->
                    <div class="row notice">
                        <p><회원 탈퇴></p>
                        <p>* 정산은 매달 5일에 이루어 집니다.</p>
						<p>* 매달 1일부터 말일까지 결제 완료된 금액에 대해서 정산을 진행합니다. * 건당 수수료 10%가 (주)펫 밀리로 지급됩니다.</p>
						<p>* 정산된 금액은 회원정보에 등록된 계좌로 입금됩니다.</p>
                    </div>     
               
                        <br/>
                        <br/>
                        <tr class="tr-blank">
                        <th>No</th>
            			<th>체크 인</th>
            			<th>체크 아웃</th>
                        <th>요청자 명</th>
                        <th>최종 결제 금액</th>
                        <th>수수료</th>
                        <th>결제 날짜</th>
                    </tr>
                    	<tr>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	
                    	</tr>
                        <br/>
                        <br/>
						<div>
						<p>이번 달 총 정산 금액 : 원</p>
						</div>
                    </div>
                </div>
            </div>
        </form>
        </div>
    </section>
    
    <br><br><br><br>

    <!-- Optional JavaScript -->
    <!— jQuery first, then Popper.js, then Bootstrap JS —>
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%@ include file="/views/common/footer.jsp" %>