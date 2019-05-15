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
	function passwordCheck(password) {
		var validate = /^[a-zA-Z0-9]{4,12}$/;
		
		if (password == "" || password == undefined) {
			document.getElementById("pwdcheck").innerHTML = "비밀번호를 입력해주세요.";
		}
		
		if (!validate.test(password)) {
			document.getElementById("pwdcheck").innerHTML = "비밀번호는 4글자 이상 12글자 이하여야 합니다.";
			document.getElementById("password").select();
		    return false;
		} else {
			document.getElementById("pwdcheck").innerHTML = "비밀번호 체크 완료";
		} 
	}
	function emailCheck(email) {
		var validateEmail 
		=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			    
		if (email == '' || email == 'undefined') {
	    	document.getElementById("emailCheck").innerHTML = "email을 입력해주세요.";
	    	return false;
	    }

		if(!validateEmail.test(email)) {
			document.getElementById("emailCheck").innerHTML = "올바른 email 형식이 아닙니다.";
			document.getElementById("email").select();
		    return false;
		}
		else {
			document.getElementById("emailCheck").innerHTML = "올바른 email 형식";
		}
	}
	function validationCheckFnc() {
		
		var passwordHTML = document.getElementById("pwdcheck").innerHTML;
		var emailHTML = document.getElementById("emailCheck").innerHTML;
		
		var passwordcomplete = "비밀번호 체크 완료";
		var emailcomplete = "올바른 email 형식";
		
		if (passwordHTML == passwordcomplete && emailHTML == emailcomplete) {
			document.getElementById("update").submit();
		}
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
	.validateResult {
		color: #AAFFA3;
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
			<form id="update" action="memberUpdateCtr.hm" method="post">
				<div>
					<input type="hidden" name="memberNumber" 
					value="${memberVo.memberNumber}"/>
				</div>
				<div>
					<span>ID</span>
				</div>
				<div>
					<input type="text" name="memberId" class="inputArea"
					value="${memberVo.memberId}" readonly="readonly">
				</div>
				<div>
					<span>비밀번호</span>
				</div>
				<div>
					<input type="text" name="password" class="inputArea"
					value="${memberVo.password}" onblur="passwordCheck(this.value)">		
				</div>
				<div>
					<span class="validteResult" id="pwdcheck"></span>
				</div>
			 	<div>
					<span>E-메일</span>
			 	</div>
				<div>
					<input type="text" name="email" class="inputArea"
					value="${memberVo.email}" onblur="emailCheck(this.value)">
				</div>
				<div>
					<span class="validteResult" id="emailCheck"></span>
				</div>
				<div>
					<span>가입일</span>
				</div>
				<div>
					<span class="inputArea">
					 	<fmt:formatDate value="${memberVo.createDate}"/>
					 </span>
				</div>
				<div>
					<span>최종수정일</span>
				</div>
				<div>
					<span class="inputArea">
					 	<fmt:formatDate value="${memberVo.modifiedDate}"/>
					 </span>
				</div>
				<div>
					<input type="button" value="수정" class="inputButton"
					onclick="validationCheckFnc();">	
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