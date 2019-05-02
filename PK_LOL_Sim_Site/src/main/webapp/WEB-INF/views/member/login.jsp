<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function goToRegisterFnc() {
		location.href="/PK_LOL_Sim_Site/member/register.hm";		
	}
</script>
<style type="text/css">
	body {
		background-image: linear-gradient(rgba(0,0,0,0.1), rgba(0,0,0,0.1)), 
						url(/PK_LOL_Sim_Site/resources/images/kda.jpg);
		background-repeat: no-repeat;
		background-size: cover;
		padding: 0px;
		height: 100vh;
		width: 100vw;
		font-family: sans-serif;
		opacity: 0.8;
	}
	#loginBox {
		position:absolute;
		top:50%;
		left:50%;
		transform: translate(-50%, -50%);
		width: 300px;
		padding: 40px;
		background: #353535;
		text-align: center;
		color: #F7EA6E;
	}
	#loginBox h1 {
		color: #F7EA6E;
	}
	.inputButton {
		border: 2px solid #F7EA6E;
		background: none;
		display: block;
		margin: 20px auto;
		text-align: center;
		width: 200px;
		height: 30px;
		outline: none;
		color: white;
		border-radius: 24px;
		transition: 0.25s;
	}	
	.inputButton:focus {
		width: 250px;
		border-color: #EDD200;
	}
	.loginButton {
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
	.loginButton:hover {
		background: #B778FF;
	}
	.register {
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
	.register:hover {
		background: #B778FF;
	}
</style>
<title>환영합니다.</title>
</head>
<body>
	<div id="loginBox">
		<form action="loginCtr.hm" method="post">
			<h1>Login Plz</h1>
			ID <input type="text" class="inputButton" name="memberId">
			PW <input type="password" class="inputButton" name="password">
			<input type="submit" class="loginButton" value="로그인">
			<input type="reset" class="loginButton" value="취소">
			<input type="button" class="register" value="회원가입"
				onclick="goToRegisterFnc();">
		</form>
	</div>
</body>
</html>