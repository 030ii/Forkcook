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
<form action="" method="post">
  <table border=1>
		<tr>
			<th>id</th>
			<td>${dto.id}</td>
		</tr>
		<tr>
			<th>pass</th>
			<td>${dto.pass}</td>
		</tr>
		<tr>
			<th>name(nickname)</th>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<th>phone</th>
			<td>${dto.phone}</td>
		</tr>
  </table>
	<button type="submit">수정</button>
	<button type="button" onclick="history.back()">취소</button>
</form>
</body>
</html>