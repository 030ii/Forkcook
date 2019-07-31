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
	$("#pwChk_btn").click(function(){
		var pass = $("#pass").val();
		
		var userpass = $("#pass").val();
		$.ajax({
			type:'get',
			url:'passCheck.do',
			data:{'pass':userpass},
			dataType:"text",
			success : function(data){
				var result = JSON.parse(data);
				if(result.exist == 1){ // 이미 아이디 존재
					//$("#check").text("통과");
					//폼 내부의 데이터를 전송할 주소 (form에 action으로 매핑주소를 주면 아이디 입력 안했는데도 페이지 넘어가버림)
					document.form.action="myinfoupdate.do?num=${loginInfo.num}";
					document.form.submit();
				}else if(result.exist == 0){ // 아직 아이디 없음
					$("#passCheck_div").text("기존 비밀번호와 다릅니다.");
				}
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
	
	
	});
});
</script>
</head>
<body>
<div class="pwChk-big uk-flex uk-flex-wrap uk-flex-wrap-around uk-background-muted uk-height-medium">
  <form method="post" name="form">
	<div class="pwChk_div uk-card uk-card-default uk-card-body">
		<span class="pwChk-msg">개인정보 보호를 위해 비밀번호를 입력해주세요.</span><br><br><br>
			  <div class="uk-margin smallPwChk_div"><div class="uk-inline">
				<span class="uk-form-icon uk-form-icon-flip" uk-icon="icon: lock"></span>
	            <input type="password" name="pass" id="pass" class="uk-input pwChk_input">
	          </div>
			<div id="passCheck_div"></div>
		<button type="button" id="pwChk_btn" class="uk-button uk-button-primary">비밀번호 확인</button>
	</div></div>
  </form>
</div>
</body>
</html>