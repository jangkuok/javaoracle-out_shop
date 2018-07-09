<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    <!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
      	<a class="navbar-brand" href="${pageContext.request.contextPath}/.do">OUTSHOP</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
          	<!-- 회원 , 비회원일 경우 -->
          	<sec:authorize access="!hasRole('ROLE_ADMIN')">	 
          		<li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/.do">Home</a>
	            </li>
          		<li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/kategorieOuterList.do?items=Outer">Outer</a>
	            </li>
          		<li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/kategorieOuterList.do?items=Jacket">Jacket</a>
	            </li>
				<li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/kategorieOuterList.do?items=Coat">Coat</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/kategorieOuterList.do?items=Padding">Padding</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/kategorieOuterList.do?items=Vest">Vest</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/kategorieOuterList.do?items=Cardigan">Cardigan</a>
	            </li>
				<li class="nav-item">
	              <a class="nav-link" href="#">Review</a> 
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/outer/cartPage.do">Cart</a> 
	            </li>	 	    
	        </sec:authorize>
	                 
            <!-- 비로그인일 경우 -->
			<sec:authorize access="!isAuthenticated()">	 
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/loginFormPage.do">Login</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/joinPage.do">Join</a>
	            </li>	           		
			</sec:authorize>
			
            <!-- 회원 로그인 할 경우 -->
			<sec:authorize access="hasRole('ROLE_USER')">
				<input type="hidden" id="id" name="id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}">
            	<li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/member/myPage.do?id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}">MyPage</a>
	            </li>				                 
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/logoutButton.do">Logout</a>
	            </li>	            
            </sec:authorize>
            
            <!-- 관리자 로그인 할 경우 -->
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li class="nav-item">
	               <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminOrderListPage.do?items=전체보기">주문관리</a>
	            </li>
				<li class="nav-item">
	               <a class="nav-link" href="${pageContext.request.contextPath}/admin/outerForm.do">상품등록</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="#">게시판 관리</a>
	            </li>			
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/logoutButton.do">로그아웃</a>
	            </li>	
			</sec:authorize>       
          </ul>
        </div>
      </div>
    </nav>
