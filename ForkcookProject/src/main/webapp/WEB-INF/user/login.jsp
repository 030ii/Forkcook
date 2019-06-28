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
<c:set var="root" value="<%=request.getContextPath()%>"/>
회원로그인폼
<form action="logingo.do" method="get">
	아이디 : <input type="text" name="id" size="7"><br>
	비밀번호 : <input type="password" name="pass" size="7"><br>
	<input type="submit" value="회원으로 로그인">
</form>
<a href="${root}/user/membership.do">회원가입하기</a>
<hr>
비회원 주문조회
<!-- (로그인시 회원정보 테이블에 insert) -->
<form action="logingo.do" method="get">
	핸드폰 : <input type="text" name="hp" size="7"><br>
	이름 : <input type="password" name="pass" size="7"><br>
	<input type="submit" value="비회원으로 로그인">
</form>
</body>
</html>