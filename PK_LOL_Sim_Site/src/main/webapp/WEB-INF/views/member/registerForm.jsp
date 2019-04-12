<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function backToLastFnc(){
		location.href = "login.hm";		
	}
</script>
<title>회원가입</title>
</head>
<body>

	<h1>회원가입</h1>
	<form action="./registerCtr.do" method="post"
		enctype="multipart/form-data">
		ID: <input type="text" name='name' 
			 placeholder="ID를 입력하세요"><br>
		비밀번호: <input type="password" name='password' 
				placeholder="비밀번호를 입력하세요"><br>
		비밀번호 확인: <input type="password" name='passwordConfirm' 
					placeholder="비밀번호를 다시 입력하세요"><br>
					
		이메일: <input type="text" name="email" 
				placeholder="E-메일을 입력하세요"><br>
		
		<input type="submit" value="추가">
		<input type="button" value="돌아가기" onclick="backToLastFnc();">
	</form>


</body>
</html>