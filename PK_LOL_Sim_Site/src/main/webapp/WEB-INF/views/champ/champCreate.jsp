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
	.clear { clear: both }
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/PageHeader.jsp" />

	<div id="container">
		<form id="champCreate" action="champVoSave.hm" method="post"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>
					<input class="normalwidth" type="text" name="championName" 
					placeholder="챔피언의 이름을 입력해주세요">
				</td>
				<td>
					<input class="normalwidth" type="text" name="championNick" 
					placeholder="챔피언의 별명을 입력해주세요">
				</td>
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
				<td>
					<input class="normalwidth" type="text" name="hp"
				 	placeholder="챔피언의 기본 hp를 설정해주세요">
				</td>
			</tr>
			<tr>
				<td>
					<input class="normalwidth" type="text" name="mp"
					placeholder="챔피언의 기본 mp를 설정해주세요">
				</td>
				<td>
					<input class="normalwidth" type="text" name="ad"
					placeholder="챔피언의 기본 ad를 설정해주세요">
				</td>
			</tr>
			<tr>
				<td>
					<input class="normalwidth" type="text" name="ap"
					placeholder="챔피언의 기본 ap를 설정해주세요">
				</td>
				<td>
					
				</td>
			</tr>
			<tr>
				<td colspan="2">
<!-- 					<input class="longwidth" type="file" name="original_file_name"  -->
<!-- 					placeholder="챔피언의 이미지를 올려주세요"> -->
				</td>
			</tr>
		</table>
		<input type="submit" class="inputButton" value="생성">
		<input type="button" class="inputButton" value="돌아가기" onclick="backtoListFnc();">
	</form>
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