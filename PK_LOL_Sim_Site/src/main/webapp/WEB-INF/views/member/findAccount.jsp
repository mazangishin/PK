<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function goBackFnc() {
		location.href="/PK_LOL_Sim_Site/member/login.hm";
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
	#container {
		position:absolute;
		top:50%;
		left:50%;
		transform: translate(-50%, -50%);
		width: 800px;
		padding: 40px;
		background: #353535;
		text-align: center;
		color: #F7EA6E;
	}
	#findId {
		float: left;
		width: 300px;
		padding: 40px;
		text-align: center;
		color: #F7EA6E;
	}
	#findId h1 {
		color: #F7EA6E;
	}
	#findPassword {
		float: left;
		width: 300px;
		padding: 40px;
		text-align: center;
		color: #F7EA6E;
	}
	#findPassword h1 {
		color: #F7EA6E;
	}
	.inputText {
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
	.inputText:focus {
		width: 250px;
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
<title>계정 찾기</title>
</head>
<body>
	<div id="container">
		<div id="findId">
			<h1>ID 찾기</h1>
			<form action="./findId.hm" method="post">
				<input type="text" class="inputText" id="email" name="email" 
				placeholder="email을 입력해주세요">
				<input type="submit" class="inputButton" value="찾기">
			</form>
		</div>
		<div id="findPassword">
			<h1>비밀번호 찾기</h1>
			<form action="./findPassword.hm" method="post">
				<input type="text" class="inputText" id="id" name="id" placeholder="id를 입력해주세요">
				<input type="text" class="inputText" id="email" name="email" 
				placeholder="email을 입력해주세요">
				<input type="submit" class="inputButton" value="찾기">
			</form>
		</div>
		<div id="buttonBox">
			<form>
				<input type="button" class="inputButton" value="돌아가기"
				onclick="goBackFnc();">
			</form>
		</div>
	</div>
</body>
</html>