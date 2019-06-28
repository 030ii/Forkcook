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
게시글 입니다 <br>
<pre>
제목 : 제목제목제목
등록 날짜 : 2019년 6월 27일
가맹점 : 강남점 
내용 : 오픈했습니다
사진 : 사진
</pre>
<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href='${root}/notice/list.do'">목록 보기</button>
<br>
<br>
아래 버튼은 가맹점주나 관리자 페이지에서 구현될 버튼들입니다<br>
<button type="button" onclick="location.href='${root}/notice/updateform.do'">게시글 수정(수정폼으로 이동)</button>
<button type="button" onclick="location.href='${root}/notice/delete.do'">게시글 삭제(삭제 후 목록으로 이동)</button>
</body>
</html>
