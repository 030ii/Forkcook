<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
회원가입 폼
<form action="signupform.do" method="get">
	<table border="1">
	<caption></caption>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" size="7"></td>
	</tr>
	<tr>
		<th>이름(닉네임)</th>
		<td><input type="text" name="name" size="7"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pass" size="7"></td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td><input type="text" name="phone" size="7"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="가입완료"></td>
	</tr>
	</table>
</form>
</body>
</html>