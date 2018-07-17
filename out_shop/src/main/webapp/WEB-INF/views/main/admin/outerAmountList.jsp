<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<style type="text/css">
	form{
		display: inline;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>PRODUCT AMOUNT</h1><hr>
</div>
	<table  class="table table-hover">
		<thead>
		<tr>
			<th>상품번호</th>
			<th>상품 이미지</th>
			<th>상품 이름</th>
			<th>상품 정보</th>
			<th>상품 가격</th>
		</tr>
		</thead>
		<tbody>
<%-- 		<c:forEach var="outer" items="${list}" varStatus="st">
			<tr>
				<td>${outer.outerNo}</td>
				<td>
					<img src="<c:url value='/image/thumbnail/${outer.thumbnailName}'/>"/>
				</td>
				<td>
					${outer.name}<br>
				</td>
				<td>
					<c:forEach var="size" items="${outer.sizeList}" varStatus="st2">
						${size.type} : ${size.amount} 개 (${size.color})<br>
					</c:forEach>
				</td>
				<td>
					<fmt:formatNumber value="${outer.price}" pattern="#,###.##"/>
				</td>
			</tr>
		</c:forEach> --%>
		<c:forEach var="outer" items="${list}" varStatus="st">


			<c:forEach var="size" items="${outer.sizeList}" varStatus="st2">
					<tr>
						<td>${outer.outerNo}</td>
						<td>
							<img src="<c:url value='/image/thumbnail/${outer.thumbnailName}'/>"/>
						</td>
						<td>
							${outer.name}<br>
							<form id="updateProductForm" name="updateProductForm" action="${pageContext.request.contextPath}/admin/modifyOuterPage.do" method="post">
								<input type="hidden" id="outerNo" name="outerNo" value="${outer.outerNo}">
								<input type="hidden" id="modify" name="modify" value="상품">	
								<input class="btn btn-primary" type="submit" id="updateProduct" name="updateProduct" value="상품 수정">
							</form>
							<form id="updateSizeForm" name="updateSizeForm" action="${pageContext.request.contextPath}/admin/modifyOuterPage.do" method="post">
								<input type="hidden" id="outerNo" name="outerNo" value="${outer.outerNo}">
								<input type="hidden" id="modify" name="modify" value="사이즈">		
								<input class="btn btn-primary" type="submit" id="updateSize" name="updateSize" value="사이즈 수정">
							</form>
							<form id="updateImagesForm" name="updateImagesForm" action="${pageContext.request.contextPath}/admin/modifyOuterPage.do" method="post">
								<input type="hidden" id="outerNo" name="outerNo" value="${outer.outerNo}">	
								<input type="hidden" id="modify" name="modify" value="이미지">	
								<input class="btn btn-primary" type="submit" id="updateImages" name="updateImages" value="이미지 수정">
							</form>
						</td>
						<td>
							   <c:choose>
							       <c:when test="${size.type == 'S'}">
							           <p style="color:red;">${size.type}</p> : ${size.amount} 개 (${size.color})<br>
							       </c:when>
							       <c:when test="${size.type == 'M'}">
							           <p style="color:blue;">${size.type}</p> : ${size.amount} 개 (${size.color})<br>
							       </c:when>
							       <c:when test="${size.type == 'L'}">
							           <p style="color:orange;">${size.type}</p> : ${size.amount} 개 (${size.color})<br>
							       </c:when>
							       <c:when test="${size.type == 'XL'}">
							           <p style="color:green;">${size.type}</p> : ${size.amount} 개 (${size.color})<br>
							       </c:when>
							       <c:when test="${size.type == 'FREE'}">
							           <p style="color:black;">${size.type}</p> : ${size.amount} 개 (${size.color})<br>
							       </c:when>
							   </c:choose>
							
						</td>
						<td>
							<fmt:formatNumber value="${outer.price}" pattern="#,###.##"/> won
						</td>
					</tr>
			</c:forEach>
			
			
		</c:forEach>
		</tbody>
	</table>
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
				<a class="page-link" style="color:blue;" href="${pageContext.request.contextPath}/admin/outerAmountList.do?page=1" aria-label="Previous">
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
						<li class="page-item"><a style="color:blue;" class="page-link" href="${pageContext.request.contextPath}/admin/outerAmountList.do?page=${page}">${page}</a></li>
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
	    		<a class="page-link" style="color:blue;" href="${pageContext.request.contextPath}/admin/outerAmountList.do?page=${requestScope.pageBean.endPage + 1}" aria-label="Next">
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
</div>
</body>
</html>