<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.List, com.petmily.pet.model.vo.Pet" %>
<%
	List<Pet> list= (List)request.getAttribute("list");

%>

<%@ include file="/views/common/header.jsp" %>

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
    td{
        /* width: 100px; */
        /* font-size: 12px;
        padding: 5px; */
    }
    .second-td{
        /* text-align: left;
        color: gray;
        line-height: 40px */
    }
    .third-td{
        /* text-align: right; */
    }

    table{
        border-collapse: collapse;
        width: 500px
    }

    td{
/*     
        border-top: 1px solid gray;
        border-bottom: 1px solid gray; */
        
    }

    input,select{
        
        border-radius: 5px;
        border: 1px solid rgb(179, 179, 179);
        background-color: rgb(228, 228, 228);
        height: 30px;
        padding: 10px;
        font-size: 11px;
    }
    #intro{
        height: 200px;
    }
    #inner{
        margin-top: 10px;
        border-collapse: collapse;
        border-color: white;
        padding: 100px;
        background-color: lightgray;
        
    }
    #inner td{
        padding: 10px 10px;
        text-align: center;
        border: 1px solid white;
    }
    #inner tr{
        border: 1px solid white;
    }
    #line{
        width: 770px;
    }
    .sub-title{
        padding-left: 10px;
        font-size: 13px;
        font-weight: 300;
        border-bottom: 1px solid rgb(201, 201, 201);
        line-height: 40px;
    }
    .none{
        padding-left: 30px;
        width: 300px;
    }
    .yes{
        border-bottom: 1px solid rgb(201, 201, 201);
        padding-left: 30px;
    }

.btn2{
    margin-left: 3px;
    font-size: 12px;
    padding: 0;
    width: 20px;
    height: 20px;

}
.btn1{
/* border: 3px solid #ffcc3383;
background-color: #ffcc33; */
    font-size: 12px;
  width: 110px;
  height: 35px;
  border-radius: 20.5px;
 
}
.btn1:hover{
    color: white;
    background-color: #ffcc33;
}
button{
    font-size: 12px;
color: #ffcc33;
  width: 100px;
  height: 30px;
  border-radius: 20.5px;
  border: solid 1px #ffcc33;
  background-color: white;
}

button:hover{
    color: white;
    background-color: #ffcc33;
    cursor: pointer;
}
label.custom-file-label::after{
    height: 28px;
}

.hr-line {
    height: 2px;
    color: #ffcc33;
    background-color: #ffcc33;
    border: none;
}

.duplicate{
        font-size: 12px;
        color: white;
        width: 80px;
        height: 30px;
        border-radius: 20.5px;
        border: solid 1px grey;
        background-color: grey;
    }

    .duplicate:hover{
    color: white;
    background-color: #ffcc33;
    border: solid 1px #ffcc33;
    }



        div.allList{
       		height:100%;
            width:100%;
            margin-right:auto;
            margin-left:auto;
        }
        div.list{
        	text-align:center;
        	font-size : 14px;
        	border-radius : 15px;
        	background-color: lightgrey;
        	line-height: 10px;
            width: 47%;
            padding : 15px;
            height:100%;
            float:left;
            margin-left : 15px;
            margin-bottom : 10px;

        }
        .btn-enroll{
        	padding-top:100px;
            display:flex;
            clear:both;
            justify-content: center;
        }
</style>

    <section>
        <div class="container">
            <div class="row">
                <!-- 메뉴 영역 -->
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
                            <li class="content"><a href="<%=request.getContextPath()%>/user/petprofile?userId=<%=loginUser.getUserId()%>"> - 펫 프로필</a></li>
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
                        <li class="breadcrumb-item">펫 프로필</li>
                        <li class="breadcrumb-item active">펫 프로필</li>
                    </ul>
                    <!-- 콘텐츠 영역 -->
                    <div class="allList" id="container">
	                <%if(!list.isEmpty()){
					for(Pet p : list){%>
	                    <div class="list">
	                   
	                    <p style="text-align : left; font-size:10px;">No.<%=p.getPetCode()%></p>
	                    <img src="<%=request.getContextPath()%>/upload/pet/<%=p.getPetImg()%>" width="200px"/>
	                    <p style="font-weight: 500; margin-top:15px;"><%=p.getPetName()%></p>
	                    <p><span><%=p.getPetGender()%>/ <%=p.getPetKind()%> / <%=p.getPetWeight()%></span></p>
	                    <%String birth =  p.getPetAge();%>
	                    <%String str = birth.substring(0, 10);%>
	                    <p>생일: <%=str%></p> 
	                    <input id="code" type="hidden" value="<%=p.getPetCode()%>"/>
	                    <button type="button" class="btnDetail" >상세보기</button>
	                    <br/>
	                    </div>
	                    
	                 <%} }%>
                    <div class="btn-enroll">
                        <div>
                            <button
                             onclick="location.replace('<%=request.getContextPath()%>/user/petprofile/upload')"
                             style= "color:white; border: solid 1px black; background-color :black; text-align: center;" type="submit">
                            <span>등록</span></button>
                        </div>
                </div>
                        <br/>
                        <br/>
                        <br/>
                    </div>
                    	
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
				var d = {no:$(e.target).prev().val()}
				console.log(d);
				$.ajax({
					url:"<%=request.getContextPath()%>/user/petprofile/detail",
					type:"get",
					data:d,
					dataType:"html",
					success:(data)=>{
						$("#container").html(data);
					}
					
				});
			});	
		});
	
	</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
 if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 

today = yyyy+'-'+mm+'-'+dd;
document.getElementById("pday").setAttribute("max", today);

// 토글 버튼
    
function toggle1(){ //on/off하나의 버튼으로 가능.

    $('.row1').slideToggle(100); //시간 부여
    
}

function toggle2(){ //on/off하나의 버튼으로 가능.
 
    $('.row2').slideToggle(100); //시간 부여
    };

function toggle3(){ //on/off하나의 버튼으로 가능.

    $('.row3').slideToggle(100); //시간 부여
    };

function toggle4(){ //on/off하나의 버튼으로 가능.

$('.row4').slideToggle(100); //시간 부여
};




</script>



