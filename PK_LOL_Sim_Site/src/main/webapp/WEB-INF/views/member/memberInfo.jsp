<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<script type="text/javascript">
	function pageMoveMainFnc() {
		var url = "/PK_LOL_Sim_Site/mainPage.hm";
		location.href = url;
	}
	function withdrawalFnc(memberNumber) {
		var url = "/PK_LOL_Sim_Site/member/memberDelete.hm?memberNumber=" + memberNumber;
		location.href = url;
	}
</script>

<style type="text/css">
	body {
		background-image: linear-gradient(rgba(0,0,0,0.1), rgba(0,0,0,0.1)), 
						url(/PK_LOL_Sim_Site/resources/images/kda.jpg);
		background-repeat: no-repeat;
		background-size: cover;
		margin: 0px;
		padding: 0px;
		height: 100vh;
		font-family: sans-serif;
		opacity: 0.8;
	}
	#box {
		position:absolute;
		top:50%;
		left:50%;
		transform: translate(-50%, -50%);
		width: 350px;
		height: 650px;
		padding: 15px 40px 15px 40px;
		background: #353535;
		text-align: center;
		color: #F7EA6E;
	}
	#box h1 {
		color: #F7EA6E;
	}
	.inputArea {
		border: 2px solid #F7EA6E;
		background: none;
		display: block;
		margin: 15px auto;
		text-align: center;
		width: 200px;
		height: 30px;
		outline: none;
		color: white;
		border-radius: 24px;
		transition: 0.25s;
	}	
	.inputArea:focus {
		width: 300px;
		border-color: #EDD200;
	}
	.inputButton {
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
	.inputButton:hover {
		background: #B778FF;
	}
</style>	
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/PageHeader.jsp" />
	
	<div id="box">
		<div>
			<h1>회원정보</h1>
		</div>
		<div>
			<form action="memberUpdate.hm" method="post">
				<div>
					<input type="hidden" name='no' class="inputArea"
					value='${memberVo.memberNumber}'/>
				</div>
				<div>
					<span>ID:</span> 
				</div>
				<div>
					<input type="text" name='id' readonly="readonly" class="inputArea"
						id='memberId' value='${memberVo.memberId}'/>
				</div>
				<div>
					<span>이메일:</span> 
				</div>
				<div>
					<input type="text" name="eMail" class="inputArea"
						value='${memberVo.email}'/>
				</div>
				<div>
					<span>가입일:</span>
				</div>
				<div>
					<input type="text" name="createDate" class="inputArea"
					 value="<fmt:formatDate value="${memberVo.createDate}"/>"
					 readonly="readonly"/>
				</div>
				<div>
					<span>최종수정일:</span>
				</div>
				<div>
					<input type="text" name="createDate" class="inputArea"
					 value="<fmt:formatDate value="${memberVo.modifiedDate}"/>"
					 readonly="readonly"/>
				</div>
				<div>
					<c:set var="authority" value="${memberVo.authority}"/>
					<c:if test="${authority eq 'Y'}">
						 <c:out value="관리자" />
					</c:if>
					<c:if test="${authority ne 'Y'}">
						 <c:out value="일반회원" />
					</c:if>
				</div>
				<div>
					<input type="submit" value="수정하기" class="inputButton">
				</div>
				<div>
					<input type="button" value="회원탈퇴" class="inputButton" 
					onclick="withdrawalFnc(${memberVo.memberNumber});">
				</div>
				<div>
					<input type="button" value="돌아가기" class="inputButton" 
					onclick="pageMoveMainFnc();">	
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/Tail.jsp" />

</body>
</html>