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
매장 수정 폼
	<!-- <form action="update.do" method="post" enctype="multipart/form-data">  -->
	<form action="update.do?num=${dto.num}" method="post">
		매장명 : 
			<input type="text" name="name" value="${dto.name}" required><br>
		
		지역 : 
			<select name="area" required>
				<option value="">지역 선택</option>
				<option value="강원" <c:if test="${dto.area=='강원'}">selected</c:if>>강원</option>
				<option value="경기" <c:if test="${dto.area=='경기'}">selected</c:if>>경기</option>
				<option value="대구" <c:if test="${dto.area=='대구'}">selected</c:if>>대구</option>
				<option value="부산" <c:if test="${dto.area=='부산'}">selected</c:if>>부산</option>
				<option value="서울" <c:if test="${dto.area=='서울'}">selected</c:if>>서울</option>
				<option value="인천" <c:if test="${dto.area=='인천'}">selected</c:if>>인천</option>
				<option value="제주" <c:if test="${dto.area=='제주'}">selected</c:if>>제주</option>
				<option value="충청" <c:if test="${dto.area=='충청'}">selected</c:if>>충청</option>
			</select><br>
			
		주소 : 
			<input type="text" name="addr" value="${dto.addr}" required><br>
			
		매장 전화번호 :
			<input type="text" name="phone" value="${dto.phone}" required><br>	
		
		매장 메인 사진 :
			<input type="text" name="mainimage" value="${dto.mainimage}" required><br><!-- TODO : 추후 이미지 업로드 붙일 것 -->
		
		매장 지도 사진 :
			<input type="text" name="mapimage" value="${dto.mapimage}" required><br><!-- TODO : 추후 이미지 업로드 붙일 것 -->
		
		운영 시간 : 
			<input type="text" name="opertime" value="${dto.opertime}" required><br>
			
		메뉴 요약 : 
			<input type="text" name="shortmsg" value="${dto.shortmsg}" required><br>
		
		메뉴 설명 :
			<input type="textarea" name="longmsg" value="${dto.longmsg}" required><br>
		
		<input type="hidden" name="num" value="${dto.num}">
		<button type="submit">수정하기</button>
		<button type="button" onclick="location.href='list.do'">취소하기</button>
	</form>
</body>
</html>
