<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>나의 WishList</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//상품 선택하기
$(document).ready(function() {	
	//상품삭제
	$("#deleteWishList").click(function() {
		
		if ( $("input[name='checkBox']").is(":checked") == false) {
		      alert("삭제할 상품을 선택하세요.");
		      return;
		}
		else{
			var checkArr = []; 

		    $("input[name='checkBox']:checked").each(function(i){
		    	checkArr.push($(this).val());
		    }) ;
		    
		 
			$.ajax
			({		
				"url":"${pageContext.request.contextPath}/member/deleteWishList.do", 
				"type":"POST",
				"data":{ "checkList" : checkArr},
				"dataType":"text",
				"success":function(data)
				{
					 $("input[name='checkBox']:checked").each(function(i){
						 var no = $(this).val();
						 $("#tr"+ no).remove();
					 }) ;
					
					alert("관심상품을 삭제하였습니다.");
				}
			});
		} 
	});
});
</script>
</head>
<body>

<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>WISH LIST</h1><hr>
</div>
	<c:if test="${empty list}">
	<center>
		<div>
			관심상품 내역이 없습니다.
		</div>
	</center>
	</c:if>	
	<c:if test="${not empty list}">
		<center>
		<div>
		<table class="table table-hover" >
			<thead>
			<tr>
				<th></th>
				<th>상품 이미지</th>
				<th>상품 이름</th>
				<th>가격</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="wishList" items="${list}" varStatus="st">
			<tr id="tr${wishList.wishNo}">		
				<c:forEach var="outerWishList" items="${wishList.list}" varStatus="st">					
					<td>
						<input type="checkBox" id="check${wishList.wishNo}" name="checkBox" value="${wishList.wishNo}">
					</td>
					<td>						
						<a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${outerWishList.outerNo}">
							<img src="<c:url value='/image/thumbnail/${outerWishList.thumbnailName}'/>"/>
						</a>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${outerWishList.outerNo}">
							${outerWishList.name}
						</a>
					</td>
					<td>
						<fmt:formatNumber value="${outerWishList.price}" pattern="#,###.##"/> won
					</td>
				</c:forEach>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
		</center>
		<input class="btn btn-dark" type="button" id="deleteWishList" name="deleteWishList" value="상품삭제">
		

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
			<a class="page-link" style="color:blue;" href="${pageContext.request.contextPath}/member/wishListSearch.do?page=1&memberId=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}" aria-label="Previous">
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
					<li class="page-item"><a style="color:blue;" class="page-link" href="${pageContext.request.contextPath}/member/wishListSearch.do?page=${page}&memberId=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}">${page}</a></li>
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
    		<a class="page-link" style="color:blue;" href="${pageContext.request.contextPath}/member/wishListSearch.do?page=${requestScope.pageBean.endPage + 1}&memberId=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}" aria-label="Next">
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