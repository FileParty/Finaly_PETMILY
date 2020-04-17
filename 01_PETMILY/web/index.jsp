<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css" type = "text/css">
<style>
	div#mainText{
		width:1366px;
		height:700px;
		background-image:url("<%=request.getContextPath()%>/img/common/main.jpg");
		background-size:100%;
		background-repeat:no-repeat;
		opacity:0.7;
	}
</style>
<section">
	<div id="mainText">
		<p>PET:MILY</p>
		<p>펫 밀리가 당신의 빈자리를 잠시 채워드릴게요.</p>
		<button onclick="location.replace('<%=request.getContextPath()%>')">펫 시터 예약하기</button>
	</div>
</section>
<section>
		<p id="service">서비스 안내</p>
	<div id="mainImg">
		<div class="mainImgs">
			<img alt="" src="<%=request.getContextPath()%>/img/common/main_img1.png" 
			width="254px;" height="226px;">
			<p>다양한 후기를 통해 우리 아이에게 맞는 <br/>맞춤형 펫시터를 골라보세요</p>
		</div>
		<div class="mainImgs">
			<img alt="" src="<%=request.getContextPath()%>/img/common/main_img2.png" 
			width="254px;" height="226px;">
			<p>다양한 필터로 우리 강아지 맞춤형<br/>펫 시터를 찾을 수 있습니다.</p>
		</div>
		<div class="mainImgs">
			<img alt="" src="<%=request.getContextPath()%>/img/common/main_img3.png" 
			width="254px;" height="226px;">
			<p>실시간 채팅으로 빠르게 예약을 진행하고,<br/>강아지의 상태를 확인 할 수 있습니다.</p>
		</div>
	</div>
</section>
<section id="Questions">
	<h2>자주하는 질문</h2>
	<div id="questionsDiv">
		<div class="que">
			<p>당일 예약이 가능한가요?</p>
			<img alt="1" src="<%=request.getContextPath()%>/img/common/arrowDown.png"
				width="20px" height="20px">
		</div>
		<div class="que2">
			<p>네, 당일 예약도 가능합니다! 그러나 예약을 더욱 안전하게 확정하기 위해서는 </p>
			<p>최소 1주일 전에 미리 예약하는 것을 추천드립니다.</p>
		</div>
		<div class="que">
			<p>펫 시터 예약변경이 가능한가요?</p>
			<img alt="1" src="<%=request.getContextPath()%>/img/common/arrowDown.png"
				width="20px" height="20px">
		</div>
		<div class="que2">
			<p>○ 돌봄일 기준 3일 전 까지 100% 환불</p>
			<p>○ 1~2일 전 까지 50% 환불</p>
			<p>○ 돌봄 당일 취소 시 20% 환불</p>
			<p> 예약 변경의 경우, 펫밀리 고객센터로 연락부탁드립니다.</p>
		</div>
		<div class="que">
			<p>호텔이나 병원에 맡기는것과 다른점은 무엇인가요?</p>
			<img alt="1" src="<%=request.getContextPath()%>/img/common/arrowDown.png"
				width="20px" height="20px">
		</div>
		<div class="que2">
			<p>검증받은 펫시터와 펫을 1대 1 케어로 안심하실 수 있습니다!</p>
		</div>
	</div>
	<button id="serviceCenter" 
		onclick="location.replace('<%=request.getContextPath()%>')">고객센터에 문의</button>
</section>
<script>
	$(function(){
		$(".que>img").click((e)=>{
			if($(e.target).attr("alt")=="1"){
				$(e.target).attr("src","<%=request.getContextPath()%>/img/common/arrowUp.png");
				$(e.target).attr("alt",2);
				let que2 = $(e.target).parent().next();
				console.log(que2);
				que2.slideDown(600);
			} else {
				$(e.target).attr("src","<%=request.getContextPath()%>/img/common/arrowDown.png");
				$(e.target).attr("alt",1);
				let que2 = $(e.target).parent().next();
				console.log(que2);
				que2.slideUp(600);
			}
		})
		let scrollE = document.addEventListener('scroll', function(){
			var scrollTop = window.scrollY || document.documentElement.scrollTop;
			if(scrollTop>190){
				let imgs = $(".mainImgs");
				$.each(imgs,function(i,d){
					$(d).slideDown(900);
					
				})
			}
			document.removeEventListener(this,scrollE);
		})
	})
</script>
<%@ include file="/views/common/footer.jsp" %>
