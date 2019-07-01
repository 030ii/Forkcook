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
<!-- 
회원 : 아이디랑 비번 체크해서 로그인성공/실패 나누기 ->성공시 메인화면
비회원 : 로그인하면 회원데이타 저장하고 장바구니로 이동
-->

데이터 갯수 : ${totalCount }
<form action="login1.do" method="get">
	아이디 : <input type="text" name="id" size="7"><br>
	비밀번호 : <input type="password" name="pass" size="7"><br>
	<input type="submit" value="회원으로 로그인">
</form>
<a href="${root}/user/membership.do">회원가입하기</a>
<hr>
비회원 주문조회
<!-- (로그인과 동시에 회원정보 테이블에 insert) -->
<form action="login2.do" method="get">
	핸드폰 : <input type="text" name="phone" size="7"><br>
	이름 : <input type="text" name="name" size="7"><br>
	<input type="submit" value="비회원으로 로그인">
</form>
</body>
</html>