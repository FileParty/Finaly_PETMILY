<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.petmily.user.model.vo.User" %>
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
        overflow: hidden; 
        margin:0px;
    }
    .container{
        height: 100%;    
        width: 1366px;
       margin-left: auto;
        margin-right: auto;
       
 
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
        font-size: 12px;
        padding: 5px;
    }
    input{
        border-radius: 5px;
        border: 1px solid rgb(179, 179, 179);
        background-color: rgb(228, 228, 228);
        height: 30px;
        padding: 10px;
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
        font-size: 13px;
        font-weight: 500;
    }
/* 체크 박스 css */

.span_pseudo, .chiller_cb span:before, .chiller_cb span:after {
  content: "";
  display: inline-block;
  background: #fff;
  width: 0;
  height: 0.2rem;
  position: absolute;
  transform-origin: 0% 0%;
}

.chiller_cb {
  position: relative;
  height: 2rem;
  display: flex;
  align-items: center;
}
.chiller_cb input {
  display: none;
}
.chiller_cb input:checked ~ span {
  background: #fdcb27;
  border-color: #fdcb27;
}
.chiller_cb input:checked ~ span:before {
  width: 1rem;
  height: 0.15rem;
  transition: width 0.1s;
  transition-delay: 0.3s;
}
.chiller_cb input:checked ~ span:after {
  width: 0.4rem;
  height: 0.15rem;
  transition: width 0.1s;
  transition-delay: 0.2s;
}
.chiller_cb input:disabled ~ span {
  background: #ececec;
  border-color: #dcdcdc;
}
.chiller_cb input:disabled ~ label {
  color: #dcdcdc;
}
.chiller_cb input:disabled ~ label:hover {
  cursor: default;
}
.chiller_cb label {
  padding-left: 2rem;
  position: relative;
  z-index: 2;
  cursor: pointer;
  margin-bottom:0;
}
.chiller_cb span {
  display: inline-block;
  width: 1.2rem;
  height: 1.2rem;
  border: 2px solid #ccc;
  position: absolute;
  left: 0;
  transition: all 0.2s;
  z-index: 1;
  box-sizing: content-box;
}
.chiller_cb span:before {
  transform: rotate(-55deg);
  top: 1rem;
  left: 0.37rem;
}
.chiller_cb span:after {
  transform: rotate(35deg);
  bottom: 0.35rem;
  left: 0.2rem;
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
</style>


    <section>
        <div class="container">
            <form action="<%=request.getContextPath()%>/user/petprofile/upload" method="post" onsubmit="return test();">
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
                            <li class="content"><a href="<%=request.getContextPath()%>/user/petprofile?userId=<%=loginUser.getUserId()%>"> - 펫 프로필</a></li>
                            <br/>
                            
                            <li class="title">예약</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/request?userId=<%=loginUser.getUserId()%>"> - 요청한 예약</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/reservationing?userId=<%=loginUser.getUserId()%>"> - 진행중인 예약</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/reservationEnd?userId=<%=loginUser.getUserId()%>"> - 종료된 예약</a></li>
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
                    <li class="breadcrumb-item">마이페이지</li>
                    <li class="breadcrumb-item active">메인</li>
                </ul>
                    <div class="col-3" style= "margin-left: auto; margin-right: auto;">
                        <br/>
                        <button type="submit" onclick="location.replace('<%=request.getContextPath()%>/user/petprofile/upload')" style="width: 200px; cursor: pointer;">펫 프로필 등록</button>
                    </div>
                    <table>
                        <tr>
                            <td class="sub-title" style="width: 100px;">예약 허가: 0건<hr/></td> 
                            
                            <td class="sub-title" style="width: 100px;">신규 메세지 : 3건<hr/></td>                             
                            
                        </tr>
                        <tr>
                            <td style="padding-left: 20px;"></td>
                            <td style="padding-left: 20px;"><a href="">김인술님의 메세지</a></td></tr>
                            <td style="padding-left: 20px;"></td>
                            <td style="padding-left: 20px;"><a href="">고세빈님의 메세지</a></td></tr>
                            <td style="padding-left: 20px;"></td>
                            <td style="padding-left: 20px;"><a href="">유슬기님의 메세지</a></td></tr>
                        <tr>
       
                        </tr>
                        <tr>
                            <td colspan="2" class="sub-title">
                            <br>
                            <br>
                            알림 <button type="button" class="btn2 btn-secondary" data-container="body"
                            data-toggle="toggle" data-placement="right"
                            title="이메일 알림은 회원 정보에 있는 메일로 발송 됩니다.">
                                ?
                              </button>
                            <hr  id="line"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                예약 요청 알람
                            </td>
                            <td>
                                채팅 알람
                            </td>
                        </tr>
                        <tr>
                            <td><div style="height: 50px; width: 300px; background-color: rgb(192, 192, 192); padding: 10px;"><span style="padding-left: 30px; padding-right: 100px;">이메일 알람</span><input type="checkbox" checked data-toggle="toggle" data-size="sm"></div></td>
                            <td><div style="height: 50px; width: 300px; background-color: rgb(192, 192, 192); padding: 10px;"><span style="padding-left: 30px; padding-right: 100px;">이메일 알람</span><input type="checkbox" checked data-toggle="toggle" data-size="sm"></p></div></td>
                        </tr>
                        
                        </table>
                        <br/>
                        <br/>
                        <br/>
                        <br/>

                    </div>
                </div>
            </div>
        </form>
        </div>
    </section>
    
    <br><br><br><br><br><br>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>

    
/* function toggle1(){ //on/off하나의 버튼으로 가능.

    $('.row1').slideToggle(1000); //시간 부여
    
}

function toggle2(){ //on/off하나의 버튼으로 가능.
 
    $('.row2').slideToggle(1000); //시간 부여
    };

function toggle3(){ //on/off하나의 버튼으로 가능.

    $('.row3').slideToggle(1000); //시간 부여
    };


    $(function () {
   $('[data-toggle="tooltip"]').tooltip()
})

$(function(){
      $("#intro").keyup(function(){
         if($(this).val().length>300){
            $(this).val($(this).val().substring(0,300));
         }
      })
   })

   var onecare= document.getElementsByClassName("onecare");
   var onecare2 = document.getElementsByClassName("onecare2");
   var shower = document.getElementsByClassName("shower");
   var pick = document.getElementsByClassName("pick");

      $(onecare).change(function(){
              
        if(event.target.value<20000) {
          $(event.target).val(event.target.min);
        }else if(event.target.value>50000){
            $(event.target).val(event.target.max);
        }
      });

      $(onecare2).change(function(){
              
              if(event.target.value<5000) {
                $(event.target).val(event.target.min);
              }else if(event.target.value>20000){
            $(event.target).val(event.target.max);
        }
            });

      $(shower).change(function(){
              
              if(event.target.value<1000) {
                $(event.target).val(event.target.min);
              }else if(event.target.value>5000){
            $(event.target).val(event.target.max);
        }
            });
            
      $(pick).change(function(){
              
              if(event.target.value<500) {
                $(event.target).val(event.target.min);
              }else if(event.target.value>10000){
            $(event.target).val(event.target.max);
        }
            });

            


         function test() {
                if($("#myCheckbox2")[0].checked==true && $("#onecare2").val().trim().length==0) {
                    alert("추가비 할인액을 입력하세요.");
                    return false;
                }else if($("#myCheckbox6")[0].checked==true && $(".shower").val().trim().length==0) {
                    alert("목욕 비용을 입력하세요.");
                    return false;
                }else if($("#myCheckbox8")[0].checked==true && $(".pick").val().trim().length==0) {
                    alert("픽업 비용을 입력하세요.");
                    return false;
                }
                return true;
         };
         
         var num =1;
         function addFile() {
             
             let file =$("<input>").attr({
                 "type":"file",
                 "name": "file"+num,
                 "id":"file"+num
             })
             let label = $("<label>").attr({
                 'for':'file'+num
             });
             $(".fileNo").attr({
                 "value":num
             })
             var s = $(".selectFile").append(file);
             s.append(label);
             s.append("<br>");
             console.log(num);
             num++;
         } */

</script>
<%@ include file="/views/common/footer.jsp" %>