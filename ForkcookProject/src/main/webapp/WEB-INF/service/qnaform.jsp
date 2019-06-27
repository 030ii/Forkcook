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
qna 작성 페이지
<br>
<br>

문의 제목 : <input type="text">
<br>

가맹점 선택 : 
<select>
	<option>전체</option>
	<option>강남점</option>
	<option>분당점</option>
</select>
<br>

내용 : 
<textarea></textarea>
<br>

사진 업로드 :
<input>
<br>

<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href='${root}/qna/list.do'">취소하기(목록으로 가기)</button>
<button type="button" onclick="location.href='${root}/qna/write.do'">작성하기(작성한 글 페이지로 감)</button>
</body>
</html>
