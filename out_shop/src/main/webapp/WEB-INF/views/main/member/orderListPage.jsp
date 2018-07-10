<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
  <meta charset="utf-8">
<title>나의 주문 목록</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/bootstrap/css/modern-business.css" rel="stylesheet">
<!-- jQuery -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	// 상세보기 
    $("input[id^=orderProductList_]").click(function (e) {
       
        var orderNo = e.target.id.substring(17); 
        
        var orderHidden = $('#orderSuccessHidden').val();
     
        $.ajax ({
            "url" : "${pageContext.request.contextPath}/member/productListSearch.do",
            "type" : "POST",
            "data":{ "orderNo" : orderNo},
            "dataType":"json",
            "success" : function (data) {
            	 $.each(data,function(index,item){
           			 var product = '<tr id="modalTr"><td>'+ item.outerNo + '</td>'+
               		 '<td><a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo='+item.outerNo+'">'+
               		 '<img src="<c:url value="/image/thumbnail/'+item.thumbnailName+'"/>"/></a></td>'+
               		 '<td><a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo='+item.outerNo+'">'+ 
               		 item.productName + '</a></td>'+
               		 '<td>'+ item.productSize + '</td>'+
               		 '<td>'+ item.productColor + '</td>'+
               		 '<td>'+ item.productPrice + '</td></tr>'

            		 $('.modal-body tbody').append(product);
            	 });
            }                  
        });

        $('input[id^=orderProductList_]').on('click',function(){
        	$('tr#modalTr').remove();
        });
    });
    
	// 리뷰 작성 
    $("input[id^=reviewList_]").click(function (e) {
       
        var orderNo = e.target.id.substring(11); 
        
        var orderHidden = $('#orderSuccessHidden').val();
     
        $.ajax ({
            "url" : "${pageContext.request.contextPath}/member/productListSearch.do",
            "type" : "POST",
            "data":{ "orderNo" : orderNo},
            "dataType":"json",
            "success" : function (data) {
            	 $.each(data,function(index,item){
           			 var product = '<tr id="modalTr"><td>'+ item.outerNo + '</td>'+
               		 '<td><a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo='+item.outerNo+'">'+
               		 '<img src="<c:url value="/image/thumbnail/'+item.thumbnailName+'"/>"/></a></td>'+
               		 '<td><a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo='+item.outerNo+'">'+ 
               		 item.productName + '</a><br>'+
               		 '<a href="${pageContext.request.contextPath}/member/addReviewPage.do?outerNo='+item.outerNo+'&outerName='+item.productName+'" class="btn btn-dark">리뷰 등록</a>'+
               		 '</td>'+
               		 '<td>'+ item.productSize + '</td>'+
               		 '<td>'+ item.productColor + '</td>'+
               		 '<td>'+ item.productPrice + '</td></tr>'

            		 $('.modal-body tbody').append(product);
            	 });
            }                  
        });

        $('input[id^=orderProductList_]').on('click',function(){
        	$('tr#modalTr').remove();
        });
    });
});

//결제하기
function payment(i){
	$(document).ready(function() {
	
     	if(confirm('결제를 하시겠습니까?')) { 
    		$('#payForm'+i).submit();
	    }else { 
	    	return;
	    }
	});
}


//주문취소
function cancelOrder(i){
	$(document).ready(function() {
     	if(confirm('주문을 취소 하시겠습니까?')) { 
     		$('#cancelForm'+i).submit();
	    }else { 
	    	return;
	    }
	});
}

//주문완료
function successOrder(i){
	$(document).ready(function() {
     	if(confirm('주문을 완료 하시겠습니까?')) { 
     		$('#successOrderForm'+i).submit();
	    }else { 
	    	return;
	    }
	});
}

//반품 신청
function returnOrder(i){
	$(document).ready(function() {
     	if(confirm('반품 하시겠습니까?')) { 
     		$('#returnOrderForm'+i).submit();
	    }else { 
	    	return;
	    }
	});
}

