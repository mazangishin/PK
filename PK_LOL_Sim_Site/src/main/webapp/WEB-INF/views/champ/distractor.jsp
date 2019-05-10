<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function goToMainPageFnc() {
		var url = "/PK_LOL_Sim_Site/champ/champList.hm";
		
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
	}
	.inputButton {
		border: 2px solid #B778FF;
		background: none;
		display: block;
		margin: 15px auto;
		text-align: center;
		width: 220px;
		height: 40px;
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
			<form id="championLevelUpdate" action="./champLevelUpdate.hm" method="get">
				<ul>
					<li>
						<input type="hidden" id="championNumber" name="championNumber" 
						value="${champVo.championNumber}">
					</li>
					<li>
						<input type="hidden" id="championName" name="championName" 
						value="${champVo.championName}">
					</li>
					<li>
						<input type="hidden" id="championNick" name="championNick" 
						value="${champVo.championNick}">
					</li>
					<li>
						<input type="hidden" id="position" name="position" 
						value="${champVo.position}">
					</li>
					<li>
						<input type="hidden" id="hp" name="hp" value="${champVo.hp}">
					</li>
					<li>
						<input type="hidden" id="mp" name="mp" value="${champVo.mp}">
					</li>
					<li>
						<input type="hidden" id="ad" name="ad" value="${champVo.ad}">
					</li>
					<li>
						<input type="hidden" id="ap" name="ap" value="${champVo.ap}">
					</li>
				</ul>
					<input type="submit" class="inputButton" value="레벨 별 정보 수정 페이지로">
			</form>
			<form>
				<input class="inputButton" value="챔피언 리스트로" onclick="goToListPageFnc();">
			</form>
		</div>
	</div>
	
</body>
</html>