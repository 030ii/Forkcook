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
<form action="myupdatedone.do?num=${loginInfo.num}" method="post" class="myUpdate_form">	
<span class="myinfo-title">내 정보 수정</span>	
<c:forEach var="dto" items="${list}" varStatus="status">
	<table class="uk-table uk-table-responsive uk-table-divider myinfoUpdate_table">
		<tr>
			<th>아이디</th>
			<td><input type="text" value="${dto.id}" readonly="readonly" class="updateInput uk-input uk-form-width-medium"></td>
		</tr>
		<tr>
			<th>새 비밀번호</th>
			<td><input type="password" name="pass" size="8" id="pass" placeholder="새로운비밀번호" value="${dto.pass }" onkeyup="check()" required="required" class="updateInput uk-input uk-form-width-medium"></td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td>
				<input type="password" name="pass2" size="8" id="pass2" placeholder="비밀번호확인" value="${dto.pass }" onkeyup="check1()" required="required" class="updateInput uk-input uk-form-width-medium">
				<div id="pwUpdate-msg"></div>
			</td>
		</tr>
		<tr>
			<th>이름(닉네임)</th>
			<td><input type="text" value="${dto.name}" name="name" required="required" class="updateInput uk-input uk-form-width-medium"></td>
		</tr>
		<tr>
			<th>핸드폰</th>
			<td><input type="text" value="${dto.phone}" name="phone" required="required" class="updateInput uk-input uk-form-width-medium"></td>
		</tr>
	</table>
</c:forEach>
	<input type="hidden" name="num" value="${dto.num }">
	<button type="submit" disabled="disabled" id="update_btn" class="myinfoUpdate_btn uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom">수정완료</button>
	<button type="button" onclick="history.back()" class="myinfoCancle_btn uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom">취소</button>
</form>

<script type="text/javascript">
//pass랑 pass2 비번체크 함수(비밀번호입력(첫번째 비번)칸에 대한것)
function check(){
	var pass = document.getElementById('pass').value;
	var pass2 = document.getElementById('pass2').value;
	//console.log(pass);
	if(pass != pass2){
		document.getElementById('pwUpdate-msg').style.color = "#e30d0d";
		document.getElementById('pwUpdate-msg').innerHTML = "동일한 암호를 입력하세요";
		$("#update_btn").attr("disabled","disabled");
	  }else{
		document.getElementById('pwUpdate-msg').style.color = "#2b43b9";
		document.getElementById('pwUpdate-msg').innerHTML = "&nbsp;&nbsp;암호가 확인 되었습니다"; 

		$("#update_btn").removeAttr("disabled");
	}
}

//pass랑 pass2 비번체크 함수(비밀번호입력'확인'칸 대한것)
function check1(){
	var pass = document.getElementById('pass').value;
	var pass2 = document.getElementById('pass2').value;
	//console.log(pass);
	if(pass != pass2){
		document.getElementById('pwUpdate-msg').style.color = "#e30d0d";
		document.getElementById('pwUpdate-msg').innerHTML = "동일한 암호를 입력하세요";
		$("#update_btn").attr("disabled","disabled");
	  }else{
		document.getElementById('pwUpdate-msg').style.color = "#2b43b9";
		document.getElementById('pwUpdate-msg').innerHTML = "&nbsp;&nbsp;암호가 확인 되었습니다"; 

		$("#update_btn").removeAttr("disabled");
	}
}
</script>
</body>
</html>