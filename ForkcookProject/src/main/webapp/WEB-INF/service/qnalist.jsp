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
qna list입니다<br>
매장별 보기 : 전체 | 강남점 | 분당점 | 삼성점<br>
문의글 검색하기<br>
<a href="content.do">문의 클릭</a><br>
<a href="content.do">문의 클릭</a><br>
<a href="content.do">문의 클릭</a><br>
<a href="content.do">문의 클릭</a><br>
페이징 처리
<br>
<br>
<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href='${root}/qna/form.do'">문의 작성</button>
</body>
</html>