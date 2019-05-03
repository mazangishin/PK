<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>



</head>
<body>

	<c:if test="${boardList != null}">
				데이터 있음
	</c:if>

	<c:if test="${boardList == null}">
				데이터 업ㅂ음
	</c:if>
</body>
</html>