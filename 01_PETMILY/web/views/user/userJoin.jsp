<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<!-- 내가 적용한 CSS : 회원가입 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yskCss/joinForm.css">
	<!-- 내가 적용한 jQuery -->
	<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
	<!-- Daum 우편번호 서비스 API  -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%@ include file="/views/common/header.jsp" %>

<!-- 회원가입 영역 -->
<section>
    <p style="margin-top: 120px; margin-bottom: 60px; font-size: 30px; text-align:center; font-weight: bolder;">회원가입</p>
    
    <article>

        <form name="form" action="<%=request.getContextPath()%>/joinEnd" method="post" onsubmit="return all_join_check();">
            <table id="enrollTB">

                
                <!-- 아이디 html -->
                
                <tr class="tr-blank">
                    <td><p id="idTitle">아이디</p></td>
                    <td class="second-td">
                    	<input style="padding-left: 5px; width:215px;" id="user_Id" name="user_Id" type="text" placeholder="ex) User01" onchange="idChange();">
                    	&nbsp;&nbsp;&nbsp;
                    	<button class="checkBtn" onclick="duplicate();">중복 확인</button>
                    </td>
                </tr>
                
                <!-- 아이디 유효성 검사 메세지 -->
				<tr>
					<td></td>
					<td id="idMsg"><span id="spanId" class="spanClass">아이디 유효성 검사 메세지</span></td>
				</tr>

				<!-- ------------------------ -->

				<!-- 비밀번호 html -->

                <tr class="tr-blank">
                    <td>비밀번호</td>
                    <td class="second-td">
                    	<input type="password" id="password" name="password" placeholder="숫자/영문(대소)/특수문자 포함" required>
                    </td>
                </tr>
                
                <tr>
					<td></td>
					<td id="pwMsg"><span id="result" class="spanClass">비밀번호 유효성 검사 메세지</span></td>
				</tr>
				
				<!-- ------------------------ -->

                <tr class="tr-blank">
                    <td>비밀번호 확인</td>
                    <td class="second-td">
                    	<input type="password" id="pwck" name="pwck" required>
                    </td>
                </tr>
                
                <tr>
					<td></td>
					<td id="pwMsg"><span id="resultPwck" class="spanClass">비밀번호 유효성 검사 메세지</span></td>
				</tr>
                
                <!-- ------------------------ -->

                <tr class="tr-blank">
                    <td>이름</td>
                    <td class="second-td">
                    	<input type="text" id="user_name" name="user_name" placeholder="2글자이상/영문자(대소)" onchange="nameChange();">
                    	<span id="resultName"></span> 
                    </td>
                </tr>
                
                <tr>
					<td></td>
					<td id="nameMsg"><span class="spanClass" id="nameResult">이름 유효성 검사 메세지</span></td>
				</tr>
                
                <!-- ------------------------ -->
                
                <tr>
                	<td>성별</td>
	                <td style="padding-left: 10%; line-height: 40px;">
						<input type="radio" name="gender" id="gender0" value="남" required>
						<label for="gender0">남</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="gender" id="gender1" value="여" required>
						<label for="gender1">여</label>
					</td>
                </tr>
                
                <tr>
					<td></td>
					<td id="idMsg"><span class="spanClass" >유효성 검사 메세지</span></td>
				</tr>

				<!-- ------------------------ -->

                <tr class="tr-blank">
                    <td>생년월일</td>
                    <td class="second-td">
                    	<input type="date" id="user_birth_day" name="user_birth_day" min="1900-01-01" max=""
			            style="width: 220px; padding-left: 10px;" required>
                   </td>
               </tr>
               
               <tr>
					<td></td>
					<td id="idMsg"><span class="spanClass"> 유효성 검사 메세지</span></td>
				</tr>
               
               <!-- ------------------------ -->
               
               <tr class="tr-blank">
                   <td>이메일</td>
                   <td class="second-td" id="emailSelect">
                   		<div style="display:flex-direction: row;">
	                   		<input type="email" style="width: 220px;" id="email" name="email" placeholder="ex) abc1231@naver.com" onchange="emailChange();"> 
	                   		&nbsp;&nbsp;&nbsp;
	                   		<button class="checkBtn" type="button" onclick="duplicateEmail();">중복확인</button>
	                   	</div>
                   </td>
               </tr>

               <tr>
					<td></td>
					<td id="idMsg"><span class="spanClass" id="emailMsg">이메일 유효성 검사 메세지</span></td>
				</tr>	
				
				<!-- ------------------------ -->
               
               <tr class="tr-blank">
                   <td>핸드폰 번호</td>
                   <td class="second-td">
                   		<input type="text" style="width: 220px;" id="phone" name="phone" placeholder="숫자만 입력가능" onchange="phoneChange();">
                   		&nbsp;&nbsp;
                   		<button class="checkBtn" type="button" onclick="duplicatePhone();">중복확인</button>
                   		&nbsp;&nbsp;&nbsp;
                   		<span id="spanEX">입력 예 : 01012345656</span>
                   </td>
               </tr>
               
               <tr>
					<td></td>
					<td id="idMsg"><span class="spanClass" id="phoneMsg">휴대번호 유효성 검사 메세지</span></td>
				</tr>
				
				<!-- ------------------------ -->
               
                <tr class="tr-blank">
                    <td>우편변호</td>
                    <td class="second-td">
                    	<input type="text" style="width: 220px;" id="postNum" name="postNum" placeholder="우편번호">&nbsp;&nbsp;&nbsp;
                    	<button type="button" class="checkBtn" onclick="zip_code();">우편번호 찾기</button>
                    </td>
                </tr>
                
                <tr>
					<td></td>
					<td id="idMsg"><span class="spanClass">아이디 유효성 검사 메세지</span></td>
				</tr>
                
                <tr class="tr-blank">
                    <td></td>
                    <td class="second-td">
                    	<input style="width: 220px;" id="streetAddress" name="streetAddress" type="text" placeholder="도로명주소">
                    </td>
                </tr>
                
                <tr>
					<td></td>
					<td id="idMsg"><span class="spanClass">아이디 유효성 검사 메세지</span></td>
				</tr>
                
                <!-- <tr class="tr-blank">
                    <td></td>
                    <td class="second-td">
                    	<input id="jibunAddress" type="text" placeholder="지번주소">
                    </td>
                </tr> -->
                
                <!-- <tr>
					<td></td>
					<td id="idMsg"><span class="spanClass">아이디 유효성 검사 메세지</span></td>
				</tr> -->
                
                <tr class="tr-blank">
                    <td><p id="detailTitle">상세주소</p></td>
                    <td class="second-td">
                    	<input style="width: 220px;" id="addressInput" name="addressInput" type="text" placeholder="상세주소 입력">
                   	</td>
                </tr>
                
            </table>

            <br>

            <button type="submit" id="enroll-btn">완료</button>
            
        </form>

    </article>

