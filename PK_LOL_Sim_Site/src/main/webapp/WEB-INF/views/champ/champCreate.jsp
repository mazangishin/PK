<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function backtoListFnc() {
		var url = "/PK_LOL_Sim_Site/champ/champList.hm";
		location.href = url;
	}
	function nameCheck(name) {
		var validate = /^[a-zA-Z0-9가-힣\s]{1,12}$/;
		
		if (name == "" || name == undefined) {
			document.getElementById("nameCheck").innerHTML = "이름을 입력해주세요.";
			return false;
		}
		
		if (!validate.test(name)) {
			document.getElementById("nameCheck").innerHTML = "이름은 1글자 이상 12글자 이하여야 합니다.";
			document.getElementById("name").select();
		    return false;
		} else {
			document.getElementById("nameCheck").innerHTML = "이름 체크 완료";
		}
	}
	function nicknameCheck(nickname) {
		var validate = /^[a-zA-Z0-9가-힣\s]{1,12}$/;
		
		if (nickname == "" || nickname == undefined) {
			document.getElementById("nicknameCheck").innerHTML = "별명을 입력해주세요.";
			return false;
		}
		
		if (!validate.test(nickname)) {
			document.getElementById("nicknameCheck").innerHTML = "별명은 1글자 이상 12글자 이하여야 합니다.";
			document.getElementById("nickname").select();
		    return false;
		} else {
			document.getElementById("nicknameCheck").innerHTML = "별명 체크 완료";
		}
	}
	function hpCheck(hp) {
		if (hp == "" || hp == undefined) {
			document.getElementById("hpCheck").innerHTML = "hp를 입력해주세요.";
			return false;
		}
		
		if(isNaN(hp)){
			document.getElementById("hpCheck").innerHTML = "숫자만 입력 가능합니다.";
			document.getElementById("hp").select();
			return false;
		} else {
			document.getElementById("hpCheck").innerHTML = "hp 체크 완료";
		}
	}
	function mpCheck(mp) {
		if (mp == "" || mp == undefined) {
			document.getElementById("mpCheck").innerHTML = "mp를 입력해주세요.";
			return false;
		}
		
		if(isNaN(mp)){
			document.getElementById("mpCheck").innerHTML = "숫자만 입력 가능합니다.";
			document.getElementById("mp").select();
			return false;
		} else {
			document.getElementById("mpCheck").innerHTML = "mp 체크 완료";
		}
	}
	function adCheck(ad) {
		if (ad == "" || ad == undefined) {
			document.getElementById("adCheck").innerHTML = "ad를 입력해주세요.";
			return false;
		}
		
		if(isNaN(ad)){
			document.getElementById("adCheck").innerHTML = "숫자만 입력 가능합니다.";
			document.getElementById("ad").select();
			return false;
		} else {
			document.getElementById("adCheck").innerHTML = "ad 체크 완료";
		}
	}
	function apCheck(ap) {
		if (ap == "" || ap == undefined) {
			document.getElementById("apCheck").innerHTML = "ap를 입력해주세요.";
			return false;
		}
		
		if(isNaN(ap)){
			document.getElementById("apCheck").innerHTML = "숫자만 입력 가능합니다.";
			document.getElementById("ap").select();
			return false;
		} else {
			document.getElementById("apCheck").innerHTML = "ap 체크 완료";
		}
	}
	
	function validationCheckFnc() {
		
		var nameHTML = document.getElementById("nameCheck").innerHTML;
		var nicknameHTML = document.getElementById("nicknamecheck").innerHTML;
		var hpHTML = document.getElementById("hpCheck").innerHTML;
		var mpHTML = document.getElementById("mpCheck").innerHTML;
		var adHTML = document.getElementById("adCheck").innerHTML;
		var apHTML = document.getElementById("apCheck").innerHTML;
		
		var nameComplete = "이름 체크 완료";
		var nicknameComplete = "별명 체크 완료";
		var hpComplete = "hp 체크 완료";
		var mpComplete = "mp 체크 완료";
		var adComplete = "ad 체크 완료";
		var apComplete = "ap 체크 완료";
		
		if (idHTML == idcomplete && passwordHTML == passwordcomplete 
				&& pwdCfHTML == pwdCfcomplete && emailHTML == emailcomplete) {
			document.getElementById("champCreate").submit();
		}
	}
