<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/header.jsp" %>
<%@ page import="java.util.List,com.petmily.reservation.model.vo.PetReservation" %>
<%
	List<PetReservation> list = (List)request.getAttribute("list");
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
    ul{
        padding-inline-start:0;
    }
    .title{
        font-size: 14px;
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
		font-size:12px;
	
    }

    th{
        width: 150px;
        font-size: 12px;
        text-align: center;
        border-right: 1px solid white;
    }

</style>


<body>
    <section>
        <div class="container">
          
            <div class="row">
          		<%@ include file="/views/user/userSideBar.jsp" %>
            <div class="vl"></div>
            <div class="col-9" style="padding:0;">
                <div class="row top-div" style="height: 200px;overflow: hidden;">
                    <img class="top-img" style="width: 100%; margin-top: -230px;" src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
                </div>
                <ul class="breadcrumb">
                  
                    <li class="breadcrumb-item active" style="font-size:15px;">요청 중인 예약 >></li>
                </ul>
     
                   <!-- 콘텐츠 영역 -->
                   <table id="enrollTB" class="table table-borderless">
	
                    <tr style="border-bottom:1px solid lightgray;"class="tr-blank">
                        <th>no</th>
            			<th>체크 인</th>
            			<th>체크 아웃</th>
            			<th>제목</th>
                        <th>펫 시터 명</th>
                        <th>요청 상세</th>
                        <th>최종 결제 금액</th>
                        <th>채팅 기록</th>
                    </tr>
                    
                    <%for(PetReservation pr : list) {%>
                   	
	                    <tr align="center">
	                    
	                    	
	                    	<td><%=pr.getReservationCode() %></td> 
	                    		                    	                    	
	                    	<td style="	width:200px;"><%=pr.getCheckIn().substring(2,11)%></td>
	                    	
	                    	<td style="	width:200px;"><%=pr.getCheckOut().substring(2,11) %></td>
	                    	
	                    	<td style="	width:200px;"><%=pr.getBoardTitle()%></td>
	                    	
							<td style="	width:200px;"><%=pr.getSitterName() %></td>
							
							<td><input onclick="requestCheck(<%=pr.getReservationCode() %>)" type="button" id="request" value="상세 요청 확인"></td>
							
							<td><%=pr.getPrice() %></td> 
							
							<td><input type="button" id="chat" value="채팅"></td>
	                    </tr>
	                   
	             <%} %>
    					
                    
                </table>             
                    </div>
                </div>
            </div>
        
        </div>
    </section>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function requestCheck(code) {

	var popupX = (window.screen.width / 2) - (300 / 2);
	var popupY= (window.screen.height /2) - (200 / 2);
	
	window.open('<%=request.getContextPath()%>/user/endRev?no='+code,'_blank','height=200,width=280,left='+popupX+',top='+popupY+',screenX='+popupX+',screenY='+popupY);
}




</script>
</html>

<%@ include file="/views/common/footer.jsp" %>