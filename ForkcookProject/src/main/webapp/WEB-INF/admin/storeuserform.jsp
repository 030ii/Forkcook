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
$(function(){
	$("#idchk_btn").click(function(){
		var id = $("#id").val();
		if($("#id").val().length <4){
			alert("아이디는 4자 이상으로 입력해주세요");
		}
		else{ 
			var id = $("#id").val();
			$.ajax({
				type:'get',
				url:'idCheck.do',
				data:{'id':id},
				dataType:"text",
				success : function(data){
					var result = JSON.parse(data);
					if(result.exist == 1){ // 이미 아이디 존재
						$("#check").text("사용불가");
						alert("이미 존재하는 아이디입니다.");
					}else if(result.exist == 0){ // 아직 아이디 없음
						$("#check").text("사용가능");
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

function check(f){
	if(f.pass.value != f.pass2.value){
	alert("비밀번호가 맞지 않습니다");
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
가맹점 회원 추가 폼
	<form action="insert.do" method="post" onsubmit="return check(this)">
		가맹점 회원 아이디 : 
			<input type="text" name="id" id="id" required>
			<button type="button" id="idchk_btn">아이디 중복확인</button><br>
		
		가맹점 회원 비밀번호 : 
			<input type="password" name="pass" required><br>
			
		가맹점 회원 비밀번호 확인 : 
			<input type="password" name="pass2" required><br>
<!-- 
		가맹점 지역 : 
			<input type="text" name="sarea" required><br>
			
		가맹점명 : 
			<input type="text" name="sname" required><br>
	 -->		
		가맹점 num : 
			<input type="text" name="snum" required><br>
			
		<button type="submit">추가하기</button>
		<button type="button" onclick="location.href='list.do'">취소하기</button>
	</form>
</body>
</html>
