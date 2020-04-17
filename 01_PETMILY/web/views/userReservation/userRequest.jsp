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
        
        
 }
    td{

        font-size:13px;
    }
	
    th{
        width: 150px;
        font-size: 12px;
        text-align: center;
        height:20px;
        

    }


</style>


<body>
    <section>
    <form action="<%=request.getContextPath()%>/request/cancels" method="post">
        <div class="container">
        	<div class="row">
          
         <%@ include file="/views/user/userSideBar.jsp" %>
               <div class="vl"></div>
            <div class="col-9"style="padding:0;" >
                <div class="row top-div" style="margin-top:0px;height: 200px;overflow: hidden;">
                    <img class="top-img" style="width: 100%; margin-top: -230px;" src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
                </div>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item active" style="font-size:15px;">요청 중인 예약 >></li>
                </ul>
                           
                   <table id="enrollTB" class="table table-hover">

                    <tr style="border-bottom:1px solid lightgray;" class="tr-blank">
                        <th>no</th>
            			<th>선택</th>
            			<th>체크인</th>
                        <th>체크 아웃</th>
                        <th>펫시터 명</th>
                        <th>제목</th>
                        <th>요청 상세</th>
                        <th>상태</th>
                        <th>총 금액</th>
                        <th>채팅</th>
                    </tr>
                    <%for(PetReservation pr : list) {%>
                   	
	                    <tr align="center">
	                    
	                    	<%if(list.isEmpty()==true) {%>
	                    	<h3>요청 중인 예약이 없습니다.</h3>
	                    	<%}else { %>
	                    	<td><%=pr.getReservationCode() %></td> 
	                    	
	                    	<td><input type="checkbox" name="choose" value="<%=pr.getReservationCode()%>"></td>	                    	                    	
	                    	
	                    	<td style="width:250px;"><%=pr.getCheckIn().substring(2,11)%></td>
	                    	
	                    	<td style="width:250px;"><%=pr.getCheckOut().substring(2,11)%></td>
	                    	
							<td style="width:250px;"><%=pr.getSitterName() %></td>
							
							<td style="width:500px;"><%=pr.getBoardTitle() %></td>
							
							<td><input style="border-radius:20px;font-size:13px;"class="btn btn-outline-secondary" style="width:100px;"onclick="requestCheck()" type="button" id="request" value="상세 요청 확인"></td>
							<td><%=pr.getResType() %></td> 
							
							<td><%=pr.getPrice() %></td> 
							
							<td><input class="btn btn-outline-secondary" style="border-radius:20px;font-size:13px;" type="button" id="chat" value="채팅"></td>
							<%} %>
	                    </tr>
	                   
	             <%} %>
    					
                    
                </table>
                
                <br>
                <br>
                <br>
                <br>
                <br>
							<input style="margin-left:400px;" type="submit" value="요청 취소" >
                 
               
            
        
          
           
            </div>
       	</div>
       </form>
    </section>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function requestCheck() {

	var popupX = (window.screen.width / 2) - (700 / 2);
	var popupY= (window.screen.height /2) - (700 / 2);
	
	window.open('<%=request.getContextPath()%>/user/requestDetail','_blank','height=700,width=700,left='+popupX+',top='+popupY+',screenX='+popupX+',screenY='+popupY);
}

$("#btn").click(function(){//위
	$("#btn1").show();
	$("#btn").hide(); 
	location.replace('<%=request.getContextPath()%>/user/request?type=btn')
})

$("#btn1").click(function(){//아래
	$("#btn1").hide();
	$("#btn").show();
	location.replace('<%=request.getContextPath()%>/user/request?type=btn1')
})
<%-- $("#btn2").click(function(){
	$("#btn2").hide();
	$("#btn3").show();
	location.replace('<%=request.getContextPath()%>/user/request?type=btn2')
})

$("#btn3").click(function(){
	$("#btn3").hide();
	$("#btn2").show();
	location.replace('<%=request.getContextPath()%>/user/request?type=btn3')
})
$("#btn4").click(function(){
	$("#btn4").hide();
	$("#btn5").show();
	location.replace('<%=request.getContextPath()%>/user/request?type=btn4')
})

$("#btn5").click(function(){
	$("#btn5").hide();
	$("#btn4").show();
	location.replace('<%=request.getContextPath()%>/user/request?type=btn5')
}) --%>

    


</script>
</html>

