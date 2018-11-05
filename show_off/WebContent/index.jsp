<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>

<!DOCTYPE html >
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="300; url=index.bizpoll">
<title>ShowOff Main</title>


<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo:400');
	
* {
	font-family: 'Hanna', sans-serif;
}
body ,url{
margin: 0;
padding: 0;
background-color: #F5F5F5;
}
a{
text-decoration: none;
color: black;
}

#indexBody{
padding-top: 200px;
}
#wrap-index{
margin-top:65px;
width: 100%;
height: 100%;
z-index: 1;
}
.main-page{
display:block;
width: 70%;
height: 100%;
margin: 0 auto
}

.container{ 
width:100%;
margin: 0 auto;
padding: 0;
z-index: 100000;
}

.carousel-inner {
overflow: hidden;
width: 100%;
}
.carousel-inner > .item > a > img {
      width: 100%;
      margin: auto;
  }
.main-page .titleBanner{
  text-align: center;
  font-size: 21px;
  margin-top: 15px;
  margin-bottom: 40px;
  }
  
.main-page .titleBanner .text{
 font-size: 13px;
 }
.main-page .main-content{
min-width: 1400px;
}
.product-list .card-deck{
flex-wrap: wrap;
display: -webkit-flex;
vertical-align: bottom;
padding: 0 5px;
}
.card-img-top{
width: 
}


/* scrolltop btn */

#myBtn{
width:100px;
height:100px;
background-color:black;
color: white;
transform:rotate(315deg);
position: fixed;
right: -50px;
bottom:-50px;
text-align: center;
font-size: 12px;
}
#myBtn:hover {
	background-color: #8C8C8C;
	border-top:1px dashed black;
}

.productImageArea img{
width: 320px;
height: 400px;
}
.p_title{
width:100%;
height: 80px;
margin-bottom: 35px;
text-align: center;
color: #282c37;
font-size: 50px;
box-shadow: 0px 4px 10px 0 rgba(0, 0, 0, 0.2),
					0px 4px 10px 0 rgba(0, 0, 0, 0.10);	
opacity: 0.9;
}
</style>
<script type="text/javascript" src="bootstrap-4.1.3-dist/js/bootstrap.js"></script>
<script>
$(document).ready(function(){
    // Activate Carousel
    $("#myCarousel").carousel({interval: 2000, pause: "hover"});
    
    // Enable Carousel Indicators
    $(".item1").click(function(){
        $("#myCarousel").carousel(0);
    });
    $(".item2").click(function(){
        $("#myCarousel").carousel(1);
    });
    $(".item3").click(function(){
        $("#myCarousel").carousel(2);
    });
    $(".item4").click(function(){
        $("#myCarousel").carousel(3);
    });
    
    // Enable Carousel Controls
    $(".left").click(function(){
        $("#myCarousel").carousel("prev");
    });
    $(".right").click(function(){
        $("#myCarousel").carousel("next");
    });

    
    //scrolltop
    $("#myBtn").css("display" , "none");
    
	$(window).scroll(function() {
		if($(document).scrollTop() > 20){
			$("#myBtn").css("display" , "block");	
		}else{
			$("#myBtn").css("display" , "none");
		}
	});

	$(document).on("click" , "#myBtn" , function() {
		/* $(document).scrollTop(0);  */
		$("html , body" ).animate({scrollTop: 0} , 1000); 
	});
    
});
</script>


</head>
<body id="indexBody">

<div id="myBtn"><span>Top</span></div>

<!-- carousel -->

<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="item1 active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1" class="item2"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2" class="item3"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="3" class="item4"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="img/shp1.jpg?auto=yes&bg=777&fg=555&text=First slide" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/shp2.jpg?auto=yes&bg=666&fg=444&text=Second slide" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/shp3.jpg?auto=yes&bg=555&fg=333&text=Third slide" alt="Third slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/shp4.jpg?auto=yes&bg=555&fg=333&text=Third slide" alt="Third slide">
    </div>
  </div>
  <a class="left carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control-next" href="#myCarousel" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div><!-- carousel end -->



