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
<script type="text/javascript">
function check(f){
	if(f.pass.value != f.pass2.value){
	alert("새 비밀번호가 다릅니다. 다시 확인해주세요.");
		f.pass.value='';
		f.pass2.value='';
		f.pass.focus();
		return false;
	}
	return true;//true 가 반환되면 액션파일 호출
}
</script>
</head>
<body>
가맹점 회원 수정 폼
	<form action="update.do?num=${dto.num}" method="post" onsubmit="return check(this)">
		가맹점 회원 아이디 : 
			<input type="text" name="id" value="${dto.id}" disabled><br>

<!-- 
		가맹점 회원 현재 비밀번호 : 
			<input type="password" name="pass-original" required><br>
 -->			
			
		가맹점 회원 새 비밀번호 : 
			<input type="password" name="pass" required><br>
		
		가맹점 회원 새 비밀번호 확인 : 
			<input type="password" name="pass2" required><br>
<!-- 
		가맹점 지역 : 
			<input type="text" name="sarea" required><br>
			
		가맹점명 : 
			<input type="text" name="sname" required><br>
	 -->		
		가맹점 num : 
			<input type="text" name="snum" value="${dto.snum}" required><br>
			
		<button type="submit">수정하기</button>
		<button type="button" onclick="location.href='list.do'">취소하기</button>
	</form>
</body>
</html>
