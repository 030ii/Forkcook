<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function() {
	   $("#inqna").click(function() {
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
	문의 게시판
	<br>

	<br>
	<br>
	<form action="write.do" method="post">
		<table class="table">
			<tr>
				<th>제 목</th>
				<td><input type="text" name="subject" class="form-control"
					required="required"></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td colspan="2"><textarea rows="5" cols="40" name="content"
						class="form-control" required="required"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><c:set var="root"
						value="<%=request.getContextPath()%>" />
					<button type="submit" id="inqna">작성하기</button>
					<button type="button"
						onclick="location.href='${root}/main/qna/list.do'">취소하기</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
