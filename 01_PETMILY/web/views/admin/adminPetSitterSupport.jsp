<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.petmily.admin.model.vo.ApplyUser" %>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminPetSitterSupport.css" type = "text/css">
<% 
	ArrayList<ApplyUser> list = new ArrayList();
	if(request.getAttribute("userList")!=null){
		list = (ArrayList<ApplyUser>)request.getAttribute("userList");
	}
	int AuCount = 1;
	String type = "USER_NAME";
	if(request.getAttribute("type")!=null){
		type = (String)request.getAttribute("type");
	}
%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<section id="adminMainMenu">
<%@ include file="/views/admin/adminSideBar.jsp" %>
	<section id="adminUserList">
		<h4>펫 시터 지원 목록</h4>
		<hr/>
		<div id="adminUserListSearchType">
			<p id="type-date">일자 순
				<img alt="2" 
					<% if(type.equals("ENROLL_DATE")){ %>
						src="<%=request.getContextPath()%>/img/common/arrowDown.png" 
					<% } else { %>
						src="<%=request.getContextPath()%>/img/common/arrowUp.png" 
					<% } %>
					width="20px" height="20px"></p>
			<p id="type-name">이름 순
				<img alt="1" 
					<% if(type.equals("USER_NAME")){ %>
						src="<%=request.getContextPath()%>/img/common/arrowDown.png" 
					<% } else { %>
						src="<%=request.getContextPath()%>/img/common/arrowUp.png" 
					<% } %>
					width="20px" height="20px"></p>
		</div>
		<div class="adminUserInfo">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>No</th>
						<th>아이디</th>
						<th>이름</th>
						<th>지원폼확인</th>
						<th>상태</th>
						<th>메일 회신</th>
						<th>지원 일자</th>
					</tr>
				</thead>
				<tbody>
					<%for(ApplyUser au : list){ %>
						<tr>
							<td><%=AuCount++%></td>
							<td><%=au.getUserid()%></td>
							<td><%=au.getName()%></td>
							<td><button class="Abtns" onclick="applyUserData()">보기</button></td>
							<td>
								<select class="Asele" name="selectType">
									<option value="상태">상태</option>
									<option value="반려">반려</option>
									<option value="허가">허가</option>
								</select>
							</td>
							<td><button type="button" class="Abtns" onclick="emailPush()">회신</button></td>
							<td><%=au.getEnrollDate().substring(0,11)%></td>
						</tr>
					<% } %>
				</tbody>
			</table>
			<div id="pageBar">
				<%= request.getAttribute("pageBar") %>
			</div>
		</div>
	</section>
</section>
<script>
	$(function(){
		// 일자순 이벤트
		$("#type-date").click(function(){
				location.replace('<%=request.getContextPath()%>/admin/apply?type=ENROLL_DATE');
		})
		// 이름순 이벤트
		$("#type-name").click(function(){
			location.replace('<%=request.getContextPath()%>/admin/apply?type=USER_NAME');
		})
		
		
	})
	
	function applyUserData(){
			let userId = $(event.target).parent().parent().find("td:nth-of-type(3)").text();
			window.open("<%=request.getContextPath()%>/admin/applyUserData?userId="+userId,"_blank","width=725px; height=500px");
		}
	
	function emailPush(){
		let seIndex = $(event.target.parentElement.parentElement.children[4].children).val();
		let userId = $(event.target.parentElement.parentElement.children[1]).text();
		let userName = $(event.target.parentElement.parentElement.children[2]).text();
		console.log(userId);
		console.log(userName);
		console.log(seIndex);
		console.log('<%=request.getContextPath()%>/admin/email?type='+seIndex+"&userId="+userId+"&userName="+userName);
		if(seIndex=='상태'){
			alert("회신할 상태를 선택해주세요!");
			return;
		}
		location.replace('<%=request.getContextPath()%>/admin/email?type='+seIndex+"&userId="+userId+"&userName="+userName);
	}
</script>
<%@ include file="/views/common/footer.jsp" %>