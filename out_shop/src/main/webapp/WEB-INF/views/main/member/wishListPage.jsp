<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<h1>WISHLIST</h1><hr>
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
		<table class="table table-hover">
			<thead>
			<tr>
				<th></th>
				<th>이미지</th>
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
		<input type="button" id="deleteWishList" name="deleteWishList" value="상품삭제">
		</div>
		</center>
		

<%-- ######################################################
							페이징 처리
		###################################################### --%>
<p style="text-align:center;">
	<!-- 첫페이지로 이동 -->
	<a href="${pageContext.request.contextPath}/member/wishListSearch.do?page=1&memberId=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}">첫페이지</a>

	<!--
		이전 페이지 그룹 처리.
		만약에 이전페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리.
	 -->
	<c:choose>
		<c:when test="${requestScope.pageBean.previousPageGroup}">
			<%-- 이전페이지 그룹이 있디면 : previousPageGroup()--%>
			<a href="${pageContext.request.contextPath}/member/wishListSearch.do?page=${requestScope.pageBean.beginPage - 1}&memberId=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}">◀</a>
		</c:when>
		<c:otherwise>
				◀
		</c:otherwise>
	</c:choose>
	
	<!-- 
		현재 page가 속한 page 그룹내의 페이지들 링크.
		현재 pageGroup의 시작page ~ 끝 page
	 -->
	 <!-- 만약에 page가 현재페이지면 링크처리를 하지 않고 page가 현재페이지가 아니라면 링크처리. -->
		<c:forEach begin="${requestScope.pageBean.beginPage}" end="${requestScope.pageBean.endPage}" var="page">
			<c:choose>
				<c:when test="${requestScope.pageBean.page != page}"> <%-- 현재패이지가 아니라면 --%>
					<a href="${pageContext.request.contextPath}/member/wishListSearch.do?page=${page}&memberId=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}">&nbsp;${page}&nbsp;</a>
				</c:when>
				<c:otherwise>
					&nbsp;[${page}]&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
	

	<!-- 
		다음페이지 그룹으로 이동
		만약에 다음페이지 그룹이 있으면 링크 처리 없으면 화살표만 나오도록 처리
	 -->
	<c:choose>
		<c:when test="${requestScope.pageBean.nextPageGroup}">
			<%-- 다음페이지 그룹이 있디면 : nextPageGroup()--%>
			<a href="${pageContext.request.contextPath}/member/wishListSearch.do?page=${requestScope.pageBean.endPage + 1}&memberId=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}">▶</a>
		</c:when>
		<c:otherwise>
				▶		
		</c:otherwise>
	</c:choose>			
	
	<!-- 마지막 페이지로 이동 -->
	<a href="${pageContext.request.contextPath}/member/wishListSearch.do?page=${requestScope.pageBean.totalPage}&memberId=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}">마지막페이지</a>
</p>
</c:if>
</div>
	
	
</body>
</html>