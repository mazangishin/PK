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

<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function champCreateFnc() {
		var url = "/PK_LOL_Sim_Site/champ/champCreate.hm";
			
		location.href = url;		
	}
</script>
<style type="text/css">
	body {
		background-color: black;
	}
	#container {
		margin: auto;
		vertical-align: middle;
		width: 1100px;
		height: 700px;
		padding: 10px;
	}
	#positionBox {
		float: left;
		box-shadow:
		0 0 0.05vw  0.2vw #FFE8FF,   
		0 0 0.2vw  0.3vw #F5D6FF, 
		0 0   2vw  0.2vw #9354ED,
		inset 0 0 0.75vw  0.2vw #9354ED,
		inset 0 0 0.2vw  0.1vw #F5D6FF,
		inset 0 0 0.25vw  0.1vw #FFE8FF;
		border-radius: 1.5rem;
		padding: 10px;
		height: 650px;
		margin: 0px 10px 0px 10px;
	}
	#positionBox div {
		margin: auto;
		margin: 20px 10px 20px 10px;
	}
	#positionBox div:hover{
		box-shadow:
		0 0 0.05vw  0.2vw #FFFFFF,   
		0 0 0.2vw  0.3vw #F6F6F6, 
		0 0   2vw  0.2vw #E4E4E4,
		inset 0 0 0.75vw  0.2vw #E4E4E4,
		inset 0 0 0.2vw  0.1vw #F6F6F6,
		inset 0 0 0.25vw  0.1vw #FFFFFF;
	}
	#championBox {
		float: left;
		box-shadow:
		0 0 0.05vw  0.2vw #FFE8FF,   
		0 0 0.2vw  0.3vw #F5D6FF, 
		0 0   2vw  0.2vw #9354ED,
		inset 0 0 0.75vw  0.2vw #9354ED,
		inset 0 0 0.2vw  0.1vw #F5D6FF,
		inset 0 0 0.25vw  0.1vw #FFE8FF;
		border-radius: 1.5rem;
		width: 650px;
		height: 650px;
		padding: 10px;
		margin: 0px 10px 0px 10px;
	}
	.championArt {
		float: left;
		width: 300px;
		height: 300px;
		margin: 10px 10px 10px 10px;
	}
	.championArt:hover {
		box-shadow:
		0 0 0.05vw  0.2vw #FFFFD2,   
		0 0 0.2vw  0.3vw #FFFF5A, 
		0 0   2vw  0.2vw #FFE400,
		inset 0 0 0.75vw  0.2vw #FFE400,
		inset 0 0 0.2vw  0.1vw #FFFF5A,
		inset 0 0 0.25vw  0.1vw #FFFFD2;
	}
	.paging {
		float: left;
		box-shadow:
		0 0 0.05vw  0.2vw #FFE8FF,   
		0 0 0.2vw  0.3vw #F5D6FF, 
		0 0   2vw  0.2vw #9354ED,
		inset 0 0 0.75vw  0.2vw #9354ED,
		inset 0 0 0.2vw  0.1vw #F5D6FF,
		inset 0 0 0.25vw  0.1vw #FFE8FF;
		border-radius: 1.5rem;
		width: 70px;
		height: 650px;
		padding: 10px;
		margin: 0px 10px 0px 10px;
	}
	.paging a {
		position: relative;
		top : 25%;
	}
	.paging:hover {
		background-color: #F5D6FF;
	}
	.clear { clear: both }
	.adminButton {
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
	.adminButton:hover {
		background: #B778FF;
	}
</style>
<title>포지션 별 챔피언</title>
</head>
<body>

<jsp:include page="/WEB-INF/views/PageHeader.jsp" />

<div id="container">

	<div id="positionBox">
	
		<div id="topChampion">
			<a href="./champList.hm?position=top">
				<img alt="탑" src="../resources/images/top.png" 
				width="100" height="100">
			</a>
		</div>
		
		<div id="jungleChampion">
			<a href="./champList.hm?position=jungle">
				<img alt="정글" src="../resources/images/jungle.png" 
				width="100" height="100">
			</a>
		</div>
		
		<div id="midChampion">
			<a href="./champList.hm?position=mid">
				<img alt="미드" src="../resources/images/mid.png" 
				width="100" height="100">
			</a>
		</div>
		
		<div id="carryChampion">
			<a href="./champList.hm?position=carry">
				<img alt="원딜" src="../resources/images/carry.png" 
				width="100" height="100">
			</a>
		</div>
		
		<div id="supportChampion">
			<a href="./champList.hm?position=support">
				<img alt="서폿" src="../resources/images/support.png" 
				width="100" height="100">
			</a>
		</div>
		
	</div>
	
	<div class="paging">
			<a href="#" onclick="goPage(${pagingMap.champPaging.prevPage});">
				<img alt="앞으로" src="../resources/images/arrowToLeft.png"
				width="70" height="300">
			</a>
	</div>
	
	<div id="championBox">
		<c:forEach var="champList" items="${champList}" varStatus="status">
			<div class="championArt">
				<a href="/PK_LOL_Sim_Site/champ/champDetailView.hm?championNumber=
				${champList.championNumber}">
					<img src="<c:url value='/images/${flieList.STORED_FILE_NAME}'/>"
					width=300px; height=300px;/>
				</a>
			</div>
		</c:forEach>
	</div>
	
	<div class="paging">
			<a href="#" onclick="goPage(${pagingMap.champPaging.nextPage});">
				<img alt="뒤로" src="../resources/images/arrowToRight.png" 
				width="70" height="300" >
			</a>
	</div>
</div>


	<div>
		<c:if test="${sessionScope.memberVo.authority eq 'Y'}">
			<form>
				<input type="button" value="챔피언 생성" class="adminButton" 
				onclick="champCreateFnc();">
			</form>
		</c:if>
	</div>

<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>
</body>
</html>