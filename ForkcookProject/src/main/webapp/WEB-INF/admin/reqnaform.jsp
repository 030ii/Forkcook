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
	      }

  });
});
</script>
</head>
<body>
문의 답변<br>

<br>
<br>
<form action="write.do" method="post">
	<table class="table">
		<tr>
			<th>가맹점</th>
			<td>
				<input type="hidden" name="snum" value="1">
			</td>
		</tr>
		<tr>
			<th>제 목</th>
			<td>
				<input type="text" name="subject" class="form-control" required>
			</td>
		</tr>
		<tr>
			<th>이미지 첨부</th>
			<td>
				<input type="text" name="image" value="test.jpg" required>
			</td>
		</tr>
		<tr>
			<th>내 용</th>			
			<td colspan="2">
				<textarea rows="5" cols="40" name="content" class="form-control" required></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<button type="submit" id="reqna">작성하기</button>
            <button type="button" onclick="location.href='list.do'">취소하기</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
