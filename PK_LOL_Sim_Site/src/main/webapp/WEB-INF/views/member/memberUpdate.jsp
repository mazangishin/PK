<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function backToPrePageFnc() {
		location.href = "/member/memberInfo.hm";		
	}
</script>
<title>회원 정보 수정</title>
</head>
<body>
	<div id="container">
		<form action="/member/memberUpdate.hm" method="post">
			ID : <input type="text" name="memberId" 
					value="${sessionScope.memberVo.memberId}" 
					readonly="readonly"><br>
			비밀번호 : <input type="text" name="password"
					value="${sessionScope.memberVo.password}"><br>
			E-메일 :	<input type="text" name="eMail"
					value="${sessionScope.memberVo.eMail}"><br>
			가입일 : ${sessionScope.memberVo.createDate}<br>
			최종수정일 : ${sessionScope.memberVo.modifiedDate}<br>
			<input type="submit" value="수정" class="UpdateButton">
			<input type="button" value="돌아가기" class="UpdateButton"
				onclick="backToPrePageFnc();">
		</form>
	</div>
</body>
</html>