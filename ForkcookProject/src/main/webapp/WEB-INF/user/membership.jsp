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
<script type="text/javascript">
$(document).ready(function(){
    $('#nextStep').click(function(){
        if($('#agree1').prop('checked') == false || $('#agree2').prop('checked') == false){
            alert('필수 약관에 동의해주세요');
        }else{
        	console.log('asdf');
            window.location.href = '/ForkcookProject/main/user/signup.do';
        }
    });
});
</script>
<body>
<c:set var="root" value="<%=request.getContextPath() %>" />
<!-- 해야될거
	2. 동의했을경우에는 회원가입페이지로 넘어가기(스크립트 안에서 주소경로 해결) -->
약관1내용~~~~~~<br>
<label class="agree1">
<input type="checkbox" name="agree1" id="agree1">동의
</label>
<br><br>
약관2내용~~~~~~<br>
<label class="agree2">
<input type="checkbox" name="agree2" id="agree2">동의
</label>
<br><br>
<button type="button" id="nextStep">약관 확인</button>
</body>
</html>