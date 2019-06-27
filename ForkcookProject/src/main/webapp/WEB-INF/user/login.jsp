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
로그인폼
<form action="logingo.do" method="get">
	아이디 : <input type="text" name="id" size="7"><br>
	비밀번호 : <input type="password" name="pass" size="7"><br>
	<input type="submit" value="서버로 전송">
</form>
</body>
</html>