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
공지 작성 페이지<br>
가맹점이나 관리자만 접근 가능한 페이지 입니다<br>
<br>
<br>

제목 : <input type="text">
<br>

가맹점 : 
<select>
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
<button type="button" onclick="location.href='${root}/board/list.do'">취소하기(목록으로 가기)</button>
<button type="button" onclick="location.href='${root}/board/write.do'">작성하기(작성한 글 페이지로 감)</button>
</body>
</html>
