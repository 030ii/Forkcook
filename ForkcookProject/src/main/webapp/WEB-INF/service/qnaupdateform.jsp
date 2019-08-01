<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div class="fk-heading">문의 수정하기</div>
	<p class="fk-desc">문의를 수정하세요</p>
	<br><br><br>
	
	<c:choose>
		<c:when test="${not empty pageNum}">
			<form class="uk-form-stacked" action="update1.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="pageNum" value="${pageNum}">
		</c:when>
		<c:otherwise>
			<form class="uk-form-stacked" action="update2.do" method="post" enctype="multipart/form-data">	
		</c:otherwise>
	</c:choose>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">문의 제목</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="text" value="${qdto.subject}" name="subject" required>
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
	<br> 가맹점 :
	<select name="snum" required>
		<option value="">전체</option>
		<option value="2">강남점</option>
		<option value="3">분당점</option>
		<option value="4">삼성점</option>
		<option value="5">가로수길점</option>
		<option value="6">홍대점</option>
		<option value="7">삼산점</option>
		<option value="8">부평점</option>
		<option value="9">부천점</option>
		<option value="10">해운대점</option>
		<option value="11">반월당점</option>
		<option value="12">춘천점</option>
		<option value="13">제주점</option>
		<option value="14">청주점</option>
	</select>
	<br> 사진 업로드 :
	<input type="file" name="upfile" value="${qdto.image}">
	<br> 내용 :
	<textarea class="form-control" name="content">${qdto.content}</textarea>

	<c:set var="root" value="<%=request.getContextPath() %>" />
	<input type="hidden" name="num" value="${qdto.num}">
	<button type="button" class="fk-btn" onclick="history.back()">취소하기</button>
	<button type="submit" class="fk-btn" onclick="content.do?qnum=${qdto.num}">수정하기</button>
</form>
