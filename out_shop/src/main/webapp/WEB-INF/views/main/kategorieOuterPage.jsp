<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>OUTSHOP</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#search").click(function(){
		var items = $('#items').val();
		
		if(items == ''){
			alert("검색어를 작성하시오.");
		}else{
			location.replace('${pageContext.request.contextPath}/kategorieOuterList.do?items='+items);
		}
	});
	
	//$('input[id^=outerCount_]').each(function(e){
	$('input[name="outerCount"]').each(function(){
		//var no = e.target.id.substring(11);
		var no = $(this).val();
		
		var color = $('#colorList'+no).val();
		
 		var colorArray = color.split(',');
		
 		for(var i in colorArray){
 			if(colorArray[i] == '블랙'){
				var colorCss = '<font size="5" style="color:black;">■</font>';
				
				$('#colorSpan'+no).append(colorCss);
			}
 			if(colorArray[i] == '화이트'){
				var colorCss = '<font size="5" style="color:white;">■</font>';
				
				$('#colorSpan'+no).append(colorCss);
			}
 			if(colorArray[i] == '레드'){
				var colorCss = '<font size="5" style="color:red;">■</font>';
				
				$('#colorSpan'+no).append(colorCss);
			}
 			if(colorArray[i] == '네이비'){
				var colorCss = '<font size="5" style="color:#08088A;">■</font>';
				
				$('#colorSpan'+no).append(colorCss);
			}
 			if(colorArray[i] == '차콜'){
				var colorCss = '<font size="5" style="color:#2E2E2E;">■</font>';
				
				$('#colorSpan'+no).append(colorCss);
			}
			if(colorArray[i] == '아이보리'){
				var colorCss = '<font size="5" style="color:#FFE4B5;">■</font>';
				
				$('#colorSpan'+no).append(colorCss);
			}	
		}	
		
	});
	
	$('input[name="outerTop3Count"]').each(function(){
		//var no = e.target.id.substring(11);
		var no = $(this).val();
		
		var color = $('#colorTop3List'+no).val();
		
 		var colorArray = color.split(',');
		
 		for(var i in colorArray){
 			if(colorArray[i] == '블랙'){
				var colorCss = '<font size="5" style="color:black;">■</font>';
				
				$('#colorTop3Span'+no).append(colorCss);
			}
 			if(colorArray[i] == '화이트'){
				var colorCss = '<font size="5" style="color:white;">■</font>';
				
				$('#colorTop3Span'+no).append(colorCss);
			}
 			if(colorArray[i] == '레드'){
				var colorCss = '<font size="5" style="color:red;">■</font>';
				
				$('#colorTop3Span'+no).append(colorCss);
			}
 			if(colorArray[i] == '네이비'){
				var colorCss = '<font size="5" style="color:#08088A;">■</font>';
				
				$('#colorTop3Span'+no).append(colorCss);
			}
 			if(colorArray[i] == '차콜'){
				var colorCss = '<font size="5" style="color:#2E2E2E;">■</font>';
				
				$('#colorTop3Span'+no).append(colorCss);
			}
			if(colorArray[i] == '아이보리'){
				var colorCss = '<font size="5" style="color:#FFE4B5;">■</font>';
				
				$('#colorTop3Span'+no).append(colorCss);
			}	
		}	
		
	});
});
</script>
</head>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
	<div style="text-align:center;">
		<c:if test="${items eq 'Outer'}">
			<h1>ALL PRODUCT</h1><hr class="hrStyle">
		</c:if>
		<c:if test="${items eq 'Jacket'}">
			<h1>JACKET</h1><hr class="hrStyle"> 
		</c:if>
		<c:if test="${items eq 'Coat'}">
			<h1>COAT</h1><hr class="hrStyle">
		</c:if>
		<c:if test="${items eq 'Padding'}">
			<h1>PADDING</h1><hr class="hrStyle">
		</c:if>
		<c:if test="${items eq 'Vest'}">
			<h1>VEST</h1><hr class="hrStyle">
		</c:if>
		<c:if test="${items eq 'Cardigan'}">
			<h1>CARDIGAN</h1><hr class="hrStyle">
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
	<!-- 관리자 로그인 할 경우 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-sm-8">
				</div>
				<div class="col-sm-3">
					<input class="form-control" type="text" name="items" id="items">
				</div>
				<div class="col-sm-1">
					<input class="btn btn-dark" type="button" id="search" value="검색">
				</div>
			</div>
		</sec:authorize>
		<div class="row" style="text-align:center;">
	     <c:forEach var="outer" items="${list}" varStatus="st">
      	<c:if test="${outer.totalAmount == '0'}">
	        <div class="col-lg-4 col-sm-6 portfolio-item">
	          <input type="hidden" id="outerCount_${outer.outerNo}" name="outerCount" value="${outer.outerNo}">
	          <input type="hidden" id="colorList${outer.outerNo}" value="${outer.totalColor}">
	          <div class="card h-100 cardBox" style="position:relative;">
            	<img class="card-img-top" style="opacity:0.2" src="<c:url value='/image/${outer.imageName}'/>" alt="">
            	<div style="position:absolute;">
            		<font size="10" style="text-align:center;">SOLD OUT</font>
            	</div>
	            <div class="card-body">
	              <h6 class="card-title">
	                <strong>
	                	<a href="#">${outer.name}</a>
	                </strong>
	              </h6>
	              <div class="card-text">
	              	상품이 없습니다.
	              </div>
	              <br><br>       
	            </div>
	            <div class="card-body">
	            	<span class="border border-dark"><strong>&nbsp;&nbsp;OUTSHOP&nbsp;&nbsp;</strong></span>
	            </div>
	          </div>
	        </div>      	
      	</c:if>
      	<c:if test="${outer.totalAmount != '0'}">
	        <div class="col-lg-4 col-sm-6 portfolio-item">
	          <input type="hidden" id="outerCount${outer.outerNo}" name="outerCount" value="${outer.outerNo}">
	          <input type="hidden" id="colorList${outer.outerNo}" value="${outer.totalColor}">
	          <div class="card h-100 cardBox">
	            <a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${outer.outerNo}">
	            	<img class="card-img-top" src="<c:url value='/image/${outer.imageName}'/>" alt="">
	            </a>
	            <div class="card-body">
	              <h6 class="card-title">
	                <strong>
	                	<a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${outer.outerNo}">${outer.name}</a>
	                </strong>
	              </h6>
	              <div class="card-text">
	              	${outer.totalSize}
	              </div>
	              <span class="card-text" id="colorSpan${outer.outerNo}"></span>
	              <h6><fmt:formatNumber value="${outer.price}" pattern="#,###.##"/> won</h6>           
	            </div>
	            <div class="card-body">
	            	<span class="border border-dark"><strong>&nbsp;&nbsp;OUTSHOP&nbsp;&nbsp;</strong></span>
	            </div>
	          </div>
	        </div>    	
      	</c:if>
	      </c:forEach>
	    </div>
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
							<li class="page-item"><a style="color:blue;" class="page-link" href="${pageContext.request.contextPath}/kategorieOuterList.do?page=${page}&items=${requestScope.items}">${page}</a></li>
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