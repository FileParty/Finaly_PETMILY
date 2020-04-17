<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.menu{
            width: 230px;
            /* border: 1px solid yellow; */
            margin-top: 150px;
            height: 100%;
            
        }
    #menu{
        width: 230px;
        position : fixed;
        height: 100%;
    }
     .content{
        font-size: 12px;
        margin-bottom: 5px;
    }
</style>


	 	<div class="col-2 menu">
                    <div id="menu">
                        <ul type="none">
                            <li class="title"><a href="">회원정보</a></li>
                            <hr class="hr-line"/>
                            <li class="content"><a href=""> - 회원정보 수정</a></li>
                            <li class="content"><a href=""> - 회원 탈퇴</a></li>
                            <li class="content"><a href=""> - 북마크</a></li>
                            <li class="content"><a href=""> - 작성 후기</a></li>
                            <br/>
        
                            <li class="title">펫 프로필</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href=""> - 펫 프로필</a></li>
                            <br/>
                            
                            <li class="title">예약</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/request"> - 요청한 예약</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/reservationing"> - 진행중인 예약</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/reservationEnd"> - 종료된 예약</a></li>
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
