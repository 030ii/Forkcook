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
$(function(){
	$("div.updateForm").css("display","none");
	
	//리뷰 추가
	$("#add-btn").click(function(){
		var rate=$("#rate").val();
		var content=$("#content").val();
		//console.log(rate+","+content);
		
		$.ajax({
			type:'post',
			url:'insert.do',
			data:{'rate':rate,"content":content},
			success:function(data){
				alert("리뷰가 등록되었습니다.");
				location.href='review.do';
				//입력 텍스트 초기화
				$("#rate").val('');
				$("#content").val('');
			},
			error:function(){
				alert("error");
			}
		});
		
		
	});
});
	function form() {
		console.log($("div.updateForm").is(":hidden"));
		var sw = $("div.updateForm").is(":hidden");

		if (sw) {
			$("div.updateForm").show('slow');
		} else {
			$("div.updateForm").hide('slow');
		}
	}
</script>
</head>
<body>
<리뷰보기페이지입니다>
<div>총 ${totalCount}개의 리뷰가 있습니다</div>
<hr>
	
	등록폼<br>
	<div class="addReview">
		평점 : <input type="text" id="rate" size="5">
		내용 : <input type="text" id="content" size="30">
		<input type="button" value="사진첨부">
		<input type="button" value="리뷰등록" id="add-btn">
	</div>
<hr>
<div class="updateForm">
	수정폼<br>
		평점 : <input type="text" id="rate" size="5">
		내용 : <input type="text" id="content" size="30">
		<input type="button" value="사진첨부">
		<input type="button" value="리뷰수정" id="update-btn">
	</div>
<hr>
<div id="reviewTable">
</div>
  <div id="reviewTable">
	<table border=1>
		<tr>
			<th>No.</th>
			<th>num</th>
			<th>unum</th>
			<th>mnum</th>
			<th>내용</th>
			<th>평점</th>
			<th>작성일</th>
			<th>관리</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${dto.num}</td>
				<td>${dto.unum}</td>
				<td>${dto.mnum}</td>
				<td>${dto.content}</td>
				<td>${dto.rate}</td>
				<td><fmt:formatDate value="${dto.writeday }" pattern="MM-dd HH:mm"/></td>
				<td>
					<a href="javascript:form()">수정</a>
					<!-- <button type="button" onclick="location.href='javascript:form()'" id="updateBtn">수정</button> -->
					<button type="button" onclick="location.href='delete.do?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
  </div>
</body>
</html>