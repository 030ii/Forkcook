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
문의 수정 페이지<br>
아래 폼에 값들이 채워있어야 합니다
<br>
<br>

제목 : <input type="text" value="제목제목도와주세요">
<br>

가맹점 : 
<select>
	<option>강남점</option>
	<option>분당점</option>
</select>
<br>

내용 : 
<textarea>문의내용내용</textarea>
<br>

사진 업로드 :
<input>
<br>

<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href='${root}/qna/list.do'">취소하기(목록으로 가기)</button>
<button type="button" onclick="location.href='${root}/qna/update.do'">수정하기(수정한 문의글 페이지로 감)</button>

</body>
</html>
