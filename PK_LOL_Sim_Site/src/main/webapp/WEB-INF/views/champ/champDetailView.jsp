<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
		
	function levelSelectFnc(value){
		var parentObj = document.getElementById("statusBox");
		var li_Obj = parentObj.getElementsByClassName("label");
		
		document.getElementById('viewTable').innerHTML = li_Obj[value];
	}
	function deleteFnc() {
		var url = "/PK_LOL_Sim_Site/champ/champList.hm";
		location.href = url;		
	} 
	function goToUpdateFnc() {
		var url = "/PK_LOL_Sim_Site/champ/champList.hm";
		location.href = url;
	}
	function goToBackFnc() {
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
	ul li select{
		margin: auto;
		width: 100px;
		height: 25px;
	}
	#container {
		margin: auto;
		position: inherit;
		vertical-align: middle;
		width: 1100px;
		height: 700px;
		padding: 10px;
		background-color: black;
	}
	#championBox {
		float: left;
		padding: 10px;
		height: 650px;
		margin: 0px 10px 0px 10px;
	}
	#championBox div {
		margin: auto;
		margin: 20px 10px 20px 10px;
	}
	#statusBox {
		float: left;
		width: 650px;
		padding: 10px;
		margin: 0px 10px 0px 10px;
		color: white;
	}
	#statusBox ul {
		width: 400px;
	}
	#statusBox ul li{
		width: 70px;
	}
	.championArt {
		float: left;
		width: 300px;
		height: 300px;
		margin: 10px 10px 10px 10px;
	}
	#buttonBox {
		width: 650px;
		height: 650px;
		padding: 10px;
		margin: auto;
	}
	.inputButton {
		float: left; 
		margin: 10px 10px 10px 10px;
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
	.viewButton {
		margin: auto;
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
<title>챔피언 상세보기 페이지</title>
</head>
<body>

	<div id="container">
		<div id="championBox">
			<ul>
				<li>
					<img class="championArt" 
						src="<c:url value='/images/${fileName.STORED_FILE_NAME}'/>">
				</li>
				<li>
					<select id="championLevel" name="championLevel" 
					onchange="levelSelectFnc(this.value);">
						<c:forEach begin="1" end="18" step="1" varStatus="status">
							<option>${status.count}</option>
						</c:forEach>
					</select>
				</li>
				<li>
					<table id="viewTable">
					
					</table>
				</li>
			</ul>
		</div>
		<div id="statusBox">
			<ul>
				<li>
					<span>레벨</span>
					<span>HP</span>
					<span>MP</span>
					<span>AD</span>
					<span>AP</span>
				</li>
				<c:forEach var="champLevelVoList" items="${champLevelVoList}" varStatus="status">
					<li id="${status.count}Level" class="label" style="diplay: none;">
						<span>${champLevelVoList.championLevel}</span>
						<span>${champLevelVoList.hp}</span>
						<span>${champLevelVoList.mp}</span>
						<span>${champLevelVoList.ad}</span>
						<span>${champLevelVoList.ap}</span>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div id="buttonBox">
			<c:if test="${sessionScope.memberVo.authority eq 'Y'}">
				<div>
					<input type="button" class="inputButton" 
						value="수정하기" onclick="goToUpdateFnc();">
					<input type="button" class="inputButton" 
						value="삭제하기" onclick="deleteFnc();">
				</div>
			</c:if>
			<input type="button" class="inputButton"
				value="돌아가기" onclick="goToBackFnc();">
		</div>
	</div>

</body>
</html>