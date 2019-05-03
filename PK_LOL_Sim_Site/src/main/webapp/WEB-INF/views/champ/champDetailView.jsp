<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
		
	window.onload = function(){
						var parentObj = document.getElementById("statusBox");
						var tr_Obj = parentObj.getElementsByClassName("label");
						
						tr_Obj[0].style.display="block";
					}
	
	function levelSelectFnc(value){
		var parentObj = document.getElementById("statusBox");
		var li_Obj = parentObj.getElementsByClassName("label");
		
		li_Obj[value].style.display="block";
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
		position:absolute;
		top: 15%;
		left: 25%;
		margin: auto;		
		width: 1000px;
		height: 600px;
		padding: 10px;
		background-color: black;
	}
	#championBox {
		float: left;
		padding: 10px;
		height: 600px;
		margin: 0px 10px 0px 10px;
	}
	#championBox div {
		margin: auto;
		margin: 20px 10px 20px 10px;
	}
	#statusBox {
		overflow: auto;
		width: 350px;
		padding: 10px;
		margin: 0px 10px 0px 10px;
		color: white;
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
	#statusBox table {
		width: 320px;
	}
	#statusBox table tr{
		text-align: center;
		width: 250px;
	}
	#statusBox table tr td{
		border-color: 2px solid white;
		text-align: center;
		width: 45px;
	}
	.championArt {
		float: left;
		width: 300px;
		height: 300px;
		margin: 10px 10px 10px 10px;
	}
	#buttonBox {
		float: left;
		width: 400px;
		height: 150px;
		margin: auto;
	}
	.inputButton {
		float: left; 
		border: 2px solid #B778FF;
		background: none;
		display: block;
		margin: 15px 10px 10px 10px;
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

	<jsp:include page="/WEB-INF/views/PageHeader.jsp" />

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
			<table>
				<tr>
					<td>레벨</td>
					<td>HP</td>
					<td>MP</td>
					<td>AD</td>
					<td>AP</td>
				</tr>
				<c:forEach var="champLevelVoList" items="${champLevelVoList}">
					<tr class="label" style="diplay: none;">
						<td>${champLevelVoList.championLevel}</td>
						<td>${champLevelVoList.hp}</td>
						<td>${champLevelVoList.mp}</td>
						<td>${champLevelVoList.ad}</td>
						<td>${champLevelVoList.ap}</td>
					</tr>
				</c:forEach>
			</table>
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

	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>