<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="fk-section">
	<article class="uk-article">
	    <h1 class="uk-article-title"><a class="uk-link-reset" href="">${dto.subject}</a></h1>
	    <p class="uk-article-meta">작성일 : <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd" /></p>
	    <p>
	    	<c:if test="${dto.image!='noimage' }">
				<c:forTokens var="myimg" items="${dto.image }" delims=",">
					<a href="../../save/${myimg}" target="_new">
		  			<img src="../../save/${myimg}" style="width: 500px;">
					</a>
				</c:forTokens>
			</c:if>
	    </p>
	    <p><pre>${dto.content}</pre></p>
	</article>
	<div class="uk-margin fk-txt-center">
		<button type="button" class="fk-btn" onclick="location.href='list.do?pageNum=${pageNum}'"><span uk-icon="icon: list"></span> 목록</button>
		<button type="button" class="fk-btn" onclick="location.href='updateform.do?num=${dto.num}&pageNum=${pageNum}'"><span uk-icon="icon: file-edit"></span> 수정</button>
		<button type="button" class="fk-btn" onclick="location.href='delete.do?num=${dto.num}&pageNum=${pageNum}'"><span uk-icon="icon: trash"></span> 삭제</button>
	</div>
</div>