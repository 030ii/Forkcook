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
메뉴 추가 폼
	<!-- <form action="write.do" method="post" enctype="multipart/form-data">  -->
	<form action="write.do" method="post">
		메뉴 이름 : 
			<input type="text" name="name" required><br>

		메뉴 종류 : 
			<select name="category" required>
				<option value="">종류 선택</option>
				<option value="파스타">파스타</option>
				<option value="피자">피자</option>
				<option value="스테이크">스테이크</option>
				<option value="샐러드">샐러드</option>
				<option value="디저트">디저트</option>
				<option value="음료">음료</option>
			</select><br>
			
		메뉴 인분 : 
			<input type="text" name="persons" required><br>
			
		메뉴 가격 :
			<input type="text" name="price" required><br>	
		
		메뉴 메인사진 :
			<input type="text" name="mainimage" value="test.png" required><br><!-- TODO : 추후 이미지 업로드 붙일 것 -->
			
		메뉴 요약 : 
			<input type="text" name="shortmsg" required><br>
		
		메뉴 상세사진 :
			<input type="text" name="longimage" value="test.png" required><br><!-- TODO : 추후 이미지 업로드 붙일 것 -->
		
		<button type="submit">추가하기</button>
		<button type="button" onclick="location.href='list.do'">취소하기</button>
	</form>
</body>
</html>
