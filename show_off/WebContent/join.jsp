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
	body{
		margin: 0;
		padding: 0;
		font-family: 'Nanum Gothic', sans-serif;
		background-color: cadetblue;
	}

	a {
		text-decoration: none;
		
	}
	
	ul {
		list-style-type: none;
	}
	#body_div{
		background-color: white;
		width: 700px;
		height: 1075px;
		margin: 0px auto;
		border: 1px solid #e3dede;
		box-shadow: 0px 4px 10px 0 rgba(0, 0, 0, 0.2),
					0px 4px 10px 0 rgba(0, 0, 0, 0.10);	
		opacity: 0.9;
		
	}
	
	#header_div img{
		display: inline-block;
		position: relative;
		top: 30px;
		left: 30px;
	}
	#mm{
		display: inline-block;
		position: relative;
		left: 300px;
		font-size: 30px;
		color:#282c37;
	}
	
	
	
	#btn_in{
		width: 300px;	
		height: 59px;
		font-size: 22px;
		text-align: center;
		background-color: #8b8687;
		color: white;
		display: block;
		margin: 50px auto;
		padding-top: 2px;
		line-height: 59px;
		box-shadow: 0px 4px 10px 0 rgba(0, 0, 0, 0.2),
					0px 4px 10px 0 rgba(0, 0, 0, 0.10);	
					
	}
	.insert_div{
		border-bottom: 1px solid #DDD;
		width: 500px;
		height: 48px;
		box-sizing: border-box;
		margin-top: 20px;
		position: relative;
		left: 100px;
		margin-bottom: 50px;
	}
	.insert_label{
	
		font-size: 14px;
		position: absolute;
		z-index: 1;
		transition: all, 4s cubic-bezier(.25,.8,.25,1);
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
	.email{
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
	#email2{
		position: absolute;
		top: 0px;
		right: 44px;
	}
	
	select{
		height: 20px;
		border: none;
		color: #282c37;
	}
	
	#selmail{
		font-size: 14px;
	}
	
	#mail{
		display: inline-block;
		position: relative;
		right: 200px;
	}
	.error{
		position: relative;
		top: 5px;
		color: red;
		font-size: 10px;
		font-weight: bold;
		display: none;
	}
	#join_logo{
	height: 30px;
	}
	
	
	
		
