<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

매장 추가 폼
	<!-- <form action="write.do" method="post" enctype="multipart/form-data">  -->
	<form action="write.do" method="post">
		매장명 : 
			<input type="text" name="name" placeholder="포크쿡 OO점" required><br>

		지역 : 
			<select name="area" required>
				<option value="">지역 선택</option>
				<option value="강원">강원</option>
				<option value="경기">경기</option>
				<option value="대구">대구</option>
				<option value="부산">부산</option>
				<option value="서울">서울</option>
				<option value="인천">인천</option>
				<option value="제주">제주</option>
				<option value="충청">충청</option>
			</select><br>
			
		주소 : 
			<input type="text" name="addr" required><br>
			
		매장 전화번호 :
			<input type="text" name="phone" required><br>	
		
		매장 메인 사진 :
			<input type="text" name="mainimage" value="test.png" required><br><!-- TODO : 추후 이미지 업로드 붙일 것 -->
		
		매장 지도 사진 :
			<input type="text" name="mapimage" value="test.png" required><br><!-- TODO : 추후 이미지 업로드 붙일 것 -->
		
		운영 시간 : 
			<input type="text" name="opertime" required><br>
			
		매장 요약 : 
			<input type="text" name="shortmsg" required><br>
		
		매장 설명 :
			<input type="textarea" name="longmsg" required><br>
		
		<button type="submit">추가하기</button>
		<button type="button" onclick="location.href='list.do'">취소하기</button>
	</form>
