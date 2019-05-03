<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style type="text/css">

nav > ul {
	list-style-type: none;
	padding: 0px;
	overflow: hidden;
	background-color: #333333;
	display: table;
	margin-left: auto;
	margin-right: auto;
}

nav > ul > li{
	float: left;
}

nav > ul > li > a{
	display: block;
 	color: white; 
	text-align: center;
	padding: 16px;
	text-decoration: none;
}

nav > ul > li > a:hover{
	color: #FFD9EC;
	background-color: #5D5D5D;
	font-weight: bold;
}

.active{
	color: #FFD9EC;
	background-color: #5D5D5D;
	font-weight: bold;
}
</style>

<script type="text/javascript" 
	src="/springHome/resources/js/jquery-3.3.1.js"></script>

<script type="text/javascript">


</script>
	
	<div>
	<nav>
		<ul>
		
			<li>
				<a href="#" 
				onclick="띠용">
				<span>≪</span>
				</a>
			</li>
			
			
			
				<li id="pageButton">
					<a href="#" onclick="호우;">
					</a>
				</li>
				
		

			<li><a href="#" 
				onclick="끼횰">
				<span>≫</span></a>
			</li>
		</ul>
	</nav>
</div>