<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<div class="fk-section">
	<div class="fk-heading">포크쿡 공지 수정하기</div>
	<p class="fk-desc">공지를 수정하고 관리하세요</p>
	<br><br><br>
	
	<c:choose>
		<c:when test="${not empty pageNum}">
			<form class="uk-form-stacked" action="updatec.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="pageNum" value="${pageNum}">
		</c:when>
		<c:otherwise>
			<form class="uk-form-stacked" action="updatel.do" method="post" enctype="multipart/form-data">	
		</c:otherwise>
	</c:choose>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">메뉴 이름</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" value="${dto.subject}" name="subject" required>
	        </div>
	    </div>
	    <div class="uk-margin" uk-margin>
	        <div uk-form-custom="target: true" class="fk-100">
		    	<label class="uk-form-label" for="form-stacked-text">공지 사진 변경</label>
	            <input type="file" name="upfile" value="${dto.image}">
	            <input class="uk-input" type="text" placeholder="${dto.image}" disabled>
	        </div>
	    </div>
	    
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">메뉴 요약</label>
	        <div class="uk-form-controls">
	            <input class="uk-textarea" type="textarea" value="${dto.content}" name="content" required>
	        </div>
	    </div>
	    
	    <div class="uk-margin">
	    	<input type="hidden" name="num" value="${dto.num}">
			<button type="submit" class="uk-button uk-button-primary fk-49">수정하기</button>
			<button type="button" class="uk-button uk-button-secondary fk-49" onclick="history.back()">취소하기</button>
		</div>
	</form>
</div>