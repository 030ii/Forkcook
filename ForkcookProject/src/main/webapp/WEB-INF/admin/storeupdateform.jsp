<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<div class="fk-section">
	<div class="fk-heading">포크쿡 매장 정보 수정하기</div>
	<p class="fk-desc">매장을 수정하고 관리하세요</p>
	<br><br><br>
	
	<form class="uk-form-stacked" action="update.do?num=${dto.num}" method="post" enctype="multipart/form-data">
	    <div class="uk-margin fk-49">
	        <label class="uk-form-label" for="form-stacked-select">매장 지역</label>
	        <div class="uk-form-controls">
	            <select class="uk-select" name="area" disabled>
	                <option value="${dto.area}" selected>${dto.area}</option>
					<option value="강원">강원</option>
					<option value="경기">경기</option>
					<option value="경남">경남</option>
					<option value="경북">경북</option>
					<option value="광주">광주</option>
					<option value="대구">대구</option>
					<option value="대전">대전</option>
					<option value="부산">부산</option>
					<option value="서울">서울</option>
					<option value="세종">세종</option>
					<option value="울산">울산</option>
					<option value="인천">인천</option>
					<option value="전남">전남</option>
					<option value="전북">전북</option>
					<option value="제주">제주</option>
					<option value="충북">충북</option>
					<option value="충청">충청</option>
	            </select>
	    	</div>
	    </div>
	    <div class="uk-margin fk-49">
	        <label class="uk-form-label" for="form-stacked-text">매장 이름</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" value="${dto.name}" name="name" disabled>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">주소</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" value="${dto.addr}" name="addr" required>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">전화번호</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" value="${dto.phone}" name="phone" required>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">운영 시간</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" value="${dto.opertime}" name="opertime" required>
	        </div>
	    </div>
	    <div class="uk-margin fk-49" uk-margin>
	        <div uk-form-custom="target: true" class="fk-100">
		    	<label class="uk-form-label" for="form-stacked-text">매장 사진</label>
	            <input type="file" name="upfile" value="${dto.mainimage}">
	            <input class="uk-input" type="text" placeholder="${dto.mainimage}" disabled>
	        </div>
	    </div>
	    <div class="uk-margin fk-49" uk-margin>
	        <div uk-form-custom="target: true" class="fk-100">
		    	<label class="uk-form-label" for="form-stacked-text">지도 사진</label>
	            <input type="file" name="upfile" value="${dto.mapimage}">
	            <input class="uk-input" type="text" placeholder="${dto.mapimage}" disabled>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">간단 설명</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" value="${dto.shortmsg}" name="shortmsg" required>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">상세 설명</label>
	        <div class="uk-form-controls">
	            <input class="uk-textarea" type="textarea" value="${dto.longmsg}" name="longmsg" required>
	        </div>
	    </div>
	    <div class="uk-margin">
			<input type="hidden" name="num" value="${dto.num}">
			<button type="submit" class="uk-button uk-button-primary fk-49">수정하기</button>
			<button type="button" class="uk-button uk-button-secondary fk-49" onclick="location.href='list.do'">취소하기</button>
		</div>
	</form>
</div>
