<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function backToPrePageFnc() {
		location.href = "/PK_LOL_Sim_Site/member/memberInfo.hm";		
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
	#container {
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
	#title {
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
<title>회원 정보 수정</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/PageHeader.jsp" />

	<div id="container">
		<div id="title">
			<h1>회원 정보</h1>
		</div>
		<div>
			<form action="memberUpdateCtr.hm" method="post">
				<div>
					<input type="hidden" name="memberNumber" 
					value="${memberVo.memberNumber}"/>
				</div>
				<div>
					ID :
				</div>
				<div>
					<input type="text" name="memberId" class="inputArea"
					value="${memberVo.memberId}" readonly="readonly">
				</div>
				<div>
					비밀번호 :
				</div>
				<div>
					<input type="text" name="password" class="inputArea"
					value="${memberVo.password}">		
				</div>
			 	<div>
					E-메일 :
			 	</div>
				<div>
					<input type="text" name="email" class="inputArea"
					value="${memberVo.email}">
				</div>
				<div>
					<span>가입일 :</span>
				</div>
				<div>
					<span class="inputArea">
					 	<fmt:formatDate value="${memberVo.createDate}"/>
					 </span>
				</div>
				<div>
					<span>최종수정일 :</span>
				</div>
				<div>
					<span class="inputArea">
					 	<fmt:formatDate value="${memberVo.modifiedDate}"/>
					 </span>
				</div>
				<div>
					<input type="submit" value="수정" class="inputButton">	
				</div>
				<div>
					<input type="button" value="돌아가기" class="inputButton"
					onclick="backToPrePageFnc();">
				</div>
		</form>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>