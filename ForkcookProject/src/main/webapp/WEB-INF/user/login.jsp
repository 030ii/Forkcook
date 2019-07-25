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
		document.form1.action="login1.do";
		document.form1.submit();
	});
});
</script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!-- 
회원 : 아이디랑 비번 체크해서 로그인성공/실패 나누기 ->성공시 메인화면
비회원 : 로그인하면 회원데이타 저장하고 장바구니로 이동 action="login1.do"
-->

<div class="loginuser">
<b class="login_text1">회원 로그인</b><br><br>
	<form method="get" name="form1" class="loginform" id="form1">
	    <div class="uk-margin">
	        <div class="uk-inline">
	            <span class="uk-form-icon" uk-icon="icon: user"></span>
	            <input class="uk-input logininput" type="text" name="id" id="id" placeholder="ID">
	        </div>
	    </div>
	
	    <div class="uk-margin">
	        <div class="uk-inline">
	            <span class="uk-form-icon" uk-icon="icon: lock"></span>
	            <input class="uk-input logininput" type="password" name="pass" id="pass" placeholder="password">
	        </div>
	    </div>
		<button type="submit" class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom" id="login_btn">회원로그인</button>
	</form>
	<button type="button" class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom" id="signup_btn" onclick="location.href='membership.do'">회원가입</button>
</div>

<div>
	<hr class="uk-divider-vertical vl">
	<%-- <img src="${root}/image/vl.PNG"> --%>
</div>

<!-- (로그인과 동시에 회원정보 테이블에 insert) -->
<div class="loginnotuser">
<b class="login_text2">비회원 주문조회</b><br><br>
	<form action="login2.do" method="get" name="form2" class="loginform">
	    <div class="uk-margin">
	        <div class="uk-inline">
	            <span class="uk-form-icon" uk-icon="icon: user"></span>
	            <input class="uk-input logininput" type="text" name="name" id="name" placeholder="name">
	        </div>
	    </div>
	
	    <div class="uk-margin">
	        <div class="uk-inline">
	            <span class="uk-form-icon" uk-icon="icon: receiver"></span>
	            <input class="uk-input logininput" type="text" name="phone" id="phone" placeholder="phone">
	        </div>
	    </div>
		<button type="submit" class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom">비회원로그인</button>
	</form>
</div>
</body>
</html>