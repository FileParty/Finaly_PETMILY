<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.petmily.admin.model.vo.AdminUser" %>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminUserList.css" type = "text/css">
<% 
	ArrayList<AdminUser> list = new ArrayList();
	if(request.getAttribute("userList")!=null){
		list = (ArrayList<AdminUser>)request.getAttribute("userList");
	}
	String type="USER_NAME";
	if(request.getAttribute("type")!=null){
		type = (String)request.getAttribute("type");
	}
	int userCount = 1;
%>
<section id="adminMainMenu">
<%@ include file="/views/admin/adminSideBar.jsp" %>
	<section id="adminUserList">
		<h4>펫 시터 지원 목록</h4>
		<hr/>
		<div id="adminUserListSearchType">
			<p id="type-date">요청수 순
				<img alt="2" 
						<% if(type.equals("BCOUNT DESC")){ %>
							src="<%=request.getContextPath()%>/img/common/arrowDown.png" 
						<% } else { %>
							src="<%=request.getContextPath()%>/img/common/arrowUp.png" 
						<% } %>
					width="20px" height="20px"></p>
			<p id="type-point">평점 순
				<img alt="2" 
						<% if(type.equals("STAR")){ %>
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
						<th>생일</th>
						<th>비밀 후기 평점</th>
						<th>후기 블라인드 요청건 수</th>
						<th>상세 정보</th>
					</tr>
				</thead>
				<tbody>
					<% for(AdminUser u : list){ %>
					<tr>
						<td><%=userCount++%></td>
						<td><%=u.getUserId() %></td>
						<td><%=u.getUserName() %></td>
						<td><%=u.getUserBirth().substring(0,11) %></td>
						<td><%=u.getStarCount() %></td>
						<td><%=u.getBlindCount() %></td>
						<td><button class="userInfo" onclick="showUserData()">보기</button></td>
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
		// 블라인드 요청건수 이벤트
		$("#type-date").click(e=>{
				location.replace('<%=request.getContextPath()%>/admin/user_list?type=BCOUNT%20DESC');
		})
		// 비밀후기 평점순 이벤트
		$("#type-point").click(e=>{
			location.replace('<%=request.getContextPath()%>/admin/user_list?type=STAR');
		})
		// 이름순 이벤트
		$("#type-name").click(e=>{
			location.replace('<%=request.getContextPath()%>/admin/user_list?type=USER_NAME');
		})
		
	})
	
	function showUserData(){
		let userId = $(event.target).parent().parent().find("td:nth-of-type(2)").text();
		window.open("<%=request.getContextPath()%>/admin/normalUserData?userId="+userId,"_blank","width=725px; height=500px");
	}
</script>
<%@ include file="/views/common/footer.jsp" %>