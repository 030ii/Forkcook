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
공지 수정 페이지<br>
가맹점이나 관리자만 접근 가능한 페이지 입니다<br>
아래 폼에 값들이 채워있어야 합니다
<br>
<br>

제목 : <input type="text" value="제목제목">
<br>

가맹점 : 
<select>
	<option>강남점</option>
	<option>분당점</option>
</select>
<br>

내용 : 
<textarea>내용내용</textarea>
<br>

사진 업로드 :
<input>
<br>

<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href='${root}/board/list.do'">취소하기(목록으로 가기)</button>
<button type="button" onclick="location.href='${root}/board/update.do'">수정하기(수정한 글 페이지로 감)</button>

</body>
</html>
