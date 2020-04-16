<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List, com.petmily.petsitterReview.model.vo.PetSitterReview" %>

	<%
		int no = Integer.parseInt(request.getParameter("no"));
		PetSitterReview psr= (PetSitterReview)request.getAttribute("psr");
		String star = "";
	%>

<!-- ------------------------------------------------------------- -->
<style>
	div{
		display:flex;
		flex-direction: column;
		margin-right:auto;
		margin-left:auto;
	}
	
	#container{
		background-color: rgb(218, 218, 218);
		border-radius:15px;
	}
	#tp{
		margin-top:120px;
	
	}
	
	
	#hr1{
		margin-top:130px;
		width: 550px;
	}
	
	#bttm{
		
		padding: 7px 15px;
		width: 100px;
		
		margin-top:30px;
		margin-bottom:30px;
	
	    background-color: black; /* 버튼 배경 */
	    border-radius:25px; /* 버튼을 둥글게! */
	    border: 0; /* 박스 선 없애기! */
	    font-size: small; /* 폰트 사이즈 */
	    color: white; /* 폰트 컬러 */
	}
	#hr2{
		margin-top:70px;
		width: 550px;
	}
	
	input{
		width: 200px;
		height: 30px;
	}
	
	#bttm2{
		
		padding: 7px 15px;
		width: 100px;

	    background-color: black; /* 버튼 배경 */
	    border-radius:25px; /* 버튼을 둥글게! */
	    border: 0; /* 박스 선 없애기! */
	    font-size: small; /* 폰트 사이즈 */
	    color: white; /* 폰트 컬러 */
	}
	
	#row{
		display:flex;
		flex-direction: row;
		margin-right:auto;
		margin-left:auto;
	}
	#checkid-container{
		margin-top:200px;
	}
</style>
<!-- ------------------------------------------------------------- -->

<section>
	<article>
		
		<div id="checkid-container">
		
			<%String birth =  psr.getReviewDate();%>
		    <%String str = birth.substring(0, 10);%>
			<div>작성 날짜 : <%=str %></div>
			<div>사용자 아이디 : <%=psr.getUserId()%> </div>
			<div>별점 : <%switch(psr.getReviewStar()) {
	                   		case 1:  star="★"; break;
	                   		case 2:  star="★★"; break;
	                   		case 3:  star="★★★"; break;
	                   		case 4:  star="★★★★"; break;
	                   		case 5:  star="★★★★★"; break;
                   		}%>
                   		<%=star%></div>
			<div>리뷰 내용 : <%=psr.getReviewTxt()%></div>

		</div>
	
	</article>
<!-- ------------------------------------------------------------- -->
<script>

	</script>
</section>