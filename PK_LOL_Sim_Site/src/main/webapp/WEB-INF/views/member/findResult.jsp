<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		width: 600px;
		padding: 40px;
		background: #353535;
		text-align: center;
		color: #F7EA6E;
	}
	ul li {
		list-style: none;
		display: none;
	}
	#findId {
		float: left;
		width: 300px;
		padding: 40px;
		background: #353535;
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
		background: #353535;
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
<title>찾은 결과</title>
</head>
<body>
	<div id="container">
		<ul>
			<li>
				<c:catch var="exception">${memberId}</c:catch>
			</li>
			<li>
				<c:catch var="exception">${memberPassword}</c:catch>
			</li>
		</ul>
		
		<c:if test="${memberId != null && memberPassword == null}">
			<h2>검색 결과</h2>
			<form id="result">
				<span class="">ID</span>
				<input type="text" class="inputText" value="${memberId}">
			</form>
		</c:if>
		<c:if test="${memberPassword != null}">
			<h2>검색 결과</h2>
			<form id="result">
				<span>ID</span>
				<input type="text" class="inputText" value="${memberId}">
				<span>PASSWORD</span>
				<input type="text" class="inputText" value="${memberPassword}">
			</form>	
		</c:if>
		<c:if test="${memberId == null && memberPassword == null}">
			<h2>검색 결과가 없습니다</h2>
		</c:if>
		<div>
			<input type="button" class="inputButton" value="돌아가기" onclick="goBackFnc();"> 
		</div>
	</div>
	
</body>
</html>