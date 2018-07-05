<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%-- 
<div class="container">
<div class="row">
		 <!-- 품목 소개 -->
		 <c:forEach var="outer" items="${list}" varStatus="st">
		  <div class="row">			
           <div class="col-lg-4 col-md-6 mb-4">
             <div class="card h-100">
               <a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${outer.outerNo}">
               	<img class="card-img-top" src="<c:url value='/image/${outer.imageName}'/>" alt="">
               </a>
               <div class="card-body">
                 <h5 class="card-title">
                   <a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${outer.outerNo}">${outer.name}</a>
                 </h5>
                 <h6><fmt:formatNumber value="${outer.price}" pattern="#,###.##"/> won</h6>
               	 <!-- 관리자 로그인 할 경우 -->
			  	 <sec:authorize access="hasRole('ROLE_ADMIN')">
			  		<a href="#" class="btn btn-primary">상품수정</a>
			  	 </sec:authorize>
               </div>
             </div>
           </div>
         </div>
        </c:forEach>
         <!-- /품목 소개 -->      
    </div>
    <!-- /신상품 3품목 소개 -->
</div>
<!-- 메인화면 -->
</div>
 --%>
 <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('http://placehold.it/1900x1080')">
            <div class="carousel-caption d-none d-md-block">
              <h3>First Slide</h3>
              <p>This is a description for the first slide.</p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Second Slide</h3>
              <p>This is a description for the second slide.</p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Third Slide</h3>
              <p>This is a description for the third slide.</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
 </header>
 
    <div class="container">
      <h1 class="my-4">BEST3</h1>

      <!-- Marketing Icons Section -->
      <div class="row">
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- 품목소개 -->
      <h2>NEW ARRIVALS</h2>

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
      <!-- /.row -->

      <!-- Features Section -->
      <div class="row">
        <div class="col-lg-6">
          <h2>Modern Business Features</h2>
          <p>The Modern Business template by Start Bootstrap includes:</p>
          <ul>
            <li>
              <strong>Bootstrap v4</strong>
            </li>
            <li>jQuery</li>
            <li>Font Awesome</li>
            <li>Working contact form with validation</li>
            <li>Unstyled page elements for easy customization</li>
          </ul>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
        </div>
        <div class="col-lg-6">
          <img class="img-fluid rounded" src="http://placehold.it/700x450" alt="">
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Call to Action Section -->
      <div class="row mb-4">
        <div class="col-md-8">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
        </div>
        <div class="col-md-4">
          <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
        </div>
      </div>

    </div>
<!-- /.container -->