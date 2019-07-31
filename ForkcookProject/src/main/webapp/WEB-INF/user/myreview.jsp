<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
내 리뷰
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
					<!-- 수정폼(배치는 나중에 정리하기) -->
	              		<span style="display: block;" class="updatespan">${dto.content}</span>
	              		<form style="display: none;" action="update.do" method="post" class="updateform">
	              			<input type="hidden" name="num" value="${dto.num}"/>
	                 		<input type="hidden" name="unum" value="${dto.unum}"/>
	                		<input type="hidden" name="mnum" value="${dto.mnum}"/>
	                		<input type="text" name="rate" value="${dto.rate }">
	                 		<input type="file" name="upfile" value="${dto.image }">
	                 		<textarea rows="" cols="" name="content">${dto.content}</textarea>
	                 		<button type="submit" class="update-cfm">수정</button>
	                 		<button type="button" class="cancle">취소</button>
	             	 	</form>
	           	</td>
				<td>
					<span class="star-prototype" id="spanstar">
							<c:forEach var="i" begin="1" end="${dto.rate }">
								<img src='${root}/image/starrate1.png'>
							</c:forEach>
							(<fmt:formatNumber value="${dto.rate}" pattern="0"/>)
					</span>
				</td>
				<td><fmt:formatDate value="${dto.writeday }" pattern="MM-dd HH:mm"/></td>
				<td>
	       			<c:if test="${not empty loginInfo && loginInfo.num == dto.unum}">
	      					<button type="button" class="updatebtn">수정</button>
						<button type="button" onclick="location.href='delete.do?num=${dto.num}&unum=${loginInfo.num }&mnum=${dto.mnum }'">삭제</button>
	      				</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>