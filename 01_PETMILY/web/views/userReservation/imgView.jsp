<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="com.petmily.petsitter.model.vo.PetSitterCertificate,java.util.List"%>
    <%
    List<PetSitterCertificate> list = (List)request.getAttribute("pc");
    String img = request.getParameter("img");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(img==null) {%>
	<p>등록 된 이미지가 없습니다.</p>
	<%} else {%>
	<img style="width:500px;height:500px;"src="<%=request.getContextPath() %>/upload/board/<%=img%>">
	<%} %>
</body>
</html>