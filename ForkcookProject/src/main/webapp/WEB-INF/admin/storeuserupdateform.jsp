<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<script type="text/javascript">
$(function(){
	 $(document).on("change","select[name='sarea']",function(){
		 var sarea = $(this).val();
		 console.log(sarea);
		 $.ajax({
			type:'get',
			url:'getSname.do',
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

function check(f){
	if(f.pass.value != f.pass2.value){
	alert("새 비밀번호가 다릅니다. 다시 확인해주세요.");
		f.pass.value='';
		f.pass2.value='';
		f.pass.focus();
		return false;
	}
	return true;//true 가 반환되면 액션파일 호출
}
</script>
<div class="fk-section">
	<div class="fk-heading">가맹점 회원 수정하기</div>
	<p class="fk-desc">가맹점 회원을 수정하고 관리하세요</p>
	<br><br><br>
	
	<form class="uk-form-stacked" action="update.do" method="post" onsubmit="return check(this)">
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">가맹점 아이디</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" id="id" type="text" name="id" value="${dto.id}" disabled>
	        </div>
	    </div>
	    <div class="uk-margin fk-49">
	        <label class="uk-form-label" for="form-stacked-text">새 비밀번호</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="password" placeholder="새 비밀번호를 입력해주세요" name="pass" required>
	        </div>
	    </div>
	    <div class="uk-margin fk-49">
	        <label class="uk-form-label" for="form-stacked-text">새 비밀번호 확인</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="password" placeholder="새 비밀번호를 다시 입력해주세요" name="pass2" required>
	        </div>
	    </div>
	    <div class="uk-margin fk-49">
	        <label class="uk-form-label" for="form-stacked-select">가맹점 지역</label>
	        <div class="uk-form-controls">
	            <select class="uk-select" name="sarea" disabled>
	                <option value="${dto.sarea}">${dto.sarea}</option>
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
	        <label class="uk-form-label" for="form-stacked-select">가맹점 지점</label>
	        <div class="uk-form-controls">	
				<select class="uk-select" name="snum" disabled>
	                <option value="${dto.snum}">${dto.sname}</option>
	                <option value="">변경하시려면 지역을 먼저 선택해주세요</option>
	            </select>
        	</div>
	    </div>
	    <div class="uk-margin">
			<input type="hidden" name="num" value="${dto.num}" required><br>
			<button type="submit" class="uk-button uk-button-primary fk-49">수정하기</button>
			<button type="button" class="uk-button uk-button-secondary fk-49" onclick="location.href='list.do'">취소하기</button>
		</div>
	</form>
</div>

