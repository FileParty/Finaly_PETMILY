<%@page import="com.petmily.reservation.model.vo.PetReservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.petmily.admin.model.vo.ApplyUserData, 
 com.petmily.admin.model.vo.User,com.petmily.admin.model.vo.AdminPetsitter" %>
<% 
PetReservation pr = (PetReservation)request.getAttribute("addPay");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 페이지</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%if(pr!=null) {  %>

	<table>
		
			<tr>
				
				<td>추가 결제 금액 :<%=pr.getFinalyPrice() %></td>
			</tr>	
			<tr>
			<br>		
				<td> <b>추가 사유</b>  <textarea cols=30; rows=3; ><%=pr.getSurchargeText() %></textarea></td>
				
			</tr>
		
			
			<tr>
			<br>
				<td><input type="button" value="결제 문의"></td>
				
			</tr>
		
				<tr>
				<td><input type="button" value="결제" onclick="closePage()"></td>						
				</tr>
			
	</table>
	<%} %>
	
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





