<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
<script type="text/javascript">

	
		
	
	function goPage(pageNumber,sc){
		
		var nowPage = $("#nowPage");
		nowPage.val(pageNumber);
		var scText = $("#scText2");
		scText.val(sc);
 		$("#pagingForm").submit();
 		//$(location).attr('href', '../board/list.hm'); 
	}
	
	function goBoardInfo(boardNumber){
		
		var boardNum = $("#boardNum");
		boardNum.val(boardNumber);
		$("#infoForm").submit();
 		
	}
	
	</script>
	
	
	<style type="text/css">
	
 		.hidden
        {
            display: none;
        }
        .bold
        {
            font-weight: bold;
        }
        .DivCss
        {
            background-color: #FFFFCC; border: thin dotted #000000; padding: 2px; margin: 0px; width: 200px;
        }


	
	
	
	body {
		background-image: linear-gradient(rgba(0,0,0,0.1), rgba(0,0,0,0.1)), 
						url(/PK_LOL_Sim_Site/resources/images/kda.jpg);
		background-repeat: no-repeat;
		background-size: cover;
		sc
		padding: 0px;
		height: 100vh;
		width: 100vw;
		font-family: sans-serif;
		opacity: 0.8;
		overflow: hidden;
	}
	 #loginBox {
		position:absolute;
		top:50%;
		left:50%;
		transform: translate(-50%, -50%);
		width: 300px;
		padding: 40px;
		background: #353535;
		text-align: center;
		color: #F7EA6E;
	}
	#loginBox h1 {
		color: #F7EA6E;
	}
	.inputButton {
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
	.inputButton:focus {
		width: 250px;
		border-color: #EDD200;
	}
	.SubButton {
		border: 2px solid #B778FF;
		background: none;
		display: block;
		margin: 3px auto;
		text-align: center;
		width: 100px;
		height: 30px;
		outline: none;
		color: white;
		border-radius: 24px;
		transition: 0.25s;
		cursor: pointer;
	}
	.SubButton:hover {
		background: #B778FF;
	}
	.register {
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
	.register:hover {
		background: #B778FF;
	}
	
	
		#board{
		
			
			 text-align: center;
			position:fixed;
			z-index: 10;
			top:0%; left:10%;
			height:100%;
			margin: 100px;
			background: black;
			text-align: center;
			color:gray; 
			color: #F7EA6E;
			overflow: scroll;
		}
		
		#board2{
			position:absolute;
			top:50%;
			left:28%;
			z-index: 12;
			
			width: 650px;
			padding: 40px;
			background: #353535;
			text-align: center;
			color: #F7EA6E;
			
		}
		
		#customers {
			/* text-align: center;
			border: 1px solid white;
  			border-collapse: collapse; */
		}

		#td_title{
		width: 750px;
		}
		
		#td_name{
		width: 150px;
		}
		
		#td_num{
		width: 150px;
		}
		
		#td_date{
		width: 200px;
		}
		
		.SubButton {
		border: 2px solid #B778FF;
		background: none;
		display: block;
		margin: 3px auto;
		text-align: center;
		width: 100px;
		height: 30px;
		outline: none;
		color: white;
		border-radius: 24px;
		transition: 0.25s;
		cursor: pointer;
		}
		.SubButton:hover {
			background: #B778FF;
		}

	a { text-decoration:none ; color:#F7EA6E}

		
	</style>
	


<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/PageHeader.jsp" /> 
	<jsp:include page="/WEB-INF/views/Tail.jsp" />
	<div id="board">
	<table id="customers">
			
						 <caption>소환사 광장</caption>
			       
			        <thead>
			        <tr>
			           
			        	
			            <td id="td_num">게시번호</td>
			            <td id="td_title">제목</td>
			            <td id="td_name">작성자</td>
			            <td id="td_date">작성일</td>
			        
			        </tr>
			        </thead>
			        <tbody>
			
				<c:forEach var="boardVo" items="${boardList}">
					<thead>
			        <tr>
			        	<th scope="col">${boardVo.board_Number}</th>
			        	
			            <th scope="col" class="first" >
			            <a href="#"  onclick="goBoardInfo(${boardVo.board_Number});" >
			            ${boardVo.title}
			             <c:if test="${boardVo.commet_Num>=1}">
			           	[${boardVo.commet_Num}] <!-- 덧글숫자 -->
			            </c:if>
			            </a>
			            </th>
			            
			            
			            <th scope="col">${boardVo.member_id}</th>  
			            <th scope="col"><fmt:formatDate value="${boardVo.create_Date}" pattern="yyyy-MM-dd"/></th>
			        </tr>
			        </thead>
				</c:forEach>
				
				<tr>
				<td>
				<form action="../board/info.hm" id="infoForm" method="get">
				<input type="hidden" id="boardNum" name="boardNum" value="${boardVo.board_Number}">
				</form>
				</td>
				</tr>
				
		</table>
		</div>
		
		
				
		
			 
			<div id="board2">
				
				
					
					<c:forEach var="num" begin="${page.blockStartPage}" end="${page.blockEndPage}">
								<a href="#" onclick="goPage(${num},'${scTextObj}');">
									[<c:out value= "${num}" />]
								</a>
					</c:forEach>
					
				<form action="./list.hm" id="pagingForm" method="post">
				<input type="hidden" id="nowPage" name="nowPage" value="${page.nowPage}">
				<input type="hidden" id="scText2" name="scText2" value="${scText}">
				</form>
				
				<div id="suDiv">
				<div id="suDiv2">
				
				
						
				
				<form action="../board/list.hm" method="get">
					<select name="key">
						<option value="title">제목</option>  <!-- 글쓴이 -->
						<option value="content">내용</option>  <!-- 내용 -->
						<option value="mno">회원번호</option>  <!-- 번호 -->
					</select>
						
						
						
						
						<input type="text" id="scText" name="scText" value="${scText}" > 
						<input type="submit" class="SubButton" value="검색하기"> 
						
						
				</form>
				
				<form action="../board/write.hm" method="get">
						
						
						<input type="submit" class="SubButton" value="글쓰기"> 
						
						
				</form>
				
				
				</div>
				</div>
				
		
				
			</div>
	
</body>
</html>