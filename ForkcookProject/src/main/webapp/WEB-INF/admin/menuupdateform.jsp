<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<div class="fk-section">
	<div class="fk-heading">포크쿡 메뉴 수정하기</div>
	<p class="fk-desc">메뉴를 수정하고 관리하세요</p>
	<br><br><br>
	
	<form class="uk-form-stacked" action="update.do?num=${dto.num}" method="post" enctype="multipart/form-data">
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">메뉴 이름</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" id="id" type="text" value="${dto.name}" name="name" required>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-select">메뉴 종류</label>
	        <div class="uk-form-controls">
	            <select class="uk-select" name="category" required>
	                <option value="">종류 선택</option>
					<option value="파스타" <c:if test="${dto.category=='파스타'}">selected</c:if>>파스타</option>
					<option value="피자" <c:if test="${dto.category=='피자'}">selected</c:if>>피자</option>
					<option value="스테이크" <c:if test="${dto.category=='스테이크'}">selected</c:if>>스테이크</option>
					<option value="샐러드" <c:if test="${dto.category=='샐러드'}">selected</c:if>>샐러드</option>
					<option value="디저트" <c:if test="${dto.category=='디저트'}">selected</c:if>>디저트</option>
					<option value="음료" <c:if test="${dto.category=='음료'}">selected</c:if>>음료</option>
	            </select>
        	</div>
	    </div>
	    <div class="uk-margin fk-49">
	        <label class="uk-form-label" for="form-stacked-text">메뉴 인분</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" value="${dto.persons}" name="persons" required>
	        </div>
	    </div>
	    <div class="uk-margin fk-49">
	        <label class="uk-form-label" for="form-stacked-text">메뉴 가격</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" value="${dto.price}" name="price" required>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">메뉴 요약</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" value="${dto.shortmsg}" name="shortmsg" required>
	        </div>
	    </div>
	    <div class="uk-margin fk-49" uk-margin>
	        <div uk-form-custom="target: true" class="fk-100">
		    	<label class="uk-form-label" for="form-stacked-text">메인 사진</label>
	            <input type="file" name="upfile" value="${dto.mainimage}">
	            <input class="uk-input" type="text" placeholder="${dto.mainimage}" disabled>
	        </div>
	    </div>
	    <div class="uk-margin fk-49" uk-margin>
	        <div uk-form-custom="target: true" class="fk-100">
		    	<label class="uk-form-label" for="form-stacked-text">상세 사진</label>
	            <input type="file" name="upfile" value="${dto.longimage}">
	            <input class="uk-input" type="text" placeholder="${dto.longimage}" disabled>
	        </div>
	    </div>
	    <div class="uk-margin">
		    <input type="hidden" name="num" value="${dto.num}">
			<input type="hidden" name="rate" value="${dto.rate}">
			<button type="submit" class="uk-button uk-button-primary fk-49">수정하기</button>
			<button type="button" class="uk-button uk-button-secondary fk-49" onclick="location.href='list.do'">취소하기</button>
		</div>
	</form>
</div>