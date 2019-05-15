<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
	function backToLastFnc(){
		location.href = "/PK_LOL_Sim_Site/member/login.hm";		
	}
	function idCheck(id) {
		var validate = /^[a-zA-Z0-9]{4,12}$/;
		
		if (id == "" || id == undefined) {
			document.getElementById("idCheck").innerHTML = "id를 입력해주세요.";
			return false;
		}
		
		if (!validate.test(id)) {
			document.getElementById("idCheck").innerHTML = "id는 4글자 이상 12글자 이하여야 합니다.";
			document.getElementById("id").select();
		    return false;
		} else {
			document.getElementById("idCheck").innerHTML = "id 체크 완료";
		}
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
	function pwdCfCheck(passwordConfirm) {
		var password = document.getElementById("password").value;
		
		if (passwordConfirm == "" || passwordConfirm == undefined) {
			document.getElementById("pwdVerification").innerHTML = "비밀번호를 확인해주세요";
			return false;
		}
		
		if (password != passwordConfirm) {
			document.getElementById("pwdVerification").innerHTML = "비밀번호와 일치하지 않습니다.";
			document.getElementById("passwordConfirm").select();
		} else {
			document.getElementById("pwdVerification").innerHTML = "일치 확인";
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
		
		var idHTML = document.getElementById("idCheck").innerHTML;
		var passwordHTML = document.getElementById("pwdcheck").innerHTML;
		var pwdCfHTML = document.getElementById("pwdVerification").innerHTML;
		var emailHTML = document.getElementById("emailCheck").innerHTML;
		
		var idcomplete = "id 체크 완료";
		var passwordcomplete = "비밀번호 체크 완료";
		var pwdCfcomplete = "일치 확인";
		var emailcomplete = "올바른 email 형식";
		
		if (idHTML == idcomplete && passwordHTML == passwordcomplete 
				&& pwdCfHTML == pwdCfcomplete && emailHTML == emailcomplete) {
			document.getElementById("register").submit();
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
	.validation {
		color: #AAFFA3;
	}
</style>	
<title>회원가입</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/PageHeader.jsp" />

	<div id="box">
		<div>
			<h1>회원가입</h1>
		</div>
		<div>
			<form id="register" action="registerCtr.hm" method="post" 
			enctype="multipart/form-data">
				<div>
					<input type="hidden" name="authority" value="n">
				</div>
				<div>
					<span>ID</span>
				</div>
				<div>
					<input type="text" id="id" name='memberId' class="inputArea"
					placeholder="ID를 입력하세요" onblur="idCheck(this.value)">
				</div>
				<div class="validation">
					<span id="idCheck"></span>
				</div>
				<div>
					<span>비밀번호</span>
				</div>
				<div>
					<input type="password" id="password" name='password' class="inputArea"
					placeholder="비밀번호를 입력하세요" onblur="passwordCheck(this.value)">
				</div>
				<div class="validation">
					<span id="pwdcheck"></span>
				</div>
				<div>
					<span>비밀번호 확인</span>
				</div>
				<div>
					<input type="password" id="passwordConfirm" name='passwordConfirm' 
					class="inputArea" placeholder="비밀번호를 다시 입력하세요"
					onblur="pwdCfCheck(this.value)">
				</div>
				<div class="validation">
					<span id="pwdVerification"></span>
				</div>
				<div>
					<span>이메일</span>
				</div>
				<div>
					<input type="text" id="email" name="email" class="inputArea"
					placeholder="E-메일을 입력하세요" onblur="emailCheck(this.value)">
				</div>
				<div class="validation">
					<span id="emailCheck"></span>
				</div>
				<div>
					<input type="button" id="submitButton" class="inputButton"
					value="회원가입" onclick="validationCheckFnc();">
				</div>
				<div>
					<input type="button" class="inputButton" value="돌아가기"
					onclick="backToLastFnc();">
				</div>
			</form> 
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>