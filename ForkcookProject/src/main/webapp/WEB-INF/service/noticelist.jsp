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
총 <strong>${totalCount}</strong> 개의 글이 있습니다<br>
공지사항 게시판 페이지 입니다<br>
매장별 보기 : 전체 | 강남점 | 분당점 | 삼성점<br>
게시글 검색하기<br>
<a href="content.do">게시글 클릭</a><br>
<a href="content.do">게시글 클릭</a><br>
<a href="content.do">게시글 클릭</a><br>
<a href="content.do">게시글 클릭</a><br>
페이징 처리

<br><br>
아래 버튼은 가맹점주나 관리자 페이지에서 구현될 버튼들입니다<br>
<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href='${root}/notice/form.do'">게시글 작성</button>
</body>
</html>