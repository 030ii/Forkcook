<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="fk-section">
	<article class="uk-article">
		<h1 class="uk-article-title">
			<a class="uk-link-reset" href="">${qdto.subject}</a>
		</h1>
		<p>
			문의 가맹점 : ${slist[qdto.snum-1].name}
		</p>
		<p class="uk-article-meta">
			문의 작성일 : <fmt:formatDate value="${qdto.writeday}" pattern="yyyy-MM-dd" />
		</p>
		<p>
			<c:if test="${qdto.image!='noimage' }">
				<c:forTokens var="myimg" items="${qdto.image }" delims=",">
					<a href="../../save/${myimg}" target="_new"> 
						<img src="../../save/${myimg}" style="width: 100px;">
					</a>
				</c:forTokens>
			</c:if>
		</p>
		<p>${qdto.content}</p>
		<hr>
		<c:if test="${qdto.qnastate==1}"><!-- 답변 없음 -->
			<p class="uk-text-lead">답변이 없습니다. 답변을 작성해주세요.</p>
			<br>
			<br>
			<hr>
			<div class="uk-margin fk-txt-center">
				<button type="button" class="fk-btn" onclick="location.href='list.do?pageNum=${pageNum}'">
					<span uk-icon="icon: list"></span> 목록
				</button>
				<button type="button" class="fk-btn" onclick="location.href='reqform.do?qnum=${qdto.num}&pageNum=${pageNum}'">
					<span uk-icon="comments"></span> 답변 추가
				</button>
				<button type="button" class="fk-btn" onclick="location.href='delete.do?qnum=${qdto.num}&pageNum=${pageNum}'">
					<span uk-icon="icon: trash"></span> 해당 문의 삭제
				</button>
			</div>
		</c:if>
		<c:if test="${qdto.qnastate==2}"><!-- 답변 있음 -->
			<c:forEach var="reqdto" items="${reqlist}">
				<p class="uk-text-lead">[답변] ${reqdto.subject}</p>
				<p class="uk-article-meta">
					답변 작성일 : <fmt:formatDate value="${reqdto.writeday}" pattern="yyyy-MM-dd" />
				</p>
				<p>
					<c:if test="${reqdto.image!='noimage' }">
						<c:forTokens var="myimg" items="${reqdto.image }" delims=",">
							<a href="../../save/${myimg}" target="_new"> 
								<img src="../../save/${myimg}" style="width: 100px;">
							</a>
						</c:forTokens>
					</c:if>
				</p>
				<p>${reqdto.content}</p>
				<hr>
				<div class="uk-margin fk-txt-center">
				<button type="button" class="fk-btn" onclick="location.href='list.do?pageNum=${pageNum}'">
					<span uk-icon="icon: list"></span> 목록
				</button>
				<button type="button" class="fk-btn" onclick="location.href='requpdateform.do?reqnum=${reqdto.num}&pageNum=${pageNum}'">
					<span uk-icon="icon: file-edit"></span> 답변 수정
				</button>
				<button type="button" class="fk-btn" onclick="location.href='reqdelete.do?reqnum=${reqdto.num}&pageNum=${pageNum}'">
					<span uk-icon="icon: trash"></span> 답변 삭제
				</button>
			</div>
			</c:forEach>
		</c:if>
	</article>
</div>