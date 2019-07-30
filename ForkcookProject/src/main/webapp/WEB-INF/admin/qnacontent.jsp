<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

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
		<c:if test="${qdto.qnastate==1}">
		<!-- 답변 없음 -->
		<div>답변이 없습니다. 답변을 작성해주세요.</div><br><br>
		<button type="button" onclick="location.href='reqform.do?qnum=${qdto.num}&pageNum=${pageNum}'"><span uk-icon="comments"></span> 답변 추가</button>
	</c:if>
	<c:if test="${qdto.qnastate==2}">
	<!-- 답변 있음 -->
		<dl class="uk-description-list">
			<c:forEach  var="reqdto" items="${reqlist}">
				<b>-답 변</b>
    			<dt><b>제 목 : ${reqdto.subject}</b></dt><br><br>
    			<td valign="middle">
					<c:if test="${reqdto.image!='noimage' }">
						<c:forTokens var="myimg" items="${reqdto.image }" delims=",">
							<a href="../../save/${myimg}" target="_new">
				  			<img src="../../save/${myimg}" style="width: 100px;">
							</a>
						</c:forTokens>
					</c:if><br>
				</td><br><br>
    			<dd>내 용 : ${reqdto.content}</dd><hr>
    			<button type="button" onclick="location.href='requpdateform.do?reqnum=${reqdto.num}&pageNum=${pageNum}'">답변 수정</button>
				<button type="button" onclick="location.href='reqdelete.do?reqnum=${reqdto.num}&pageNum=${pageNum}'">답변 삭제</button>
			</c:forEach>
		</dl>
			
	</c:if>
	<c:set var="root" value="<%=request.getContextPath() %>" />
	<button type="button" onclick="location.href='${root}/admin/qna/list.do'"><span uk-icon="list"></span> 목록</button>
	<c:if test="${qdto.qnastate==1}">
	<button type="button" onclick="location.href='delete.do?qnum=${qdto.num}&pageNum=${pageNum}'"><span uk-icon="trash"></span> 해당 문의 삭제</button>
	</c:if>
