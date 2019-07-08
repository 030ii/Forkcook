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
/* $(document).ready(function(){
	$("#login_btn").unbind("click").click(function(e){
		e.preventDefault();
		fn_login();
	});
});

function fn_login(){
	if($("#id").val().length<1){
		alert("아이디를 입력해주세요");
		}else if($("#pass").val().length<1){
			alert("비밀번호를 입력해주세요");
		}
} */

$(document).ready(function(){
	$("#login_btn").click(function(){
		var id = $("#id").val();
		var pass = $("#pass").val();
		if(id == ""){
			alert("아이디를 입력해주세요");
			$("#id").focus();//입력 포커스 이동
			return;//함수 종료
		}
		if(pass == ""){
			alert("비밀번호를 입력하세요");
			$("#pass").focus();
			return;
		}
		//폼 내부의 데이터를 전송할 주소 (form에 action으로 매핑주소를 주면 아이디 입력 안했는데도 페이지 넘어가버림)
		document.form1.action="login1.do"
		//제출
		//document.form1.submit();
	});
});
</script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!-- 
회원 : 아이디랑 비번 체크해서 로그인성공/실패 나누기 ->성공시 메인화면
비회원 : 로그인하면 회원데이타 저장하고 장바구니로 이동
-->
id : ${udto.id }님 로그인 중<br>
phone : ${phone }<br>
pass : ${pass }<br>
데이터 갯수 : ${totalCount }
<form method="get" name="form1">
	아이디 : <input type="text" name="id" size="7" id="id"><br>
	비밀번호 : <input type="password" name="pass" size="7" id="pass"><br>
	<input type="submit" value="회원으로 로그인" id="login_btn">
</form>
<a href="${root}/main/user/membership.do">회원가입하기</a>
<a href="${root}/main/user/login1.do">로그인성공</a>
<hr>
비회원 주문조회
<!-- (로그인과 동시에 회원정보 테이블에 insert) -->
<form action="login2.do" method="get">
	핸드폰 : <input type="text" name="phone" size="7"><br>
	이름 : <input type="text" name="name" size="7"><br>
	<input type="submit" value="비회원으로 로그인">
</form>
</body>
</html>