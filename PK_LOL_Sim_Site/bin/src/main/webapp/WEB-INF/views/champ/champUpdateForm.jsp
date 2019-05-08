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
				
				document.getElementById('statusTable').innerHTML = htmlStr;	
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
		height: 30px;
		outline: none;
		color: white;
		border-radius: 24px;
		transition: 0.25s; 
	}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/PageHeader.jsp" />

<div id="container">
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
			<c:foreach var="champLevelVo" items="${champLevelVo}">
				<tr>
				<td class="label">
					<span>${champLevelVo.championLevel}</span>
				</td>
				<td class="label">
					<span>${champLevelVo.hp}</span>
				</td>
				<td class="label">
					<span>${champLevelVo.mp}</span>
				</td>
				<td class="label">
					<span>${champLevelVo.ad}</span>
				</td>
				<td class="label">
					<span>${champLevelVo.ap}</span>
				</td>
			</tr>
			</c:foreach>
		</table>
	</div>
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
					<input type="hidden" class="status" id="ap" name="rowNumber"
					value="${champLevelVo.rowNumber}">
				</li>
				<li>
					<input type="hidden" class="status" id="ap" name="championNumber"
					value="${champLevelVo.championNumber}">
				</li>
				<li>
					<input type="hidden" class="status" id="ap" name="championLevel"
					value="${champLevelVo.championLevel}">
				</li>
				<li>
					<input type="hidden" class="status" id="ap" name="ap"
					value="${champLevelVo.hp}">
				</li>
				<li>
					<input type="hidden" class="status" id="ap" name="ap"
					value="${champLevelVo.mp}">
				</li>
				<li>
					<input type="hidden" class="status" id="ap" name="ap"
					value="${champLevelVo.ad}">
				</li>
				<li>
					<input type="hidden" class="status" id="ap" name="ap"
					value="${champLevelVo.ap}">
				</li>
				<li>
					<input type="text" class="status" id="hpGrowth" name="hpGrowth" 
					placeholder="hp 성장치를 입력해주세요">
				</li>
				<li>
					<input type="text" class="status" id="mpGrowth" name="mpGrowth" 
					placeholder="mp 성장치를 입력해주세요">
				</li>
				<li>
					<input type="text" class="status" id="adGrowth" name="adGrowth" 
					placeholder="ad 성장치를 입력해주세요">
				</li>
				<li>
					<input type="text" class="status" id="apGrowth" name="apGrowth" 
					placeholder="ap 성장치를 입력해주세요">
				</li>
				<li>
					<input type="button" class="inputButton" value="반영" 
					onclick="createTableFnc();">
				</li>
				<li>
					<input type="reset" class="inputButton" value="취소">
				</li>
				<li>
					<input type="submit" class="inputButton" value="저장">
				</li>
				<li>
					<input class="longwidth" type="file" name="original_file_name" 
					placeholder="챔피언의 이미지를 올려주세요">
				</li>
			</ul>
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
		<table class="statusTable">
		
		</table>
	</div>
</div>	

<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>