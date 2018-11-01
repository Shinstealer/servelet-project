<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');

body {
	margin: 0;
	padding: 0;
	font-family: 'Nanum Gothic', sans-serif;
	background-image: url('img/001.jpg');
	background-color: cadetblue;
}

a {
	text-decoration: none;
}

ul {
	list-style-type: none;
}

#body_div {
	background-color: white;
	width: 700px;
	height: 1075px;
	margin: 0px auto;
	border: 1px solid #e3dede;
	box-shadow: 0px 4px 10px 0 rgba(0, 0, 0, 0.2), 0px 4px 10px 0
		rgba(0, 0, 0, 0.10);
	opacity: 0.9;
}

#header_div img {
	display: inline-block;
	position: relative;
	top: 30px;
	left: 30px;
}

#mm {
	display: inline-block;
	position: relative;
	left: 300px;
	font-size: 30px;
	color: #282c37;
}

#btn_in {
	width: 300px;
	height: 59px;
	font-size: 22px;
	text-align: center;
	background-color: #8b8687;
	color: white;
	display: block;
	margin: 20px auto;
	padding-top: 2px;
	line-height: 59px;
	box-shadow: 0px 4px 10px 0 rgba(0, 0, 0, 0.2), 0px 4px 10px 0
		rgba(0, 0, 0, 0.10);
}

.insert_div {
	border-bottom: 1px solid #DDD;
	width: 500px;
	height: 48px;
	box-sizing: border-box;
	margin-top: 20px;
	position: relative;
	left: 100px;
	margin-bottom: 50px;
}

.insert_label {
	font-size: 14px;
	position: absolute;
	z-index: 1;
	transition: all, 4s cubic-bezier(.25, .8, .25, 1);
	transition-duration: 0.3s;
	color: #979797;
	top: 14px;
	left: 10px;
	font-weight: bold;
}

.input_class {
	width: 100%;
	height: 44px;
	display: block;
	position: relative;
	border: none;
	overflow: visible;
	padding: 20px 0px 0px 10px;
	box-sizing: border-box;
	transition: all .4s cubic-bezier(.25, .8, .25, 1);
	outline: none;
}

.email {
	width: 200px;
	height: 44px;
	display: inline-block;
	position: relative;
	border: none;
	overflow: visible;
	padding: 20px 0px 0px 10px;
	box-sizing: border-box;
	transition: all .4s cubic-bezier(.25, .8, .25, 1);
	outline: none;
}

#email2 {
	position: absolute;
	top: 0px;
	right: 44px;
}

select {
	height: 20px;
	border: none;
	color: #282c37;
}

#selmail {
	font-size: 14px;
}

#mail {
	display: inline-block;
	position: relative;
	right: 200px;
}

.error {
	position: relative;
	top: 5px;
	color: red;
	font-size: 10px;
	font-weight: bold;
	display: none;
}

