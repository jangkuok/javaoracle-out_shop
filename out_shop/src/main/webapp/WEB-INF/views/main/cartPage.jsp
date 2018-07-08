<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

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
		    	var tr = checkbox.parent().parent().eq(i);
			    var td = tr.children();
			    
			    var cartNo = td.eq(1).text();

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
		
		var loginId = $('#id').val();
		
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
			
			var rowData = [];
			var checkArr = []; 
			var checkbox = $("input[name='checkBox']:checked");
			
			//테이블 행의 모든 값 가져오기
			checkbox.each(function(i){   			    	
		    	var tr = checkbox.parent().parent().eq(i);
			    var td = tr.children();
			    rowData.push(tr.text());
			    
			    var cartNo = td.eq(1).text();
		        var productNo = td.eq(2).text();
		        var productName = td.eq(3).text();
		        var productColor = td.eq(4).text();
		        var productSize = td.eq(5).text();
		        var productPrice = td.eq(6).text();
		        
		        checkArr.push(cartNo);
		        checkArr.push(productNo);
		        checkArr.push(productName);
		        checkArr.push(productColor);
		        checkArr.push(productSize);
		        checkArr.push(productPrice);
			});	
			
			alert(checkArr);
		    
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
<h1>CART</h1><hr>
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
		<table class="table table-hover">
			<thead>
			<tr>
				<th></th>
				<th>번호</th>
				<th>상품 번호</th>
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
							<input type="checkBox" id="checkBox" name="checkBox">
						</td>
						<td>${cartList.cartNo}</td>
						<td>${cartList.productNo}</td>
						<td>${cartList.productName}</td>
						<td>${cartList.productColor}</td>
						<td>${cartList.productSize}</td>
						<td>${cartList.productPrice}</td>
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