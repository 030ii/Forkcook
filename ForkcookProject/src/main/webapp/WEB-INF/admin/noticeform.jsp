<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<div class="fk-section">
	<div class="fk-heading">포크쿡 공지 작성하기</div>
	<p class="fk-desc">공지를 작성하고 관리하세요</p>
	<br><br><br>
	
	<form class="uk-form-stacked" action="write.do" method="post" enctype="multipart/form-data">
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">메뉴 이름</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" placeholder="공지 제목을 입력해주세요" name="subject" required>
	        </div>
	    </div>
	    <div class="uk-margin" uk-margin>
	        <div uk-form-custom="target: true" class="fk-100">
		    	<label class="uk-form-label" for="form-stacked-text">공지 사진 추가</label>
	            <input type="file" name="upfile" required>
	            <input class="uk-input" type="text" placeholder="공지 사진 선택" disabled>
	        </div>
	    </div>
	    
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">메뉴 요약</label>
	        <div class="uk-form-controls">
	            <input class="uk-textarea" type="textarea" placeholder="공지 내용을 작성해주세요" name="content" required>
	        </div>
	    </div>
	    
	    <div class="uk-margin">
			<button type="submit" class="uk-button uk-button-primary fk-49">추가하기</button>
			<button type="button" class="uk-button uk-button-secondary fk-49" onclick="location.href='list.do'">취소하기</button>
		</div>
	</form>
</div>