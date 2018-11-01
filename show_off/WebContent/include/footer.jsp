<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Footer</title>
 
 <style type="text/css">
/* @media screen and (min-width:768px) */

body ul{
padding: 0;
margin: 0;
}
a{
text-decoration: none;
color: inherit;
list-style: none;
}
.contents{
height: 160px;
width: 33.3333333%;
}
.row:before {
	content: " ";
	display: table;
}
.contacts{
background-image: linear-gradient(to right, #cdcdcd, #e1eef6);
margin-top: 20px;
margin-bottom: 0;
}
.contacts > div{

text-align: center;
padding: 35px;
}
.contacts > div > row{
margin: .5rem;
}
.contacts a > h2{
font-size: 17px;
margin-top: 15px;
}
.contents{
}
.text{
width: 100%;
}
h2{
font-family: inherit;
font-weight: 300;
line-height: 1.1;
color: inherit;
}
.text{
font-size: 1rem;
}
.contract{
width: 100%;
}
.contract > h2{
font-size: 1rem;
}
.bar{
font-size: 1rem;
}
.openinfo > #bar{
padding: 0;
}

.info{
width: 100%;
height: 405px;
background-color: #000;
}

.info>div:first-child{

padding: 85px 300px 20px;
display: flex;
flex-direction: row;

}
.info>div:first-child .paragraph {
order: 1;
text-align:left;
color: #fff;
font-size: 30px;
}
.info>div:first-child .paragraph:nth-child(2) {
order: 2;
text-align:right;
display:inline-block;
}

.paragraph{
width: 50%;
display: inline-block;
}
</style>

<script type="text/javascript">


</script>
</head>
<body id="index_footer">
<div class="row contacts">	

	<div class = contents>
		<div class="row">
			<div class="text"><h2>고객센터</h2></div>
			<div class="contract"><a href="#">1500-XXXX</a></div>
		</div>
	</div>
	<div class = contents>
		<div class="row">
			<div class="text"><h2>카카오톡</h2></div>
			<div class="contract"><a href="#">@SHOWOFF</a></div>
		</div>
		</div>
	<div class = contents>
		<div class="row">
			<div class="text"><h2>1:1 문의</h2></div>
		</div>
		<div class="contract"><a href ="#">문의하기</a></div>
		</div>
	<div class = text>
		<div class="openinfo hidden-sm hidden-md hidden-lg hidden-xl col-md- col-sm- col-xs-12 col-lg-"><h2 class="bar">평일 10:30~19:00</h2></div>
		<div class="openinfo hidden-xs col-md-12 col-sm-12 col-xs-12 col-lg-12"><h2 class="bar">평일 10:30~19:00　&nbsp;|&nbsp; 휴무 : 주말 및 법정공휴일</h2></div>
		<div class="openinfo hidden-sm hidden-md hidden-lg hidden-xl col-md- col-sm- col-xs-12 col-lg-"><h2 class="bar">휴무 : 주말 및 법정공휴일</h2></div>
	</div>
</div>

	<div class="info">
	 	<div class="padding-zero col-md-12 col-sm-12 col-xs-12 col-lg-12">
	 		<div class="paragraph"><strong>SHO</strong>WOFF</div>
	 		<div class="paragraph">All copy rights deserve SHOWOFF cop,.</div>
	 	</div>


	</div>


</body>
</html>