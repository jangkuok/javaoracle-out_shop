<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>장바구니</title>
<script type="text/javascript">
//카트 삭제
$(document).ready(function() {
	
	$("#removeCart").click(function() {
		if ( $("input[name='checkBox']:checked").length == 0) {
		      alert("삭제할 상품을 선택하세요.");
		      return;
		}
		else{
			var checkArr = []; 
			var checkbox = $("input[name='checkBox']:checked");
			
			//테이블 행의 모든 값 가져오기
			checkbox.each(function(i){  
				var cartNo = $(this).val();
		        checkArr.push(cartNo);
		    });

 			$.ajax
			({		
				"url":"${pageContext.request.contextPath}/outer/deleteCart.do", 
				"type":"POST",
				"data":{ "checkList" : checkArr},
				"dataType":"text",
				"success":function(data)
				{
					location.reload();
				}
			});
		}
	});
});

//상품 주문 
function orderProduct(){
	$(document).ready(function(){
		
		var loginId = $('#memberId').val();
		
		if ( $("input[name='checkBox']:checked").length == 0) {
		      alert("주문할 상품을 선택하세요.");
		      return;
		}
		else if(loginId == null){
			if(confirm('로그인 하시겠습니까?')) { 
				location.href="${pageContext.request.contextPath}/member/orderPage.do"
		    }else { 
		    	return;
		   	}		
		}else{
			
			var checkArr = []; 
			var checkbox = $("input[name='checkBox']:checked");

			$("input[name='checkBox']:checked").each(function(){
				var cartNo = $('#cartNo'+$(this).val()).val();
		        var productNo = $('#productNo'+$(this).val()).val();
		        var thumbnailName = $('#thumbnailName'+$(this).val()).val();
		        var productName = $('#productName'+$(this).val()).val();
		        var productColor = $('#productColor'+$(this).val()).val();
		        var productSize = $('#productSize'+$(this).val()).val();
		        var productPrice = $('#productPrice'+$(this).val()).val();
		        
		        checkArr.push(cartNo);
		        checkArr.push(productNo);
		        checkArr.push(thumbnailName);		        
		        checkArr.push(productName);	        
		        checkArr.push(productColor);
		        checkArr.push(productSize);
		        checkArr.push(productPrice);
		    });
			  
		    var $form = $('<form></form>');
		    $form.attr('action', '${pageContext.request.contextPath}/member/orderPages.do');
		    $form.attr('method', 'post');
		    $form.appendTo('body');
		    
		    var index = 1;
		    
		    var input = '<input value="'+loginId+'" name="memberId" type="hidden">';
		    $form.append(input);
		    
		    for (var i = 0; i < checkArr.length; i++) {
		    	var input = '<input value="'+checkArr[i]+'" name="productInfo'+index+'" type="hidden">';
		    	$form.append(input);
		    	index++;
			}
		    
		    $form.submit();
		}
	});
};

</script>
</head>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>CART</h1><hr class="hrStyle">
</div>
<c:if test="${empty sessionScope.cart}">
	<center>
		<div>
			장바구니에 상품이 없습니다.
		</div>
	</center>
</c:if>
<c:if test="${not empty sessionScope.cart}">
<input type="hidden" id="count" name="count" value="${sessionScope.size()}">
<input type="hidden" id="memberId" name="memberId" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}">
		<table class="table table-hover">
			<thead>
			<tr>
				<th></th>
				<th>번호</th>
				<th>이미지</th>
				<th>이름</th>
				<th>색상</th>
				<th>사이즈</th>
				<th>가격</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="cartList" items="${sessionScope.cart}" varStatus="st">
					<tr>
						<td>
							<input type="checkBox" id="checkBox" name="checkBox" value="${cartList.cartNo}">
						</td>
						<td>
							<input class="textTrans" type="text" id="cartNo${cartList.cartNo}" name="cartProduct" size="2" value="${cartList.cartNo}" readOnly="readOnly">
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${cartList.productNo}">
								<img src="<c:url value='/image/thumbnail/${cartList.thumbnailName}'/>"/>
							</a>
							<input type="hidden" id="productNo${cartList.cartNo}" name="cartProduct" value="${cartList.productNo}">
							<input type="hidden" id="thumbnailName${cartList.cartNo}" name="cartProduct" value="${cartList.thumbnailName}">
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${cartList.productNo}">
								${cartList.productName}
							</a>
							<input type="hidden" id="productName${cartList.cartNo}" name="cartProduct" value="${cartList.productName}">
						</td>
						<td>
							<input class="textTrans" type="text" id="productColor${cartList.cartNo}" name="cartProduct" value="${cartList.productColor}" readOnly="readOnly">
						</td>
						<td>
							<input class="textTrans" type="text" id="productSize${cartList.cartNo}" name="cartProduct" value="${cartList.productSize}" readOnly="readOnly">
						</td>
						<td>
							<fmt:formatNumber value="${cartList.productPrice}" pattern="#,###.##"/>
							<input type="hidden" id="productPrice${cartList.cartNo}" name="cartProduct" value="${cartList.productPrice}">
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<input class="btn" type="button" id="removeCart" name="removeCart" value="상품삭제">
		<input class="btn btn-dark" type="button" id="buyB" name="buyB" value="상품주문" onclick="orderProduct();">
</c:if>
</div>
</body>
</html>