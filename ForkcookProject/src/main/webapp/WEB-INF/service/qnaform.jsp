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
		let
		cnt = 1;
		$(document).on("click","div.files button.btn",function() {
			cnt++;
			if (cnt > 3) {
				alert("이미지는 최대 갯수가 3개입니다");
				return false;
			}
			var s = '<input type="file" name="upfile" class="form-control" style="width: 250px;">';
			s += '<button type="button" class="btn btn-sm btn-danger" style="width: 60px;">추가</button>';
			s += '<br>';
			$("div.files").append(s);

		});

	});
</script>
</head>
<body>
	<form action="write.do" method="post">
		qna 작성 페이지 <br> <br> 작성자 : ${dto.writer}<br> 문의 제목 : <input
			type="text"> <br> 가맹점 선택 : <select>
			<option>전체</option>
			<option>강남점</option>
			<option>분당점</option>
			<option>잠실점</option>
			<option>강동점</option>
			<option>역삼점</option>
			<option>삼성역점</option>
			<option>서귀포점</option>
			<option>해운대점</option>
			<option>춘천점</option>
			<option>일산점</option>
		</select> <br> 내용 :
		<textarea></textarea>
		<br> 사진 업로드 : <input type="file" name="upfile"
			class="form-control">
		<button type="button" class="btn btn-sm btn-info">추가</button>

		<br> <br>

		<c:set var="root" value="<%=request.getContextPath()%>" />
		<button type="button" class="btn btn-success btn-sm"
			onclick="location.href='${root}/qna/list.do'">작성하기</button>
		<button type="button" class="btn btn-danger btn-sm"
			onclick="location.href='${root}/qna/list.do'">취소하기</button>
	</form>
</body>
</html>