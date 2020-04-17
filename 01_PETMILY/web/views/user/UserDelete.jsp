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
                            <li class="content"><a href="<%=request.getContextPath()%>/user/Update?userId=<%=loginUser.getUserId()%>"> - 회원정보 수정</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/Delete?userId=<%=loginUser.getUserId()%>"> - 회원 탈퇴</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/BookMarkList?userId=<%=loginUser.getUserId()%>"> - 북마크</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/Review?userId=<%=loginUser.getUserId()%>"> - 작성 후기</a></li>
                            <br/>
        
                            <li class="title">펫 프로필</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href=""> - 펫 프로필</a></li>
                            <br/>
                            
                            <li class="title">예약</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href=""> - 요청한 예약</a></li>
                            <li class="content"><a href=""> - 진행중인 예약</a></li>
                            <li class="content"><a href=""> - 종료된 예약</a></li>
                            <li class="content"><a href=""> - 채팅</a></li>
                            <br/>
                            
                            <li class="title">결제</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href=""> - 결제 내역</a></li>
                            <li class="content"><a href=""> - 추가 요금 내역</a></li>
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
                        <p>탈퇴 시 해당 이메일 아이디 재가입이 불가합니다. 펫시터의 경우 보유하고 계신 수익금과 관련된 이력이 모두 삭제되며, 진행중인 예약이 모두 취 소 또는 완료가 된 후에 탈퇴 가능합니다. 이를 지키지 않아 발생하는 문제에 대한 책임은 회원 본인에게 있으니 신중히 결정해 주시기를 바랍니다.
                            탈퇴 후에도 서비스에 등록한 후기는 자동으로 삭제되지 않으며 그대로 남아있습니다. 삭제를 원하는 게시글이 있다면 반드시 탈퇴 전에 삭제를 요 청해주시기 바랍니다. 탈퇴 후에는 회원 정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없으므로 후기글을 임의로 삭제해 드릴 수 없습니다.</p>
                    </div>     
               
                        <br/>
                        <br/>
                        <div class="row" style="margin-left: 35%;">
                            <div style="margin-top:80px; margin-bottom: 100px;">
                                <button class="btn" style="color:white; border: solid 1px #666666; background-color :#666666; margin-right:10px;" class="btn1 preview" type="button">예약 요청 삭제</button>
                                <button class="btn" style="color:white; border: solid 1px black; background-color :black" class="btn1" type="submit">회원 탈퇴</button>
                            </div>
                        </div>
                        <br/>
                        <br/>

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