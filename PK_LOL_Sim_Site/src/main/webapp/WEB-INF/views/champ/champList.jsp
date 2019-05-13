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
	function backToMainFnc() {
		var url = "/PK_LOL_Sim_Site/mainPage.hm";
		
		location.href = url;
	}
	function goPage(pageNumber) {
// 		var curPage = $("#curPage");
		var curPage = document.getElementById("curPage");
// 		curPage.val(pageNumber);
		curPage.value = pageNumber;

		document.getElementById("pagingForm").submit();
	}
</script>
<style type="text/css">
	body {
		background-color: black;
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
	#container {
		position: fixed;
		top: 10%;
		left: 20%;
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
	#outerBox {
		position: fixed;
		top: 83%;
		left: 20%;
		width: 1100px;
		height: 700px;
		padding: 10px;
	}
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
			<img alt="뒤로" src="../resources/images/arrowToLeft.png"
			width="70" height="300">
		</a>
		
	</div>
	
	<div id="championBox">
		<c:forEach var="champList" items="${champList}" varStatus="status">
			<div class="championArt">
				<a href="/PK_LOL_Sim_Site/champ/champDetailView.hm?championNumber=
				${champList.championNumber}">
					<img src="<c:url value='/images/${champList.STORED_FILE_NAME}'/>"
					width=300px; height=300px;/>
				</a>
			</div>
		</c:forEach>
		<form action="./champList.hm" id="pagingForm" method="get">
			<input type="hidden" id="curPage" name="curPage" 
				value="${pagingMap.champPaging.curPage}">
		</form>
	</div>
	
	<div class="paging">
		<a href="#" onclick="goPage(${pagingMap.champPaging.nextPage});">
			<img alt="앞으로" src="../resources/images/arrowToRight.png" 
			width="70" height="300" >
		</a>
	</div>
</div>


	<div id="outerBox">
		<c:if test="${memberVo.authority eq 'Y'}">
			<form>
				<input type="button" value="챔피언 생성" class="adminButton" 
				onclick="champCreateFnc();">
			</form>
		</c:if>
		<form>
			<input type="button" value="돌아가기" class="adminButton"
			onclick="backToMainFnc();">
		</form>
	</div>

<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>