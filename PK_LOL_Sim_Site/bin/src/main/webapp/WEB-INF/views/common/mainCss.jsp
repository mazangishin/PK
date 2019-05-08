<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>



<meta charset="UTF-8">

<style>
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
		top:45%; left:47%;
		margin: 0 auto;
	}

	
	
 	#video { 
     position: absolute;
     top: 0%;
     left: 0%;
     width: 100%;
     height: 100%;
   
     z-index: 10;
     overflow: hidden;
     background-color: black;
	} 
	
	 #mouseimg{
		position:fixed; z-index: 700;
		top:85%; left:47%; width: 180px; height: 150px;
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
 
	
	
	
	
	
	
	

	#pageBox{
		 position: absolute;
	     top: 88%;
	     left: 20%;
	     width: 1150;
	     height: 10%;
	   
	     z-index: 11;
	     color:white;
	  	 background-color: yellow;
	  	 display: inline-block;
		}
		
	#pageBox a {
		  color: black;
		  float: left;
		  padding: 8px 16px;
		  text-decoration: none;
		}
		
	#pageBox a.active {
		  background-color: #4CAF50;
		  color: white;
		  border-radius: 5px;
		}
		
	#pageBox a:hover:not(.active) {
		  background-color: #ddd;
		  border-radius: 5px;
		}
	
		
	#board{
	 position: absolute;
     top: 5%;
     left: 25%;
     width: 75%;
     height: 90%;
   
     z-index: 10;
     overflow:scroll;
	 overflow-x:hidden; 
    
     color:white;
  	 background-color: green;
	}	
	
		
	#customers{
	border-style: solid; border-color: black;
	}
	#customers tr td{
	border-style: solid; border-color: black;
	}
	
	#suDiv{
	text-align: center;
	
	}
	
	#suDiv2{
	top: 90%;
	}
	
	#first{
	margin:0 0 29px 0;padding:0 10px;font-size:16px;line-height:20px;}
	{
	

</style>


</head>

</html>