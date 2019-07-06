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
메뉴 수정 폼
	<!-- <form action="update.do" method="post" enctype="multipart/form-data">  -->
	<form action="update.do?num=${dto.num}" method="post">
		메뉴 이름 : 
			<input type="text" name="name" value="${dto.name}" required><br>

		메뉴 종류 : 
			
			<select name="category" required>
				<option value="">종류 선택</option>
				<option value="파스타" <c:if test="${dto.category=='파스타'}">selected</c:if>>파스타</option>
				<option value="피자" <c:if test="${dto.category=='피자'}">selected</c:if>>피자</option>
				<option value="스테이크" <c:if test="${dto.category=='스테이크'}">selected</c:if>>스테이크</option>
				<option value="샐러드" <c:if test="${dto.category=='샐러드'}">selected</c:if>>샐러드</option>
				<option value="디저트" <c:if test="${dto.category=='디저트'}">selected</c:if>>디저트</option>
				<option value="음료" <c:if test="${dto.category=='음료'}">selected</c:if>>음료</option>
			</select><br>
			
		메뉴 인분 : 
			<input type="text" name="persons" value="${dto.persons}" required><br>
			
		메뉴 가격 :
			<input type="text" name="price" value="${dto.price}" required><br>	
		
		메뉴 사진 :
			<input type="text" name="image" value="${dto.image}" required><br><!-- TODO : 추후 이미지 업로드 붙일 것 -->
			
		메뉴 요약 : 
			<input type="text" name="shortmsg" value="${dto.shortmsg}" required><br>
		
		메뉴 설명 :
			<input type="textarea" name="longmsg" value="${dto.longmsg}" required><br>
		
		<input type="hidden" name="num" value="${dto.num}">
		<input type="hidden" name="rate" value="${dto.rate}">
		<button type="submit">수정하기</button>
		<button type="button" onclick="location.href='list.do'">취소하기</button>
	</form>
</body>
</html>
