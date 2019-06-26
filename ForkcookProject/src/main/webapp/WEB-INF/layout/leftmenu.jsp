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
<style type="text/css">
	ul.menu li{
		list-style: none;
		padding: 10px;
		border: 5px solid pink;
		margin-bottom: 20px;
		border-radius:30px;
		width: 180px;
		background: #ffc0cb;
	}
	ul.menu li:hover{
		background: #b0e0e6;
	}
</style>

</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<ul class="menu">
		<li>
			<a href="${root}/main.do">Home</a>
		</li>
		<li>
			<a href="${root}/member/form.do">회원가입</a>
		</li>
		<li>
			<a href="${root}/board/list.do">게시판</a>
		</li>
		<li>
			<a href="${root}/guest/list.do">방명록</a>
		</li>
	</ul>
</body>
</html>
