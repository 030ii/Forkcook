<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

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

문의 답변<br>

<br>
<br>
<form action="reqwrite.do" method="post" enctype="multipart/form-data">
	<table class="table">
		<tr>
			<td>
				<input type="hidden" name="snum" value="2" readonly>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="subject" required placeholder="제목을 입력해주세요">
			</td>
		</tr>
		<tr>
			<td>
				<input type="file" name="upfile" required>
			</td>
		</tr>
		<tr>
			<td>
				<textarea name="content" required placeholder="내용을 입력해주세요"></textarea>
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

