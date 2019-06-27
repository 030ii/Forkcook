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
qna 수정 페이지
<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href=">취소하기</button>
<button type="button" onclick="location.href='${root}/qna/edit.do'">수정하기</button>
</body>
</html>
