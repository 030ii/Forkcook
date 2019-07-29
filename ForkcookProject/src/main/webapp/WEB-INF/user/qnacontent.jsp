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

</head>
<body>
문의글 입니다 <br>
<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped">
	    <thead>
	        <tr>
				<th>제 목 : ${qdto.subject}</th>
				<th><fmt:formatDate value="${qdto.writeday}" pattern="yyyy-MM-dd HH:mm" /></th>
	        </tr>
	        <tr>
	        <th>가맹점 : ${slist[qdto.snum-1].name}</th>
	        </tr>
	    </thead>
	    <tbody>	    	
			<tr>
				<td valign="middle">
					<c:if test="${qdto.image!='noimage' }">
						<c:forTokens var="myimg" items="${qdto.image }" delims=",">
							<a href="../../save/${myimg}" target="_new">
				  			<img src="../../save/${myimg}" style="width: 100px;">
							</a>
						</c:forTokens>
					</c:if><br><br>
					${qdto.content}
				</td>
			</tr>
	    </tbody>
	</table>
<hr>
<c:if test="${qdto.qnastate==1}">
<!-- 답변 없음 -->
	<div>문의 확인 중 입니다.</div>
</c:if>
<c:if test="${qdto.qnastate==2}">
<!-- 답변 있음 -->
	<!-- TODO : 답변 content 가져오기! -->
	<div>
		<c:forEach  var="reqdto" items="${reqlist}">
			<b>제 목 : </b>${reqdto.subject}<br><br><br>
			<b>내 용 : </b>${reqdto.content}<hr>
		</c:forEach>
	</div>
</c:if>
<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" class="btn btn-info btn-sm"
	  onclick="location.href='${root}/main/user/myqna.do'">목록</button>
	  
	  <c:choose> 
			<c:when test="${qdto.qnastate==1}">
		    	<button type="button" class="btn btn-success btn-sm"
	  				onclick="location.href='updateform.do?qnum=${qdto.num}&pageNum=${pageNum}'">수정</button>
	  			<button type="button" class="btn btn-danger btn-sm"
	  				onclick="location.href='uqdelete.do?qnum=${qdto.num}&pageNum=${pageNum}'">삭제</button>
	  		</c:when>
		    <c:otherwise>
		    	<button type="button" class="btn btn-success btn-sm"
	  				onclick="alert('답변이 있는 문의는 수정 할 수 없습니다.')">수정</button>
	  			<button type="button" class="btn btn-danger btn-sm"
	  				onclick="alert('답변이 있는 문의는 삭제 할 수 없습니다.')">삭제</button>
			</c:otherwise>
	    </c:choose>
</body>
</html>