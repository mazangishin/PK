<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function backToLastFnc(){
		location.href = "/PK_LOL_Sim_Site/member/login.hm";		
	}
</script>

<style type="text/css">
	body {
		background-image: linear-gradient(rgba(0,0,0,0.1), rgba(0,0,0,0.1)), 
						url(/PK_LOL_Sim_Site/resources/images/kda.jpg);
		background-repeat: no-repeat;
		background-size: cover;
		margin: 0px;
		padding: 0px;
		height: 100vh;
		font-family: sans-serif;
		opacity: 0.8;
	}
	#box {
		position:absolute;
		top:50%;
		left:50%;
		transform: translate(-50%, -50%);
		width: 350px;
		height: 650px;
		padding: 15px 40px 15px 40px;
		background: #353535;
		text-align: center;
		color: #F7EA6E;
	}
	#box h1 {
		color: #F7EA6E;
	}
	.inputArea {
		border: 2px solid #F7EA6E;
		background: none;
		display: block;
		margin: 15px auto;
		text-align: center;
		width: 200px;
		height: 30px;
		outline: none;
		color: white;
		border-radius: 24px;
		transition: 0.25s;
	}	
	.inputArea:focus {
		width: 300px;
		border-color: #EDD200;
	}
	.inputButton {
		border: 2px solid #B778FF;
		background: none;
		display: block;
		margin: 15px auto;
		text-align: center;
		width: 100px;
		height: 30px;
		outline: none;
		color: white;
		border-radius: 24px;
		transition: 0.25s;
		cursor: pointer;
	}
	.inputButton:hover {
		background: #B778FF;
	}
</style>	
<title>회원가입</title>
</head>
<body>
	<div id="box">
		<h1>회원가입</h1>
		<form action="/registerCtr.do" method="post" enctype="multipart/form-data">
			ID: <input type="text" name='memberId' class="inputArea"
				 placeholder="ID를 입력하세요"><br>
			비밀번호: <input type="password" name='password' class="inputArea"
					placeholder="비밀번호를 입력하세요"><br>
			비밀번호 확인: <input type="password" name='passwordConfirm' 
					class="inputArea" placeholder="비밀번호를 다시 입력하세요"><br>
			이메일: <input type="text" name="eMail" class="inputArea"
					placeholder="E-메일을 입력하세요"><br>
			
			<input type="submit" class="inputButton" value="회원가입">
			<input type="button" class="inputButton" value="돌아가기"
				 onclick="backToLastFnc();">
		</form>
	</div>
</body>
</html>