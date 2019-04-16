<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<script type="text/javascript">
	function memberUpdateFnc() {
		location.href = "/member/memberUpdateCtr.hm";
	}
	function pageMoveListFnc() {
		location.href = "/mainpage.hm"
	}
	function withdrawalFnc() {
		location.href = "/member/memberDelete.hm";
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
</head>
<body>
	
	<div id="box">
		<h1>회원정보</h1>
		<form action="/member/memberInfo.hm" method="get">
		<input type="hidden" name='no' class="inputArea"
			value='${sessionScope.memberVo.memberNumber}'>
		ID: <input type="text" name='id' readonly="readonly" class="inputArea"
				id='memberId' value='${memberVo.memberId}'><br>
		이메일: <input type="text" name="eMail" class="inputArea"
				value='${sessionScope.memberVo.eMail}'><br>
		가입일: <fmt:formatDate value="${sessionScope.memberVo.createDate}"
				class="inputArea" pattern="yyyy-MM-dd" /><br>
		최종수정일: <fmt:formatDate value="${sessionScope.memberVo.modifiedDate}"
				class="inputArea" pattern="yyyy-MM-dd" /><br>
		<c:set var="authority" value="${sessionScope.memberVo.authority}"/>
		<c:if test="authority == y">관리자입니다.</c:if>
		
		<input type="submit" value="수정하기" class="inputButton"
			onclick="memberUpdateFnc();">
		<input type="button" value="회원탈퇴" class="inputButton" 
			onclick="withdrawalFnc();">
		<input type="button" value="돌아가기" class="inputButton" 
			onclick="pageMoveListFnc();">	
	</form>
	</div>

</body>
</html>