<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
	function levelSelectFnc(value){
		var parentObj = document.getElementById("statusBox");
		var li_Obj = parentObj.getElementsByClassName("status");
		for (var i = 0; i < li_Obj.length; i++) {
			if (value == (i + 1)) {
				li_Obj[i].style.display="block"; 
			} else if (value != (i + 1)) {
				li_Obj[i].style.display="none";
			}
		}
	}
	function deleteFnc() {
		var url = "/PK_LOL_Sim_Site/champ/champDeleteCtr.hm?championNumber=${champVo.championNumber}";
		location.href = url;		
	} 
	function goToUpdateFnc() {
		var url = "/PK_LOL_Sim_Site/champ/champUpdate.hm?championNumber=${champVo.championNumber}";
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
	select{
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
		width: 500px;
		padding: 10px;
		height: 600px;
		margin: 0px 10px 0px 10px;
	}
	#championBox div {
		margin: auto;
		width: 450px;
		margin: 20px 10px 20px 10px;
	}
	#statusBox {
		overflow: auto;
		width: 400px;
		margin: 10px 10px 0px 10px;
		color: white;
	}
	#selector {
		position: relative;
		top: 10%;
		color: #F7EA6E;
	}
	#selector ul li {
		padding: 5px;
	}
	.label:nth-child(odd) {
		border: 2px solid #E3C4FF;
		color: white;
		width: 80px;
		height: 70px;
	}
	.label:nth-child(even) {
		border: 2px solid #F7EA6E;
		color: white;
		width: 80px;
		height: 70px;
	}
	#statusBox table {
		width: 400px;
		height: 80px;
	}
	#statusBox table tr{
		text-align: center;
		width: 400px;
		height: 80px;
	}
	.championArt {
		padding: 10px;
		float: left;
		width: 300px;
		height: 300px;
		margin: 10px 10px 10px 10px;
		border-color: 1px solid #989898;
	}
	#buttonBox {
		position: relative;
		top: 30%;
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
	#headTr {
		float: left;
		position: relative;
		left: 2px;
		
	}
</style>
<title>챔피언 상세보기 페이지</title>
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
		<div id="championBox">
			<ul>
				<li>
					<img class="championArt" 
						src="<c:url value='/images/${fileName.STORED_FILE_NAME}'/>">
				</li>
			</ul>
			<div id="statusBox">
				<table id="headTr">
					<tr>
						<td class="label">레벨</td>
						<td class="label">HP</td>
						<td class="label">MP</td>
						<td class="label">AD</td>
						<td class="label">AP</td>
					</tr>
				</table>
				<table id="contentTr">
					<c:forEach var="champLevelVoList" items="${champLevelVoList}">
						<tr class="status" style="width: 400px; display:none;">
							<td class="label" style="width:80px; height:70px;">${champLevelVoList.championLevel}</td>
							<td class="label" style="width:80px; height:70px;">${champLevelVoList.hp}</td>
							<td class="label" style="width:80px; height:70px;">${champLevelVoList.mp}</td>
							<td class="label" style="width:80px; height:70px;">${champLevelVoList.ad}</td>
							<td class="label" style="width:80px; height:70px;">${champLevelVoList.ap}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		
		<div id="selector">
			<ul>
				<li>
					<h1>${champVo.championName}</h1>
				</li>
				<li>
					<h2>${champVo.championNick}</h2>
				</li>
				<li>
					<select id="championLevel" name="championLevel" 
					onchange="levelSelectFnc(this.value);">
						<c:forEach begin="1" end="18" varStatus="status">
							<option>${status.index}</option>
						</c:forEach>
					</select>
				</li>
			</ul>
		</div>
		
		<div id="buttonBox">
				<c:if test="${sessionScope.memberVo.authority eq 'Y'}">
					<div>
						<form>
							<input type="button" class="inputButton" 
								value="수정하기" onclick="goToUpdateFnc();">
							<input type="button" class="inputButton" 
								value="삭제하기" onclick="deleteFnc();">
						</form>
					</div>
					<div>
						<form action="./champLevelUpdate.hm">
							<input type="hidden" id="championNumber" name="championNumber"
							value="${champVo.championNumber}">
							<input type="hidden" id="championName" name="championName" 
							value="${champVo.championName}">
							<input type="hidden" id="championNick" name="championNick" 
							value="${champVo.championNick}">
							<input type="hidden" id="position" name="position" 
							value="${champVo.position}">
							<input type="hidden" id="hp" name="hp" value="${champVo.hp}">
							<input type="hidden" id="mp" name="mp" value="${champVo.mp}">
							<input type="hidden" id="ad" name="ad" value="${champVo.ad}">
							<input type="hidden" id="ap" name="ap" value="${champVo.ap}">
							<input type="submit" class="inputButton" 
									value="레벨별 정보 수정">
						</form>
					</div>
				</c:if>
			<form>
				<input type="button" class="inputButton"
					value="돌아가기" onclick="goToBackFnc();">
			</form>		
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>