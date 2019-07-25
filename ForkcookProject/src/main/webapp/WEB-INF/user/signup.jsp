<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javascript">
$(function(){
	$("#idchk_btn").click(function(){

		var id = $("#id").val();
		var pass = $("#pass").val();
		if($("#id").val().length <4){
			alert("아이디는 4자 이상으로 입력해주세요");
		}
		else{ 
			var userid = $("#id").val();
			$.ajax({
				type:'get',
				url:'idCheck.do',
				data:{'id':userid},
				dataType:"text",
				success : function(data){
					var result = JSON.parse(data);
					if(result.exist == 1){ // 이미 아이디 존재
						$("#check").text("사용불가");
						$("#signup_btn").attr("disabled","disabled");
						alert("이미 존재하는 아이디입니다.");
					}else if(result.exist == 0){ // 아직 아이디 없음
						$("#check").text("사용가능");
						$("#signup_btn").removeAttr("disabled");
						alert("사용이 가능한 아이디입니다.");
					}
				},
				error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }
			});
		}
		//폼 내부의 데이터를 전송할 주소 (form에 action으로 매핑주소를 주면 아이디 입력 안했는데도 페이지 넘어가버림)
		//document.form1.action="signupform.do"
	});
	
});

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
</head>
<body>
<div class="signupform">
회원가입 폼<br><br>
	<form action="signupForm.do" method="get" onsubmit="return check(this)" name="frm">
		<table class="signupTable">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" id="id" required="required" class="uk-input uk-form-width-medium">
				<button type="button" id="idchk_btn" class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom">중복확인</button>
				중복확인결과:<div id="check"></div>
			</td>
		</tr>
		<tr>
			<th>이름(닉네임)</th>
			<td><input type="text" name="name" required="required" class="uk-input uk-form-width-medium"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pass" required="required" id="pass" onkeyup="check()" class="uk-input uk-form-width-medium"></td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td><input type="password" name="pass2" required="required" id="pass2" onkeyup="check1()" class="uk-input uk-form-width-medium">비번확인:<div id="pwchk"></div></td>
		</tr>
		<tr>
			<th>핸드폰( - 빼고 입력)</th>
			<td><input type="text" name="phone" required="required" class="uk-input uk-form-width-medium"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="가입완료" id="signup_btn" disabled="disabled"></td>
		</tr>
		</table>
	</form>
</div>
</body>
</html>
