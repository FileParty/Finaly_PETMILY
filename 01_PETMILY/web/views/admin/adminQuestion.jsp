<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.petmily.admin.model.vo.AdminQuestion" %>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminQuestion.css" type = "text/css">
<% 
	ArrayList<AdminQuestion> aqList = new ArrayList();
	if(request.getAttribute("questionList")!=null){
		aqList = (ArrayList<AdminQuestion>)request.getAttribute("questionList");
	}
	String type="ANSWER_DATE";
	if(request.getAttribute("type")!=null){
		type = (String)request.getAttribute("type");
	}
	int qCount = 1;
%>
<section id="adminMainMenu">
<%@ include file="/views/admin/adminSideBar.jsp" %>
	<section id="adminUserList">
		<h4>펫 시터 지원 목록</h4>
		<hr/>
		<div id="adminUserListSearchType">
			<p id="type-date">등록 순
				<img alt="2" 
						<% if(type.equals("ANSWER_DATE")){ %>
							src="<%=request.getContextPath()%>/img/common/arrowDown.png" 
						<% } else { %>
							src="<%=request.getContextPath()%>/img/common/arrowUp.png" 
						<% } %>
					width="20px" height="20px"></p>
			<p id="type-yn">답변 순
				<img alt="2" 
						<% if(type.equals("ANSWER_YN")){ %>
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
						<th>문의사항</th>
						<th>답장 받을 이메일</th>
						<th>답변 유무</th>
						<th>메일 회신</th>
						<th>문의 일자</th>
					</tr>
				</thead>
				<tbody>
					<% for(AdminQuestion aq : aqList){ %>
					<tr>
						<td><%=qCount++%></td>
						<td><% if(aq.getEmailTitle().length()<10){ %>
								<%=aq.getEmailTitle() %>
							<% } else { %>
								<%=aq.getEmailTitle().substring(0,11) + "..." %>
							<% } %>
						</td>
						<td><%=aq.getSendEmail() %></td>
						<td><%=aq.getQueYN() %></td>
						<td><button class="Abtns" onclick="sendQuestion('<%=aq.getSendEmail()%>')">회신</button></td>
						<td><%=aq.getEmailDate().substring(0,11) %></td>
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
		// 신청일순 이벤트
		$("#type-date").click(e=>{
				location.replace('<%=request.getContextPath()%>/admin/question?type=ANSWER_DATE');
		})
		// 답변순 이벤트
		$("#type-yn").click(e=>{
			location.replace('<%=request.getContextPath()%>/admin/question?type=ANSWER_YN');
		})
		
	})
	
	function sendQuestion(){
		let content = $(event.target).parent().parent().find("td:nth-of-type(2)").text();
		let email = $(event.target).parent().parent().find("td:nth-of-type(3)").text();
		console.log(content, email);
		<%-- window.open("<%=request.getContextPath()%>/admin/normalUserData?userId="+userId,"_blank","width=725px; height=500px"); --%>
	}
</script>
<%@ include file="/views/common/footer.jsp" %>