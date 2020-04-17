<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pageType = 0;
	if(request.getAttribute("pageType")!=null){
		pageType = Integer.parseInt((String)request.getAttribute("pageType"));
	}
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminSideBar.css" type = "text/css">
<aside id="sideBar">
		<div id="sideBar1" class="side">
			<h2>일반 회원</h2>
			<hr/>
			<% if(pageType==1){ %>
				<a href="<%=request.getContextPath()%>/admin/user_list">▷  일반 회원 목록</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/admin/user_list">-  일반 회원 목록</a>
			<% } %>
		</div>
		<div id="sideBar2" class="side">
			<h2>펫 시터</h2>
			<hr/>
			<% if(pageType==2){ %>
				<a href="<%=request.getContextPath()%>/admin/apply">▷  펫 시터 지원 목록</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/admin/apply">- 펫 시터 지원 목록</a>
			<% } %>
			<% if(pageType==3){ %>
				<a href="<%=request.getContextPath()%>/admin/cancel">▷  이전 펫 시터 지원 목록</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/admin/cancel">-  이전 펫 시터 지원 목록</a>
			<% } %>
			<% if(pageType==4){ %>
				<a href="<%=request.getContextPath()%>/admin/petsitterList">▷   펫 시터 목록</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/admin/petsitterList">-  펫 시터 목록</a>
			<% } %>
		</div>
		<div id="sideBar3" class="side">
			<h2>게시글</h2>
			<hr/>
			<a href="#">- 후기 블라인드 요청 목록</a>
			<a href="#">- 블라인드 된 후기</a>
			<a href="#">- 블라인드 된 게시글</a>
		</div>
		<div id="sideBar4" class="side">
			<h2>고객 문의</h2>
			<hr/>
			<% if(pageType==8){ %>
				<a href="<%=request.getContextPath()%>/admin/question">▷   고객 문의</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/admin/question">-  고객 문의</a>
			<% } %>
		</div>
		<div id="sideBar5" class="side">
			<h2>추가 요금</h2>
			<hr/>
			<a href="#">- 추가 요금 청구 목록</a>
			<a href="#">- 이전 추가 요금 청구 목록</a>
			<a href="#">- 추가 요금 관련 문의</a>
		</div>
	</aside>