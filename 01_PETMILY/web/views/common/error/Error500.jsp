<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ include file="/views/common/header.jsp" %>
<div id="errorPage">
	<div id="errorBoard">
		<h1>서버 내부 오류입니다.<br/>관리자에게 문의해주세요</h1>
		<br/></br/>
		<button onclick="location.replace('<%=request.getContextPath()%>')">돌아가기</button>
	</div>
</div>
<style>
	div#errorPage{
		display:flex;
		flex-direction:column;
		justify-content:center;
		text-align:center;
		align-items:center;
		width:1366px;
		height:444px;
	}
	div#errorBoard{
		display:flex;
		flex-direction:column;
		justify-content:center;
		text-align:center;
		align-items:center;
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
		width:50%;
		height:250px;
	}
	div#errorBoard button{
		width:100px;
		border:1px solid gray;
		border-radius:24px;
		background-color:lightyellow;
	}
</style>
<%@ include file="/views/common/footer.jsp" %>