<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="fk-section">
	<div class="fk-heading">답변 수정하기</div>
	<p class="fk-desc">답변를 수정하고 관리하세요</p>
	<br><br><br>
	
	<form class="uk-form-stacked" action="pqupdate.do" method="post" enctype="multipart/form-data">
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">답변 제목</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" value="${reqdto.subject}" name="subject" required>
	        </div>
	    </div>
	    <div class="uk-margin" uk-margin>
	        <div uk-form-custom="target: true" class="fk-100">
		    	<label class="uk-form-label" for="form-stacked-text">답변 사진</label>
	            <input type="file" name="upfile" value="${reqdto.image}">
	            <input class="uk-input" type="text" placeholder="${reqdto.image}" disabled>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">답변 내용</label>
	        <div class="uk-form-controls">
	            <input class="uk-textarea" type="textarea" value="${reqdto.content}" name="content" required>
	        </div>
	    </div> 
	    <div class="uk-margin">
			<input type="hidden" name="num" value="${reqdto.num}">
			<input type="hidden" name="qnum" value="${reqdto.qnum}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<button type="submit" class="uk-button uk-button-primary fk-49">답변 수정하기</button>
			<button type="button" class="uk-button uk-button-secondary fk-49" onclick="history.back()">취소하기</button>
		</div>
	</form>
</div>