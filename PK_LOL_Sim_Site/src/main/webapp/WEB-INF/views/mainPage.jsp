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
	
		
	/*
	function goPage(pageNumber,sc){
		
		var nowPage = $("#nowPage");
		nowPage.val(pageNumber);
		var scText = $("#scText2");
		scText.val(sc);
 		$("#pagingForm").submit();
 		$(location).attr('href', 'http://localhost:8090/PK_LOL_Sim_Site/board/list.hm?'); 
	}
	
	function goBoardInfo(boardNumber){
		var boardNum = $("#boardNum");
		boardNum.val(boardNumber);
		$("#infoForm").submit();
 		
	}
	
	*/
	
	</script>



		
	<script >	
	
		 $(document).ready(function() {
			
			$('#fullpage').fullpage({
				
				anchors: ['firstPage', 'secondPage', '3rdPage', '4thpage', 'lastPage'],
				menu: '#menu',
				//equivalent to jQuery `easeOutBack` extracted from http://matthewlein.com/ceaser/
				easingcss3: 'cubic-bezier(0.175, 0.885, 0.320, 1.275)',
				
				/* onLeave: function(origin, destination, direction){
					var loadedSection = this;
					//after leaving section 2
					if(origin == 3 && direction =='down'){
					$(location).attr('href', 'http://localhost:8090/PK_LOL_Sim_Site/board/list.hm?');
					} 
				} */
			
				
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
	<li><b><a href="#secondPage">게임 소개</a></b></li><br>
	<li><b><a href="#3rdPage">챔피언 리스트</a></b></li><br>
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
	

	<div class="section" style="background-color:black;">
		<div id="gameinfo">
				
		</div>
	</div>
	
	<div class="section">
		<div class="3rdSectionImage" style="width: 1920px; height: 930px; background-color: black;">
			<a href="/PK_LOL_Sim_Site/champ/champList.hm" id="champListImg" 
			style="width: 1920px; height: 930px;">
				<img alt="hexagonChampList" src="./resources/images/hexagonChampList.jpg" 
				style="width: 1000px; height: 500px; position: absolute; top: 22%; left: 25%;">
			</a>
		</div>
	</div>


	<div class="section"  style="background-color:black;" >
	<div id="board2">
		
	
		<div id="board">
		
			<div id="board_table">
				
				<table id="btable">
					<tr>
						<td width="150" height="80">
						
						</td>
						
						<td width="150" height="80">
						
						</td>
						
						<td width="150" height="80">
						
						</td>
						
						<td width="150" height="80">
						
						</td>
					
					</tr>
				
				
					<tr>
						<td>
						<a href="./board/list.hm">게시판 리스트로 가기</a><br>
						<font style="font-size: 11px; color: black;">자유롭게 의견을 나누세요.</font>
						</td>
						
						<td>
						
						</td>
						
						<td>
						
						</td>
						
						<td>
						
						</td>
					
					</tr>
					
					<tr>
						<td>
						 
						</td>
						
						<td>
						
						</td>
						
						<td>
						
						</td>
						
						<td>
						
						</td>
					
					</tr>
					
					<tr>
						<td>
						
						</td>
						
						<td>
						
						</td>
						
						<td>
						
						</td>
						
						<td>
						
						</td>
					
					</tr>
					
					<tr>
						<td>
						
						</td>
						
						<td>
						
						</td>
						
						<td>
						
						</td>
						
						<td>
						
						</td>
					
					</tr>
				
				
				
				</table>
			
			
			</div>
					
				
		</div>
	</div>
			
	</div>	
</div>
</body>
</html>
