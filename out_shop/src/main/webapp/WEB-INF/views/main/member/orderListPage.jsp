<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
//상품 선택하기
$(document).ready(function() {
	 // 게시글 팝업(modal) 보기 
    $("input[id^=orderProductList_]").click(function (e) {
       
        var orderNo = e.target.id.substring(17); 
        
     
        $.ajax ({
            "url" : "${pageContext.request.contextPath}/member/productListSearch.do",
            "type" : "POST",
            "data":{ "orderNo" : orderNo},
            "dataType":"json",
            "success" : function (data) {
            	 $.each(data,function(index,item){
            		 var product = '<tr id="modalTr"><td>'+ item.outerNo + '</td>'+
            		 '<td>'+ item.productName + '</td>'+
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
    		$.form({
				"action": "${pageContext.request.contextPath}/member/haningUpdateOrder.do",
				"type":"POST",
				"data": {"orderNo" : i, "handing" : $('#paymentHanding').val(), "memberId" : $('#id').val()},
				"dataType":"text"
			}).submit();
	    }else { 
	    	return;
	    }
	});
}


//주문취소
function handingOrder(i){
	$(document).ready(function() {
     	if(confirm('주문을 취소 하시겠습니까?')) { 
    		$.form({
				"action": "${pageContext.request.contextPath}/member/haningUpdateOrder.do",
				"type":"POST",
				"data": {"orderNo" : i, "handing" : $('#handing').val(), "memberId" : $('#id').val()},
				"dataType":"text"
			}).submit();
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
	<c:if test="${empty list}">
		<div>
			주문 내역이 없습니다.
		</div>
	</c:if>
	
	<c:if test="${not empty list}">		
		<table  class="table table-hover">
			<thead>
			<tr>
				<th>주문번호</th>
				<th>입금액</th>
				<th>주문날짜</th>
				<th>진행상황</th>
				<th>상세보기</th>
				<th>주문관리</th>
				<th>결제하기</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="orderList" items="${list}" varStatus="st">
				<tr>
					<td>${orderList.orderNo}</td>
					<td>${orderList.totalPrice}</td>
					<td>${orderList.orderDate}</td>
					<td>${orderList.handing}</td>
					<td>
						<c:if test="${orderList.handing != '주문취소'}">
							<input type="button" id="orderProductList_${orderList.orderNo}" class="" 
								data-toggle="modal" data-target="#myModal" value="상세보기">					
						</c:if>
					</td>
					<td>
						<c:if test="${orderList.handing != '배송완료'}">
							<input type="hidden" id="handing" value="주문취소">
							<input type="button" id="hangingOrderB_${orderList.orderNo}" value="주문취소" onclick="handingOrder(${orderList.orderNo})">
						</c:if>
					</td>
					<td>
						<c:if test="${orderList.handing == '결제 대기중'}">
								<input type="hidden" id="paymentHanding" value="배송대기중">
								<input type="button" id="paymentB_${orderList.orderNo}" value="결제하기" onclick="payment(${orderList.orderNo})">
						</c:if>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
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