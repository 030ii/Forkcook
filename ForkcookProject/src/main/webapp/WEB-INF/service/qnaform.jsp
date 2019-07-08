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
			var s = '<input type="file" name="upfile" class="form-control">';
			s += '<button type="button" class="btn btn-sm btn-danger">추가</button>';
			s += '<br>';
			$("div.files").append(s);

		});
		$("#inqna").click(function() {
			   if($(this).val()!==''){
				   alert("입력란을 확인해주세요");
			   } 
		  });

	});
</script>
</head>
<body>
	<form action="write.do" method="post" enctype="multipart/form-data">
		qna 작성 페이지 <br> <br> 
<%-- 		<input type="hidden" name="unum" value="${udto.num}"> --%>
<%-- 		작성자 : <input type="text" name="uname" value="${dto.name}"><br> --%>
		<input type="hidden" name="unum" value="1">
		작성자 : <input type="text" name="uname" value="회원1"><br> 
		문의 제목 : <input type="text" name="subject" class="form-control" required="required"> <br>
		가맹점 선택 : 
		<select>
			<c:forEach var="sdto" items="${slist}">	
        		<option value="${sdto.num}">${sdto.name}</option>
 	  		</c:forEach>
		</select>
		<br> 내용 :
		<textarea name="content" class="form-control" required="required"></textarea>
		<br> 사진 업로드 : <input type="file" name="upfile"
			class="form-control">
		<button type="button" class="btn btn-sm btn-info">추가</button>

		<br> <br>
	
		<c:set var="root" value="<%=request.getContextPath()%>" />
		<button type="submit" id="inqna">작성하기</button>
		<button type="button"
			onclick="location.href='${root}/main/qna/list.do'">취소하기</button>
	</form>
	
</body>
</html>