#label_id {
	font-size: 10px;
	color: black;
	font-weight: bold;
	top: 5px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
	
	
	$("#input_pw").focus(function(){
		$(this).css("font-size", "17px");
		$("#pw").css("top", "5px").css("font-size", "10px");
		$("#pw").css("color", "black");
		$("#pw").css("font-weight", "bold");
	
	});
	
	$("#input_pw").blur(function() {
		var idVal = $(this).val();
		if(idVal ==""){
			$(this).css("font-size", "5px");
			$("#pw").css("top", "14px").css("font-size", "14px");
			$("#pw").css("color", "#979797");
		}
	});
	
	$("#input_pw1").focus(function(){
		$(this).css("font-size", "17px");
		$("#pw1").css("top", "5px").css("font-size", "10px");
		$("#pw1").css("color", "black");
		$("#pw1").css("font-weight", "bold");
	
	});
	
	$("#input_pw1").blur(function() {
		var idVal = $(this).val();
		if(idVal ==""){
			$(this).css("font-size", "5px");
			$("#pw1").css("top", "14px").css("font-size", "14px");
			$("#pw1").css("color", "#979797");
		}
	});
	
	$("#input_pw2").focus(function(){
		$(this).css("font-size", "17px");
		$("#pw2").css("top", "5px").css("font-size", "10px");
		$("#pw2").css("color", "black");
		$("#pw2").css("font-weight", "bold");
	
	});
	
	$("#input_pw2").blur(function() {
		var idVal = $(this).val();
		if(idVal ==""){
			$(this).css("font-size", "5px");
			$("#pw2").css("top", "14px").css("font-size", "14px");
			$("#pw2").css("color", "#979797");
		}
	});
	
});
	
	
		$(".input_class").blur(function(){
			/*input태그에 입력된 값을 가져옴*/
			var inputVal = $(this).val();
			/*input태그에 입력된 값을 가져옴*/
			if(inputVal =="")	
				$(this).next().text("필수 정보입니다").css("display", "block");
			else{
				$(this).next().css("display", "none");
			}
			
			
		});
		
		
		/*비밀번호 재확인 input태그를 blur했을떄  비밀번호와 비밀번호 재확인 값을 비교*/
		$("#input_pw2").blur(function(){
			
			var pw1 = $("#input_pw1").val();
			var pw2 = $("#input_pw2").val();
			
			if(pw1 != "" && pw2 !=""){
				if(pw1 == pw2){
					$(".checkpw").next().css("display", "none")
				}else{
					$(this).next().text("비밀번호가 일치하지 않습니다").css("display", "block");
					$(this).select("");
				}
			}
		});
		
		
		
	$(document).on("blur", "#input_pw", function(){
		// 현재 비밀번호 입력받은 값이 일치하는지 확인하는 과정
		var inputPw = $("#input_pw").val();
		
		if(inputPw != ""){
			$.ajax({
				url: "pwCheck.bizpoll",
				type: "POST",
				dataType: "json",
				data: "id=${sessionScope.loginUser.id}&pw="+inputPw,
				success: function(data){
					
					if(data.msg == 1){
						$("#input_pw").next().text("현재 비밀번호가  값이 일치합니다 ").css("display", "block");
						$("#input_pw1").select();
					}else{
						$("#input_pw").next().text("현재 비밀번호가  아닙니다 ").css("display", "block");
						$("#input_pw").focus();
						
					}
				},
				error:function(){
					alert("System Error!!");
				}
				
				
			});	
		}
		
	});

	
	$(document).on("click", ".btn_agree", function(){
		/*유효성 체크하는 값을 받아온다*/
		var form = $("#frm_mem"),
		 mpw = $("#input_pw"),
		 mpw1 = $("#input_pw1"),
		 mpw2 = $("#input_pw2");
		
		/*비밀번호*/
		var pw = $.trim(mpw.val());
		var pw1 = $.trim(mpw1.val());
		var pw2 = $.trim(mpw2.val());
		var regPass = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; 
		if(pw == ""){
			mpw.focus();
			mpw.next().text("현재 비밀번호를 입력해주세요").css("display", "block");
			return false;
		}else if(pw1 == ""){
			mpw1.focus();
			mpw1.next().text("필수 정보입니다").css("display", "block");
		}else if(!regPass.test(pw1)){
			mpw1.focus();
			mpw1.next().text("8~20글자 내의 값을 입력해주세요").css("display", "block");
			return false;
		}else if(pw2 == ""){
			mpw2.focus();
			mpw2.next().text("필수 정보입니다").css("display", "block");
			return false;
		}else if(pw1 != pw2){
			mpw2.select();
			mpw2.next().text("비밀번호가 일치하지 않습니다").css("display", "block");
			return false;
		}else if(pw != pw1){
			mpw1.val();
			mpw2.val();
			mpw1.select();
			mpw1.next().text("현재 비밀번호와 일치합니다").css("display", "block");
		}
		/*유효성체크 값이 유효한값 확인 끝*/
		/*$("#btn_in").click(function(){
			form.submit();
		});*/
			form.submit();
	});
	
	$(document).ready(function(){
		/* var email_info = "${sessionScope.loginUser.email}";
		var index = email_info.indexOf('@');
		var emailid = email_info.substring(0, index);
		var emailur = email_info.substring(index + 1);
		var emailurl = '@'+emailur 
		
		$("#input_email_id").val(emailid);
		$("#input_email_pw").val(emailurl); */
		$(".input_class").blur(
				function() {
					/*input태그에 입력된 값을 가져옴*/
					var inputVal = $(this).val();
					/*input태그에 입력된 값을 가져옴*/
					if (inputVal == "")
						$(this).next().text("필수 정보입니다").css("display","block");
					else {
						$(this).next().css("display", "none");
					}

				});
	});
	
</script>
</head>
<body>
	<div id="body_div">
		<header>

			<div id="header_div">
				<a href="index.bizpoll"> <img alt="may" src="img/Slogo.png">
				</a>
			</div>
			<h2 id="mm">비밀번호 수정 수정</h2>
		</header>

		<section>

			<form action="pwUpdate.bizpoll" method="POST" name="frm_mem"
				id="frm_mem">
				<!-- name값과 id값은 똑같이 해주는게 좋다  -->
				
				<div id="insert_pw" class="insert_div">
					<label for="input_pw" class="insert_label" id="pw">
						현재 비밀번호 </label> 
						<input type="password" id="input_pw" name="input_pw" class="input_class ckeckpw"> 
						<span class="error">필수정보입니다 </span>
				</div>

				<div id="insert_pw1" class="insert_div">
					<label for="input_pw1" class="insert_label" id="pw1">
						새로운 비밀번호 </label> 
						<input type="password" id="input_pw1" name="input_pw1" class="input_class ckeckpw"> 
						<span class="error">필수정보입니다 </span>
				</div>


				<div id="insert_pw2" class="insert_div">
					<label for="input_pw2" class="insert_label " id="pw2">
						새로운 비밀번호 재입력 </label> <input type="password" id="input_pw2" name="input_pw2"
						class="input_class ckeckpw"> <span class="error">필수
						정보입니다 </span>
				</div>

				<input type="hidden" name="updateId" value="${sessionScope.loginUser.id }">



				<div>
					<a href="#" id="btn_in" class="btn_agree">비밀번호 수정</a>
					<a href="index.bizpoll" id="btn_in" >취 소</a>
				</div>

			</form>
		</section>

	</div>




</body>
</html>