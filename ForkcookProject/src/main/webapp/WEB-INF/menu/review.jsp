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
<form action="insert.do" method="post" class="form-inline" enctype="multipart/form-data">
	<div class="addReview">
		평점 : <input type="text" name="rate" size="5">
		내용 : <input type="text" name="content" size="30">
		사진 : <input type="file" name="upfile">
		<input type="hidden" name="unum" value="2">
		<input type="hidden" name="mnum" value="${mnum}">
		<input type="submit" value="리뷰등록" id="add-btn">
	</div>
</form>
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
			<th>사진</th>
			<th>사진보기</th>
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
				<td>${dto.image }</td>
				
				<td>
					<c:if test="${dto.image!='noimage' }">
						<c:forTokens var="myimg" items="${dto.image }" delims=",">
							<a href="../../save/${myimg }" target="_new">
							  <img src="../../save/${myimg }" style="width: 100px;">
							</a>
						</c:forTokens>
					</c:if>
				</td>
				<td>
               		<span style="display: block;" class="updatespan">${dto.content}</span>
               		<form style="display: none;" action="update.do" method="post" class="updateform">
               			<input type="hidden" name="num" value="${dto.num}"/>
                  		<input type="hidden" name="unum" value="${dto.unum}"/>
                 		<input type="hidden" name="mnum" value="${dto.mnum}"/>
                  		<input type="text" name="rate" value="${dto.rate }"/>
                  		<input type="file" name="upfile" value="${dto.image }">
                  		<textarea rows="" cols="" name="content">${dto.content}</textarea>
                  		<button type="submit">수정</button>
                  		<button type="button" class="cancle">취소</button>
              	 	</form>
            	</td>
				<td>${dto.rate}</td>
				<td><fmt:formatDate value="${dto.writeday }" pattern="MM-dd HH:mm"/></td>
				<td>
					<!-- 해야될것 ------
						c:if -> 로그인 세션의 user num랑 dto.unum이 같으면 수정 버튼 보여지고, 다르면 안보여짐
                  		-> 삭제버튼도 같음 -->
					<button type="button" class="updatebtn">수정</button>
					<button type="button" onclick="location.href='delete.do?num=${dto.num}&mnum=${dto.mnum }'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
  </div>
</body>
</html>