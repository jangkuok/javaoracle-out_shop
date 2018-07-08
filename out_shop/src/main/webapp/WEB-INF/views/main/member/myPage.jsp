<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko-kr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>${memberVo.name}님의 마이페이지</title>
<style type="text/css">
form{
	display:inline
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//삭제버튼(보이기.숨기기) jquery
$(document).ready(function(){
    $("#showButton").click(function(){
        $("#showDiv").show();
        $("#showButton").hide();
        $("#pw2").focus();
    });
});  

/* //새로고침 뒤로가기 방지 javascript
document.onkeydown = function(e){
    key = (e) ? e.keyCode : event.keyCode;
    if(key==8 || key==116){
       if(e){
          e.preventDefault();
       }
       else{
          event.keyCode = 0;
          event.returnValue = false;
       }
    }
}; */

//삭제 버튼 submit 
function delete_member(){
	if(confirm('회원탈퇴를 하시겠습니까?')){
    	$("#deleteForm").submit();
    }
};
</script>
<style>
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    
    infoForm > div {
    	margin: 15px 0;
    }
</style>
</head>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>MY PAGE</h1><hr>
</div>
<c:if test="${msg == 'deleteError'}">
	<script>
		alert("비밀번호가 일치하지 않습니다.");
	</script>
</c:if>
     <div class="row">
        <div class="col-lg-6 mb-6">
          <div class="card h-100">
            <h4 class="card-header">회원정보</h4>
            <div class="card-body">
              	 <h4><strong>${memberVo.name} [${memberVo.id}] 님</strong></h4>
		         <h5>이메일 : ${memberVo.email}</h5>
		         <h5>핸드폰번호 : ${memberVo.phoneNum}</h5>
		         <h5>주소 :</h5>
		         <h7>${memberVo.address} ${memberVo.address2}</h7>
		         <h5>등급 : ${memberVo.grade}</h5>
            </div>
            <div class="card-footer" style="text-align:center;">          	
            	<a href="${pageContext.request.contextPath}/member/modifyPage.do?memberId=${memberVo.id}"
            		 class="btn btn-dark">회원수정</a>
              	<a href="#" class="btn btn-dark">회원탈퇴</a>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
        	<input type="hidden" id="memberId" name="memberId" value="${memberVo.id}">
        	<h4><strong>
	      		<a href="${pageContext.request.contextPath}/member/wishListSearch.do?memberId=${memberVo.id}">
	      			WISHLIST
	      		</a>
	      		<p style="text-align:right;">관심 상품</p>	      		
			 </strong></h4><hr>
			 <h4><strong>
	      	 <a href="${pageContext.request.contextPath}/member/orderListSearch.do?memberId=${memberVo.id}">
			      	ORDER
			    </a>
			    <p style="text-align:right;">주문 목록</p>
			 </strong></h4><hr>	
			 <h4><strong>
	      		<a href="#">
			      	BOARD
			    </a>
			    <p style="text-align:right;">게시물 관리</p>
			 </strong></h4><hr>		 
		</div>	 
	</div>
</div>
</body>
</html>