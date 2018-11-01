<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<style type="text/css">
body ul{
margin: 0px;
padding: 0px;
}

img{
vertical-align: middle;
}
#indexBody{
padding-top: 200px;
}
.product{

width: 100%;
height: 700px;
}

.product_info{
width:70%;
height:600px;
margin: 0 auto;
}

.imageWrap{
width: 50%;
height: 600px;
padding-top:50px;
float: left;
}
.imageWrap > img{
	max-width: 600px;
    display: block;
    max-height: 45rem;
    width: auto;
    margin: 0 auto

}
#product_img{
width: 80%;
height: 500px;
}
.product_detail{
width: 50%;
height: 600px;
padding-top:100px;
float:right;
}

.hidden-sm{
width:70%;
border-bottom: 1px solid gray;
margin-bottom: 10px;
}
.buyingbtnWrap button{
 width: 100%;
 margin: 0;
 height: 40px
}
.col-md-6 > .halfSize{
width: 49%;
}

</style>
</head>
<body id="indexBody">
<div class="product">

<c:if test="">
	<div class="row show-grid product_info">
	
		<div class="imageWrap padding-zero col-md-6 col-sm-12 col-xs-12 col-lg-6">
			<img id="product_img" alt="상품" src="img/20180127_636526505002368405.jpg">
		</div>
		<div class="product_detail">
			
			  <div class="hidden-sm hidden-xs padding-zero col-md-12 col-sm-12 col-xs-12 col-lg-12">브랜드 명</div>
			  <div class="hidden-sm hidden-xs padding-zero col-md-12 col-sm-12 col-xs-12 col-lg-12">상품 명</div>
			  <div class="hidden-sm hidden-xs padding-zero col-md-12 col-sm-12 col-xs-12 col-lg-12">.col-9</div>
			  
			  <br>
			  <hr>
			  
			  
			  <div class="hidden-sm hidden-xs padding-zero col-md-12 col-sm-12 col-xs-12 col-lg-12">상품 가격</div>
			  <div class="hidden-sm hidden-xs padding-zero col-md-12 col-sm-12 col-xs-12 col-lg-12">상품 명</div>
			  <div class="hidden-sm hidden-xs padding-zero col-md-12 col-sm-12 col-xs-12 col-lg-12">.col-9</div>
			  
			  <br>
			  <hr>
			  
			  <div class="row buyingbtnWrap">
			  	<div class=" col-md-6 col-sm-6 col-xs-12 col-lg-6">
			  		<button type="button" class="btn btn-dark btn-buying float-left">바로 구매하기</button>
			  	</div>
			  	<div class=" col-md-6 col-sm-6 col-xs-12 col-lg-6">
			  		<button type="button" class="btn btn-secondary false halfSize rightGap">장바구니 담기</button>
			  		<button type="button" class="btn btn-info halfSize">실시간 재고 확인</button>
			  	</div>
			  
			  
			  </div>
		</div>
	
		<hr>
	</div>
</c:if>
</div>










</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script type="text/javascript">



</script>
</html>