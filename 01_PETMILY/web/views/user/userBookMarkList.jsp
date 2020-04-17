<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List,com.petmily.user.model.vo.UserBookMarkBoard,com.petmily.user.model.vo.User" %>
<%
	List<UserBookMarkBoard> list = (List)request.getAttribute("list");
	for(UserBookMarkBoard ubmb : list) {
		System.out.println("화면에 갖고오나?"+ubmb);
	}
%>     
    
<%@ include file="/views/common/header.jsp" %>
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
            margin-top: 50px;
            height: 100%;
            
        }
    #menu{
        width: 230px;
        /* position : fixed; */
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

    }

    th{
        width: 150px;
        font-size: 12px;
        text-align: center;
        background-color: rgb(189, 188, 188);
        color: grey;
        border-right: 1px solid white;
    }
	a#detailViewBTN {
	    color: gray;
	}
	a#detailViewBTN:hover {
	    color: black;
	}
</style>


    <section>
        <div class="container">
            <form action="<%=request.getContextPath()%>" method="post" onsubmit="return test();">
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
                    <li class="breadcrumb-item active">북마크</li>
                </ul>
                   <!-- 콘텐츠 영역 -->
                   <table id="enrollTB">

                    <tr class="tr-blank">
                        <th>no</th>
            			<th>제목</th>
            			<th>펫 시터 이름</th>
                        <th>일박 케어 요금(소형)</th>
                        <th>일박 케어 요금(중형)</th>
                        <th>일박 케어 요금(대형)</th>
                        <th>게시글 링크</th>
                    </tr>
                    
                    <% for(UserBookMarkBoard ubmb : list) { %>
	                 <tr>
                    	<!-- no -->
						<td><p style="text-align: center;"><%= ubmb.getBoardCode() %></p></td>
						<!-- 제목 -->
						<td><p style="text-align: center;"><%= ubmb.getBoardTitle() %></p></td>
						<!-- 펫 시터 이름 --> 
						<td><p style="text-align: center;"><%= ubmb.getUserName() %></p></td> 
						<!-- 일박 케어 요금 s,m,b-->
						<td><p style="text-align: center;"><%= ubmb.getOnedaySprice() %>원</p></td> <!-- s --> 
						<td><p style="text-align: center;"><%= ubmb.getOnedayMprice() %>원</p></td> <!-- m -->
						<td><p style="text-align: center;"><%= ubmb.getOnedayBprice() %>원</p></td> <!-- b -->
						<!-- 게시글 링크 -->
						<td><a id="detailViewBTN" href="javascript:void(0);" style="margin-left: 10px;"
						onclick="location.replace('<%=request.getContextPath()%>/BoardList.do?userId=<%=loginUser.getUserId()%>&boardCode=<%=ubmb.getBoardCode()%>')">상세 내역 보기</a></td> 
                    </tr>
	                 <% } %>
    
                    
                </table>
                
                <br><br><br>
				
				<div style="padding-left: 370px;"><%=request.getAttribute("pageBar") %></div>

                    </div>
                </div>
            </div>
        </form>
        </div>
    </section>
    
    
    <br><br><br>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%@ include file="/views/common/footer.jsp" %>