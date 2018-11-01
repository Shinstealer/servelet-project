<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta http-equiv="refresh" content="5; url=index.bizpoll"> -->
<title>Welcome Page</title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
	body{
		margin: 0;
		padding: 0;
		font-family: 'Nanum Gothic', sans-serif;
		
	}
h1, h2, h3{
display: inline;
}
#welcome_wrap{
width:70%;
height:220px;
margin: 200px auto;
box-shadow: 0px 4px 10px 0 rgba(0, 0, 0, 0.2),
			0px 4px 10px 0 rgba(0, 0, 0, 0.10);
}
#showoff_name{
width: 50%;
height: 50px;
margin: 50px auto;
text-align: center;
font-size: 70px;
}
#join_complete_text{
width: 50%;
height: 70px;
margin: 50px auto;
color:#383A3F;
font-size:50px;
text-align: center;

}
#join_thanks_text{
width: 50%;
height: 50px;
margin: 0 auto;
color: #383A3F;
font-size: 20px;
font-weight:500;
text-align: center;
}
#pagemovetoindex{
width: 50%;
height: 50px;
margin: 0 auto;
font-size: 15px;
text-align: center;
}
</style>
</head>
<body>
<div id="showoff_name">
<h1>S</h1><h2>H</h2><h2>O</h2><h3>W</h3><h1>O</h1><h2>F</h2><h3>F</h3>

</div>
<div id="welcome_wrap">
	<div id="join_complete_text" class="welcome_text"><strong>회원가입</strong>이 <strong>완료</strong> 되었습니다.</div>
	<div id="join_thanks_text" class="welcome_text"><span><strong>님</strong></span>SHOWOFF AWESOME MEMBER에 가입해주셔서 감사합니다.</div>
	<div id="pagemovetoindex" class="welcome_text"><span id="rCnt"><strong>5</strong></span>초후에 메인페이지로 이동합니다.</div>
	<br>
</div>

</body>
<script type="text/javascript">
var cnt = 4;
function countdown() {
	if(cnt == 0){
		clearInterval(s);
		location.href ="index.bizpoll";
	}
	document.getElementById("rCnt").innerHTML=cnt;
	cnt--;
}
var s = setInterval(countdown, 1000);/* 1초단위로 countdown함수 실행 */

</script>
</html>