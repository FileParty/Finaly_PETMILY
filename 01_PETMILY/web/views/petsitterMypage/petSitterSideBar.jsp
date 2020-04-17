<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<style>
#menu{
	width: 230px;
	/* position : fixed; */
	height: 100%;
}
ul{
    padding-inline-start:0;
}
hr{
    margin-left: 0;
    width: 10%;
}
</style>

<div class="col-2 menu">
	<div id="menu">
		<ul type="none">
			<li class="title">회원정보</li>
			<hr class="hr-line"/>
			<li class="content"><a href=""> - 회원정보 수정</a></li>
			<li class="content"><a href=""> - 회원 탈퇴</a></li>
			<br/>
			<li class="title">작성글</li>
			<hr class="hr-line"/>
			<li class="content"><a href="<%=request.getContextPath()%>/sitter/Detail"> - 작성글 보기</a></li>
			<li class="content"><a href=""> - 작성한 비밀 후기 보기</a></li>
			</br>
			<li class="title">예약</li>
			<hr class="hr-line"/>
			<li class="content"><a href=""> - 요약 현황</a></li>
			<li class="content"><a href=""> - 결제 전 예약</a></li>
			<li class="content"><a href=""> - 결제 완료 예약</a></li>
			<li class="content"><a href=""> - 내 예약 일정</a></li>
			<li class="content"><a href=""> - 채팅</a></li>
			<br/>
			<li class="title">정산</li>
			<hr class="hr-line"/>
			<li class="content"><a href=""> - 이번 달 정산 현황</a></li>
			<li class="content"><a href="<%=request.getContextPath()%>/sitter/settled"> - 이전 정산 보기</a></li>
			<br/>
			<li class="title">자격증</li>
			<hr class="hr-line"/>
			<li class="content"><a href="<%=request.getContextPath()%>/sitter/certificate"> - 보유 자격증 목록</a></li>
			<li class="content"><a href="<%=request.getContextPath()%>/sitter/AddCertificate"> - 자격증 추가</a></li>
			<br/>
		</ul>
	</div>
</div>