</script>
<title>챔피언 등록</title>
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
	#menu li {
		display:inline-block;
		width: 150px;
	}
  	#menu li a {
  		text-decoration:none; 
  		color: #EDBB6A;  
  		padding: 41px 20px; 
  		display:block;
  	}
   	#menu{
      position:fixed; 
      z-index: 500;
      top:0; 
      left:0; 
      width: 200px; 
      height: 100%;
      padding: 0; 
      margin: 0 auto;
      background-image:url(/PK_LOL_Sim_Site/resources/images/l_menu_img.png); 
      text-align: center; 
      overflow: hidden;      
   	}
   	#menu li:hover {
   		background: rgba(255,255,255, 0.2);
   	}
   	#menu>.act {
   		background:rgba(255,255,255, 0.1);
   	}
   	#menu>.act>a:hover {
   		color:black;
   	}
   	#menu>.act>a {
   		color:white;
   	}
    #logo{
      position:fixed; 
      z-index: 550;
      top:15px; 
      left:15px; 
      width: 220px; 
      height: 200px;
      padding: 0; 
      margin: 0 auto;
   	}
	#container {
		position:absolute;
		top:50%;
		left:50%;
		transform: translate(-50%, -50%);
		width: 500px;
		padding: 10px;
		background: #353535;
		text-align: center;
		color: #F7EA6E;
	}
	table tr td {
		text-align: center;
	}
	.normalwidth {
		float: left;	
		width: 225px;
		border: 2px solid #F7EA6E;
		background: #595959;
		display: block;
		text-align: center;
		height: 30px;
		outline: none;
		color: white;
		border-radius: 24px;
		transition: 0.25s; 
	}
	.longwidth {
		float: left;	
		width: 450px;
		border: 2px solid #F7EA6E;
		background: #595959;
		display: block;
		text-align: center;
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
	.validateResult {
		height: 30px;
		width: 225px;
		color: #AAFFA3;
	}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/PageHeader.jsp" />

	<div id="logo">
   		<a href="/PK_LOL_Sim_Site/mainPage.hm#firstPage"><img src="/PK_LOL_Sim_Site/resources/images/logo.png" width="80%"></a><br>
   	</div>

	<div>
		<ul id="menu">
		   <br><br><br><br><br><br><br><br><br><br>
		   <li id=first_m><b><a href="/PK_LOL_Sim_Site/mainPage.hm#firstPage">HOME</a></b></li><br>
		   <li><b><a href="/PK_LOL_Sim_Site/mainPage.hm#secondPage">11111</a></b></li><br>
		   <li><b><a href="/PK_LOL_Sim_Site/mainPage.hm#3rdPage">챔피언 리스트</a></b></li><br>
		   <li><b><a href="/PK_LOL_Sim_Site/mainPage.hm#4thpage">자유 게시판</a></b></li><br>
		</ul>
	</div>
	
	<div id="container">
		<form id="champCreate" action="champVoSave.hm" method="post"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>
					<input class="normalwidth" type="text" name="championName" 
					placeholder="챔피언의 이름을 입력해주세요" id="name" 
					onblur="nameCheck(this.value)">
				</td>
				
				<td>
					<input class="normalwidth" type="text" name="championNick" 
					placeholder="챔피언의 별명을 입력해주세요" id="nickname"
					onblur="nicknameCheck(this.value)">
				</td>
			</tr>
			<tr>
				<td>
					<span class="validateResult" id="nameCheck"></span>
				</td>
				<td>
					<span class="validateResult" id="nicknameCheck"></span>
				</td>
			</tr>
			<tr>
				<td>			
					<select id="positionOption" class="normalwidth" name="position"
					dir="rtl">
						<option value="top">탑</option> 
						<option value="jungle">정글</option>
						<option value="mid">미드</option>
						<option value="carry">원딜</option>
						<option value="support">서폿</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<input class="normalwidth" type="text" name="hp" id="hp"
				 	placeholder="챔피언의 기본 hp를 설정해주세요" onblur="hpCheck(this.value)">
				</td>
				<td>
					<input class="normalwidth" type="text" name="mp" id="mp"
					placeholder="챔피언의 기본 mp를 설정해주세요" onblur="mpCheck(this.value)">
				</td>
			</tr>
			<tr>
				<td>
					<span class="validateResult" id="hpCheck"></span>
				</td>
				<td>
					<span class="validateResult" id="mpCheck"></span>
				</td>
			</tr>
			<tr>
				<td>
					<input class="normalwidth" type="text" name="ad" id="ad"
					placeholder="챔피언의 기본 ad를 설정해주세요" onblur="adCheck(this.value)">
				</td>
				<td>
					<input class="normalwidth" type="text" name="ap" id="ap"
					placeholder="챔피언의 기본 ap를 설정해주세요" onblur="apCheck(this.value)">
				</td>
			</tr>
			<tr>
				<td>
					<span class="validateResult" id="adCheck"></span>
				</td>
				<td>
					<span class="validateResult" id="apCheck"></span>
				</td>
			</tr>
		</table>
		<input type="submit" class="inputButton" value="생성">
		<input type="button" class="inputButton" value="돌아가기" onclick="backtoListFnc();">
	</form>
	</div>

	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</html>
</body>
</html>