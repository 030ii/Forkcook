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
제목 : ${dto.subject}
등록 날짜 : ${dto.writeday}
가맹점 : 강남점 
내용 : ${dto.content}
사진 : ${dto.image}
</pre>
<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" class="btn btn-info btn-sm"
	  onclick="location.href='${root}/qna/list.do'">목록</button>
<button type="button" class="btn btn-success btn-sm"
	  onclick="location.href='updateform.do?num=${dto.num}&pageNum=${pageNum}'">수정</button>
<button type="button" class="btn btn-danger btn-sm"
	  onclick="location.href='delete.do?num=${dto.num}&pageNum=${pageNum}'">삭제</button>
</body>
</html>