<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body align="center">

	<form action="<%=request.getContextPath() %>/sitter/AddCertificateEnd"  method="post" enctype="multipart/form-data">
	<p>자격증 명</p>
	<input type="text" name="certificateName">
	<p>인증 기관</p>
	<input type="text" name="certificationName">
	<p>취득 일시</p>
	<input type="date" name="date">
	<p>만료 일시</p>
	<input type="radio" name="radio"  id="radio" onclick="onOff();">있음
	<input type="radio" name="radio"  id="radio1"  onclick="onOff();">없음
	<br>
	<input type="date" name="date1" id="date1">
	<p>이미지 첨부</p>
	<input type="file" name="file">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
		<button type="submit" onclick="close();">추가 요청</button>
	</form>
	
	<script>
		
		$("#date1").hide();
		function onOff() {
		if(document.getElementById("radio").checked==true) {
			$("#date1").show();
			
		}else if(document.getElementById("radio1").checked==true){
			$("#date1").hide();
			
		}
		}
		
		function close() { 
			window.close();
		}
	</script>
</body>
</html>