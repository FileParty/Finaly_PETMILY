<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
<%@ page import="com.petmily.user.model.vo.User"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="http://apis.google.com/js/platform.js" async defer></script>

<%@ include file="/views/common/header.jsp" %>

<!-- 내가 적용한 CSS : 로그인 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yskCss/loginForm.css">
<!-- 내가 적용한 Jquery 파일 -->
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script> 

<section>

	<!-- 로그인 타이틀 -->
     <p id="loginTitle">로그인</p>

     <!-- 첫번째 article : 로그인 폼 -->
     <article>
         <form id="loginForm" action="<%=request.getContextPath()%>/log-in.do" method="post" > 
             <table id="loginTB" >

                 <tr id="firstTr">
                     <td class="idForm" id="idTitle"> <p id="idTitle">아이디</p> </td>
                     <td class="idForm"> 
                     	<input type="text" autofocus name="userId" id="userId" required placeholder="아이디 입력"  >
                     	<!-- value="loginUser.getUser_id()" -->
                   	 </td>
                     <td rowspan="2" id="login-td" class="idForm">
                         <button type="submit" name="login-btn" id="login-btn" onclick="log_in(); msg_div();">login</button>
                     </td>
                 </tr>

                 <tr>
                     <td class="pwForm" id="pwTitle"> 비밀번호 </td>
                     <td class="pwForm"> 
                     	<input type="password" name="userPw" id="userPw" required placeholder="비밀번호 입력" >
                     </td>
                 </tr>

             </table>

			
			<!-- 여기는 어쩔 수 없는 부분 -->
			<%-- <% if((boolean)request.getAttribute("flag")==false) { %>
	             <!-- 메세지란 : 아이디 혹은 비밀번호가 잘못 되었습니다. -->
	           	 <p id="idpwMistake" style="display:block;">아이디 혹은 비밀번호가 잘못 되었습니다.</p>
           	 <% } %> --%> 
           	 
           	 
             <br>
             
             <!-- id찾기, pw찾기, 회원가입 태그 -->
             <a id="first_find_enroll" class="find_enroll" href="javascript:void(0);" onclick="findId();">아이디</a>
             <a class="find_enroll" href="javascript:void(0);" onclick="findPw();">비밀번호 찾기</a>
             <a class="find_enroll" href="javascript:void(0);" onclick="location.replace('<%=request.getContextPath()%>/join')">회원가입</a>
             
         </form>
         
     </article>

     <!-- 로그인 폼과 sns로그인 폼의 사이 여백 -->
     <div id="blank"></div>

     <!-- 두번째 article : sns 로그인(API 필요) -->
     <!-- 현재 API를 어떻게 해야 할지 몰라서 form 태그 대신, div로만 설정해뒀음! -->
     <article id="second-article">
         <div id="facebook" class="SNS_BG" onclick="location.replace('....')">페이스북으로 로그인 </div>
         <!-- <div id="google" class="SNS_BG" onclick="googloeLogin()">구글로 로그인</div>
		 <div id="googleSigninButton" style="display:none;"></div> -->
		 <div class="g-signin2" data-ousuccess="onSignIn">구글로 로그인</div>
         <div id="kakao" class="SNS_BG kakao" onclick="kakaoLogin()">카카오톡으로 로그인</div>
         <!-- DB에 insert 구현 필요. -->
     </article>

</section>


<script>
	// 구글 로그인
	function googloeLogin(){
		location.href="https://accounts.google.com/o/oauth2/auth?client_id="+
		"306171897820-rnu74sp5127hhcvfqqdd3qu06sc2n5d3.apps.googleusercontent.com"+
		"&redirect_uri="+
		"http://localhost:9090/01_PETMILY/googleLogin.do" +
		"&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email&approval_prompt=force&access_type=offline";
	};
	
	function onSignIn(googleUser){
		var profile = googleUser.getBasicProfile();
		console.log('ID : ' + propfile.getId());
		console.log('Name : ' + propfile.getName());
		console.log('Email : ' + propfile.getEmail());
		gapi.auth2.getAuthInstance().signOut().thn(function() {
			console.log("로그아웃");
		})
	}

	// 카카오톡 로그인
	 Kakao.init('21457534dfe681cc96c51d32694dc5a9');
        // 카카오 로그인 버튼을 생성합니다.
        function kakaoLogin(){
        	
	        Kakao.Auth.loginForm({
	            success: function (res) {
	            	Kakao.API.request({
	                    url: '/v2/user/me',
	                    success: function(res) {
	                     console.log(res);
	                     var userID = res.id;      //유저의 카카오톡 고유 id
	                     var userEmail = res.kakao_account.email;   //유저의 이메일
	                     var userNickName = res.properties.nickname; //유저가 등록한 별명
	                     /* document.getElementById("profileID").value=userID;
	                     document.getElementById("profileEMAIL").value=userEmail;
	                     document.getElementById("profileNICKNAME").value=userNickName;
	                     document.getElementById("profileGENDER").value=gender;
	                     $("#profileImg").attr('src',userImg);  */
	                     console.log(userID);
	                     console.log(userEmail);
	                     console.log(userNickName);
	                     alert("로그인 성공");
	                     Kakao.Auth.logout();
	                     location.replace('<%=request.getContextPath()%>/APIlogin.do?userEmail='+userEmail);
	                    },
	                    fail: function(error) {
	                     alert(JSON.stringify(error));
	                    }
	                   });
	            	
	            },
	            fail: function (err) {
	                alert(JSON.stringify(err));
	            }
	        });
        }
        
        

	// 아이디를 입력하세요. 비밀번호를 입력하세요. 멘트
	function log_in() { 
		var userId = $("#userId").val();
		var userPw = $("#userPw").val();
		
		// 아이디의 공백을 제거하고, 아이디값의 길이가 0과 같을 때
		if(userId!=null && userId.trim().length==0) {
			alert('아이디를 입력하세요.');
			$("#userId").focus();
			return false;
			
		}
		// 비밀번호의 공백을 제거하고, 비밀번호값의 길이가 0과 같을 때
		if(userPw.trim().length==0) {
			alert('비밀번호를 입력하세요.');
			$("#userPw").focus();
			return false;
		}
		return true;
		
	}

	
	// 아이디찾기, 비밀번호찾기 로직(팝업창)
	function findId() { // 아이디 찾기
		// 새 창을 띄워서 userId의 값을 비교하는 함수!
		var url = "<%=request.getContextPath()%>/idFind";
		var status = "height=420px, width=600px, top=200px, left=500px";
		window.open(url, "_blank", status);
	};
	
	function findPw() { // 비밀번호 찾기
		var url = "<%=request.getContextPath()%>/pwFind";
		var status = "height=420px, width=600px, top=200px, left=500px";
		window.open(url, "_blank", status);
	}
	
	
	
</script>










<%@ include file="/views/common/footer.jsp" %>