</section>

<script>
/* --------------------------------------------------------------------------------------- */

	//아이디 중복확인 팝업창
	function duplicate() {	
		// 아이디값 불러오기
		var userId = document.getElementById("user_Id").value;
		
		// 새 창을 띄워서 userId의 값을 비교하는 함수!
		var url = "<%=request.getContextPath()%>/UserIdDuplicate?user_Id="+userId;
		var status = "height=420px, width=600px, top=200px, left=500px";
		window.open(url, "_blank", status);
	}
	
	
	// 휴대전화 중복확인 팝업창
	function duplicatePhone() {
		// 서블릿에 보낼 휴대번호값 불러오기
		var phone = $("#phone").val();
		
		// 새 창을 띄워서 phone의 값을 비교하는 함수!
		var url = "<%=request.getContextPath()%>/phoneDuplicate?phone="+phone;
		var status = "height=420px, width=600px, top=200px, left=500px";
		
		/* 유효성검사에 맞게 틀린 값을 입력했을 때 팝업창이 띄워지지 않게 설정한다. */
		/* if(phone.length<11 && phone.length>11 && phone.value==" "){ // 휴대번호 숫자가 11개가 아니면 팝업창을 띄우지 않는다.
			return;
		} */
		window.open(url, "_blank", status);
	}
	
	
	// 이메일 중복확인 팝업창
	function duplicateEmail() {
		// 서블릿에 보낼 이메일값 불러오기
		var email = document.getElementById("email").value; // input 태그 값 가져오기
		// var optionValue = $("#email option:selected").val(); // select 태그에서 선택된 option 값 가져오기
		// var emailId = emailInput+optionValue;
		
		if( !(email==null || email.trim().length<4) ) {
			// 새 창을 띄워서 emailInput, email의 값을 비교하는 함수!
			var url = "<%=request.getContextPath()%>/emailDuplicate?email="+email;
			var status = "height=420px, width=600px, top=200px, left=500px";
			window.open(url, "_blank", status);
		}
		else {
			alert("이메일 4글자 이상 입력하세요");
			$("#email").focus();
			return;
			
		}
		
	}
