<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>띠용</title>	
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
	
	
	<script type="text/javascript">
	
	function upBoard(){
		
		 var boardtext = $('#boardText');
		boardtext.val($('#textareavalue').val());
		
		 var boardTitle2 = $('#boardTitle2');
		 boardTitle2.val($('#boardTitle').val());
			
 		$('#baordupdate').submit(); 
 		
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
			
			text-align: center;
			height:auto;
			margin: 150px;
			background: #353535;
			
			
		}
		
		#customers {
			/* text-align: center;
			border: 1px solid white;
  			border-collapse: collapse; */
		}
		
		#boardnum_td{
			
		}
		
		#noresize{
		  	resize: none; /* 사용자 임의 변경 불가 */
		}
		
		#texta{
			resize: none; /* 사용자 임의 변경 불가 */
		}
		
		#comm{
			resize: none; /* 사용자 임의 변경 불가 */
		}
		#comm2{
			resize: none; /* 사용자 임의 변경 불가 */
		}
		
		#table_caption{
		font-size: 25px;
		}
		
		#reply_div{
			text-align: center;
			
			z-index: 11;
			
			margin: 100px;
			
			position: absolute;
    		top: 55%;
     		left: 11%;
    
		}
		
		#reply_div2{
			text-align: center;
			
			z-index: 11;
			
			margin: 100px;
			
			position: absolute;
    		top: 69%;
     		left: 3%;
    
		}
		
		#re_w{
			width: 150px;
			font-size: 16px;
			background-color: #353535;
		}
		
		#re_comm{
			width: 592px;
			font-size: 17px;
			color: gray;
			text-align: left;
		}
		#rere_name{
			text-align: left;
			font-size: 16px;
			color: gray;
		}
		
		#td_title{
		width: 450px;
		}
		
		#td_name{
		width: 100px;
		}
		
		#reply_t2 {
			text-align: center;
			border: 1px solid white;
  			border-collapse: collapse;
		}
	
		#rere_w{
			
			font-size: 16px;
			background-color: #353535;
			text-align: left;
		}
		
		#rere_w2{
			
			
			background-color: #353535;
		}
		
		#tt1{
			width: 100px;
		}
		
		#tt2{
			width: 100px;
		}
		
		.menu a{cursor:pointer;}
    	.menu .hide{display:none;}



		
	</style>
		
		
	</style>

</head>

<body>

	<jsp:include page="/WEB-INF/views/PageHeader.jsp" /> 
	<jsp:include page="/WEB-INF/views/Tail.jsp" />


	
			
	<div id="board">
		
		<div id="board2">
			<table id="customers">
				
				<caption id="table_caption">소환사 광장</caption>
				<tr>
				<td colspan="4">
			    <hr size="2" color="black">
			    </td>
			      <tr>
			     
			        
			        
			        <tr>
			        	
			        	
			        	
			            <td>게시글 번호</td>
			            <td id="td_title">제목</td>
			            <td id="td_name">작성자</td>
			            <td>작성일</td>
			        </tr>
			        
			      
			        <tr>
			        	<td> 
			        	${sessionScope.memberVo.memberNumber}
			        	</td>
			        
			        	<td><input type="text" id="boardTitle" name="boardTitle" value="${binfo.title}"></td>
			        
			       	    <td>${binfo.member_id}</td>
			        	
			        	<td>
			        	<fmt:formatDate value="${binfo.create_Date}" pattern="yyyy-MM-dd"/>
			        	</td>
			        	
			        	
			        	
			        	
			         
			        </tr>
			     
			         	       
			        <tr>
			        
			        <td></td>
			        
			        <td colspan="2" >
			        <textarea id="textareavalue" rows="20" cols="110">${binfo.content}</textarea>
			        </td>
			        <td></td>
			        </tr>
			       
					<tr>
						
						<td>
						</td>
						
						<td>
						</td>
						
						
						
						<td>
						<form action="./list.hm" method="get">
						<input type="submit" class="SubButton" value="목록으로">
						</form>
						</td>
						
						<td>
						<form action="./updateok.hm" id="baordupdate" method="post">
						<input type="hidden" id="boardNum" name="boardNum" value="${binfo.board_Number}">
						<input type="hidden" id="boardText" name="boardText" value="${binfo.content}">
						<input type="hidden" id="boardTitle2" name="boardTitle2" value="${binfo.title}">
						<input type="button" class="SubButton" value="수정확인" onclick="upBoard();">
						</form>
						</td>
						</tr>
					</table>
					
					
				<br>
				<br>
				<br> 
				<br>
				<br> 
		
		
		
		</div>	 
	</div>	

</body>
</html>
