<%@page import="com.petmily.reservation.model.vo.PetReservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.petmily.admin.model.vo.ApplyUserData, 
 com.petmily.admin.model.vo.User,com.petmily.admin.model.vo.AdminPetsitter" %>
<% 
PetReservation pr = (PetReservation)request.getAttribute("rev");

%>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<table border="1" class="table table-hover">
		
			<tr>
				<th>예약NO</th>
				<td><%=pr.getReservationCode() %></td>						
			</tr>
			<tr>
				<th>예약자 ID</th>
				<td><%=pr.getUserId() %></td>
			</tr>
			<tr>
				<th>체크 인</th>
				<td><%=pr.getCheckIn().substring(0,11)%></td>
			</tr>
			<tr>
				<th>체크 아웃</th>
				<td><%=pr.getCheckOut().substring(0,11) %></td>
				
			</tr>
			
			<tr>
				<th>추가 요청 문의사항</th>
				<%if(pr.getPlusQuestion()==null) { %>
					<td>없음</td>
					<%} else { %>
					<td><%=pr.getPlusQuestion() %></td>
					<%} %>
			</tr>
			<tr>
				<th>입금 일자</th>
					<%if(pr.getPriceEndDate()!=null) {%>
					<td><%=pr.getPriceEndDate().substring(0,11) %></td>
					<%}else { %>
					<td>-</td>
					<%} %>
					
				
			</tr>
			<tr>
				<th>총 금액</th>
				<td><%=pr.getPrice() %></td>
			</tr>
			
			<tr>
				<th>약물 복용 상세</th>
				
				<%if(pr.getPetMedication()==null) { %>
				<td>없음</td>
				<%} else { %>
				<td><%=pr.getPetMedication() %></td>
				<%} %>
			</tr>
			<tr>
				<th>픽업</th>
				
				<%if(pr.getPetPickup()==null) { %>
				<td>없음</td>
				<%} else { %>
				<td><%=pr.getPetPickup() %></td>
				<%} %>
			</tr>
			
				<tr>
				<th>펫 사이즈</th>
				<td><%=pr.getPetSize() %></td>
			</tr>
			
				<tr>
				<th>목욕 횟수</th>
				<td><%=pr.getPetBath() %></td>
			</tr>							
	</table>
	<br>
	<br>
	<button onclick="closePage();">확인</button>
</body>
<style>
	body{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
	table{
		text-align:center;
	}
</style>
<script>
	function closePage(){
		window.close();
	}
</script>
</html>





