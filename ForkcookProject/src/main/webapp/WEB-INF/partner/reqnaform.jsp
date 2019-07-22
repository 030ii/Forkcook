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
$(function() {
   $("#reqna").click(function() {
	     if($("#subject").val()!==""){
	        alert("저장 되었습니다");
	      }else{
	    	  $("#subject").val()==""{
	    		  alert("내용을 입력해주세요");
	    	  }
	      }

  });
});
</script>
</head>
<body>
문의 답변<br>

<br>
<br>
<form action="preqwrite.do" method="post">
	<table class="table">
		<tr>
			<th>가맹점</th>
			<td>
				<input type="text" name="snum" value="2" readonly>
			</td>
		</tr>
		<tr>
			<th>제 목</th>
			<td>
				<input type="text" name="subject" required>
			</td>
		</tr>
		<tr>
			<th>이미지 첨부</th>
			<td>
				<input type="text" name="image" value="1.jpg" required>
			</td>
		</tr>
		<tr>
			<th>내 용</th>
			<td>
				<textarea name="content" required></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<input type="hidden" name="qnum" value="${qnum}">
				<input type="hidden" name="pageNum" value="${pageNum}">
				<button type="submit">작성하기</button>
            	<button type="button" onclick="history.back()">취소하기</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
