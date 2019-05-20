<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<title>챔피언 레벨별 정보 입력</title>

<script type="text/javascript">
		function goToBackFnc() {
			var url = "/PK_LOL_Sim_Site/champ/champList.hm";
			location.href = url;
		}
		function createTableFnc() {
			
			var level = parseInt(document.getElementById('championLevel').value);
			var hp = parseInt(document.getElementById('hp').value);
			var mp = parseInt(document.getElementById('mp').value);
			var ad = parseInt(document.getElementById('ad').value);
			var ap = parseInt(document.getElementById('ap').value);
			
			var hpGrowth = parseInt(document.getElementById('hpGrowth').value);
			var mpGrowth = parseInt(document.getElementById('mpGrowth').value);
			var adGrowth = parseInt( document.getElementById('adGrowth').value);
			var apGrowth = parseInt(document.getElementById('apGrowth').value);
			
			var htmlStr = "";
			
			for (var i = 0; i <= 17; i++) {

				htmlStr += "<tbody>";
				htmlStr += "<tr>";
				htmlStr += "<td class='label'>";
				htmlStr += "<span>" + (level+(i)) + "</span>";
				htmlStr += "</td>";
				htmlStr += "<td class='label'>";
				htmlStr += "<span>" + (hp+(hpGrowth*i)) + "</span>";
				htmlStr += "</td>";
				htmlStr += "<td class='label'>";
				htmlStr += "<span>" + (mp+(mpGrowth*i)) + "</span>";
				htmlStr += "</td>";
				htmlStr += "<td class='label'>";
				htmlStr += "<span>" + (ad+(adGrowth*i)) + "</span>";
				htmlStr += "</td>";
				htmlStr += "<td class='label'>";
				htmlStr += "<span>" + (ap+(apGrowth*i)) + "</span>";
				htmlStr += "</td>";
				htmlStr += "</tr>";
				htmlStr += "</tbody>";
				
				document.getElementById('statusTable').innerHTML = htmlStr;	
			}
		}
		function hpGrowthCheck(hpGrowth) {
			if (hpGrowth == "" || hpGrowth == undefined) {
				document.getElementById("hpGrowthCheck").innerHTML = "hpGrowth를 입력해주세요.";
				return false;
			}
			
			if(isNaN(hpGrowth)){
				document.getElementById("hpGrowthCheck").innerHTML = "숫자만 입력 가능합니다.";
				document.getElementById("hpGrowth").select();
				return false;
			} else {
				document.getElementById("hpGrowthCheck").innerHTML = "hpGrowth 체크 완료";
			}
		}
		function mpGrowthCheck(mpGrowth) {
			if (mpGrowth == "" || mpGrowth == undefined) {
				document.getElementById("mpGrowthCheck").innerHTML = "mpGrowth를 입력해주세요.";
				return false;
			}
			
			if(isNaN(mpGrowth)){
				document.getElementById("mpGrowthCheck").innerHTML = "숫자만 입력 가능합니다.";
				document.getElementById("mpGrowth").select();
				return false;
			} else {
				document.getElementById("mpGrowthCheck").innerHTML = "mpGrowth 체크 완료";
			}
		}
		function adGrowthCheck(adGrowth) {
			if (adGrowth == "" || adGrowth == undefined) {
				document.getElementById("adGrowthCheck").innerHTML = "adGrowth를 입력해주세요.";
				return false;
			}
			
			if(isNaN(adGrowth)){
				document.getElementById("adGrowthCheck").innerHTML = "숫자만 입력 가능합니다.";
				document.getElementById("adGrowth").select();
				return false;
			} else {
				document.getElementById("adGrowthCheck").innerHTML = "adGrowth 체크 완료";
			}
		}
		function apGrowthCheck(apGrowth) {
			if (apGrowth == "" || apGrowth == undefined) {
				document.getElementById("apGrowthCheck").innerHTML = "apGrowth를 입력해주세요.";
				return false;
			}
			
			if(isNaN(apGrowth)){
				document.getElementById("apGrowthCheck").innerHTML = "숫자만 입력 가능합니다.";
				document.getElementById("apGrowth").select();
				return false;
			} else {
				document.getElementById("apGrowthCheck").innerHTML = "apGrowth 체크 완료";
			}
		}
		function fileCheck(file) {
			if (file == null) {
				document.getElementById("fileCheck").innerHTML = "파일을 선택해주세요.";
				return false;
			} else if(file != null) {
				document.getElementById("fileCheck").innerHTML = "파일 체크 완료";
			}
			
		}
		
		function validationCheckFnc() {
			
			var hpHTML = document.getElementById("hpGrowthCheck").innerHTML;
			var mpHTML = document.getElementById("mpGrowthCheck").innerHTML;
			var adHTML = document.getElementById("adGrowthCheck").innerHTML;
			var apHTML = document.getElementById("apGrowthCheck").innerHTML;
			var fileHTML = document.getElementById("fileCheck").innerHTML;
			
			var hpComplete = "hpGrowth 체크 완료";
			var mpComplete = "mpGrowth 체크 완료";
			var adComplete = "adGrowth 체크 완료";
			var apComplete = "apGrowth 체크 완료";
			var fileComplete = "파일 체크 완료";
			
			if (hpHTML == hpComplete && mpHTML == mpComplete && adHTML == adComplete
				&& apHTML == apComplete && fileHTML == fileComplete) {
				document.getElementById("champCreate").submit();
			}
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
	ul li {
		list-style: none;
	}
	#container {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		width: 900px;
		padding: 40px;
		background: #353535;
		text-align: center;
		color: #F7EA6E;
	}
	#controlBox {
		float: left;
		color: #F7EA6E;
	}
	#tableBox {
		float: right;
		padding: 10px;
		margin: 20px 20px 20px 20px;
		border: 4px solid #F7EA6E;
	}
	.status {
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
	.status:focus {
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
	#tableBox table {
		whidth: 350px;
	}
	#headTable tr td{
		width: 70px;
		text-align: center;
	}
	#statusTable tr td {
		width: 70px;
		text-align: center;
		opacity: 1.0;
	}
	.label:nth-child(odd) {
		border: 2px solid #E3C4FF;
		text-align: center;
		color: white;
	}
	.label:nth-child(even) {
		border: 2px solid #F7EA6E;
		text-align: center;
		color: white;
	}
	.longwidth {
		float: left;	
		width: 300px;
		border: 2px solid #F7EA6E;
		background: #595959;
		display: block;
		text-align: center;
		margin: 15px auto;
		height: 30px;
		outline: none;
		color: white;
		border-radius: 24px;
		transition: 0.25s; 
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
		   <li><b><a href="/PK_LOL_Sim_Site/mainPage.hm#secondPage">게임 소개</a></b></li><br>
		   <li><b><a href="/PK_LOL_Sim_Site/mainPage.hm#3rdPage">챔피언 리스트</a></b></li><br>
		   <li><b><a href="/PK_LOL_Sim_Site/mainPage.hm#4thpage">자유 게시판</a></b></li><br>
		</ul>
</div>

<div id="container">

	<div id="controlBox">
		<form id="champCreate" action="champCreateCtr.hm" method="post"
		enctype="multipart/form-data">
			<ul>
				<li>
					<input type="hidden" class="status" id="championNumber" 
					name="championNumber" value="${champVo.championNumber}">
				</li>
				<li>
					<input type="hidden" class="status" id="championName" 
					name="championName" value="${champVo.championName}">
				</li>
				<li>
					<input type="hidden" class="status" id="championNick" 
					name="championNick" value="${champVo.championNick}">
				</li>
				<li>
					<input type="hidden" class="status" id="position" 
					name="position" value="${champVo.position}">
				</li>
				<li>
					<input type="hidden" class="status" id="championNumber" 
					name="championNumber" value="${champVo.championNumber}">
				</li>
				<li>
					<input type="hidden" class="status" id="championLevel"
					name="championLevel" value="1">
				</li>
				<li>
					<input type="hidden" class="status" id="hp" name="hp"
					value="${champVo.hp}">
				</li>
				<li>
					<input type="hidden" class="status" id="mp" name="mp"
					value="${champVo.mp}">
				</li>
				<li>
					<input type="hidden" class="status" id="ad" name="ad"
					value="${champVo.ad}">
				</li>
				<li>
					<input type="hidden" class="status" id="ap" name="ap"
					value="${champVo.ap}">
				</li>
				<li>
					<input type="text" class="status" id="hpGrowth" name="hpGrowth" 
					placeholder="hp 성장치를 입력해주세요" onblur="hpGrowthCheck(this.value);">
				</li>
				<li>
					<span class="validateResult" id="hpGrowthCheck"></span>
				</li>
				<li>
					<input type="text" class="status" id="mpGrowth" name="mpGrowth" 
					placeholder="mp 성장치를 입력해주세요" onblur="mpGrowthCheck(this.value);">
				</li>
				<li>
					<span class="validateResult" id="mpGrowthCheck"></span>
				</li>
				<li>
					<input type="text" class="status" id="adGrowth" name="adGrowth" 
					placeholder="ad 성장치를 입력해주세요" onblur="adGrowthCheck(this.value);">
				</li>
				<li>
					<span class="validateResult" id="adGrowthCheck"></span>
				</li>
				<li>
					<input type="text" class="status" id="apGrowth" name="apGrowth" 
					placeholder="ap 성장치를 입력해주세요" onblur="apGrowthCheck(this.value);">
				</li>
				<li>
					<span class="validateResult" id="apGrowthCheck"></span>
				</li>
				<li>
					<input class="longwidth" type="file" name="original_file_name" 
					placeholder="챔피언의 이미지를 올려주세요" id="file" 
					onblur="fileCheck(this.value);">
				</li>
				<li>
					<span class="validateResult" id="fileCheck"></span>
				</li>
				<li>
					<input type="button" class="inputButton" value="반영" 
					onclick="createTableFnc();">
				</li>
				<li>
					<input type="reset" class="inputButton" value="취소">
				</li>
				<li>
					<input type="button" class="inputButton" value="저장"
					onclick="validationCheckFnc();">
				</li>
				<li>
					<input type="button" class="inputButton" value="리스트로"
					onclick="goToBackFnc();">
				</li>
			</ul>
		</form>
	</div>
	<div id="tableBox">
		<table id="headTable">
			<tr>
				<td class="label">
					<span>레벨</span>
				</td>
				<td class="label">
					<span>hp</span>
				</td>
				<td class="label">
					<span>mp</span>
				</td>
				<td class="label">
					<span>ad</span>
				</td>
				<td class="label">
					<span>ap</span>
				</td>
			</tr>
		</table>
		<table id="statusTable">
		
		</table>
	</div>
</div>	

<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>