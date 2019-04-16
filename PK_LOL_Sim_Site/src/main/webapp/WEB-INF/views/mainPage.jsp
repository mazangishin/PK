<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>one page - wheel sliding move</title>	
	
	<meta charset=UTF-8>
	<meta name="viewport" content="width=device-width"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
	
		
	
	</script>



		
	<script>		
		$(document).ready(function() {
			
			
			
			
			$('#fullpage').fullpage({
				
				anchors: ['firstPage', 'secondPage', '3rdPage', '4thpage', 'lastPage'],
				menu: '#menu',
				//equivalent to jQuery `easeOutBack` extracted from http://matthewlein.com/ceaser/
				easingcss3: 'cubic-bezier(0.175, 0.885, 0.320, 1.275)'
			});
			
			
			$("#menu>li").click(function(){
				$(this).addClass("act").siblings().removeClass("act");
			});
			
			
		});	
	</script>	
	<style>
	#fullpage>div	{text-align:center;}
	
	
	#menu2 lnput{color: white; top:10px; padding: 41px 20px;}
	
	
	

	
	
	#menu li 		{display:inline-block;}
	#menu li a		{text-decoration:none; color: #EDBB6A;  padding: 41px 20px; display:block;}
	#menu{
		position:fixed; z-index: 500;
		top:0; left:0; width: 200px; height: 100%;
		padding: 0; margin: 0 auto;
		background-image:url(/PK_LOL_Sim_Site/resources/images/l_menu_img.png); text-align: center; overflow: hidden;		
	}
	#menu li:hover	{background: rgba(255,255,255, 0.2);}
	#menu>.act 		{background:rgba(255,255,255, 0.1);}
	#menu>.act>a:hover 	{color:black;}
	#menu>.act>a 		{color:white;}
	
	
	#logo{
		position:fixed; z-index: 550;
		top:15px; left:15px; width: 220px; height: 200px;
		padding: 0; margin: 0 auto;
	}
	
	#bttt{
	top:10%; left:0; width: 145px; height: 145px;
	border: 0px; 
	background: rgba(255,255,255, 0);
	
 	
 
	 border-top-left-radius: 15px; 
  	border-top-right-radius: 15px; 
  	border-bottom-left-radius: 15px; 
  	border-bottom-right-radius: 15px; 
	}
	
	#play_bt{
		position:fixed;
		z-index: 250;
		width: 145px; height: 145px;
		padding: 0; 
		top:30%; left:47%;
		margin: 0 auto;
	}
	 #ft_img{
		position: absolute;
		background-image:url(/PK_LOL_Sim_Site/resources/images/tt_img.png);
		position:fixed; z-index: 200;
		top:-15%; left:0%; width: 100%; height: 100%;
		padding: 0; margin: 0 auto;
		
	} 
	
	#video { 
     position: absolute;
     top: -12%;
     left: 0%;
     width: 100%;
     height: 100%;
   
     z-index: 10;
     overflow: hidden;
     background-color: black;
	}
	
	#mouseimg{
		position:fixed; z-index: 700;
		top:75%; left:47%; width: 180px; height: 150px;
		padding: 0; margin: 0 auto;
		
		text-align: center; overflow: hidden;	
	}


	.box {
	width:224px;
	height : 0;
	position: absolute;
	left : 50;
	top : 0;
	}

	.yt-w{display:none}
	.yt-pop{position:fixed;top:-15%;left:0;bottom:0;right:0;margin:auto;width:800px;height:600px;background:#000;z-index:339}
	.close{text-align:center; color:white; display:block;position:absolute;top:-30px;right:0;width:65px;height:30px; background-color: black;}

	
	
   
	
	</style>
	
	
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/PageHeader.jsp" />


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




<ul id="menu3">
	<li><a href="#firstPage">00000</a></li><br>
</ul>


<jsp:include page="/WEB-INF/views/Tail.jsp" />

<div id="fullpage">

	

	<div class="section" id="mainp">
	
	<div id="mouseimg">
		<img src="/PK_LOL_Sim_Site/resources/images/scroll.png" width="30">
		
		
		<div class="box">
		<img src="/PK_LOL_Sim_Site/resources/images/boll.png" width="15">
		<button id="run">띠용</button>
		</div>
		
	</div>
	
	
	<div id="ft_img">
	
	</div>
	
	
	<div id=video>
		<video muted autoplay loop plays-inline id="video-background" width="1980" height="1300">
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
	
	<div class="section">11111</div>
	<div class="section">22222</div>
	<div class="section">33333</div>	
	<div class="section">
	
	</div>

</body>
</html>
