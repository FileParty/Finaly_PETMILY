<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <!-- 내가 적용한 CSS : 아이디,비밀번호 찾기 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yskCss/pwFindForm.css">
	<!-- 내가 적용한 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  
<section>
	
	<article>
	
		<h3 id="title">비밀번호 찾기</h3>
		
		<hr>
		
		
		<!-- [비밀번호 찾기] 아이디 입력 -->
		<!-- 바로 보여져야 하는 화면이기 때문에 따로 분기처리 하지 않았음. -->
		<div id="contentModal1" name="contentModal1">
			<table id="firstTB">
				<tr>
					<td>아이디</td>
					<td id="inputId">
						<input type="text" id="userId" name="userId" value="" required>
					</td>
				</tr>
				<tr>
					<td id="id_warningMsg" style="color: red;"></td>
				</tr>
			</table>
			<br><br><br>
			<hr id="bottom-line">
			<button id="send-next-btn" onclick="next1();">다음</button>
		</div>
		
		
		<!-- [비밀번호 찾기] 이메일 입력 -->
		<!-- userId값이 DB에 있는지 확인되면 해당 화면으로 전환시키고 위의  화면을 가림 -->
		<div id="contentModal2" name="contentModal2">
			<p id="p_title">회원가입 시 작성한 이메일을 입력해 주세요</p> <br><br>
			<input type="text" id="inputEmail" name="inputEmail"> @ 
			<select id="email_select">직접입력</select>
			<button id="send-btn" onclick="next2();">인증번호 전송</button> <!-- API랑 어떻게 이어야 하는 부분이죠?ㅋㅋ -->
			<br><br><br><br>
			<hr id="bottom-line">
		</div>
		
		
		<!-- [비밀번호 찾기] 이메일 인증번호 입력 -->
		<div id="contentModal3" name="contentModal3">
			<table>
				<tr>
					<td id="inputNum">인증번호 입력</td>
				</tr>
				<tr>
					<td><input type="text" name="randomNum" id="randomNum"></td>
				</tr>
				<tr>
					<td id="warningMsg">*인증번호가 일치하지 않습니다.</td>
				</tr>
			</table>
			
			<hr id="last-bottom-line">
			<button id="send-end-btn">인증 완료</button>
		</div>
		
		
	</article>
	
	
	
</section>

<script>
	// [다음] 버튼 누를 때 화면전환
	function next1() {
		let modal1 = document.getElementById("contentModal1");
		let modal2 = document.getElementById("contentModal2");
		
		modal1.style.display = "none";
		modal2.style.display = "inline";
	}
	
	// [인증번호 전송] 버튼 누를 때 화면전환
	function next2() {
		let modal2 = document.getElementById("contentModal2");
		let modal3 = document.getElementById("contentModal3");
		
		modal2.style.display = "none";
		modal3.style.display = "inline";
	}
	
	
	
	
	
	
</script>