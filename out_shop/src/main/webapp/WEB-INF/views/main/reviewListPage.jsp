<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>REVIEW</title>
<script type="text/javascript">
//리뷰 수정
$(document).ready(function() {
	$('a[name="modifyButton"]').hide();
	
	var member = $('#loginMemberId').val();

	$('input[name="reviewNo"]').each(function(){
		
		var no = $(this).val();

		var writer = $('#writeMemberId_'+ no).val();
	
 		if(member != ''){
			if(member == writer){
				$('#modifyButton_'+no).show();
			}			
		}
	});
	
	//리뷰 삭제
	$('a[name="removeButton"]').hide();
	
	var member = $('#loginMemberId').val();

	$('input[name="reviewNo"]').each(function(){
		
		var no = $(this).val();

		var writer = $('#writeMemberId_'+ no).val();
		
 		if(member != '' || $('#loginAdminId').val() != ''){
			if(member == writer || $('#loginAdminId').val() != ''){
				$('#removeButton_'+no).show();
			}			
		}
 		
 		$("#removeButton_"+no).click(function() {
			if(confirm('게시물을 삭제 하시겠습니까?')) { 
				
		    }else { 
		    	return false;
		   	}	
 		});
	});
});
</script>
</head>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>REVIEW</h1><hr>
</div>
	<c:if test="${empty list}">
	<center>
		<div>
			작성된 리뷰가 없습니다.
		</div>
	</center>
	</c:if>	
	<c:if test="${not empty list}">
		<sec:authorize access="hasRole('ROLE_USER')">
			<input type="hidden" id="loginMemberId" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}">
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<input type="hidden" id="loginAdminId" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.adminId}">
		</sec:authorize>
		<c:forEach var="reviewList" items="${list}" varStatus="st" >
		  <div class="row">
		  	<div class="col-lg-1">
	          <a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${reviewList.outerNo}">
            	<img class="card-img-top" src="<c:url value='/image/${reviewList.outer.imageName}'/>" alt="">
           	  </a>
	        </div>	              
	        <div class="col-lg-9">
	        	<c:if test="${reviewList.star == 1}">
	        		<h2>★☆☆☆☆</h2>
	        	</c:if>
	        	<c:if test="${reviewList.star == 2}">
	        		<h2>★★☆☆☆</h2>
	        	</c:if>
	        	<c:if test="${reviewList.star == 3}">
	        		<h2>★★★☆☆</h2>
	        	</c:if>
	        	<c:if test="${reviewList.star == 4}">
	        		<h2>★★★★☆</h2>
	        	</c:if>
	        	<c:if test="${reviewList.star == 5}">
	        		<h2>★★★★★</h2>
	        	</c:if>          
	          <h5>${reviewList.subject} (${reviewList.reviewDate})</h5>
	          <p>${reviewList.content}</p>
	          <a style="color:white;" href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${reviewList.outerNo}" class="btn btn-primary" >상품 상세보기</a>
	          <input type="hidden" id="reviewNo_${reviewList.reviewNo}" name="reviewNo" value="${reviewList.reviewNo}">
	          <input type="hidden" id="writeMemberId_${reviewList.reviewNo}" name="writeMemberId" value="${reviewList.memberId}">
	          <a style="color:white;" id="modifyButton_${reviewList.reviewNo}" name="modifyButton" href="${pageContext.request.contextPath}/member/modifyReviewPage.do?reviewNo=${reviewList.reviewNo}" class="btn btn-primary">수정하기</a>
	          <a style="color:white;" id="removeButton_${reviewList.reviewNo}" name="removeButton" href="${pageContext.request.contextPath}/member/removeMemberReview.do?reviewNo=${reviewList.reviewNo}" class="btn btn-primary">삭제하기</a>
	        </div>
	        <div class="col-lg-2">
	          <p>아이디 : ${reviewList.memberId}</p>
	          <c:if test="${reviewList.pictureName != null}">
	          	<img class="card-img-top" src="<c:url value='/image/${reviewList.pictureName}'/>" alt="">
	          </c:if>
	        </div>
	      </div>
	      <hr>
		</c:forEach>
		<%-- ######################################################
									페이징 처리
				###################################################### --%>		
		<nav aria-label="Page navigation example">
		  <ul class="pagination ulCenter">    
			<!--
				이전 페이지 그룹 처리.
				만약에 이전페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리.
			 -->
			<li class="page-item">
			<c:choose>
				<c:when test="${requestScope.pageBean.previousPageGroup}">
					<%-- 이전페이지 그룹이 있디면 : previousPageGroup()--%>
					<a class="page-link" style="color:blue;" href="${pageContext.request.contextPath}/reviewPage.do?page=1" aria-label="Previous">
		       			<span aria-hidden="true">&laquo;</span>
		        		<span class="sr-only">Previous</span>
		      		</a>
				</c:when>
				<c:otherwise>
					<a class="page-link" aria-label="Previous">
		        		<span aria-hidden="true">&laquo;</span>
		       			<span class="sr-only">Previous</span>
		      		</a>
				</c:otherwise>
			</c:choose>
		    </li>
			<!-- 
				현재 page가 속한 page 그룹내의 페이지들 링크.
				현재 pageGroup의 시작page ~ 끝 page
			 -->
			 <!-- 만약에 page가 현재페이지면 링크처리를 하지 않고 page가 현재페이지가 아니라면 링크처리. -->
				<c:forEach begin="${requestScope.pageBean.beginPage}" end="${requestScope.pageBean.endPage}" var="page">
					<c:choose>
						<c:when test="${requestScope.pageBean.page != page}"> <%-- 현재패이지가 아니라면 --%>
							<li class="page-item"><a style="color:blue;" class="page-link" href="${pageContext.request.contextPath}/reviewPage.do?page=${page}">${page}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link">${page}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			<!-- 
				다음페이지 그룹으로 이동
				만약에 다음페이지 그룹이 있으면 링크 처리 없으면 화살표만 나오도록 처리
			 -->
			<li class="page-item">
			<c:choose> 	
				<c:when test="${requestScope.pageBean.nextPageGroup}">
					<%-- 다음페이지 그룹이 있디면 : nextPageGroup()--%>
		    		<a class="page-link" style="color:blue;" href="${pageContext.request.contextPath}/reviewPage.do?page=${requestScope.pageBean.endPage + 1}" aria-label="Next">
		        		<span aria-hidden="true">&raquo;</span>
		        		<span class="sr-only">Next</span>
		      		</a>		
				</c:when>
				<c:otherwise>
					<a class="page-link" aria-label="Next">
		        		<span aria-hidden="true">&raquo;</span>
		       			<span class="sr-only">Next</span>
		      		</a>		
				</c:otherwise>
			</c:choose>
			</li>
		  </ul>
		</nav>		
	</c:if>
</div>
	
</body>
</html>