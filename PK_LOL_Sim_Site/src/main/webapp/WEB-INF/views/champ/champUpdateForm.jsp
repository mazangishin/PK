<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<title>챔피언 수정 페이지</title>

<script type="text/javascript">
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
				
				document.getElementById('afterInputTable').innerHTML = htmlStr;	
			}
		}
		function goBackFnc() {
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
	#menu li {
		display:inline-block;
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
		width: 1200px;
		padding: 40px;
		background: #353535;
		text-align: center;
		color: #F7EA6E;
	}
	#before {
		float: left;
	}
	#after {
		float: left;
	}
	#controlBox {
		float: left;
		color: #F7EA6E;
		margin-right: 40px;
	}
	#tableBox {
		float: left;
		width: 400px;
		padding: 10px;
		margin: 20px 20px 20px 80px;
		border: 4px solid #F7EA6E;
	}
	.status {
		border: 2px solid #F7EA6E;
		background: none;
		display: block;
		margin: 10px auto;
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
		margin: 10px auto;
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
	.tableBox table {
		whidth: 350px;
	}
	.headTable tr td{
		width: 70px;
		text-align: center;
	}
	.statusTable tr td {
		width: 70px;
		text-align: center;
		opacity: 1.0;
	}
	.label:nth-child(odd) {
		text-size: smaller;
		border: 2px solid #E3C4FF;
		text-align: center;
		color: white;
	}
	.label:nth-child(even) {
		text-size: smaller;
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
		height: 30px;
		outline: none;
		color: white;
		border-radius: 24px;
		transition: 0.25s; 
	}
	ul li select option {
		color: black;
	}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/PageHeader.jsp" />

<div id="container">
	
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

	<div id="before">
		<div class="tableBox">
			<table class="headTable">
				<tr>
					<td class="label">
						<span>저장된 레벨</span>
					</td>
					<td class="label">
						<span>저장된 hp</span>
					</td>
					<td class="label">
						<span>저장된 mp</span>
					</td>
					<td class="label">
						<span>저장된 ad</span>
					</td>
					<td class="label">
						<span>저장된 ap</span>
					</td>
				</tr>
			</table>
			<table class="statusTable">
				<c:forEach var="champLevelVoList" items="${champLevelVoList}">
					<tr>
					<td class="label">
						<span>${champLevelVoList.championLevel}</span>
					</td>
					<td class="label">
						<span>${champLevelVoList.hp}</span>
					</td>
					<td class="label">
						<span>${champLevelVoList.mp}</span>
					</td>
					<td class="label">
						<span>${champLevelVoList.ad}</span>
					</td>
					<td class="label">
						<span>${champLevelVoList.ap}</span>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="atfer">
		<div id="controlBox">
			<form id="champUpdate" action="champUpdateCtr.hm" method="post"
			enctype="multipart/form-data">
				<ul>
					<li>
						<input type="hidden" class="status" id="championNumber" 
						name="championNumber" value="${champVo.championNumber}">
					</li>
					<li>
						<input type="hidden" class="status" id="championLevel"
						name="championLevel" value="1">
					</li>
					<li>
						<input type="hidden" class="status" id="champHp" name="champHp"
						value="${champVo.hp}">
					</li>
					<li>
						<input type="hidden" class="status" id="champMp" name="champMp"
						value="${champVo.mp}">
					</li>
					<li>
						<input type="hidden" class="status" id="champAd" name="champAd"
						value="${champVo.ad}">
					</li>
					<li>
						<input type="hidden" class="status" id="champAp" name="champAp"
						value="${champVo.ap}">
					</li>
					<li>
						<input type="hidden" class="status" id="rowNumber" name="rowNumber"
						value="${champLevelVoList[0].rowNumber}">
					</li>
					<li>
						<input type="hidden" class="status" id="levelHp" name="levelHp"
						value="${champLevelVoList[0].hp}">
					</li>
					<li>
						<input type="hidden" class="status" id="levelMp" name="levelMp"
						value="${champLevelVoList[0].mp}">
					</li>
					<li>
						<input type="hidden" class="status" id="levelAd" name="levelAd"
						value="${champLevelVoList[0].ad}">
					</li>
					<li>
						<input type="hidden" class="status" id="levelAp" name="levelAp"
						value="${champLevelVoList[0].ap}">
					</li>
					<li>
						<input type="hidden" class="status" id="hpGrowth" name="hpGrowth"
						value="${champLevelVoList[0].hpGrowth}">
					</li>
					<li>
						<input type="hidden" class="status" id="mpGrowth" name="mpGrowth"
						value="${champLevelVoList[0].mpGrowth}">
					</li>
					<li>
						<input type="hidden" class="status" id="adGrowth" name="adGrowth"
						value="${champLevelVoList[0].adGrowth}">
					</li>
					<li>
						<input type="hidden" class="status" id="apGrowth" name="apGrowth"
						value="${champLevelVoList[0].apGrowth}">
					</li>
					
					<!--입력부 -->
					<li>
						<input type="text" class="status" id="championName" 
						name="championName" value="${champVo.championName}">
					</li>
					<li>
						<input type="text" class="status" id="championNick" 
						name="championNick" value="${champVo.championNick}">
					</li>
					<li>
						<select id="positionOption" class="status" name="position"
						dir="rtl">
							<option value="top">탑</option> 
							<option value="jungle">정글</option>
							<option value="mid">미드</option>
							<option value="carry">원딜</option>
							<option value="support">서폿</option>
						</select>
					</li>
					<li>
						<span>HP</span>
						<input type="text" class="status" id="hp" name="hp" 
						value="${champVo.hp}">
					</li>
					<li>
						<span>MP</span>
						<input type="text" class="status" id="mp" name="mp" 
						value="${champVo.mp}">
					</li>
					<li>
						<span>AD</span>
						<input type="text" class="status" id="ad" name="ad" 
						value="${champVo.ad}">
					</li>
					<li>
						<span>AP</span>
						<input type="text" class="status" id="ap" name="ap" 
						value="${champVo.ap}">
					</li>
					<li>
						<input type="button" class="inputButton" value="반영" 
						onclick="createTableFnc();">
					</li>
					<li>
						<input type="submit" class="inputButton" value="수정">
					</li>
					<li>
						<input type="text" class="inputButton" value="돌아가기"
						onclick="goBackFnc();">
					</li>
					<li>
						<input class="longwidth" type="file" name="original_file_name" 
						value="">
					</li>
				</ul>
				<input type="hidden" name="stored_file_name" value="${fileName.STORED_FILE_NAME}">
			</form>
		</div>
		<div class="tableBox">
			<table class="headTable">
				<tr>
					<td class="label">
						<span>수정후 레벨</span>
					</td>
					<td class="label">
						<span>수정후 hp</span>
					</td>
					<td class="label">
						<span>수정후 mp</span>
					</td>
					<td class="label">
						<span>수정후 ad</span>
					</td>
					<td class="label">
						<span>수정후 ap</span>
					</td>
				</tr>
			</table>
			<table id="afterInputTable" class="statusTable">
			
			</table>
		</div>
	</div>
</div>	

<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>