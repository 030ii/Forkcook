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
	//$("div.updateForm").css("display","none");
	
	//리뷰 추가
	$("#add-btn").click(function(){
		var rate=$("#rate").val();
		var content=$("#content").val();
		var unum=$("#unum").val();
		var mnum=$("#mnum").val();
		console.log(rate+","+content+","+unum+","+mnum);
		
		$.ajax({
			type:'post',
			url:'insert.do',
			data:{"unum":unum,"mnum":mnum,"rate":rate,"content":content},
			success:function(data){
				alert("리뷰가 등록되었습니다.");
				console.log(mnum);
				location.href='review.do?mnum='+mnum;
				//입력 텍스트 초기화
				$("#rate").val('');
				$("#content").val('');
			},
			error:function(){
				console.log(mnum);
				alert("error");
			}
		});
		
		
	});
});
	/* $(function(){
		$(".updatebtn").click(function(){
			var updateform = $('.updateform:eq(0)');
			var updatespan = $('.updatespan:eq(0)');
			//var mcountnum = parseInt(mcount.text());
			updatespan.css("display","none");
			updateform.css("display","block");
		});
	}); */
	$(function(){
		$(".updatebtn").click(function(){
			var updateform = $(this).parents('.updatetr').find('.updateform');
			var updatespan = $(this).parents('.updatetr').find('.updatespan');
			updateform.css("display","block");
			updatespan.css("display","none");
		});
		
		$(".cancle").click(function(){
			var updateform = $(this).parents('.updatetr').find('.updateform');
			var updatespan = $(this).parents('.updatetr').find('.updatespan');
			updateform.css("display","none");
			updatespan.css("display","block");
		});
	});
</script>
</head>
<body>
리뷰보기페이지입니다
<div>총 ${totalCount}개의 리뷰가 있습니다</div>
<hr>
	
	등록폼<br>
	<div class="addReview">
		평점 : <input type="text" id="rate" size="5">
		내용 : <input type="text" id="content" size="30">
		<input type="hidden" id="unum" value="2">
		<input type="hidden" id="mnum" value="${mnum}">
		<input type="button" value="리뷰등록" id="add-btn">
	</div>
<hr>
<div id="reviewTable">
</div>
  <div id="reviewTable">
	<table border=1 id="listTable">
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
			<tr class="updatetr">
				<td>${status.count}</td>
				<td>${dto.num}</td>
				<td>${dto.unum}</td>
				<td>${dto.mnum}</td>
				<td>
               		<span style="display: block;" class="updatespan">${dto.content}</span>
               		<form style="display: none;" action="update.do" method="post" class="updateform">
               			<input type="hidden" name="num" value="${dto.num}"/>
                  		<input type="hidden" name="unum" value="${dto.unum}"/>
                 		<input type="hidden" name="mnum" value="${dto.mnum}"/>
                  		<input type="text" name="rate" value="${dto.rate }"/>
                  		<textarea rows="" cols="" name="content">${dto.content}</textarea>
                  		<button type="submit">수정</button>
                  		<button type="button" class="cancle">취소</button>
              	 	</form>
            	</td>
				<td>${dto.rate}</td>
				<td><fmt:formatDate value="${dto.writeday }" pattern="MM-dd HH:mm"/></td>
				<td>
					<!-- c:if -> 로그인 세션의 user num랑 dto.unum이 같으면 수정 버튼 보여지고, 다르면 안보여짐
                  		-> 삭제버튼도 같음 -->
					<button type="button" class="updatebtn">수정</button>
					<button type="button" onclick="location.href='delete.do?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
  </div>
</body>
</html>