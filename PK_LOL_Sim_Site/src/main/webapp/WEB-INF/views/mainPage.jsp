<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>one page - wheel sliding move</title>	
	

	

	<meta charset=UTF-8>

	<meta name="viewport" content="width=device-width"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.fullpage/2.9.4/jquery.fullpage.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.fullpage/2.9.4/jquery.fullpage.min.css">
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$('.btn-g button').on('click',function(e){
		$('.yt-w').css("display","block");
			setSrc($(this)); // setSrc($(this),{'autoplay':1});
		});

		$('.yt-pop .close').on('click',function(e){
			$('.yt-w').css("display","");
			$('#yt').attr('src','');
		});

		function playerVars(src,option){
			var def = {
				'autoplay' : 1,
				'control' : 1,
				'loop' : 0,
				'rel' : 1,
				'mute': 1,
				'modestbranding' : 0,
			};
			if(option) $.extend(def,option);
			var s = '';
			$.each(def,function(p,v){
				s = s+p+'='+v+'&';
			});

			return src = src+'?'+s.replace(/&$/gi,'');
		}

		function setSrc($id,option){
			var src = 'https://www.youtube.com/embed/'+$id.data('id');
			$('#yt').attr('src',playerVars(src,option));
		}
		
		

		function eee(){
			  $(".box").animate({ top : "1px" },1000)
			
			  .animate({ top : "15px" },1000)
			  eee();
			}
		
		eee();
		
		
		
		
	});
	
		
	
	function goPage(pageNumber,sc){
		
		var nowPage = $("#nowPage");
		nowPage.val(pageNumber);
		var scText = $("#scText2");
		scText.val(sc);
 		$("#pagingForm").submit();
 		//$(location).attr('href', 'http://localhost:8090/PK_LOL_Sim_Site/board/list.hm?');
	}
	
	function goBoardInfo(boardNumber){
		var boardNum = $("#boardNum");
		boardNum.val(boardNumber);
		$("#infoForm").submit();
 		
	}
	
	
	
	</script>



		
	<script >	
	
	
	
		 $(document).ready(function() {
			
			$('#fullpage').fullpage({
				
				anchors: ['firstPage', 'secondPage', '3rdPage', '4thpage', 'lastPage'],
				menu: '#menu',
				//equivalent to jQuery `easeOutBack` extracted from http://matthewlein.com/ceaser/
				easingcss3: 'cubic-bezier(0.175, 0.885, 0.320, 1.275)',
				
				onLeave: function(origin, destination, direction){
					var loadedSection = this;
					//after leaving section 2
					if(origin == 3 && direction =='down'){
					$(location).attr('href', 'http://localhost:8090/PK_LOL_Sim_Site/board/list.hm?');
					} 
					
					

				}
			
				
			});
			
			
			$("#menu>li").click(function(){
				$(this).addClass("act").siblings().removeClass("act");

			});
			
			function aaa(){
				location.href = "list.do";
				}
			
			
			
		
		});	 
		
		
	</script>	
	
	<link rel="stylesheet" href="//PK_LOL_Sim_Site/src/main/views/common/main.css"/>
	
	

	
	
	
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/PageHeader.jsp" /> 
	<jsp:include page="/WEB-INF/views/common/mainCss.jsp" />

	<div id="logo">
	<a href="#firstPage"><img src="/PK_LOL_Sim_Site/resources/images/logo.png" width="80%"></a><br>
	</div>

<ul id="menu">
	<br><br><br><br><br><br><br><br><br><br>
	<li id=first_m><b><a href="#firstPage">HOME</a></b></li><br>
	<li><b><a href="#secondPage">11111</a></b></li><br>
	<li><b><a href="#3rdPage">22222</a></b></li><br>
	<li><b><a href="#4thpage">자유 게시판</a></b></li><br>
</ul>







<jsp:include page="/WEB-INF/views/Tail.jsp" />

<div id="fullpage">

	

	<div class="section">
	<div id="mouseimg">
		<img src="/PK_LOL_Sim_Site/resources/images/scroll.png" width="30">
		<div class="box">
		<img src="/PK_LOL_Sim_Site/resources/images/boll.png" width="15">
		<button id="run">띠용</button>
		</div>
	</div>
	
	
	<div id=video>
		<video muted autoplay loop plays-inline id="video-background">
	  	<source src="/PK_LOL_Sim_Site/resources/images/K_DA.mp4">
		</video>
	</div>
	
	

	<div id="play_bt">
		<div class="btn-g">
			<button id="bttt" data-id='UOxkGD8qRB4'>
			<img src="/PK_LOL_Sim_Site/resources/images/b_play.png" width="145" height="145">
			</button>	
			
		</div>
	<div class="yt-w">
		<div class="yt-pop">
			<button id="close_bt" type="button" class="close">Close</button>
			<iframe id="yt" width="800px" height="600px" src="" frameborder="0" allowfullscreen></iframe>
		</div>
	</div>
	</div>
	
	</div>
	
	<div class="section"><a> </a></div>
	
	
	
	

	<div class="section">헤헤헤헤헤</div>
	
	<div class="section">
			
	<div id="board">
	
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
			
				<c:forEach var="boardVo" items="${boardList}">
					
				
					  <thead>
					   
			        <tr>
			        	<th scope="col">${boardVo.board_Number}</th>
			            <th scope="col" class="first" ><a href="#" onclick="goBoardInfo(${boardVo.board_Number});">${boardVo.title}
			             <c:if test="${boardVo.commet_Num>=1}">
			           	[${boardVo.commet_Num}]
			            </c:if></a></th>
			            <th scope="col">${boardVo.member_id}</th>
			            
			           
			            
			            <th scope="col">작성일</th>
			        </tr>
			        </thead>
				</c:forEach>
				
				
				
		</table>
				<form action="./board/info.hm" id="infoForm" method="post">
				<input type="text" id="boardNum" name="boardNum" value="${boardVo.board_Number}">
				</form>
		
			 
			<div id="pageBox">
				
				
					
					
					<c:forEach var="num" begin="${page.blockStartPage}" end="${page.blockEndPage}">
					
							
								<a href="#" onclick="goPage(${num}, '${scTextObj}');">
									<c:out value="${num}"/>
								</a>
							
						
					</c:forEach>
					
					
				
				
				<form action="./board/list.hm" id="pagingForm" method="post">
				<input type="hidden" id="nowPage" name="nowPage" value="${page.nowPage}">
				<input type="hidden" id="scText2" name="scText2" value="${scText}">
				</form>
				
				<div id="suDiv">
				<div id="suDiv2">
				
				<form action="./board/list.hm" method="get">
					<select name="key">
						<option value="title">제목</option>  <!-- 글쓴이 -->
						<option value="content">내용</option>  <!-- 내용 -->
						<option value="mno">회원번호</option>  <!-- 번호 -->
					</select>
						
						<input type="text" id="scText" name="scText" value="${scText}" > 
						<input type="submit" value="검색하기"> 
						
				</form>
				
				</div>
				</div>
				
		
				
			</div>
	</div>
	
	</div>	
</div>
</body>
</html>