/* --------------------------------------------------------------------------------------- */
/* ------------------------------------[유효성 검사 로직]-------------------------------------- */
	
/* ------------------------------------ 아이디 검사 로직 -------------------------------------- */
	
	function idChange() {
		var idReg = /^[a-zA-Z0-9]{4,12}$/g; // 영문자(대소문자), 숫자, 5글자 이상만 가능
		var id = document.getElementById("user_Id");
		var spanId = document.getElementById("spanId"); // span 영역
		
		// 아이디 유효성 검사
		$("#user_Id").change(function() { 
			if(!idReg.test(id.value)) {
				spanId.innerHTML="아이디는 영문자(대소), 숫자 조합으로 5글자 이상 12글자 이하만 가능합니다.";
				spanId.style.color="red";
				spanId.style.fontWeight='bolder';
				spanId.style.fontSize= '13px';
				spanId.style.visibility='visible';
				console.log("아이디 유효성 검사 (유효성 검사 실패) : "+idReg.test(id.value));
				return false;
			}
			/* else { */
				spanId.innerHTML="아이디 유효성 검사 완료!";
				spanId.style.color="green";
				spanId.style.fontWeight='bolder';
				spanId.style.fontSize= '13px';
				spanId.style.visibility='visible';
				console.log("아이디 유효성 검사 (유효성 검사 완료) : "+idReg.test(id.value));
				
				return true;
			/* } */
		}); 
		
		/* 아이디에 공백 사용하지 않기 */
		if (document.form.user_Id.value.indexOf(" ")>=0) {
            alert("아이디에 공백 사용 불가!");
            form.user_Id.value="";
            form.user_Id.focus();
            
            spanId.innerHTML="아이디 유효성 검사 실패!(사유 : 공백 포함)";
            spanId.style.color="red";
            spanId.style.fontWeight='bolder';
            spanId.style.fontSize= '13px';
            spanId.style.visibility='visible';
            
            console.log("아이디 유효성 검사(공백) : "+idReg.test(id.value));
            return false;
       	}
		
		/* 아이디 길이 체크 */
		if(document.form.user_Id.value.length<=5) {
			alert("아이디는 5글자 이상 사용 가능합니다.");
			form.user_Id.value="";
            form.user_Id.focus();
            
            spanId.innerHTML="아이디 유효성 검사 실패!(사유 : 글자 수)";
            spanId.style.color="red";
            spanId.style.fontWeight='bolder';
            spanId.style.fontSize= '13px';
            spanId.style.visibility='visible';
            
            console.log("아이디 유효성 검사(글자 수) : "+idReg.test(id.value));
            return false;
		}
       		
   	}
/* ------------------------------------ 아이디 검사 로직 끝 -------------------------------------- */   	

