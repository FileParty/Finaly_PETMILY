<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.List, com.petmily.petsitterReview.model.vo.PetSitterReview" %>
<%
	List<PetSitterReview> list=(List)request.getAttribute("list");
	int count=1;
	String star="";
%>

<%@ include file="/views/common/header.jsp" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
    
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>펫 프로필</title>
</head>
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
<body>
    <section>
        <div class="container">
            <div class="row">
                <!-- 메뉴 영역 -->
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
                        <li class="breadcrumb-item">작성글</li>
                        <li class="breadcrumb-item active">작성한 비밀후기 보기</li>
                    </ul>
                    <!-- 콘텐츠 영역 -->
                    
                    <table id="enrollTB">
					
                    <tr class="tr-blank">
                        <th class="no">No</th>
            			<th class="star">별점</th>
            			<th class="name">사용자 아이디</th>
                        <th class="ckDate">후기 내용</th>
                        <th class="ckDate">작성 날짜</th>
                        <th>작성 후기</th>
                    </tr>
                   <%for(PetSitterReview psr:list){ %>
                   	<tr>
                   		<td><%=count++%>
                   		</td>
                   		<td>
                   		<%switch(psr.getReviewStar()) {
	                   		case 1:  star="★"; break;
	                   		case 2:  star="★★"; break;
	                   		case 3:  star="★★★"; break;
	                   		case 4:  star="★★★★"; break;
	                   		case 5:  star="★★★★★"; break;
                   		}%>
                   		<%=star%></td>
                   		<td><%=psr.getUserId()%></td>
                   		<td><div class="txt_line"><%=psr.getReviewTxt()%></div></td>
                   		<%String birth =  psr.getReviewDate();%>
	                    <%String str = birth.substring(0, 10);%>
                   		<td><%=str%></td>
                   		<td>
                   			<input id="detail" type="hidden" value="<%= psr.getSitterReviewNo()%>"/>
                   			<button class="btnDetail" type="button">작성글 보기</button>
                   		</td>
                   	</tr>
                   <%} %>
						
                </table>
                    
                    	
            </div>
        </div>
    </section>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


	<script>
	$(function(){
		$(".btnDetail").click((e)=>{
		// 서블릿에 보낼 no값 불러오기
		var no = $(e.target).prev().val();
		
		var url = "<%=request.getContextPath()%>/sitter/reviewDetail?no="+no;
		var status = "height=420px, width=600px, top=200px, left=500px";
		
		window.open(url, "_blank", status);
		});
	});


</script>
</html>

