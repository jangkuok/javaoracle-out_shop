<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="ko-kr">
<head>
 <meta charset="utf-8">
<title>주문 완료</title>
</head>
<script type="text/javascript">
//새로고침 뒤로가기 방지 javascript
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
};
</script>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>ORDER SUCCESS</h1><hr>
</div>
     <div class="row">
        <div class="col-lg-12 mb-6" style="margin:auto;text-align:center;">
          <div class="card h-100">
            <h4 class="card-header">주문이 완료되었습니다.</h4>
            <div class="card-body">
				<table  class="table table-hover">
					<thead>
					<tr>
						<th width="5%"></th>
						<th width="12%">상품 이미지</th>
						<th width="30%">상품 이름</th>
						<th width="15%">사이즈</th>
						<th width="20%">색상</th>
						<th width="18%">가격</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="productList" items="${productList}" varStatus="st">					
							<tr>
								<td>
									${st.count}
								</td>
								<td>
									<img class="card-img-top" src="<c:url value='/image/thumbnail/${productList.thumbnailName}'/>" alt="" width="" >	
								</td>
								<td>
									${productList.productName}
								</td>
								<td>
									${productList.productSize}
								</td>
								<td>
									${productList.productColor}
								</td>
								<td>
									<fmt:formatNumber value="${productList.productPrice}" pattern="#,###.##"/>		
								</td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
				<hr>
				결제 금액 : <fmt:formatNumber value="${order.totalPrice}" pattern="#,###.##"/>&nbsp;won<br>	
				배송 메세지 : 
				<c:if test="${order.message != ''}">
					${order.message}
				</c:if>
				<c:if test="${order.message == ''}">
					메세지가 없습니다.
				</c:if>
            </div>
            <div class="card-footer" style="text-align:center;">
            	<a style="color:white;" href="${pageContext.request.contextPath}/" class="btn btn-dark">홈으로</a>          	      	
            </div>
          </div>
        </div>
	</div>
</div>
</body>
</html>