/*-------------------------------------- 비밀번호 로직 -------------------------------------------- */
	var pw = document.getElementById("password"); // 비밀번호
	var pwck = document.getElementById("pwck"); // 비밀번호 확인
	var span = document.getElementById("result"); // 메세지
	
	/* pw.onfocus= function() { span.innerHTML=''; } */
	
	//비밀번호가 일치하지 않을 시, 입력한 값이 전부 지워집니다.
	$("#password").change(function() {
		let idck = document.getElementById("user_Id");
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		if(!reg.test(pw.value)) {
			span.innerHTML='비밀번호는 8자 이상! (숫자/영문자(대소)/특수문자 포함)';
			span.style.color= 'red';
			span.style.fontWeight='bolder';
			span.style.fontSize= '13px';
			span.style.visibility='visible';
			console.log("비밀번호 유효성 검사 값을 보여줘! 1 : "+reg.test(pw.value));
		}
		else {
			span.innerHTML='유효성 검사 확인 완료!';
			span.style.color= 'green';
			span.style.fontWeight='bolder';
			span.style.fontSize= '13px';
			span.style.visibility='visible';
			console.log("비밀번호 유효성 검사 값을 보여줘! 3 : "+reg.test(pw.value));
		}
	});
	
	 $("#pwck").change(function() {
		 var pwck = document.getElementById("pwck");
		 var pwckSpan = document.getElementById("resultPwck");
		 
        if(pw.value==pwck.value && pw.value.trim()!='') {
           pwckSpan.innerHTML='비밀번호가 일치합니다.';
           pwckSpan.style.color='green';
           pwckSpan.style.fontSize= '13px';
           pwckSpan.style.fontWeight='bolder';
           pwckSpan.style.visibility='visible';
           
           console.log(pwck.value);
           console.log(typeof(pw.value));
        }
        else {
           pwckSpan.innerHTML='비밀번호가 일치하지 않습니다.';
           pwckSpan.style.color= 'red';
           pwckSpan.style.fontSize= '13px';
           pwckSpan.style.fontWeight= 'bolder';
           pwckSpan.style.visibility='visible';
           pw.value='';
           pwck.value='';
           pw.focus();
           console.log(this);
           console.log(pwck.value);
        }
     });
	/*---------------------------------- 비밀번호 로직 끝 ---------------------------------------- */
	
	/*---------------------------------------- 이름 로직 ---------------------------------------- */
	function nameChange() {
		var nameReg = /^[가-힣a-zA-Z]+$/; // 영문자, 한글만 입력 가능
		var name = document.getElementById("user_name"); // 이름 input id 가져오기
		var spanName = document.getElementById("nameResult"); // 이름 메세지 영역
		
		// 이름 유효성 검사
		$("#user_name").change(function() {
			if(!nameReg.test(name.value)) {
				spanName.innerHTML="이름은 영문자와 한글만 입력이 가능합니다.";
				name.value="";
				$("#user_name").focus();
				spanName.style.color="red";
				spanName.style.fontWeight='bolder';
				spanName.style.fontSize= '13px';
				spanName.style.visibility='visible';
				console.log("이름 유효성 검사 (유효성 검사 실패) : "+nameReg.test(name.value));
				return false;
			}
			else { 
				spanName.innerHTML="이름 유효성 검사 완료!";
				spanName.style.color="green";
				spanName.style.fontWeight='bolder';
				spanName.style.fontSize= '13px';
				spanName.style.visibility='visible';
				console.log("이름 유효성 검사 (유효성 검사 완료) : "+nameReg.test(name.value));
				return true;
			}
		});
		
		if (name.value.length<2 && name!=null) {
	        form.user_Id.value="";
	        form.user_Id.focus();
	        
	        spanName.innerHTML="공백 불가/이름 2글자 이상/영문자(대소) 및 한글 사용 가능";
	        spanName.style.color="red";
	        spanName.style.fontWeight='bolder';
			spanName.style.fontSize= '13px';
			spanName.style.visibility='visible';
	        console.log("아이디 유효성 검사(사유 : 공백불가, 2글자 이상) : "+nameReg.test(name.value));
	        return false;
	   	}	
		
		/* 이름값이 없을 때 */
		if(document.form.user_name.value=="") {
			spanName.innerHTML="이름을 입력하세요.";
			spanName.style.color="red";
	        spanName.style.fontWeight='bolder';
			spanName.style.fontSize= '13px';
			spanName.style.visibility='visible';
			console.log("아이디 유효성 검사 (사유: 이름) : "+nameReg.test(name.value));
			return false;
		}
	}
	
	/*---------------------------------------- 이름 로직 끝 -------------------------------------- */

	/*-------------------------------------- 이메일 로직  ---------------------------------------- */
	 function emailChange() {
		 var email = $("#email").val();
		 // 이메일 출처 : https://olsh1108o.tistory.com/entry/JS-%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85-%EC%9C%A0%ED%9A%A8%EC%84%B1-%EA%B2%80%EC%82%AC
		 var emailReg = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		 if (!emailReg.test(email)) {
            alert("이메일 형식이 올바르지 않습니다!");
           	form.email.value = "";
            form.email.focus();
            return false;
        }
	 }
	/*-------------------------------------- 이메일 로직 끝  -------------------------------------- */
	
	/*-------------------------------------- 휴대전화 로직 -------------------------------------- */
	function phoneChange() {
		var phone = document.getElementById("phone");
		var phoneReg = /^[0-9]*$/; // 숫자만 입력
		var spanPhone = document.getElementById("phoneMsg");
		var reg=/" "/g;
		
		/* 휴대번호 공백 확인 */
		if( (phone.value).trim().length<11 || (phone.value).trim().length>11 ) {
			spanPhone.innerHTML="공백은 입력할 수 없고(숫자만 입력가능) 길이는 숫자 11글자입니다.";
			spanPhone.style.color="red";
			spanPhone.style.fontWeight='bolder';
			spanPhone.style.fontSize= '13px';
			spanPhone.style.visibility='visible';
			console.log("휴대번호 길이: "+phone.value);
			return;
		}
		
		/* 휴대번호 숫자 길이 조건 */
		if((phone.value.length<11 || phone.value.length>11)) {
			spanPhone.innerHTML="휴대번호는 숫자 11개로 입력해야 합니다.";
			spanPhone.style.color="red";
			spanPhone.style.fontWeight='bolder';
			spanPhone.style.fontSize= '13px';
			spanPhone.style.visibility='visible';
			console.log("아이디 유효성 검사 (사유: 숫자) : "+phoneReg.test(phone.value));
			return false;
		}
		
		/* 휴대번호 유효성 검사(정규식 표현) */
		/* if(!phoneReg.test(phone.value)) {
			spanPhone.innerHTML="숫자만 입력 가능합니다.";
			spanPhone.style.color="red";
			spanPhone.style.fontWeight='bolder';
			spanPhone.style.fontSize= '13px';
			spanPhone.style.visibility='visible';
			console.log("아이디 유효성 검사 (사유: 숫자) : "+phoneReg.test(phone.value));
			return false; */
		/* } */ 
		
		
		spanPhone.innerHTML="유효성 검사 성공!";
		spanPhone.style.color="green";
		spanPhone.style.fontWeight='bolder';
		spanPhone.style.fontSize= '13px';
		spanPhone.style.visibility='visible';
		console.log("아이디 유효성 검사 (성공!) : "+phoneReg.test(phone.value));
		
		
	}
	/*-------------------------------------- 휴대전화 로직 끝  -------------------------------------- */
	
	
	/* --------------------------------------------------------------------------------------- */
	
	
	/* Daum 우편번호 로직 */
	function zip_code() {
		new daum.Postcode({
			oncomplete: function(data) {
	        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	        var roadAddr = data.roadAddress; // 도로명 주소 변수
	        var extraRoadAddr = ''; // 참고 항목 변수
	
	        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	            extraRoadAddr += data.bname;
	        }
	        // 건물명이 있고, 공동주택일 경우 추가한다.
	        if(data.buildingName !== '' && data.apartment === 'Y'){
	           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	        }
	        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	        if(extraRoadAddr !== ''){
	            extraRoadAddr = ' (' + extraRoadAddr + ')';
	        }
	
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        document.getElementById("postNum").value = data.zonecode; // 우편번호
	        document.getElementById("streetAddress").value = roadAddr; // 도로명주소
/* 	        document.getElementById("jibunAddress").value = data.jibunAddress; // 지번주소 */
	        
	        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다. (상세주소)
	        /* if(roadAddr !== ''){
	            document.getElementById("addressInput").value = extraRoadAddr;
	        } else {
	            document.getElementById("addressInput").value = '';
	        }
	
	        var guideTextBox = document.getElementById("guide");
	        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	        if(data.autoRoadAddress) {
	            var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	            guideTextBox.style.display = 'block';
	
	        } else if(data.autoJibunAddress) {
	            var expJibunAddr = data.autoJibunAddress;
	            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	            guideTextBox.style.display = 'block';
	        } else {
	            guideTextBox.innerHTML = '';
	            guideTextBox.style.display = 'none';
	        } */
	  	  }
		}).open();
	} // function()
</script>

<%@ include file="/views/common/footer.jsp" %> 