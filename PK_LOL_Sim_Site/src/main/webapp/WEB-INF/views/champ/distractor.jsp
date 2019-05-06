<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript">
	function goToUpdateFnc() {
		var url = "/PK_LOL_Sim_Site/champ/champLevelUpdate.hm";
		
		location.href = url;		
	}
	function goToMainPageFnc() {
		var url = "/PK_LOL_Sim_Site/mainPage.hm";
		
		location.href = url;
		
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
	ul li {
		list-style: none;
	}
	#container {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		width: 400px;
		padding: 40px;
		background: #353535;
		text-align: center;
		color: #F7EA6E;
	}
	#choiceBox {
		padding: 10px;
		margin: 20px 20px 20px 20px;
		border: 4px solid #F7EA6E;
	}
	.inputButton {
		border: 2px solid #B778FF;
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
		cursor: pointer;
	}
	.inputButton:hover {
		background: #B778FF;
	}
</style>
<title>다음 작업을 선택해주십시오.</title>
</head>
<body>

	<div id="container">
		<div id="textArea">
			<h1>
				다음 작업을 선택해주십시오.
			</h1>
		</div>
		<div id="choiceBox">
			<ul>
				<li>
					<input class="inputButton" value="레벨 별 정보 수정 페이지로 넘어가기"
					onclick="goToUpdateFnc();">
				</li>
				<li>
					<input class="inputButton" value="메인 페이지로 넘어가기"
					onclick="goToMainPageFnc();">
				</li>
			</ul>
		</div>
	</div>
	
</body>
</html>