</style>
<script type="text/javascript">
	$(document).ready(function(){
	$("#input_id").focus(function(){
		$(this).css("font-size", "17px");
		$(".insert_label:first").css("top", "5px").css("font-size", "10px");
		$(".insert_label:first").css("color", "black");
		$(".insert_label:first").css("font-weight", "bold");
	
	});
	
	$("#input_id").blur(function() {
		var idVal = $(this).val();
		if(idVal ==""){
			$(this).css("font-size", "5px");
			$(".insert_label:first").css("top", "14px").css("font-size", "14px");
			$(".insert_label:first").css("color", "#979797");
		}
	});
	
	$("#input_pw").focus(function(){
		$(this).css("font-size", "17px");
		$("#pw1").css("top", "5px").css("font-size", "10px");
		$("#pw1").css("color", "black");
		$("#pw1").css("font-weight", "bold");
	
	});
	
	$("#input_pw").blur(function() {
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
	
	
	$("#input_name").focus(function(){
		$(this).css("font-size", "17px");
		$("#name").css("top", "5px").css("font-size", "10px");
		$("#name").css("color", "black");
		$("#name").css("font-weight", "bold");
	
	});
	
	$("#input_name").blur(function() {
		var idVal = $(this).val();
		if(idVal ==""){
			$(this).css("font-size", "5px");
			$("#name").css("top", "14px").css("font-size", "14px");
			$("#name").css("color", "#979797");
		}
	});
	
	
	
	$("#input_ph").focus(function(){
		$(this).css("font-size", "17px");
		$("#phone").css("top", "5px").css("font-size", "10px");
		$("#phone").css("color", "black");
		$("#phone").css("font-weight", "bold");
	
	});
	
	$("#input_ph").blur(function() {
		var idVal = $(this).val();
		if(idVal ==""){
			$(this).css("font-size", "5px");
			$("#phone").css("top", "14px").css("font-size", "14px");
			$("#phone").css("color", "#979797");
		}
	});
	
	
	
	
	$("#input_email_id").focus(function(){
		$(this).css("font-size", "17px");
		$("#email_id").css("top", "5px").css("font-size", "10px");
		$("#email_id").css("color", "black");
		$("#email_id").css("font-weight", "bold");
	
	});
	
	$("#input_email_id").blur(function() {
		var idVal = $(this).val();
		if(idVal ==""){
			$(this).css("font-size", "5px");
			$("#email_id").css("top", "14px").css("font-size", "14px");
			$("#email_id").css("color", "#979797");
		}
	});
	
	$("#input_email_pw").focus(function(){
		$(this).css("font-size", "17px");
		$("#email_pw").css("top", "5px").css("font-size", "10px");
		$("#email_pw").css("color", "black");
		$("#email_pw").css("font-weight", "bold");
	
	});
	
	$("#input_email_pw").blur(function() {
		var idVal = $(this).val();
		if(idVal ==""){
			$(this).css("font-size", "5px");
			$("#email_pw").css("top", "14px").css("font-size", "14px");
			$("#email_pw").css("color", "#979797");
		}
	});
	
 }); 
	
	/*이메일*/
	$(document).ready(function(){ 
		$("#selmail").change(function(){
			var selmail = $("#selmail").val();
			
			
			if(selmail == "directval") {
				$("#input_email_pw").val("");
				$("#input_email_pw").focus();
			}else{
				$("#input_email_pw").val(selmail);
				$("#email_pw").css("top", "5px").css("font-size", "10px");
				$("#email_pw").css("color", "black");
				$("#email_pw").css("font-weight", "bold");
				$("#email_pw").focus();
				/*#emil_url에 value 속성에 selmail값을 넣어라*/
			}
			
		});
		
		
		
		
		
		$(".input_class").blur(function(){
			/*input태그에 입력된 값을 가져옴*/
			var inputVal = $(this).val();
			/*input태그에 입력된 값을 가져옴*/
			if(inputVal == "")	
				$(this).next().text("필수 정보입니다").css("display", "block");
			else{
				$(this).next().css("display", "none");
			}
		});
		/* ajax */
		$("#input_id").blur(function() {
			//alert("블러");
			var idVal = $(this).val();
			if(idVal != ""){
				$.ajax({
					type:"POST",
					url:"idCheck.bizpoll",
					datatype:"json",
					data:"id="+idVal,
					success:function(data){
						
						if(data.message == -1){
							$("#input_id").next().text("이미 사용중인 아이디입니다.").css("display" , "block").css("color" , "#F4665");
							$("#input_id").select();
						}else{
							$("#input_id").next().text("사용가능한 아이디입니다.").css("display" , "block").css("color" , "#F4665");
							$("#input_pw").select();
						}
					},
					error:function(){
						alert("System error");
					}
				});
			}
		});
		
		
		/*비밀번호 재확인 input태그를 blur했을떄  비밀번호와 비밀번호 재확인 값을 비교*/
		$("#input_pw2").blur(function(){
			
			var pw1 = $("#input_pw").val();
			var pw2 = $("#input_pw2").val();
			
			if(pw1 != "" && pw2 !=""){
				if(pw1 == pw2){
					$(".checkpw").next().css("display", "none")
				}else{
					$(this).next().text("비밀번호가 일치하지 않습니다").css("display", "block");
					$(this).val("");
					$(this).focus();
				}
			}
		});
			
	});
	
	$(document).on("click", ".btn_agree", function(){
		/*유효성 체크하는 값을 받아온다*/
		var form = $("#frm_mem"),
		mid = $("#input_id"),
		mpw1 = $("#input_pw"),
		mpw2 = $("#input_pw2"),
		mname = $("#input_name"),
		mphone = $("#input_ph"),
		mmailid = $("#input_email_id"),
		mmailurl = $("#input_email_pw");
		
		var id = $.trim(mid.val())
		var regId =/^[a-z0-9_-]{3,16}$/; /*영문자와 숫자만 가능한 정규식*/
		/*trim = 앞 뒤 공백 제거(가운데 공백은 제거 안됨)*/
		if(id == ""){
			mid.focus();
			mid.next().text("필수 정보입니다").css("display", "block");
			return false;
		}else if(!regId.test(id)){
			mid.focus();
			mid.next().text("영문자와 숫자만 입력하세요").css("display", "block");
			return false;
		}
		/*ID 중복 체크 해야함 */
		
		var pw1 = $.trim(mpw1.val());
		var pw2 = $.trim(mpw2.val());
		var regPass =/^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		
		if(pw1 == ""){
			mpw1.focus();
			mpw1.next().text("필수 정보입니다").css("display", "block");
			return false;
		}else if(!regPass.test(pw1)){
			mpw1.focus();
			mpw1.next().text("8~20자 이내 영문자, 숫자, 특수문자만 입력해주세요").css("display", "block");
			return false;
		
		}else if(pw2 == ""){
			mpw2.focus();
			mpw2.next().text("필수 정보입니다").css("display", "block");
			return false;
		
		}else if(pw1 != pw2){
			mpw2.select();
			mpw2.next().text("비밀번호가 일치하지 않습니다.").css("display", "block");
			return false;
		}
		
		/*이름 체크 */
		var name = $.trim(mname.val());
		if(name == ""){
			mname.focus();
			mname.next().text("공백이 있습니다.").css("display", "block");
			return false;
		}
		
		var phone =$.trim(mphone.val());
		var regphone =/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		
		if(phone == ""){
			mphone.focus();
			mphone.next().text("필수정보 입니다.").css("display", "block");
			return false;
		}else if($.isNumeric(phone) == false){/* 숫자값만 들어왔는지 체크 */
			mphone.select();
			mphone.next().text("숫자만 입력하세요.").css("display", "block");
			return false;
		}else if(!regphone.test(phone)){
			mphone.select();
			mphone.next().text("올바른 값을 입력하세요.").css("display", "block");
			return false;
		}

		/*메일 합치기*/
		var mailid = $.trim(mmailid.val());
		var mailurl =$.trim(mmailurl.val());
		
		var mail = mailid+mailurl;
		var regMail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

		
		if(mailid == ""){
			mmailid.focus();
			mmailid.next().text("필수정보 입니다.").css("display", "block");
			return false;
		}else if(mailurl == ""){
			mmailurl.focus();
			mmailurl.next().text("필수정보 입니다.").css("display", "block");
			return false;
		}else if(!regMail.test(mail)){
			mmailid.select();
			mmailid.next().text("E-mail형식이 올바르지 않습니다.").css("display", "block");
			return false;
		}
		
		
		/*	ex)	1. 01012341234 (11글자)
				2. 010-1234-1234 (13글자)
				
			1)	1번을 사용한 경우
				input siz=11 고정
				
			2)	2번을 사용할 경운
				input size를 고정안한고
				010-1234-1234를 입력받으면
				subString으로 (-)을 제거한 후 데이터베이스에 저장
			3)	애초에 input 3개를 만든다
				input1 - input2 - input3
				input size= 3 size=4 size=4 
				*/
			
			/* 유효성체크 값이 유효한 값 확인 끝 */
			form.submit();
				
	});
	
	
</script>
</head>
<body>
	<div id="body_div">
		<header>
			
			<div id="header_div">
				<a href="index.bizpoll">
					<img alt="showoff"src="img/Slogo.png" id="join_logo">
				</a>
			</div>
			<h2 id="mm">회원가입</h2>
		</header>
		
		<section>
		
		<form action="memberplay.bizpoll" method="POST" name="frm_mem" id="frm_mem">
		<!-- name값과 id값은 똑같이 해주는게 좋다  -->

		<div id="insert_id" class="insert_div">
			<label for="input_id" class="insert_label">
				ID
			</label>
			<input type="text" id="input_id" name="input_id" class="input_class">
			<span class="error" id="input_error">필수 정보입니다 </span>
		</div>
	
	
		<div id="insert_pw" class="insert_div">
			<label for="input_pw" class="insert_label"  id="pw1">
				PASSWORD
			</label>
			<input type="password" id="input_pw" name="input_pw" class="input_class ckeckpw">
			<span class="error">필수 정보입니다 </span>
		</div>
		
		
		<div id="insert_pw2" class="insert_div">
			<label for="input_pw2" class="insert_label " id="pw2">
				PASSWORD2
			</label>
			<input type="password" id="input_pw2" name="input_ckpw" class="input_class ckeckpw">
			<span class="error">필수 정보입니다 </span>
		</div>
	
		<div id="insert_name" class="insert_div">
			<label for="input_name" class="insert_label" id="name">
				NAME
			</label>
			<input type="text" id="input_name" name="input_name" class="input_class">
			<span class="error">필수 정보입니다 </span>
		</div>
	
	
		<div id="insert_ph" class="insert_div">
			<label for="input_ph" class="insert_label" id="phone">
				PHONE( - 없이 입력하세요)
			</label>
			<input type="text" id="input_ph" name="input_ph" class="input_class" maxlength=11>
			<span class="error">필수 정보입니다 </span>
		</div>
	
		<div id="insert_em" class="insert_div">
		
		<div>
			<label for="input_email_id" class="insert_label" id="email_id">
				ID
			</label>
			<input type="text" id="input_email_id" name="input_email_id" class="email input_class">
			<span class="error">필수 정보입니다 </span>
		</div>
			
				
		<div id="email2">
			<label for="input_email_pw" class="insert_label" id="email_pw">
				EMAIL
			</label>
			
			<input type="text" id="input_email_pw" name="input_email_url" class="email" id="mail">
			<span class="error">필수 정보입니다 </span>
			
			<select id="selmail">
				<option value="" selected="selected" class="email">EMAIL</option>
				<option value="@directval">직접 입력</option>
				<option value="@naver.com">naver.com</option>
				<option value="@daum.net">daum.net</option>
				<option value="@gmail.com">gmail.com</option>
				<option value="@nate.com">nate.com</option>
			</select>
			
		</div>	
		
		</div>
			<div><a href="#" id="btn_in" class ="btn_agree">확인</a></div>
			
		</form>
		</section>
		
	</div>
	
	
	
	
</body>
<script type="text/javascript">


</script>
</html>