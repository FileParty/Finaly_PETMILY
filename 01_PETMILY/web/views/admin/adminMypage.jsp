<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.petmily.admin.model.vo.AdminApplyDate"%>
<%
	ArrayList lists = new ArrayList();
	ArrayList applyList = new ArrayList<AdminApplyDate>();
	ArrayList questionList = new ArrayList<String>();
	if(request.getAttribute("dates")!=null){
		lists = (ArrayList<ArrayList>)request.getAttribute("dates");
		applyList = (ArrayList<AdminApplyDate>)lists.get(0);
		questionList = (ArrayList<String>)lists.get(1);
	}
	
	
%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminMypage.css" type = "text/css">
<section id="adminMainMenu">
<%@ include file="/views/admin/adminSideBar.jsp" %>

	<section id="adminMypage">
		<img alt="" src="<%=request.getContextPath()%>/img/common/main.jpg"
			width="1016px" height="400px">
		<div id="adminPetsitterSupportList">
			<h4>펫 시터 지원목록</h4>
			<hr/>
			<% for(int i=0;i<applyList.size();i++){ %>
				<p>-&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/admin/apply"><%=((AdminApplyDate)applyList.get(i)).getUserName()%>@naver.com</a>&nbsp;&nbsp;&nbsp;&nbsp;<%=((AdminApplyDate)applyList.get(i)).getEnrollData().substring(0,11)%></p>
			<% } %>
		</div>
		<div id="adminUser">
			<div id="adminUserInfo">
				<h4>고객 문의</h4>
				<h4>추가 요금 청구 건</h4>
			</div>
			<hr/>
			<div id="adminUserData">
				<div id="adminUserQ">
					<% for(int i=0;i<questionList.size();i++){ %>
						<p>-&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/admin/question"><%=questionList.get(i)%></a> 님의 문의</p>
					<% } %>
				</div>
				<div id="adminUserPlusPrice">
				</div>
			</div>
		</div>
	</section>
</section>
<%@ include file="/views/common/footer.jsp" %>