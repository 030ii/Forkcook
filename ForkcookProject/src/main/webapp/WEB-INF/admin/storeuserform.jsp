<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<style>
.fk-section {
	margin: 0 auto;
	min-width:375px;
	max-width:500px;
}
.fk-form-width {
	width:375px;
}
.fk-49 {
	width:49%;
}
</style>
<script type="text/javascript">
$(function(){
	$("#idchk_btn").click(function(){
		var id = $("#id").val();
		if($("#id").val().length <4){
			$("#insert-btn").attr('disabled', true);
			alert("아이디는 4자 이상으로 입력해주세요");
		}
		else{ 
			var id = $("#id").val();
			$.ajax({
				type:'get',
				url:'idCheck.do',
				data:{'id':id},
				dataType:"text",
				success : function(data){
					var result = JSON.parse(data);
					if(result.exist == 1){ // 이미 아이디 존재
						$("#check").text("사용불가");
						alert("이미 존재하는 아이디입니다.");
						$("#insert-btn").attr('disabled', true);
					}else if(result.exist == 0){ // 아직 아이디 없음
						$("#check").text("사용가능");
						alert("사용이 가능한 아이디입니다.");
						$("#insert-btn").attr('disabled', false);
					}
				},
				error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		}
		//폼 내부의 데이터를 전송할 주소 (form에 action으로 매핑주소를 주면 아이디 입력 안했는데도 페이지 넘어가버림)
		//document.form1.action="signupform.do"
	});
	
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
	alert("비밀번호가 맞지 않습니다");
		f.pass.value='';
		f.pass2.value='';
		f.pass.focus();
		return false;
	}
	return true;//true 가 반환되면 액션파일 호출
}
</script>
<div class="fk-section">
	<div class="fk-heading">가맹점 회원 추가하기</div>
	<p class="fk-desc">가맹점 회원을 추가하고 관리하세요</p>
	<br><br><br>
	
	<form class="uk-form-stacked" action="insert.do" method="post" onsubmit="return check(this)">
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">가맹점 아이디</label>
	        <div class="uk-form-controls">
	            <input class="uk-input fk-form-width" id="id" type="text" placeholder="아이디를 입력해주세요" name="id" required>
	        	<button type="button" class="uk-button uk-button-default" id="idchk_btn">중복확인</button>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">가맹점 비밀번호</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="password" placeholder="비밀번호를 입력해주세요" name="pass" required>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-text">가맹점 비밀번호 확인</label>
	        <div class="uk-form-controls">
	            <input class="uk-input" type="password" placeholder="비밀번호를 다시 입력해주세요" name="pass2" required>
	        </div>
	    </div>
	    <div class="uk-margin">
	        <label class="uk-form-label" for="form-stacked-select">가맹점 지역/지점 선택</label>
	        <div class="uk-form-controls">
	            <select class="uk-select fk-49" name="sarea" required>
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
				<select class="uk-select fk-49" name="snum" required>
	                <option value="">지점 선택</option>
	            </select>
        	</div>
	    </div>
	    <div class="uk-margin">
			<button type="submit" id="insert-btn" class="uk-button uk-button-primary fk-49" disabled>추가하기</button>
			<button type="button" class="uk-button uk-button-secondary fk-49" onclick="location.href='list.do'">취소하기</button>
		</div>
	</form>
</div>