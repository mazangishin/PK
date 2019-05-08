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
	
		#board{
			
			text-align: center;
			position:fixed;
			z-index: 10;
			top:0%; left:0%;
			height:100%;
			margin: 100px;
			background-color: gray;
			
			overflow: scroll;
		}
		#board2{
			
			text-align: center;
			height:2000px;
			margin: 150px;
			background-color: green;
			
			
		}
		
		#customers{
			text-align: center;
		}
		
		
	</style>

</head>

<body>

	<jsp:include page="/WEB-INF/views/PageHeader.jsp" /> 
	<jsp:include page="/WEB-INF/views/Tail.jsp" />


	
			
	<div id="board">
		
		<div id="board2">
			<table id="customers">
			
						 <caption>게시물 수정하기</caption>
			        <colgroup>
			        	<col style="width:13%">
			            <col style="width:*%">
			            <col style="width:13%">
			            <col style="width:10%">
			           
			        </colgroup>
			        <thead>
			        <tr>
			            <th scope="col">게시번호</th>
			            <th scope="col" class="first" >제목</th>
			            <th scope="col">작성자</th>
			            <th scope="col">작성일</th>
			        </tr>
			        </thead>
			        <tbody>
			
				
				
					  <thead>
			        <tr>
			        
			        	<th scope="col">${binfo.board_Number}</th>
			            <th scope="col" class="first" ><input type="text" id="boardTitle" name="boardTitle" value="${binfo.title}"></th>
			            <th scope="col">${binfo.member_id}</th>
			            <th scope="col">${binfo.create_Date}</th>
			            
			        </tr>
			        	
			        	
			        	
			        </thead>
			        	<tr><td>---------------</td></tr>
			        
			        	<tr><td>내용</td></tr>
						
						<tr><td>---------------</td></tr>
			        
			        
			        	<tr>
			        	<td>
			        		<textarea id="textareavalue" rows="20" cols="110">${binfo.content}</textarea>
			        		
			        	
			        	</td>
			        	</tr>
						
						<tr><td>
						<form action="./list.hm" method="get">
						<input type="submit" value="목록으로">
						</form>
						
						<form action="./updateok.hm" id="baordupdate" method="post">
						<input type="text" id="boardNum" name="boardNum" value="${binfo.board_Number}">
						<input type="text" id="boardText" name="boardText" value="${binfo.content}">
						<input type="text" id="boardTitle2" name="boardTitle2" value="${binfo.title}">
						<input type="button" value="수정확인" onclick="upBoard();">
						</form>
						
						</td></tr>
						
				
			</table>
		</div>	 
	</div>	

</body>
</html>
