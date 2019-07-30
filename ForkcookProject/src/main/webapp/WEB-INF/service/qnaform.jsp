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
<c:set var="root" value="<%=request.getContextPath() %>" />
<script type="text/javascript">
$(function() {
   $("#inqna").click(function() {
     if($("#subject").val()!==""){
        alert("저장 되었습니다");
      }else{
		alert("내용을 입력해주세요");
   	  }
	});
   
   $(document).on("change","select[name='sarea']",function(){
		 var sarea = $(this).val();
		 console.log(sarea);
		 $.ajax({
			type:'get',
			url:'${root}/admin/storeuser/getSname.do',
			data:{'sarea':sarea},
			dataType:"json",
			success : function(data){
				$("select[name='snum']").html("<option value=''>지점 선택</option>");
				for(var i=0; i<data.result.length; i++){
					$("select[name='snum']").append("<option value='"+data.result[i].num+"'>"+data.result[i].name+"</option>");
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
					가맹점 지역 : 
					<select name="sarea" required>
						<option value="">지역 선택</option>
						<option value="강원">강원</option>
						<option value="경기">경기</option>
						<option value="경남">경남</option>
						<option value="경북">경북</option>
						<option value="광주">광주</option>
						<option value="대구">대구</option>
						<option value="대전">대전</option>
						<option value="부산">부산</option>
						<option value="서울">서울</option>
						<option value="세종">세종</option>
						<option value="울산">울산</option>
						<option value="인천">인천</option>
						<option value="전남">전남</option>
						<option value="전북">전북</option>
						<option value="제주">제주</option>
						<option value="충북">충북</option>
						<option value="충청">충청</option>
					</select><br>
				</td>
			<tr>
				<td>
					가맹점 지점 선택 : 
					<select name="snum" required>
						<option value="">지점 선택</option>
					</select><br>
				</td>
			</tr>
					
			<tr>
			<td>
				이미지 : <input type="file" name="upfile" required>
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
