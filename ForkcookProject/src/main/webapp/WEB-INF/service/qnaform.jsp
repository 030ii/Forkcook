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
	<form action="write.do" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td><input type="text" name="subject" class="form-control" required="required" placeholder="제목을 입력해주세요"></td>
			</tr>
			<tr>
				<td>
					<select name="snum" required>
						<option value="">전체</option>
						<option value="2">강남점</option>
						<option value="3">분당점</option>
						<option value="4">삼성점</option>
						<option value="5">가로수길점</option>
						<option value="6">홍대점</option>
						<option value="7">삼산점</option>
						<option value="8">부평점</option>
						<option value="9">부천점</option>
						<option value="10">해운대점</option>
						<option value="11">반월당점</option>
						<option value="12">춘천점</option>
						<option value="13">제주점</option>
						<option value="14">청주점</option>
			</select><br>
				</td>
			</tr>
			<tr>
			<td>
				<input type="file" name="upfile" required>
			</td>
			</tr>
			<tr>
				<td><textarea  name="content" class="form-control" required="required" placeholder="내용을 입력해주세요"></textarea></td>
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