<div class="main-page">


<!--titleBanner  -->
<div class="titleBanner">
"POP UP"

<div class="text">Show Off your Quality and Loyalty</div>
</div>


<!--img card  -->
<!-- 1row -->
<div class="main-content container-fluid">
<div class="product-list">
<div class="card-deck">

	<div class="p_title">BEST 상품</div>
	  <c:forEach items="${bestlist }" var = "bestDTO">
			<div class="item col-md-4 col-sm-6 col-xs-6 col-lg-3">
			
				<div class="productImageArea" tabindex="12">
				<a href="#"><img alt="상품 이미지" src="img/${bestDTO.p_img }"></a>
				</div>
				
				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">First</th>
				      <th scope="col">Last</th>
				    </tr>
				  </thead>  
			    <tbody>
				    <tr>
				      <td>브랜드</td>
				      <td>${bestDTO.p_name }</td>
				    </tr>
			    </tbody>
			    
			    <tbody>
				    <tr>
				      <td>가격</td>
				      <%-- <td>${bestDTO.p_price }W</td> --%>
				      <%-- <fmt:formatNumber value ="0.25" type="percent"/> --%>
				      <%-- <fmt:formatNumber value ="3.141589" type="#.##"/> --%>
				      <td><fmt:formatNumber value="${bestDTO.p_price }" type="currency" /></td>
				    </tr>
			    </tbody>
			    
			     <tbody>
				    <tr>
				      <td>LIKE</td>
				      <td>${bestDTO.p_goodcnt }</td>
				    </tr>
			    </tbody>
				  
			  </table>			
				
			</div>
	  </c:forEach>
  
  <div class="p_title">THE 4 HIGHEST VALUE PRICE</div>
	  <c:forEach items="${highPriceList }" var = "highPriceDTO">
			<div class="item col-md-4 col-sm-6 col-xs-6 col-lg-3">
				<div class="productImageArea" tabindex="12">
					<a href="#"><img alt="상품 이미지" src="img/${highPriceDTO.p_img }"></a>
				</div>
				
				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">First</th>
				      <th scope="col">Last</th>
				    </tr>
				  </thead>  
			    <tbody>
				    <tr>
				      <td>브랜드</td>
				      <td>${highPriceDTO.p_name }</td>
				    </tr>
			    </tbody>
			    
			    <tbody>
				    <tr>
				      <td>가격</td>
				      <td><fmt:formatNumber value="${highPriceDTO.p_price }" type="currency" /></td>
				    </tr>
			    </tbody>
			    
			     <tbody>
				    <tr>
				      <td>LIKE</td>
				      <td>${highPriceDTO.p_goodcnt }</td>
				    </tr>
			    </tbody>
				  
			  </table>		
			</div>
	  </c:forEach>
  
  
  
  <div class="p_title">NEW ARRIVAL</div>
	  <c:forEach items="${newArrList }" var = "newArrDTO">
			<div class="item col-md-4 col-sm-6 col-xs-6 col-lg-3">
				<div class="productImageArea" tabindex="12">
					<a href="#"><img alt="상품 이미지" src="img/${newArrDTO.p_img }"></a>
				</div>
				
				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">First</th>
				      <th scope="col">Last</th>
				    </tr>
				  </thead>  
			    <tbody>
				    <tr>
				      <td>브랜드</td>
				      <td>${newArrDTO.p_name }</td>
				    </tr>
			    </tbody>
			    
			    <tbody>
				    <tr>
				      <td>가격</td>
				      <td><fmt:formatNumber value="${newArrDTO.p_price }" type="currency" /></td>
				    </tr>
			    </tbody>
			    
			     <tbody>
				    <tr>
				      <td>LIKE</td>
				      <td>${newArrDTO.p_goodcnt }</td>
				    </tr>
			    </tbody>
				  
			  </table>		
			</div>
	  </c:forEach>
  
  
  
  </div><!-- product list -->
  </div><!-- main-content -->
</div><!--main-page end  -->
</div>




</body>
<%@ include file="include/footer.jsp" %>


</html>