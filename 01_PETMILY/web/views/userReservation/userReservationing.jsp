<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List,com.petmily.reservation.model.vo.PetReservation" %>
<%@ include file="/views/common/header.jsp" %>
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

    }

    th{
        width: 150px;
        font-size: 12px;
        text-align: center;
        background-color: rgb(189, 188, 188);
        color: grey;
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
                    <li class="breadcrumb-item active" style="font-size:15px;">진행 중인 예약 >></li>
                </ul>
              
                  
                   
                   <!-- 콘텐츠 영역 -->
                   
                   <% for(PetReservation p : list) { %>
                <table border="1" class="table table-borderless">
				<tr >
					<td style="width300px; height:200px;" rowspan="2" colspan="2">
						<div style="width: 200px;">
							<%if(p.getPetImg()==null) {%>
							<p style="margin-top:90px;">등록 된 이미지가 없습니다.</p>
							<%}else {%>
							<img style="border:1px solid;width:200px;height:150px;"src="<%=request.getContextPath()%>/upload/board/<%=p.getPetImg()%>">
							<%} %>
							
						</div>
					</td>
					<td style="height: 10px;"colspan="3">
					<div class="row">
						<h4 style="margin-left:50px;display:inline;text-align:center;">'<%=p.getBoardTitle()%>'</h4>
						<input class="btn btn-outline-secondary"style="display:flex;border-radius:15px;font-size:13px;margin-left:200px;" type="button" value="추가 요금 결제" onclick="window.open('<%=request.getContextPath()%>/user/addPay?revNo=<%=p.getReservationCode()%>','_blank','width=300px,height=350px');">
					</div>
					</td>
		
				</tr>
				<tr style="width: 200px;">
					<td colspan="3">
						<div class="row">
							<div class="col-lg-6">
								<p>'<%=p.getPetName() %>'를 맡겼습니다.</p>
								<p style="margin:0px;font-size:15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;체크 인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 체크아웃</p>
								<input class="form-control form-control-sm" style="width:90px;height:20px;display:inline;"type="text" value="<%=p.getCheckIn().substring(0,11)%>">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input class="form-control form-control-sm" style="width:90px;height:20px;display:inline;"type="text" value="<%=p.getCheckOut().substring(0,11)%>">
								<br>
								<%if(p.getPlusQuestion()!=null) {%>
								<textarea class="form-control" cols="20" rows="2"><%=p.getPlusQuestion() %></textarea>
								<%} else { %>
								<textarea class="form-control" cols="20" rows="2">추가 사항이 없습니다.</textarea>
								<%} %>
							</div>
							<div class="col-lg-6 align-self-end">
								<%if(p.getPlusType().contains("목욕가능")==true) { %>
								<input style="display:inline;font-size:13px;margin:0px;"type="checkbox" value="목욕가능" checked disabled><p style="font-size:13px;display:inline;">목욕</p>
								<%} else { %>
								<input style="font-size:13px;display:inline;"type="checkbox" value=""><p style="font-size:13px;display:inline;">목욕</p>
								<%} %>
								<%if(p.getPlusType().contains("집앞픽업")==true) { %>
								<input style="display:inline;" type="checkbox" checked disabled><p style="font-size:13px;display:inline;">집앞픽업</p><br>
								<%} else { %>
								<input style="display:inline;" type="checkbox"><p style="font-size:13px;display:inline;">집앞픽업</p><br>
								<%} %>
								<%if(p.getPlusType().contains("약물복용")==true) { %>
								<input style="display:inline;" type="checkbox" value="약물복용" checked disabled><p style="font-size:13px;display:inline;">약물복용</p>
								<%} else { %>
								<input style="display:inline;" type="checkbox"><p style="font-size:13px;display:inline;">약물복용</p>
								<%} %>
								<%if(p.getPlusType().contains("노견케어")==true) { %>
								<input style="display:inline;" type="checkbox" checked disabled><p style="font-size:13px;display:inline;">노견케어</p>
								<%} else { %>
								<input style="display:inline;" type="checkbox"><p style="font-size:13px;display:inline;">노견케어</p>
								<%} %>
								<%if(p.getPlusType().contains("추가할인")==true) { %>
								<input style="display:inline;margin:0px;"type="checkbox" checked disabled><p style="font-size:13px;display:inline;">추가 할인</p>
								<%} else { %>
								<input style="display:inline;margin:0px;"type="checkbox"><p style="font-size:13px;display:inline;">추가 할인</p>
								<%} %>
								<input class="btn btn-outline-secondary" style="font-size:13px;border-radius:20px;margin-left:120px;margin-top:30px;height:30px;"type="button" value="상세 요청 확인" onclick="requestDetail();">
								</div>
							</div>
					
					</td>
		
				</tr>
				<tr>
					<td colspan="5">
						<input onclick="endSitting(<%=p.getReservationCode() %>)" class="btn btn-outline-warning" style="font-size:13px;border-radius:20px;margin-left:670px;"type="button" value="펫 시팅 종료">
						</td>
		
				</tr>
				</table>
				<%} %>
                    </div>
                </div>
            </div>
        
        
    </section>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <script>
    
    	function requestDetail() {
    		var popupX = (window.screen.width / 2) - (300 / 2);
    		var popupY= (window.screen.height /2) - (350 / 2);

    		
    		window.open('<%=request.getContextPath()%>/user/requestDetails','_blank','height=350,width=300,left='+popupX+',top='+popupY+',screenX='+popupX+',screenY='+popupY);
    	}
    	
    	function endSitting(code) { 
    		location.replace('<%=request.getContextPath()%>/user/endSitting?code='+code);
    	}
    	
    	
    </script>
</body>
</html>