</script>
</head>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>ORDER LIST</h1><hr>
</div>
	<a href="${pageContext.request.contextPath}/member/orderListSearch.do?memberId=${param.memberId}&items=1달" class="btn btn-primary">현재 ~ 1달전</a>
	<a href="${pageContext.request.contextPath}/member/orderListSearch.do?memberId=${param.memberId}&items=3달" class="btn btn-primary">현재 ~ 3달전</a>
	<a href="${pageContext.request.contextPath}/member/orderListSearch.do?memberId=${param.memberId}&items=1년" class="btn btn-primary">현재 ~ 1년전</a>
	<a href="${pageContext.request.contextPath}/member/orderListSearch.do?memberId=${param.memberId}&items=전체" class="btn btn-primary">전체</a>
			
	<c:if test="${empty list}">
		<div style="text-align:center;">
			주문 내역이 없습니다.
		</div>
	</c:if>
	
	<c:if test="${not empty list}">		
		<table  class="table table-hover">
			<thead>
			<tr>
				<th>주문번호</th>
				<th>이미지</th>
				<th>주문이름</th>
				<th>입금액</th>
				<th>주문날짜</th>
				<th>진행상황</th>
				<th>주문관리</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="orderList" items="${list}" varStatus="st">
				<tr>
					<td>${orderList.orderNo}</td>
					<td>
						<img src="<c:url value='/image/thumbnail/${orderList.thumbnailName}'/>"/>
					</td>
					<td>
						${orderList.orderName}<br>
						<input type="button" id="orderProductList_${orderList.orderNo}" class="btn" 
							data-toggle="modal" data-target="#myModal" value="상세보기">
						<c:if test="${orderList.handing == '배송완료' || orderList.handing == '주문완료'}">		
							<input type="button" id="reviewList_${orderList.orderNo}" class="btn btn-dark" 
									data-toggle="modal" data-target="#myModal" value="리뷰 작성">	
						</c:if>							
						
					</td>
					<td>
						<fmt:formatNumber value="${orderList.totalPrice}" pattern="#,###.##"/>
					</td>
					<td>${orderList.orderDate}</td>
					<td>${orderList.handing}</td>
					<td>
						<c:if test="${orderList.handing == '결제 대기중' || orderList.handing == '상품 준비중'}">
								<form id="cancelForm${orderList.orderNo}" action="${pageContext.request.contextPath}/member/haningUpdateOrder.do" method="post" style="margin-bottom:1px;">
									<input type="hidden" id="handing" name="handing" value="주문취소">
									<input type="hidden" id="orderNo" name="orderNo" value="${orderList.orderNo}">
									<input type="hidden" id="items" name="items" value="${param.items}">
									<input type="hidden" id="memberId" name="memberId" value="${orderList.memberId}">
									<input type="button" class="btn btn-dark" value="주문취소" onclick="cancelOrder(${orderList.orderNo})">
								</form>
						</c:if>
						<c:if test="${orderList.handing == '결제 대기중'}">
								<form id="payForm${orderList.orderNo}" action="${pageContext.request.contextPath}/member/haningUpdateOrder.do?" method="post" style="margin-bottom:1px;">
									<input type="hidden" id="handing" name="handing" value="결제완료">
									<input type="hidden" id="orderNo" name="orderNo" value="${orderList.orderNo}">
									<input type="hidden" id="items" name="items" value="${param.items}">
									<input type="hidden" id="memberId" name="memberId" value="${orderList.memberId}">
									<input type="button" class="btn btn-dark" value="결제하기" onclick="payment(${orderList.orderNo})">
								</form>
						</c:if>
						<c:if test="${orderList.handing == '배송완료'}">
								<form id="successOrderForm${orderList.orderNo}" action="${pageContext.request.contextPath}/member/haningUpdateOrder.do" method="post" style="margin-bottom:1px;">
									<input type="hidden" id="handing" name="handing" value="주문완료">
									<input type="hidden" id="orderNo" name="orderNo" value="${orderList.orderNo}">
									<input type="hidden" id="items" name="items" value="${param.items}">
									<input type="hidden" id="memberId" name="memberId" value="${orderList.memberId}">
									<input type="button" class="btn btn-dark" value="주문완료" onclick="successOrder(${orderList.orderNo})">
								</form>
								
								<form id="returnOrderForm${orderList.orderNo}" action="${pageContext.request.contextPath}/member/haningUpdateOrder.do" method="post" style="margin-bottom:1px;">
									<input type="hidden" id="handing" name="handing" value="반품중">
									<input type="hidden" id="orderNo" name="orderNo" value="${orderList.orderNo}">
									<input type="hidden" id="items" name="items" value="${param.items}">
									<input type="hidden" id="memberId" name="memberId" value="${orderList.memberId}">
									<input type="button" class="btn btn-dark" value="반품하기" onclick="returnOrder(${orderList.orderNo})">
								</form>
						</c:if>								
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
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
					<a class="page-link" href="${pageContext.request.contextPath}/member/orderListSearch.do?page=1&memberId=${param.memberId}&items=${param.items}" aria-label="Previous">
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
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/member/orderListSearch.do?page=${page}&memberId=${param.memberId}&items=${param.items}">${page}</a></li>
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
		    		<a class="page-link" href="${pageContext.request.contextPath}/member/orderListSearch.do?page=${requestScope.pageBean.endPage + 1}&memberId=${param.memberId}&items=${param.items}" aria-label="Next">
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


<!-- The modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="modalLabelLarge" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="modalLabelLarge">PRODUCT INFO</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			
			<div class="modal-body">
				<table class="table table-hover">
					<thead>
					<tr>
						<th>상품번호</th>
						<th>상품이미지</th>
						<th>상품이름</th>
						<th>사이즈</th>
						<th>색상</th>
						<th>가격</th>
					</tr>
					</thead>
					<tbody id="modalTbody">

					</tbody>
				</table>
			</div>		
		</div>
	</div>
</div>
</body>
</html>