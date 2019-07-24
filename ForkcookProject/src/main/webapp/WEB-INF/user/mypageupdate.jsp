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
<form action="myupdatedone.do?num=${loginInfo.num}" method="post">
<c:forEach var="dto" items="${list}" varStatus="status">
	<table border=1>
		<tr>
			<th>id</th>
			<td><input type="text" value="${dto.id}" readonly="readonly"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pass" size="8" id="pass" placeholder="새로운비밀번호" value="${dto.pass }" onkeyup="check()" required="required"></td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td><input type="password" name="pass2" size="8" id="pass2" placeholder="비밀번호확인" value="${dto.pass }" onkeyup="check1()" required="required">
				비번확인:<div id="pwchk"></div></td>
		</tr>
		<tr>
			<th>name(nickname)</th>
			<td><input type="text" value="${dto.name}" name="name" required="required"></td>
		</tr>
		<tr>
			<th>phone</th>
			<td><input type="text" value="${dto.phone}" name="phone" required="required"></td>
		</tr>
	</table>
</c:forEach>
	<input type="hidden" name="num" value="${dto.num }">
	<button type="submit" disabled="disabled" id="update_btn">수정완료</button>
	<button type="button" onclick="history.back()">취소</button>
	</form>
<script type="text/javascript">
//pass랑 pass2 비번체크 함수(비밀번호입력(첫번째 비번)칸에 대한것)
function check(){
	var pass = document.getElementById('pass').value;
	var pass2 = document.getElementById('pass2').value;
	//console.log(pass);
	if(pass != pass2){
		document.getElementById('pwchk').style.color = "red";
		document.getElementById('pwchk').innerHTML = "동일한 암호를 입력하세요.";
		$("#update_btn").attr("disabled","disabled");
	  }else{
		document.getElementById('pwchk').style.color = "black";
		document.getElementById('pwchk').innerHTML = "암호가 확인 되었습니다."; 

		$("#update_btn").removeAttr("disabled");
	}
}

//pass랑 pass2 비번체크 함수(비밀번호입력'확인'칸 대한것)
function check1(){
	var pass = document.getElementById('pass').value;
	var pass2 = document.getElementById('pass2').value;
	//console.log(pass);
	if(pass != pass2){
		document.getElementById('pwchk').style.color = "red";
		document.getElementById('pwchk').innerHTML = "동일한 암호를 입력하세요.";
		$("#update_btn").attr("disabled","disabled");
	  }else{
		document.getElementById('pwchk').style.color = "black";
		document.getElementById('pwchk').innerHTML = "암호가 확인 되었습니다."; 

		$("#update_btn").removeAttr("disabled");
	}
}
</script>
</body>
</html>