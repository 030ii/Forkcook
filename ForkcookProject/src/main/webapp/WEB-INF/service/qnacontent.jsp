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
문의글 입니다 <br>
<pre>
제목 : 결제가 안됩니다 살려주세용
등록 날짜 : 2019년 6월 27일
가맹점 : 강남점 
내용 : 주문 하고 싶은데 결제에서 오류가 나용... 피자 먹고싶어요..
사진 : 사진
</pre>
<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href='${root}/qna/list.do'">목록 보기</button>
<button type="button" onclick="location.href='${root}/qna/updateform.do'">문의 수정(수정폼으로 이동)</button>
<button type="button" onclick="location.href='${root}/qna/delete.do'">문의 삭제(삭제 후 목록으로 이동)</button>
</body>
</html>
