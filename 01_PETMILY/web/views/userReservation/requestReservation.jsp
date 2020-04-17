<%@page import="com.petmily.reservation.model.vo.PetReservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.petmily.admin.model.vo.ApplyUserData, 
 com.petmily.admin.model.vo.User,com.petmily.admin.model.vo.AdminPetsitter" %>
<% 
PetReservation pr = (PetReservation)request.getAttribute("rev");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 페이지</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<table>
		
			<tr>
				<th>예약NO</th>
				<th>예약자 ID</th>
				<th>체크 인</th>
				<th>체크 아웃</th>
				<th>추가 요청 문의사항</th>
				<th>입금일자</th>
				<th>합계 금액</th>
				<th>약물 복용 상세</th>
				<th>집 앞 픽업</th>
				<th>펫 사이즈</th>
				<th>목욕 횟수</th>
				
			</tr>
			
			<tr>
				
					<td><%=pr.getReservationCode() %></td>
					<td><%=pr.getUserId() %></td>
					<td><%=pr.getCheckIn().substring(0,11) %></td>
					<td><%=pr.getCheckOut().substring(0,11) %></td>
					
					<%if(pr.getPlusQuestion()==null) { %>
					<td>없음</td>
					<%} else { %>
					<td><%=pr.getPlusQuestion() %></td>
					<%} %>
					<%if(pr.getPriceEndDate()!=null) {%>
					<td><%=pr.getPriceEndDate().substring(0,11) %></td>
					<%}else { %>
					<td>-</td>
					<%} %>
					<td><%=pr.getPrice() %></td>
					<%if(pr.getPetMedication()==null) { %>
					<td>없음</td>
					<%} else { %>
					<td><%=pr.getPetMedication() %></td>
					<%} %>
						<%if(pr.getPetPickup()==null) { %>
					<td>없음</td>
					<%} else { %>
					<td><%=pr.getPetPickup() %></td>
					<%} %>
					<td><%=pr.getPetSize() %></td>
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
		display:flex;
		flex-direction:column;
		text-align:center;
	}
	table tr{
		background-color:lightgray;
		board:1px solid black;
	}
	table th, table td{
		board:1px solid white;
	}
	table td>textarea{
		resize:none
	}
</style>
<script>
	function closePage(){
		window.close();
	}
</script>
</html>





