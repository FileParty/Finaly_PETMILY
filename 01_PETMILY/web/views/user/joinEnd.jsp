<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>


<!-- 내가 적용한 CSS : 회원가입 완료 -->	
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yskCss/joinEndForm.css">

<section>
	
	<!-- 회원가입 완료 타이틀 -->
	<h1 id="joinEnd_Title">회원가입</h1>
	
	<!-- 회원가입 축하 영역 -->
	<article>
	
		<table>
			
			<tr id="joinEnd_msg">
				<td id="joinEnd_msg_td">
					<strong>'(아이디명)'</strong>님의 회원 가입을 축하드립니다.
				</td>
			</tr>
			
			<tr id="joinEnd_Question">
				<td>
					<p>
						펫 시터 예약 서비스는 펫 프로필을 등록해야 이용하실 수 있습니다. <br>
						그럼, 펫 프로필 등록을 진행할까요?
					</p>
				</td>
			</tr>
			
			<tr>
				<td>
					<button id="petProfile-btn" onclick="location.replace('<%=request.getContextPath()%>/user/petprofile')">
						펫 프로필 등록
					</button>
				</td>
			</tr>
					
		</table>
	
	</article>
	
</section>

<%@ include file="/views/common/footer.jsp" %>