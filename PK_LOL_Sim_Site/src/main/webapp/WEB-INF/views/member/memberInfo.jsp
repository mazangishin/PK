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
	function memberUpdateFnc() {
		location.href = "/member/memberUpdate.hm";
	}
	function withdrawalFnc() {
		location.href = "/member/memberDelete.hm";
	}
</script>
</head>
<body>
	
	<div>
		<h1>회원정보</h1>
		<form action="/member/memberInfo.hm" method="get">
		<input type="hidden" name='no' value='${memberVo.memberNumber}'>
		ID: <input type="text" name='id' readonly="readonly" 
				id='memberId' value='${memberVo.memberId}'><br>
		이메일: <input type="text" name="eMail" value='${memberVo.eMail}'>
			<br>
		가입일: <fmt:formatDate value="${memberVo.createDate}"
				pattern="yyyy-MM-dd" /><br>
		최종수정일: <fmt:formatDate value="${memberVo.modifiedDate}"
				pattern="yyyy-MM-dd" /><br>
		<c:set var="authority" value="${memberVo.authority}"/>
		<c:if test="authority == y">관리자입니다.</c:if>
		<input type="submit" value="수정하기" onclick="memberUpdateFnc();">
		<input type="button" value="돌아가기" onclick="pageMoveListFnc();">
		<input type="button" value="회원탈퇴" onclick="withdrawalFnc();">
	</form>
	</div>

</body>
</html>