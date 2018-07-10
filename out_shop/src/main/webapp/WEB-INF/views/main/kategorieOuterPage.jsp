<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
	<div style="text-align:center;">
		<c:if test="${items eq 'Outer'}">
			<h1>ALL PRODUCT</h1><hr>
		</c:if>
		<c:if test="${items eq 'Jacket'}">
			<h1>JACKET</h1><hr>
		</c:if>
		<c:if test="${items eq 'Coat'}">
			<h1>COAT</h1><hr>
		</c:if>
		<c:if test="${items eq 'Padding'}">
			<h1>PADDING</h1><hr>
		</c:if>
		<c:if test="${items eq 'Vest'}">
			<h1>VEST</h1><hr>
		</c:if>
		<c:if test="${items eq 'Cardigan'}">
			<h1>CARDIGAN</h1><hr>
		</c:if>
	</div>
	<c:if test="${empty list}">
		<center>
			<div>
				상품이 준비되지 않았습니다.
			</div>
		</center>
	</c:if>	
	<c:if test="${not empty list}">
		<div class="row">
	     <c:forEach var="outer" items="${list}" varStatus="st">
	       <div class="col-lg-4 col-sm-6 portfolio-item">
	         <div class="card h-100">
	           <a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${outer.outerNo}">
	           	<img class="card-img-top" src="<c:url value='/image/${outer.imageName}'/>" alt="">
	           </a>
	           <div class="card-body">
	             <h4 class="card-title">
	               <a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${outer.outerNo}">${outer.name}</a>
	             </h4>
	             <p class="card-text">
	             	<h6><fmt:formatNumber value="${outer.price}" pattern="#,###.##"/> won</h6>
	             </p>
	           </div>
	         </div>
	       </div>
	      </c:forEach>
	    </div>
		<%-- ######################################################
									페이징 처리
				###################################################### --%>	
		<nav aria-label="Page navigation example">
		  <ul class="pagination">    
			<!--
				이전 페이지 그룹 처리.
				만약에 이전페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리.
			 -->
			<li class="page-item">
			<c:choose>
				<c:when test="${requestScope.pageBean.previousPageGroup}">
					<%-- 이전페이지 그룹이 있디면 : previousPageGroup()--%>
					<a class="page-link" href="${pageContext.request.contextPath}/kategorieOuterList.do?page=1&items=${requestScope.items}" aria-label="Previous">
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
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/kategorieOuterList.do?page=${page}&items=${requestScope.items}">${page}</a></li>
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
		    		<a class="page-link" href="${pageContext.request.contextPath}/kategorieOuterList.do?page=${requestScope.pageBean.endPage + 1}&items=${requestScope.items}" aria-label="Next">
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