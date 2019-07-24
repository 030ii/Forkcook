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
   $("#wkrtjd").click(function() {
	     if($("#subject").val()!==""){
	        alert("저장 되었습니다");
	      } else {
	    	  $("#subject").val()==""{
	    		  alert("내용을 입력해주세요");
	    	  }
	      }

  });
});
</script>
</head>
<body>
가맹점이나 관리자만 접근 가능한 페이지 입니다<br>
<br>
<br>
<form action="write.do" method="post" enctype="multipart/form-data">
	
	<fieldset class="uk-fieldset">

        <legend class="uk-legend">공지 작성 페이지</legend>

        <div class="uk-margin">
            <input type="text" name="subject" class="form-control" required="required" placeholder="제목을 입력하세요">
        </div>

        <div class="uk-margin">
            <input type="file" name="upfile">
        </div>

        <div class="uk-margin">
            <textarea name="content" class="form-control" placeholder="내용을 입력하세요"></textarea>
        </div>

        <div class="uk-margin">
            <c:set var="root" value="<%=request.getContextPath() %>" />
            <button type="button" onclick="location.href='${root}/admin/notice/list.do'">취소하기</button>
            <button type="submit" id="wkrtjd">작성하기</button>
        </div>

    </fieldset>

</form>
</body>
</html>
