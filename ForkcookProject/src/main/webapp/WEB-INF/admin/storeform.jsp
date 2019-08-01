<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="root" value="<%=request.getContextPath() %>" />  
<script>
$(function(){
	 $(document).on("change","select[name='sarea']",function(){
		 var sarea = $(this).val();
		 console.log(sarea);
		 $.ajax({
			type:'get',
			url:'${root}/admin/storeuser/getSname.do',
			data:{'sarea':sarea},
			dataType:"json",
			success : function(data){
				$("select[name='snum']").html("<option value=''>지점 선택</option>");
				for(var i=0; i<data.result.length; i++){
					$("select[name='snum']").append("<option value='"+data.result[i].num+"'>"+data.result[i].name+"</option>");
				}
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
   });
});
</script>  
<div class="fk-section">
	<div class="fk-heading">포크쿡 매장 정보 추가하기</div>
	<p class="fk-desc">매장을 추가하고 관리하세요</p>
	<br><br><br>
	
	<form class="uk-form-stacked" action="write.do" method="post" enctype="multipart/form-data">
	    <div class="uk-margin fk-49">
	        <label class="uk-form-label" for="form-stacked-select">매장 지역</label>
	        <div class="uk-form-controls">
	            <select class="uk-select" name="area" required>
	                <option value="">지역 선택</option>
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
	            <input class="uk-input" type="text" placeholder="ex) 포크쿡 OO점" name="name" required>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">주소</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" placeholder="주소를 입력해주세요" name="addr" required>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">전화번호</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" placeholder="ex) 02-111-1111" name="phone" required>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">운영 시간</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" value="평일 10:00 - 22:00, 주말 10:00 - 24:00" name="opertime" required>
	        </div>
	    </div>
	    <div class="uk-margin fk-49" uk-margin>
	        <div uk-form-custom="target: true" class="fk-100">
		    	<label class="uk-form-label" for="form-stacked-text">매장 사진</label>
	            <input type="file" name="upfile" required>
	            <input class="uk-input" type="text" placeholder="매장 사진 선택" disabled>
	        </div>
	    </div>
	    <div class="uk-margin fk-49" uk-margin>
	        <div uk-form-custom="target: true" class="fk-100">
		    	<label class="uk-form-label" for="form-stacked-text">지도 사진</label>
	            <input type="file" name="upfile" required>
	            <input class="uk-input" type="text" placeholder="지도 사진 선택" disabled>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">간단 설명</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" value="기쁨주고 행복주는 OO점입니다" name="shortmsg" required>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">상세 설명</label>
	        <div class="uk-form-controls">
	            <input class="uk-textarea" type="textarea" value="시즌별 감성테마에 마늘로 풍미를 더한 창작메뉴, 페어링 와인을 즐길 수 있는 곳" name="longmsg" required>
	        </div>
	    </div>
	    <div class="uk-margin">
			<button type="submit" class="uk-button uk-button-primary fk-49">추가하기</button>
			<button type="button" class="uk-button uk-button-secondary fk-49" onclick="location.href='list.do'">취소하기</button>
		</div>
	</form>
</div>