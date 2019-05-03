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
	<script type="text/javascript">	</script>
	
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
	<script type="text/javascript">
		function upReply(){
		var comm=$('#comm');
		comm.val($('#texta').val());
			
	 		$('#replyWrite').submit(); 
	 		
		}
		
		
		
	
	</script>

</head>

<body>

	<jsp:include page="/WEB-INF/views/PageHeader.jsp" /> 
	<jsp:include page="/WEB-INF/views/Tail.jsp" />


	
			
	<div id="board">
		
		<div id="board2">
			<table id="customers">
			
						 <caption>소환사 광장</caption>
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
			            <th scope="col" class="first" >${binfo.title}</th>
			            <th scope="col">${binfo.member_id}</th>
			            <th scope="col">${binfo.create_Date}</th>
			            
			        </tr>
			        	
			        	
			        	
			        </thead>
			        	<tr><td>---------------</td></tr>
			        
			        	<tr><td>내용</td></tr>
						
						<tr><td>---------------</td></tr>
			        
			        
			        	<tr>
			        	<td>
			        		<textarea rows="20" cols="110" readonly="readonly">${binfo.content}</textarea>
			        	
			        	</td>
			        	</tr>
			        	
			        	
			        	
						
						<tr><td>
						<form action="./list.hm" method="get">
						<input type="submit" value="목록으로">
						</form>
						
						<form action="./update.hm" method="get">
						<input type="text" id="boardNum" name="boardNum" value="${binfo.board_Number}">
						<input type="submit" value="수정하기">
						</form>
						
						</td></tr>
						
						<!-- 댓글부분  -->
						<tr>
			        	<td>
			        		<form action="./reply.hm" id="replyWrite"method="get">
			        		<textarea id="texta" rows="3" cols="80"></textarea>
			        		<input type="button" value="답글달기" onclick="upReply();">
			        		<input type="hidden" id="comm" name="comm">
			        		<input type="hidden" id="is_re_comm" name="is_re_comm" value="">
			        		<input type="hidden" id="bnum" name="bnum" value="${binfo.board_Number}">
			        		<input type="hidden" id="mnum" name="mnum" value="${sessionScope.memberVo.memberNumber}">
			        		</form>
			        	</td>
			        	</tr>
			        	<c:forEach var="RePlyVo" items="${rePlyList}">
			        		<tr>
			        		<td>댓글 번호 ${RePlyVo.reply_num} </td>
			        		<td>댓글 내용 ${RePlyVo.re_comment} </td>
			        		<td>댓글 쓴애 ${RePlyVo.member_name} </td>
			        		<td>
			        		<form action="./reply.hm" id="replyWrite"method="get">
			        		<textarea id="comm" name="comm" rows="1" cols="15"></textarea>
			        		<input type="submit" value="답글달기">
			        		<%-- <input type="hidden" id="comm" name="comm" vlaue="${('#texta')}"> --%>
			        		<!-- ~에게 댓글을 달았을때 IS_Re_COMM값에 상대편 이름 들어감 -->
			        		<input type="hidden" id="is_re_comm" name="is_re_comm" value="${RePlyVo.member_name}">
			        		<input type="hidden" id="bnum" name="bnum" value="${binfo.board_Number}">
			        		<input type="hidden" id="mnum" name="mnum" value="${sessionScope.memberVo.memberNumber}">
			        		</form>
			        		</td>
			        		
			        		</tr>
			        		
			        		
			        	</c:forEach>
			        	
<!-- 			        	<input type="text" id="test7" name="test7" value="4"> -->
			        	
			        	
<%-- 			        	<c:if test="${rePlyList[4]!=null}"> --%>
<%-- 			        				<td>${rePlyList[4]} 아응애예요</td> --%>
<%-- 			        				<td>${rePlyList[4].getRe_comment()} 아응애예요2</td> --%>
<%-- 			            </c:if> --%>
			        	
			        		
			      
			        	
			</table>
		</div>	 
	</div>	

</body>
</html>
