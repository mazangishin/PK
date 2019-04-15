<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<meta charset="UTF-8">

<style type="text/css">

#menu2{
		position:fixed; z-index: 100;
		top:0; right:0px; width: 100%; height: 45px;
		padding: 0; margin: 0 auto;
		background: black; text-align: center; overflow: hidden;		
	}
	
	#munu2_bt{
		position:fixed; z-index: 150;
		top:1%; left:45%; width: 100%; height: 25px;
		padding: 0; margin: 50 auto;
		text-align: center; overflow: hidden;
		color: white;
	}
	#login_bt{
 	background-color:black;
	color: white;
	}
	#logout_bt{
 	background-color:black;
	color: white;
	}

</style>


	<div id="menu2">
		<div id="munu2_bt">
			
			<span>
				<c:if test="${sessionScope._memberVo_ != null}">
					${sessionScope._memberVo_.name}
					<a href="${pageContext.request.contextPath}/auth/logout.do"	style="color:white;">
						로그아웃
					</a>
				</c:if>
				<c:if test="${sessionScope._memberVo_ == null}">
					게스트1
					<a href="${pageContext.request.contextPath}/auth/logout.do"	style="color:white;">
						나가기
					</a>
				</c:if>
				
			</span>
			
		</div>
	</div>


