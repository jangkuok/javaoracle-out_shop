<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>주문 목록</title>
<!-- jQuery -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
<!-- 가격 "," 처리 추가  -->
function commaNum(num) {  
    var len, point, str;  

    num = num + "";  
    point = num.length % 3  
    len = num.length;  

    str = num.substring(0, point);  
    while (point < len) {  
        if (str != "") str += ",";  
        str += num.substring(point, point + 3);  
        point += 3;  
    }  
    return str;  
}
//상품 선택하기
$(document).ready(function() {
	 // 게시글 팝업(modal) 보기 
    $("input[id^=orderProductList_]").click(function (e) {
       
        var orderNo = e.target.id.substring(17); 
        var message = $('#message').val();
     
        $.ajax ({
            "url" : "${pageContext.request.contextPath}/admin/adminProductListSearch.do?orderNo="+orderNo,
            "type" : "GET",
            "data": {"orderNo" : orderNo},
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
            		 '<td>'+ commaNum(item.productPrice) + '</td></tr>'
            		 if(message == ""){
            			 $('#orderMessage').val('메세지가 없습니다.');
            		 }else{
            			 $('#orderMessage').val(message);	 
            		 }
					 
            		 $('.modal-body tbody').append(product);
            	 });
            }                  
        });

        $('input[id^=orderProductList_]').on('click',function(){
        	$('tr#modalTr').remove();
        });
    });
});
   
//상품 준비
function productPreparations(i){
	$(document).ready(function() {
	
     	if(confirm('결제를 확인했습니까?')) { 
    		$('#productPreparationsForm'+i).submit();
	    }else { 
	    	return;
	    }
	});
}


//배송 시작
function startDelivery(i){
	$(document).ready(function() {
     	if(confirm('배송을 시작 하시겠습니까?')) { 
     		$('#startDeliveryForm'+i).submit();
	    }else { 
	    	return;
	    }
	});
}

//주문취소 완료
function cancelOrder(i){
	$(document).ready(function() {
     	if(confirm('해당회원의 주문을 취소를 완료하겠습니까?')) { 
     		$('#cancelOrderForm'+i).submit();
	    }else { 
	    	return;
	    }
	});
}

//주문취소 완료
function successDelivery(i){
	$(document).ready(function() {
     	if(confirm('배송을 완료하겠습니까?')) { 
     		$('#successDeliveryForm'+i).submit();
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
	<a href="${pageContext.request.contextPath}/admin/adminOrderListPage.do?items=결제대기중" class="btn btn-primary">결제 대기중</a>
	<a href="${pageContext.request.contextPath}/admin/adminOrderListPage.do?items=상품준비중" class="btn btn-primary">상품 준비중</a>
	<a href="${pageContext.request.contextPath}/admin/adminOrderListPage.do?items=배송중" class="btn btn-primary">배송중</a>
	<a href="${pageContext.request.contextPath}/admin/adminOrderListPage.do?items=배송완료" class="btn btn-primary">배송완료</a>
	<a href="${pageContext.request.contextPath}/admin/adminOrderListPage.do?items=주문취소" class="btn btn-primary">주문취소</a>
	<a href="${pageContext.request.contextPath}/admin/adminOrderListPage.do?items=주문취소완료" class="btn btn-primary">주문취소 완료</a>
	<a href="${pageContext.request.contextPath}/admin/adminOrderListPage.do?items=전체보기" class="btn btn-primary">전체보기</a>
			
	<c:if test="${empty orderList}">
		<div style="margin-top:110px;text-align:center;">
			주문 내역이 없습니다.
		</div>
	</c:if>
	
	<c:if test="${not empty orderList}">
		<table  class="table table-hover">
			<thead>
			<tr>
				<th>주문번호</th>
				<th>이미지</th>
				<th>주문이름</th>
				<th>주문자</th>
				<th>입금액</th>
				<th>주문날짜</th>
				<th>진행상황</th>
				<th>주문관리</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="orderList" items="${orderList}" varStatus="st">
				<tr>
					<td>${orderList.orderNo}</td>
					<td>
						<img src="<c:url value='/image/thumbnail/${orderList.thumbnailName}'/>"/>
					</td>
					<td>
						${orderList.orderName}<br>
						<input type="hidden" id="message" value="${orderList.message}">
						<input type="button" id="orderProductList_${orderList.orderNo}" class="btn"	data-toggle="modal" data-target="#myModal" value="상세보기">
					</td>
					<td>
						${orderList.memberName}<br>
						[${orderList.memberId}]
					</td>
					<td>
						<fmt:formatNumber value="${orderList.totalPrice}" pattern="#,###.##"/>
					</td>
					<td>${orderList.orderDate}</td>
					<td>${orderList.handing}</td>
					<td> 
						<c:if test="${orderList.handing == '결제완료'}">
								<form id="productPreparationsForm${orderList.orderNo}" action="${pageContext.request.contextPath}/admin/haningUpdateOrder.do" method="post">
									<input type="hidden" id="handing" name="handing" value="상품 준비중">
									<input type="hidden" id="orderNo" name="orderNo" value="${orderList.orderNo}">
									<input type="button" class="btn btn-dark"  value="상품준비" onclick="productPreparations(${orderList.orderNo})">
								</form>
						</c:if>
						<c:if test="${orderList.handing == '주문취소'}">
								<form id="cancelOrderForm${orderList.orderNo}" action="${pageContext.request.contextPath}/admin/haningUpdateOrder.do" method="post">
									<input type="hidden" id="handing" name="handing" value="주문취소 완료">
									<input type="hidden" id="orderNo" name="orderNo" value="${orderList.orderNo}">
									<input type="button" class="btn btn-dark" value="취소완료" onclick="cancelOrder(${orderList.orderNo})">
								</form>
						</c:if>
						<c:if test="${orderList.handing == '상품 준비중'}">
								<form id="startDeliveryForm${orderList.orderNo}" action="${pageContext.request.contextPath}/admin/haningUpdateOrder.do" method="post">
									<input type="hidden" id="handing" name="handing" value="배송중">
									<input type="hidden" id="orderNo" name="orderNo" value="${orderList.orderNo}">
									<input type="button" class="btn btn-dark" value="배송출발" onclick="startDelivery(${orderList.orderNo})">
								</form>
						</c:if>		
						<c:if test="${orderList.handing == '배송중'}">
								<form id="successDeliveryForm${orderList.orderNo}" action="${pageContext.request.contextPath}/admin/haningUpdateOrder.do" method="post">
									<input type="hidden" id="handing" name="handing" value="배송완료">
									<input type="hidden" id="orderNo" name="orderNo" value="${orderList.orderNo}">
									<input type="button" class="btn btn-dark" value="배송완료" onclick="successDelivery(${orderList.orderNo})">
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
					<a class="page-link" href="${pageContext.request.contextPath}/amdin/adminOrderListPage.do?page=1&items=${requestScope.items}" aria-label="Previous">
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
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/amdin/adminOrderListPage.do?page=${page}&items=${requestScope.items}">${page}</a></li>
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
		    		<a class="page-link" href="${pageContext.request.contextPath}/amdin/adminOrderListPage.do?page=${requestScope.pageBean.endPage + 1}&items=${requestScope.items}" aria-label="Next">
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
				<div class="col-lg-10">
					<input class="textTrans" type="text" id="orderMessage" value="">
				</div>
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