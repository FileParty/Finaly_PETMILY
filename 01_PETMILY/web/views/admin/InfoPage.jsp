<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.petmily.admin.model.vo.ApplyUserData, 
 com.petmily.admin.model.vo.User,com.petmily.admin.model.vo.AdminPetsitter" %>
<% 
	ApplyUserData aud = null;
	User u = null;
	ArrayList<AdminPetsitter> apList = new ArrayList<AdminPetsitter>();
	if(request.getAttribute("showType")!=null&&request.getAttribute("userData")!=null&&((String)request.getAttribute("showType")).equals("apply")){
		aud = (ApplyUserData)request.getAttribute("userData");
	} else if(request.getAttribute("showType")!=null&&request.getAttribute("userData")!=null&&((String)request.getAttribute("showType")).equals("user")){
		u = (User)request.getAttribute("userData");
	} else if(request.getAttribute("showType")!=null&&request.getAttribute("userData")!=null&&((String)request.getAttribute("showType")).equals("petsitterCer")){
		apList = (ArrayList<AdminPetsitter>)request.getAttribute("userData");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 페이지</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<table>
		<% if(aud!=null){ %>
			<tr>
				<th>아이디</th>
				<td><%=aud.getPET_SITTER_ID()%></td>
			</tr>
			<tr>
				<th>직업</th>
				<td><%=aud.getPET_SITTER_JOB()%></td>
			</tr>
			<tr>
				<th>가족 구성원</th>
				<td>
					<textarea rows="5" cols="20" readonly>
						<%=aud.getPET_SITTER_FAMILY()%>
					</textarea>
				</td>
			</tr>
			<tr>
				<th>반려동물 키움 설명</th>
				<td>
					<textarea rows="5" cols="20" readonly>
						<%=aud.getPET_SITTER_KEEP_PETS()%>
					</textarea>
				</td>
			</tr>
			<tr>
				<th>펫시터 활동 경력</th>
				<td>
					<textarea rows="5" cols="20" readonly>
						<%=aud.getPET_SITTER_ACTIVITY()%>
					</textarea>
				</td>
			</tr>
			<tr>
				<th>거주유형</th>
				<td>
				<% for(String s : aud.getRESIDENCE_VALUE()){ %>
				<%= s%>
				<% 	}%>
				</td>
			</tr>
			<% if(aud.getPET_CERTIFICATE_YN()!=null){ %>
				<tr>
					<th>자격증이름</th>
					<td><%=aud.getCERTIFICATE_NAME()%></td>
				</tr>
				<tr>
					<th>자격증기관명</th>
					<td><%=aud.getCERTIFICATION_NAME()%></td>
				</tr>
				<tr>
					<th>자격증 발급일</th>
					<td>
					<% if(aud.getDATE_OF_ACQUISITION()!=null){ %>
						<%=aud.getDATE_OF_ACQUISITION().substring(0, 11)%>
					<% } else { %>
						<p>발급일이 없습니다</p>
					<% } %>
					</td>
				</tr>
				<tr>
					<th>자격증 만료일</th>
					<td><%=aud.getEXPIRATION_DATE()!=null?aud.getEXPIRATION_DATE():"만료일자없음"%></td>
				</tr>
				<tr>
					<th>자격증 사진</th>
					<td>
						<%if(aud.getCERTIFICATE_FILENAME()!=null){ %>
							<img alt="" src="<%=request.getContextPath()%>/upload/sitter/<%=aud.getCERTIFICATE_FILENAME()%>"
								widht="200px" height="120px">
						<% } else { %>
							<p>사진이 없습니다.</p>
						<% } %>
					</td>
				</tr>
			<% }
			}%>
			<% if(apList.size()>0){
				for(AdminPetsitter ap : apList){ %>
				<tr>
					<th colspan="2"><h3>자격증</h3></th>
				</tr>
				<tr>
					<th>자격증이름</th>
					<td><%=ap.getCERTIFICATE_NAME()%></td>
				</tr>
				<tr>
					<th>자격증기관명</th>
					<td><%=ap.getCERTIFICATION_NAME()%></td>
				</tr>
				<tr>
					<th>자격증 발급일</th>
					<td>
					<% if(ap.getDATE_OF_ACQUISITION()!=null){ %>
						<%=ap.getDATE_OF_ACQUISITION().substring(0, 11)%>
					<% } else { %>
						<p>발급일이 없습니다</p>
					<% } %>
					</td>
				</tr>
				<tr>
					<th>자격증 만료일</th>
					<td><%=ap.getEXPIRATION_DATE()!=null?ap.getEXPIRATION_DATE():"만료일자없음"%></td>
				</tr>
				<tr class="photo">
					<th>자격증 사진</th>
					<td>
						<%if(ap.getCERTIFICATE_FILENAME()!=null){ %>
							<img alt="" src="<%=request.getContextPath()%>/upload/sitter/<%=ap.getCERTIFICATE_FILENAME()%>"
								widht="100%" height="100%">
						<% } else { %>
							<p>사진이 없습니다.</p>
						<% } %>
					</td>
				</tr>
			<% }
			}%>
		<% if(u!=null) { %>
			<tr>
				<th>아이디</th>
				<td><%=u.getUserId()%></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=u.getUserName()%></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><%=u.getUserBirth()%></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><%=u.getPhone()%></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><%=u.getZipCode()%></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%=u.getAddress()%></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><%=u.getDetAddress()%></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><%=u.getEnrollDate().substring(0, 11) %></td>
			</tr>
		<% } %>
	</table>
	<button onclick="closePage();">확인</button>
</body>
<style>
	body{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
	table{
		display:flex;
		flex-direction:column;
		text-align:center;
	}
	table tr{
		board:1px solid black;
	}
	table th{
		background-color:lightgray;
	}
	table td{
		background-color:white;
	}
	table th, table td{
		width:160px;
		height:40px;
	}
	table td>textarea{
		resize:none
	}
	tr.photo{
		width:160px;
		height:160px;
	}
</style>
<script>
	function closePage(){
		window.close();
	}
</script>
</html>





