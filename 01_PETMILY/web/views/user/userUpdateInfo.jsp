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
    td{
        /* width: 100px; */
        font-size: 12px;
        padding: 5px;
    }
    .second-td{
        text-align: left;
        color: gray;
        line-height: 40px
    }
    .third-td{
        text-align: right;
    }

    table{
        border-collapse: collapse;
        
    }

    td{
    
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
        
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

    .subrow{

        border-bottom: 1px solid white;
    }
    .subrow2{
        
        border-top: 1px solid white;
        border-bottom: 1px solid white;
    }
    .subrow3{
        
        border-top: 1px solid white;
    }


</style>

    <section>
        <div class="container">
            <form action="<%=request.getContextPath()%>/user/UpdateEnd" method="post" onsubmit="return test();">
            
            <!-- form을 넘기기 위해 hidden 처리한 input을 만듦. -->
            <input type="hidden" id="userId" name="userId" value="<%= u.getUserId() %>" >
            
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
                            <li class="content"><a href="<%=request.getContextPath()%>/user/request"> - 요청한 예약</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/reservationing"> - 진행중인 예약</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/Review"> - 종료된 예약</a></li>
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
                	<table style="margin-left: auto; margin-right:auto">
                     <tr>
                         <td class="sub-title" style="width: 150px;">이름</td> 
                         <td colspan="2" class="second-td" style="width: 400px;"><%= loginUser.getUserName() %></td>
                     </tr>
                     <tr>  
                         <td class="sub-title">이메일</td> 
                         <td class="second-td"><%= u.getEmail()  %></td>
                         <td class="third-td"><button type="button" onclick="toggle1();">수정하기</button></td>
                     </tr>
                     <div>
                     <tr class="row1" style="display: none;">
                         <td></td>
                         <td style="line-height:40px; padding-left:50px;">
                         	<input type="email" id="email" name="email" value="<%= loginUser.getEmail() %>" style="height:25px; width: 230px;"/> 
                        	</td> 
                         <td><button class="duplicate" type="button" style="height:25px;">중복확인</button></td>
                         <p></p>
                     </tr>
                     </div>

                     <tr>
                     	<% String birth = loginUser.getUserBirth(); %>
                         <td class="sub-title">생년월일</td> 
                         <td colspan="2" class="second-td"><%= birth.substring(0,11) %></td>
                     </tr>
                     <tr>
                         <td class="sub-title">성별</td> 
                         <td colspan="2" class="second-td"><%= loginUser.getGender() %></td>
                     </tr>
                     <tr>
                         <td class="sub-title">휴대폰 번호</td> 
                         <td class="second-td"><%= u.getPhone() %></td>
                         <td class="third-td"><button type="button" onclick="toggle2();">수정하기</button></td>
                     </tr>
                     <tr class="row2" style="display: none;">
                         <td></td>
                         <td style="line-height:40px; padding-left:50px;">
                         	<input type="text" id="phone" name="phone" value="<%= loginUser.getPhone() %>" style="height:25px; width: 230px;"/> 
                       	 </td> 
                         <td><button class="duplicate" type="button" style="height:25px;">중복확인</button></td>
                         <p></p>
                     </tr>
                     <tr>
                         <td class="sub-title">주소</td> 
                         <td class="second-td"><%= u.getZipCode() %> / <%= u.getAddress() %> / <%= u.getDetailAddress() %></td>
                         <td class="third-td"><button type="button" onclick="toggle3();">수정하기</button></td>
                     </tr>
                     <tr class="row3" style="display: none; border:1px solid white">
                         <td class="subrow"></td>
                         <td colspan = "2" class="subrow"style= "padding-left:50px;" >
                             <input style="line-height: 40px;" type="text" id="postNum" name="postNum" value="<%= loginUser.getZipCode() %>" placeholder="우편번호">&nbsp;&nbsp;&nbsp;<button class="duplicate" type="button" style="height:25px; width: 100px; " onclick="zip_code();" >우편번호 찾기</button></td> 
                         <!-- <td class="subrow" ></td> -->
                     </tr>
                     <tr class="row3" style="display: none;">
                         <td class="subrow2"></td>
                         <td class="subrow2" style= "padding-left:50px;">
                             <input style="line-height: 40px; width: 250px;" id="streetAddress" name="address" type="text" value="<%= loginUser.getAddress() %>" placeholder="도로명주소"/>
                         </td>
                         <td class="subrow2"></td>
                     </tr>
                     <tr class="row3" style="display: none;">
                         <td class="subrow3"></td>
                         <td class="subrow3" style = "padding-left:50px; padding-bottom: 10px;">
                             <input style="line-height: 40px; width: 250px;" id="addressInput" name="detail" type="text" value="<%= loginUser.getDetailAddress() %>" placeholder="상세주소 입력"/>
                         </td>
                         <td class="subrow3"></td>
                     </tr>
                     <tr>
                         <td class="sub-title">비밀번호</td> 
                         <td class="second-td">비공개</td>
                         <td class="third-td"><button type="button" onclick="toggle4();">수정하기</button></td>    
                     </tr>
                     <tr class="row4" style="display: none;">
                         <td class="subrow2"></td>
                         <td class="subrow2" style= "padding-left:50px;">
                             <input style="line-height: 40px; width: 250px;" id="nowpw" name="nowpw" type="password" value="<%= loginUser.getPassword() %>" placeholder="현재 비밀번호"/>
                         </td>
                         <td class="subrow2"></td>
                     </tr>
                     <tr class="row4" style="display: none;">
                         <td class="subrow2"></td>
                         <td class="subrow2" style = "padding-left:50px;">
                             <input style="line-height: 40px; width: 250px;" id="newpw" name="newpw" type="password" value="<%= loginUser.getPassword() %>" placeholder="새 비밀번호"/>
                         </td>
                         <td class="subrow2"></td>
                     </tr>
                     <tr class="row4" style="display: none;">
                         <td class="subrow3"></td>
                         <td class="subrow3" style = "padding-left:50px; padding-bottom: 10px;">
                             <input style="line-height: 40px; width: 250px;" id="pwck" name="pwck" type="password" value="<%= loginUser.getPassword() %>" placeholder="새 비밀번호 확인"/>
                         </td>
                         <td class="subrow3"></td>
                     </tr>
                  
                    </table>
                        
                    <br/>
                    <br/>
                    
                    <div> <button style="display:flex; margin-right: auto; margin-left: auto; color:white; border: solid 1px black; background-color :black; text-align: center;" type="submit">수정</button> </div>
                    
                    <br/>
                    <br/>

                </div>
              </div>
      	  </form>
        </div>
    </section>
	
	<br><br><br><br><br><br><br><br><br>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

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
	        /* if(roadAddr !== ''){
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
	        } */
	    }
		/* window.close(); */
	}).open();
	}
</script>

<%@ include file="/views/common/footer.jsp" %>