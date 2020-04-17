<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>



<!-- 채팅 화면. html/css 작성하다가 멈춤(완성도 0%) -->

<!-- 스타일 -->
<style>
	* {   
        box-sizing: border-box;
        font-family: 'Noto Sans KR', sans-serif;
    }
    html, body,section {
          height: 100%;
      }
    .col-9{
        height: 100%;
        /* overflow: hidden; */
    }
    .container{
        height: 100%;
        padding: 0;
        width: 1366px;
        margin-left: auto;
        margin-right: auto;
        /* border: 1px solid red; */
 
    }
    .row{
        padding: 0;
        margin: 0;
    }
    .menu{
            width: 230px;
            /* border: 1px solid yellow; */
            margin-top: 50px;

        }
    #menu{
        width: 230px;
        /* position : fixed; */
    }
    ul{
        padding-inline-start:0;
    }
    .title{
        font-size: 14px;
    }
    .content{
        font-size: 12px;
        margin-bottom: 5px;
    }
        a:link { color: black; text-decoration: none;}
        a:visited { color: gray; text-decoration: none;}
        a:hover { color: black; text-decoration: underline;}
        
    .hr-line {
    	margin-left: 0;
    	width: 22px;
	    height: 2px;
	    color: #ffcc33;
	    background-color: #ffcc33;
	    border: none;
	}
	.vl {   width: 1px;
            margin-top: 0px;
            border-left: 1px solid lightgrey;
            /* height: 100%; */
        }
</style>


<section>
	<div class="container">
	
		<div class="row">
			
			<div class="col-2 menu">
				<div id="menu">
					<ul type="none">
						<li class="title">회원정보</li>
                        <hr class="hr-line"/>
                        <li class="content"><a href="<%=request.getContextPath()%>/user/Update?userId=<%=loginUser.getUserId()%>"> - 회원정보 수정</a></li>
                        <li class="content"><a href="<%=request.getContextPath()%>/user/Delete?userId=<%=loginUser.getUserId()%>"> - 회원 탈퇴</a></li>
                        <li class="content"><a href="<%=request.getContextPath()%>/user/BookMarkList?userId=<%=loginUser.getUserId()%>"> - 북마크</a></li>
                        <li class="content"><a href="<%=request.getContextPath()%>/user/Review?userId=<%=loginUser.getUserId()%>"> - 작성 후기</a></li>
                        <br/>
        
                        <li class="title">펫 프로필</li>
                        <hr class="hr-line"/>
                        <li class="content"><a href="<%=request.getContextPath()%>/user/petprofile?userId=<%=loginUser.getUserId()%>"> - 펫 프로필</a></li>
                        <br/>
                            
                        <li class="title">예약</li>
                        <hr class="hr-line"/>
                        <li class="content"><a href="<%=request.getContextPath()%>/user/request?userId=<%=loginUser.getUserId()%>"> - 요청한 예약</a></li>
                        <li class="content"><a href="<%=request.getContextPath()%>/user/reservationing?userId=<%=loginUser.getUserId()%>"> - 진행중인 예약</a></li>
                        <li class="content"><a href=""> - 종료된 예약</a></li>
                        <li class="content"><a href=""> - 채팅</a></li>
                        <br/>
                            
                        <li class="title">결제</li>
                        <hr class="hr-line"/>
                        <li class="content"><a href=""> - 결제 내역</a></li>
                        <li class="content"><a href=""> - 추가 요금 내역</a></li>
                        <br/>
					</ul>
				</div>
			</div>	
			
			<div class="vl"></div>
			
			<div class="col-9" style="padding:0;">
			
				<div class="row" style="border: 1px solid;">
				
					<div class="col-3">
					
						<ul type="none">
							
							<li class="title"> <br><br>예약 요청 요약</li>
	                        <hr class="hr-line"/>
	                        
	                        <li class="content">케어 유형</li>
	                        <ul type="none">
		                        <li class="content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 1박 케어</a></li>	                        
	                        </ul>
	                        <li class="content">체크인-체크아웃</li>
	                        <ul type="none">
		                        <li class="content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 2020.04.01 ~ 2020.04.10</li>
	                        </ul>
	                        <li class="content">반려동물 유형</li>
	                        <ul type="none">
	                        	<li class="content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 소형견 1마리</li>
	                        </ul>
	                        <br/>
	        
	                        <li class="title">펫 프로필</li>
	                        <hr class="hr-line"/>
	                        <li class="content"><a href="<%=request.getContextPath()%>/user/petprofile?userId=<%=loginUser.getUserId()%>"> - 펫 프로필</a></li>
	                        <br/>
	                            
	                        <li class="title">예약</li>
	                        <hr class="hr-line"/>
	                        <li class="content"><a href="<%=request.getContextPath()%>/user/request?userId=<%=loginUser.getUserId()%>"> - 요청한 예약</a></li>
	                        <li class="content"><a href="<%=request.getContextPath()%>/user/reservationing?userId=<%=loginUser.getUserId()%>"> - 진행중인 예약</a></li>
	                        <li class="content"><a href=""> - 종료된 예약</a></li>
	                        <li class="content"><a href=""> - 채팅</a></li>
	                        <br/>
	                            
	                        <li class="title">결제</li>
	                        <hr class="hr-line"/>
	                        <li class="content"><a href=""> - 결제 내역</a></li>
	                        <li class="content"><a href=""> - 추가 요금 내역</a></li>
	                        <br/>
						</ul>
					</div>
					
					<div class="vl"></div>
					
				</div>
				
			</div>
			
			
		</div>
		
	</div>
</section>



<%@ include file="/views/common/footer.jsp" %>