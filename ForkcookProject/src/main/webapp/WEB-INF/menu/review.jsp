<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
//등록폼의 별점
$(document).ready(function(){
	  $('#stars li').on('mouseover', function(){
	    var onStar = parseInt($(this).data('value'), 10); // 현재 커서올라간 별
	   
	    // hover 효과
	    $(this).parent().children('li.star').each(function(e){
	      if (e < onStar) {
	        $(this).addClass('hover');
	      }
	      else {
	        $(this).removeClass('hover');
	      }
	    });
	    
	  }).on('mouseout', function(){
	    $(this).parent().children('li.star').each(function(e){
	      $(this).removeClass('hover');
	    });
	  });
	  
	  // 클릭 이벤트
	  $('#stars li').on('click', function(){
	    var onStar = parseInt($(this).data('value'), 10); // 현재 선택된 별
	    var stars = $(this).parent().children('li.star');
	    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10); // 이전 선택된 별
	    
	    for (i = 0; i < stars.length; i++) { // 이전 선택한 별 css 제거
	      $(stars[i]).removeClass('selected');
	    }
	    for (i = 0; i < onStar; i++) { // 현재 선택한 별 css 추가
	      $(stars[i]).addClass('selected');
	    }
	    
	    $('#insertRate').val(onStar); // input hidden으로 선택한 별점 보내기
	 });
});

function deleteReview(num,unum,mnum){
    var result = confirm('상태를 변경하시겠습니까?'); 
    if(result) { //yes 
        $.ajax({
            url: 'delete.do?num='+num+'&unum='+unum+'&mnum='+mnum,
            method: 'get',
            success: function () {
                location.reload(); // 새로고침
            },
            error: function (error) {
                alert('문제가 발생하여 주문 상태가 변경되지 않았습니다. 관리자에게 문의해주세요.');
            }
        });
     }
 }
</script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>" />
<div class="reviewTitle-div">
	<hr>
	<h2>&nbsp;&nbsp;&nbsp;이용고객 리뷰</h2>
	<hr>
</div>

<div id="reviewTable-wrap">
	<span class="reviewCount-span">
		<input class="uk-input uk-form-success uk-form-width-medium reviewCount" type="text" placeholder="form-success" value="총 ${totalCount}개의 리뷰가 있습니다">
	</span>

  <table id="reviewListTable" class="uk-table uk-table-middle uk-table-divider">
    <thead>
        <tr class="updateSubject-tr">
            <th>글번호</th>
            <th>작성자</th>
            <th>사진</th>
			<th>내용</th>
			<th>평점</th>
			<th>작성일</th>
			<th> </th>
        </tr>
    </thead>
    <tbody>
      <c:forEach var="dto" items="${list}" varStatus="status">
        <tr class="updateContent-tr">
        	<td>${status.count}</td>
        	<td>unum:${dto.unum }/uname:${dto.uname}</td>
            <td>
				<c:if test="${dto.image!='noimage' }">
					<c:forTokens var="myimg" items="${dto.image }" delims=",">
						<a href="../../save/${myimg }" target="_new">
						  <img src="../../save/${myimg }" style="width: 100px;" class="reviewImg">
						</a>
					</c:forTokens>
				</c:if>
			</td>
			<td>${dto.content}</td>
			<td>
				<span class="star-prototype" id="spanstar">
						<c:forEach var="i" begin="1" end="${dto.rate }">
							<img src='${root}/image/starrate1.png' style="width: 15px;">
						</c:forEach>
						(<fmt:formatNumber value="${dto.rate}" pattern="0"/>)
				</span>
			</td>
			<td><fmt:formatDate value="${dto.writeday }" pattern="MM-dd HH:mm"/></td>
			<td>
				<c:if test="${not empty loginInfo && loginInfo.num == dto.unum}">
					<button type="button" class="uk-button uk-button-danger reviewDelete-btn"
            	 		onclick="deleteReview(${dto.num },${loginInfo.num},${dto.mnum})">삭제</button>
	      		</c:if>
	      	</td>
        </tr>
        </c:forEach>
    </tbody>
  </table>
</div>

<div class="reviewImageOnly-wrap">
	<a>이미지 모아보기>></a><br>(나중에 클릭하면 이미지들만 크게 보이도록)<br>
	<c:forEach var="dto" items="${list}" varStatus="status">
		<c:if test="${dto.image!='noimage' }">
			<c:forTokens var="myimg" items="${dto.image }" delims=",">
				<a href="../../save/${myimg }" target="_new">
				  <img src="../../save/${myimg }" style="max-width: 50px;">
				</a>
			</c:forTokens>
		</c:if>
	</c:forEach>
</div>

  <!-- 등록폼 -->
<c:if test="${not empty loginInfo}">
<div class="reviewInsert_wrap">
<button type="button" class="uk-button uk-button-secondary reviewInsert-btn" href="#modal-sections" uk-toggle>리뷰작성하기</button>
	<div id="modal-sections" uk-modal>
	    <div class="uk-modal-dialog">
	        <button class="uk-modal-close-default" type="button" uk-close></button>
	        <div class="uk-modal-header">
	            <h2 class="uk-modal-title">리뷰 작성</h2>
	        </div>
	        <form action="insert.do" method="post" class="form-inline" name="insertForm" enctype="multipart/form-data">
		        <div class="uk-modal-body">
					<div class="addReview">
						평점 : 
						<section class='rating-widget'>
						  <div class='rating-stars text-center'>
						    <ul id='stars'>
						      <li class='star' title='1점' data-value='1'>
						        <i class='fa fa-star fa-fw'></i>
						      </li>
						      <li class='star' title='2점' data-value='2'>
						        <i class='fa fa-star fa-fw'></i>
						      </li>
						      <li class='star' title='3점' data-value='3'>
						        <i class='fa fa-star fa-fw'></i>
						      </li>
						      <li class='star' title='4점' data-value='4'>
						        <i class='fa fa-star fa-fw'></i>
						      </li>
						      <li class='star' title='5점' data-value='5'>
						        <i class='fa fa-star fa-fw'></i>
						      </li>
						    </ul>
						  </div>
						</section>
						<br>
						내용 : <input type="text" name="content" size="30"><br>
						사진 : <input type="file" name="upfile"><br><br>
						<input type="hidden" name="unum" value="${loginInfo.num }">
						<input type="hidden" name="mnum" value="${mnum}">
						<input type="hidden" name="rate" id="insertRate">
					</div>
				</div>
		        <div class="uk-modal-footer uk-text-right">
		            <button class="uk-button uk-button-default uk-modal-close" type="button">취소</button>
		            <input type="submit" value="리뷰등록" id="add-btn" class="uk-button uk-button-primary" type="button">
		        </div>
	        </form>
	    </div>
	</div>
</div>
</c:if>
</body>
</html>