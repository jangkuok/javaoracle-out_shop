<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
$(document).ready(function() {			
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


<header style="margin-bottom:30px;">
     <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
       <ol class="carousel-indicators">
         <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
         <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
         <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
       </ol>
       <div class="carousel-inner" role="listbox">
         <!-- Slide One - Set the background image for this slide in the line below -->
         <div class="carousel-item active" style="background-image: url('<c:url value='/image/main.png'/>')">
           <div class="carousel-caption d-none d-md-block">
             <!-- <h3>First Slide</h3>
             <p>This is a description for the first slide.</p> -->
           </div>
         </div>
         <!-- Slide Two - Set the background image for this slide in the line below -->
         <div class="carousel-item" style="background-image: url('<c:url value='/image/main2.png'/>')">
         </div>
         <!-- Slide Three - Set the background image for this slide in the line below -->
         <div class="carousel-item" style="background-image: url('<c:url value='/image/main3.png'/>')">
           <div class="carousel-caption d-none d-md-block">
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
	
    <div class="container"  style="text-align:center;">
    <c:if test="${not empty top}">
      <h1 class="my-4">BEST3</h1><hr>
      <div class="row" style="margin-bottom:30px;">
      <c:forEach var="outer" items="${top}" varStatus="st">
	    <div class="col-lg-4 col-sm-6 portfolio-item">
          <input type="hidden" id="outerTop3Count${outer.outerNo}" name="outerTop3Count" value="${outer.outerNo}">
          <input type="hidden" id="colorTop3List${outer.outerNo}" value="${outer.totalColor}">
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
              <span class="card-text" id="colorTop3Span${outer.outerNo}"></span>
              <h6><fmt:formatNumber value="${outer.price}" pattern="#,###.##"/> won</h6>           
            </div>
            <div class="card-body">
            	<span class="border border-dark"><strong>&nbsp;&nbsp;OUTSHOP&nbsp;&nbsp;</strong></span>
            </div>
          </div>
        </div>      
        </c:forEach>
      </div>		
      </c:if>
      <!-- 품목소개 -->
      <h2>NEW ARRIVALS</h2><hr class="hrStyle">
      
      <div class="row" style="margin-bottom:15px;text-align:center;">
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
      
      
      <!-- /.row -->

      <!-- Features Section -->
<!--       
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
      /.row
      <hr>
      Call to Action Section
      <div class="row mb-4">
        <div class="col-md-8">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
        </div>
        <div class="col-md-4">
          <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
        </div>
      </div> 
-->
    </div>
<!-- /.container -->