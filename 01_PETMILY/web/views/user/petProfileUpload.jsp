<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <title>펫 프로필 등록</title>
</head>
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
            margin-top: 150px;

        }
    #menu{
        width: 230px;
        position : fixed;
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
                        <li class="breadcrumb-item active">회원 정보 수정</li>
                    </ul>
                    <!-- 콘텐츠 영역 -->
                <form action="<%=request.getContextPath()%>/user/petprofile/uploadEnd" method="post" enctype="multipart/form-data">
                    <table style="margin-left: auto; margin-right:auto">
                        <tr>
                            <td class="sub-title" style="width: 150px;">프로필 이미지</td> 
                        </tr>
                        <tr>
                            <td></td>
                            <td class="none" style="line-height: 5px; font-size: 10px; width: 200px;"><input type="file" name="upload" required/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="none" ><p style="font-size:10px;">*파일명이 영문, 숫자가 아닐경우 이미지가 안보일 수 있습니다.</p></td>
                        </tr>
                        <tr>
                            <td class="sub-title">이름</td>
                            <td class="none"><input type="text" name="pname" placeholder="이름을 입력하세요." style="width: 150px;" required></td>
                        </tr>
                        <tr>
                            <td class="sub-title">성별</td>
                            <td class="none" style="line-height: 40px;">
                                <input type="radio" name="gender" id="gender0" value="수" style="vertical-align:0px" required>
						        <label for="gender0" style= "font-size:12px; vertical-align:10px; padding-right: 10px;">남</label>
						        <input type="radio" name="gender" id="gender1" value="암" style="vertical-align:0px"required >
						        <label for="gender1" style=" font-size:12px; vertical-align:10px;">여</label>
                            </td>
                        </tr>
                        <tr>
                            <td class="sub-title">품종</td>
                            <td class="none"><input type="text" name="ptype" style="width: 150px;" placeholder="품종을 입력하세요." required></td>
                        </tr>                 
                        <tr>
                            <td class="sub-title">생년월일</td>
                            <td class="none"><input type="date" id="pday" style="width: 150px;" name="pday" min="1900-01-01" max="<%=System.currentTimeMillis() %>" required></td>
                        </tr>
                        <tr>
                            <td class="sub-title">무게</td>
                            <td class="none">
                                <select name="weight" aria-placeholder="무게" style="width: 150px; font-size: 12px;" required>
					     
                                    <option value="소형견">7kg 미만</option>
                                    <option value="중형견">7kg-14kg</option>
                                    <option value="대형견">15kg 이상</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="sub-title">반려동물 등록 유무</td>
                                <td class="none" style="width: 200px;">
                                    <input type="radio" name="enroll" id="innn" value="내장형" style="vertical-align:0px">
                                    <label for="innn" style= "font-size:12px; vertical-align:10px; padding-top: 15px; padding-right: 10px;">내장형 무선식별장치 개체 삽입</label>
                                </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="none">
                                <input type="radio" name="enroll" id="out" value="외장형" style="vertical-align:0px">
                                <label for="out" style=" font-size:12px; vertical-align:10px;">외장형 무선식별장치 개체 삽입</label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="none">
                                <input type="radio" name="enroll" id="ident" value="인식표" style="vertical-align:0px">
                                <label for="ident" style=" font-size:12px; vertical-align:10px;">등록인식표 부착</label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="none">
                                <input type="radio" name="enroll" id="non" value="하지않음" style="vertical-align:0px">
                                <label for="non" style=" font-size:12px; vertical-align:10px;">등록하지 않음</label>
                            </td>
                        </tr>
                        <tr>
                            <td class="sub-title">다른 개와 친화적인가요?</td>
                            <td class="yes">
                                <input type="radio" name="friendly" id="y" value="Y" style="vertical-align:0px" required>
						        <label for="y" style= "font-size:12px; vertical-align:10px; padding-right: 10px;">예</label>
						        <input type="radio" name="friendly" id="n" value="N" style="vertical-align:0px"required >
                                <label for="n" style=" font-size:12px; vertical-align:10px; padding-right: 10px;">아니오</label>
                                <input type="radio" name="friendly" id="d" style="vertical-align:0px;"required >
						        <label for="d" style=" font-size:12px; vertical-align:10px;">모름</label>
                            </td>

                        </tr>
                        <tr>
                            <td class="sub-title">중성화 수술을 했나요?</td>
                            <td class="yes">
                                <input type="radio" name="neutral" id="ny" value="Y" style="vertical-align:0px" required>
						        <label for="ny" style= "font-size:12px; vertical-align:10px; padding-right: 10px;">예</label>
						        <input type="radio" name="neutral" id="nn" value="N" style="vertical-align:0px"required >
                                <label for="nn" style=" font-size:12px; vertical-align:10px; padding-right: 10px;">아니오</label>
                                <input type="radio" name="neutral" id="nd" style="vertical-align:0px;"required >
						        <label for="nd" style=" font-size:12px; vertical-align:10px;">모름</label>
                            </td>

                        </tr>
                        <tr>
                            <td class="sub-title">지병이 있나요?</td>
                            <td class="yes">
                                <input type="radio" name="ill" id="iy" value="Y" style="vertical-align:0px" required>
						        <label for="iy" style= "font-size:12px; vertical-align:10px; padding-right: 10px;">예</label>
						        <input type="radio" name="ill" id="in" value="N" style="vertical-align:0px"required >
                                <label for="in" style=" font-size:12px; vertical-align:10px; padding-right: 10px;">아니오</label>
                                <input type="radio" name="ill" id="id" style="vertical-align:0px;"required >
						        <label for="id" style=" font-size:12px; vertical-align:10px;">모름</label>
                            </td>

                        </tr>
                        <tr>
                            
                            <td colspan="2"><textarea style="font-size: 12px; padding:5px; margin-top: 5px;" name="illexplanation" cols="80" rows="4"
                                placeholder="지병 및 다친 적이 있는지 자세하게 적어주세요." ></textarea></td>
                        </tr>

                        <tr>
                            <td class="sub-title">분리불안이 있나요?</td>
                            <td class="yes">
                                <input type="radio" name="anxiety" id="ay" value="Y" style="vertical-align:0px" required>
						        <label for="ay" style= "font-size:12px; vertical-align:10px; padding-right: 10px;">예</label>
						        <input type="radio" name="anxiety" id="an" value="N" style="vertical-align:0px"required >
                                <label for="an" style=" font-size:12px; vertical-align:10px; padding-right: 10px;">아니오</label>
                                <input type="radio" name="anxiety" id="ad" style="vertical-align:0px;"required >
						        <label for="ad" style=" font-size:12px; vertical-align:10px;">모름</label>
                            </td>

                        </tr>
                        <tr>
                            
                            <td colspan="2"><textarea style="font-size: 12px; padding:5px; margin-top: 5px;" name="aexplanation" cols="80" rows="4"
                                placeholder="분리불안 증상을 보일 경우 어떻게 대처하시는지 적어주세요." ></textarea></td>
                        </tr>

                        <tr>
                            <td class="sub-title">대소변을 잘 가리나요?</td>
                            <td class="yes">
                                <input type="radio" name="menstruation" id="my" value="Y" style="vertical-align:0px" required>
						        <label for="my" style= "font-size:12px; vertical-align:10px; padding-right: 10px;">예</label>
						        <input type="radio" name="menstruation" id="mn" value="N" style="vertical-align:0px"required >
                                <label for="mn" style=" font-size:12px; vertical-align:10px; padding-right: 10px;">아니오</label>
                                <input type="radio" name="menstruation" id="md" style="vertical-align:0px;"required >
						        <label for="md" style=" font-size:12px; vertical-align:10px;">모름</label>
                            </td>

                        </tr>
                        <tr>
                            
                            <td colspan="2"><textarea style="font-size: 12px; padding:5px; margin-top: 5px;" name="mexplanation" cols="80" rows="4"
                                placeholder="주로 어디에 대소변을 하는지 적어주세요." ></textarea></td>
                        </tr>

                        <tr>
                            <td class="sub-title">실내 마킹(영역표시)를 하나요?</td>
                            <td class="yes">
                                <input type="radio" name="mark" id="mmy" value="Y" style="vertical-align:0px" required>
						        <label for="mmy" style= "font-size:12px; vertical-align:10px; padding-right: 10px;">예</label>
						        <input type="radio" name="mark" id="mmn" value="N" style="vertical-align:0px"required >
                                <label for="mmn" style=" font-size:12px; vertical-align:10px; padding-right: 10px;">아니오</label>
                                <input type="radio" name="mark" id="mmd" style="vertical-align:0px;"required >
						        <label for="mmd" style=" font-size:12px; vertical-align:10px;">모름</label>
                            </td>

                        </tr>
                        <tr>
                            
                            <td colspan="2"><textarea style="font-size: 12px; padding:5px; margin-top: 5px;" name="mmexplanation" cols="80" rows="4"
                                placeholder="주로 어디에 마킹을 하는지 적어주세요." ></textarea></td>
                        </tr>

                        <tr>
                            <td class="sub-title">반려견이 잘 짖는 편인가요?</td>
                            <td class="yes">
                                <input type="radio" name="bark" id="by" value="Y" style="vertical-align:0px" required>
						        <label for="by" style= "font-size:12px; vertical-align:10px; padding-right: 10px;">예</label>
						        <input type="radio" name="bark" id="bn" value="N" style="vertical-align:0px"required >
                                <label for="bn" style=" font-size:12px; vertical-align:10px; padding-right: 10px;">아니오</label>
                                <input type="radio" name="bark" id="bd" style="vertical-align:0px;"required >
						        <label for="bd" style=" font-size:12px; vertical-align:10px;">모름</label>
                            </td>

                        </tr>
                        <tr>
                            
                            <td colspan="2"><textarea style="font-size: 12px; padding:5px; margin-top: 5px;" name="bexplanation" cols="80" rows="4"
                                placeholder="주로 어떤 상황에서 짖는지,짖을 경우 따로 주의를 주는 행동이 있는지 적어주세요." ></textarea></td>
                        </tr>

                        <tr>
                            <td colspan="2" class="sub-title">(심장사상충)약을 복용하였습니까? (월 1회/미 복용시 산책 금지)</td>
                        </tr>
                        <tr>
                            <td class="none">
                                <input type="radio" name="drug" id="dy" value="Y" style="vertical-align:0px" required>
						        <label for="dy" style= "font-size:12px; vertical-align:10px; padding-right: 30px;">예</label>
						        <input type="radio" name="drug" id="dn" value="N" style="vertical-align:0px"required >
                                <label for="dn" style=" font-size:12px; vertical-align:10px; padding-right: 30px;">아니오</label>
                                <input type="radio" name="drug" id="dd" style="vertical-align:0px;"required >
						        <label for="dd" style=" font-size:12px; vertical-align:10px;">모름</label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="line-height: 40px;"><p style="font-size: 12px; font-weight: 500; text-align: center; margin: 0;">* 하기 예방 접종 확인 사항 중 한가지라도 접종하지 않은 경우 산책이 금지됩니다.</p></td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" class="sub-title">(종합 7종 백신)접종을 하였습니까? (연 1회)</td>
                        </tr>
                        <tr>
                            <td class="none">
                                <input type="radio" name="inoculation" id="1y" value="Y" style="vertical-align:0px" required>
						        <label for="1y" style= "font-size:12px; vertical-align:10px; padding-right: 30px;">예</label>
						        <input type="radio" name="inoculation" id="1n" value="N" style="vertical-align:0px"required >
                                <label for="1n" style=" font-size:12px; vertical-align:10px; padding-right: 30px;">아니오</label>
                                <input type="radio" name="inoculation" id="1d" style="vertical-align:0px;"required >
						        <label for="1d" style=" font-size:12px; vertical-align:10px;">모름</label>
                            </td>
                        </tr>

                        <tr >
                            <td colspan="2" class="sub-title">(코로나 장염)접종을 하였습니까? (연 1회)</td>
                        </tr>
                        <tr>
                            <td class="none">
                                <input type="radio" name="inoculation2" id="2y" value="Y" style="vertical-align:0px" required>
						        <label for="2y" style= "font-size:12px; vertical-align:10px; padding-right: 30px;">예</label>
						        <input type="radio" name="inoculation2" id="2n" value="N" style="vertical-align:0px"required >
                                <label for="2n" style=" font-size:12px; vertical-align:10px; padding-right: 30px;">아니오</label>
                                <input type="radio" name="inoculation2" id="2d" style="vertical-align:0px;"required >
						        <label for="2d" style=" font-size:12px; vertical-align:10px;">모름</label>
                            </td>
                        </tr>

                        <tr >
                            <td colspan="2" class="sub-title">(켄넬코프)접종을 하였습니까? (연 1회)</td>
                        </tr>
                        <tr>
                            <td class="none">
                                <input type="radio" name="inoculation3" id="3y" value="Y" style="vertical-align:0px" required>
						        <label for="3y" style= "font-size:12px; vertical-align:10px; padding-right: 30px;">예</label>
						        <input type="radio" name="inoculation3" id="3n" value="N" style="vertical-align:0px"required >
                                <label for="3n" style=" font-size:12px; vertical-align:10px; padding-right: 30px;">아니오</label>
                                <input type="radio" name="inoculation3" id="3d" style="vertical-align:0px;"required >
						        <label for="3d" style=" font-size:12px; vertical-align:10px;">모름</label>
                            </td>
                        </tr>
                    <br/>
                        <tr style="border-top: 1px solid rgb(179, 179, 179);">
                            <td colspan="2"><p style="font-size: 12px; font-weight: 400; padding-top: 10px;
                            text-align: left; margin: 0; padding-left: 10px;">반려동물이 자주 다니는 동물병원을 입력해주세요.<br/>
                            위급 시 사용될 수 있는 중요한 정보 입니다.</p></td>
                        </tr>

                        <tr style="line-height: 40px;">
                            <td style="padding-left: 10px;"><input  type="text" placeholder="병원명" name="hospital"/></td style="padding-left: 10px;">
                        </tr>
                        <tr style="line-height: 40px;">
                            <td style="padding-left: 10px;"><input  type="text" placeholder="번호" name="hnum"/></td style="padding-left: 10px;">
                        </tr>
                        <tr >
                            <td colspan="2" style="padding-left: 10px; padding-top: 10px; padding-bottom: 5px;">
                                <input style="line-height: 40px;"  type="text" id="postNum" name="postNum" placeholder="우편번호">&nbsp;&nbsp;&nbsp;
                                <button type="button" id="check-btn" onclick="zip_code();">우편번호 찾기</button>
                                
                            </td>
                        </tr>
                        
                        <tr style="line-height: 40px;">
                    
                            <td style="padding-left: 10px;">
                                <input style="width: 250px;" id="streetAddress" name="address" type="text" placeholder="도로명주소">
                            </td>
                        </tr>

                        <tr style="line-height: 40px;">
                   
                            <td style="padding-left: 10px;">
                                <input id="addressInput"  style="width: 250px;"  name="detail" type="text" placeholder="상세주소 입력">
                               </td>
                        </tr>
                        </table>

                        <br/>
                        <br/>
                        <br/>
                        <div>
                        <button style="display:flex; margin-right: auto; margin-left: auto; color:white; border: solid 1px black; background-color :black; text-align: center;" type="submit">
                            <span style="padding-left: 30px;">등록</span></button>
                        </div>
                        <br/>
                        <br/>
                        <br/>

                    </div>
                </div>
            </div>
        </form>
        </div>
    </section>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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


                 
  	/* Daum 우편번호 로직 */
    function zip_code() {
		new daum.Postcode({
			oncomplete: function(data) {
	        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
	        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	        var roadAddr = data.roadAddress; // 도로명 주소 변수
	        var extraRoadAddr = ''; // 참고 항목 변수
	
	        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	            extraRoadAddr += data.bname;
	        }
	        // 건물명이 있고, 공동주택일 경우 추가한다.
	        if(data.buildingName !== '' && data.apartment === 'Y'){
	           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	        }
	        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	        if(extraRoadAddr !== ''){
	            extraRoadAddr = ' (' + extraRoadAddr + ')';
	        }
	
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        document.getElementById("postNum").value = data.zonecode; // 우편번호
	        document.getElementById("streetAddress").value = roadAddr; // 도로명주소
	        
	        
	        /* document.getElementById("jibunAddress").value = data.jibunAddress; // 지번주소 */
	        
	        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다. (상세주소)
	        if(roadAddr !== ''){
	            document.getElementById("addressInput").value = extraRoadAddr;
	        } else {
	            document.getElementById("addressInput").value = '';
	        }
	
	        var guideTextBox = document.getElementById("guide");
	        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	        if(data.autoRoadAddress) {
	            var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	            guideTextBox.style.display = 'block';
	
	        } else if(data.autoJibunAddress) {
	            var expJibunAddr = data.autoJibunAddress;
	            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	            guideTextBox.style.display = 'block';
	        } else {
	            guideTextBox.innerHTML = '';
	            guideTextBox.style.display = 'none';
	        }
	    }
		/* window.close(); */
	}).open();
	}
</script>
<%@ include file="/views/common/footer.jsp" %>