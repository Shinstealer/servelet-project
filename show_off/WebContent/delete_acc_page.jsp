<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');

body {
	margin: 0;
	padding: 0;
	font-family: 'Nanum Gothic', sans-serif;
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
	height: 975px;
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

.delete_btn_group {
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

#join_logo{
	height: 30px;
	}

#delete_warn_msg > h3{
text-align: center;

}
.desc_g{
border: 1px solid gray;
overflow: scroll;
width:500px;
height: 150px;
margin: 0 auto;
padding: 10px 20px;
border-radius:10px;
box-shadow: 0px 4px 10px 0 rgba(0, 0, 0, 0.2), 0px 4px 10px 0
		rgba(0, 0, 0, 0.10);
}

.modal-content{
z-index: 19999;
position: absolute;
}

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
			if(idVal !=""){
				$(this).css("font-size", "5px");
				$(".insert_label:first").css("top", "14px").css("font-size", "14px");
				$(".insert_label:first").css("color", "#979797");
			}
		});	
		
		
	
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

	
	$(document).ready(function(){
		
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
			$(document).on("click" , "#delete_agr_btn" , function () {
				var nowPw = $("#input_pw").val();
				
				alert("정말로 탈퇴하시겠습니까?");
				
				$.ajax({
					url:"memberdeleteplay.bizpoll",
					type: "POST",
					dataType: "json",
					data: "id=${sessionScope.loginUser.id}&pw="+nowPw,
					success: function(data){
						
						if(data.msg == 1){
							location.href ="index.bizpoll";
							
						}else{
							$("#input_pw").next().text("정확한 비밀번호를 입력해주세요. ").css("display", "block");
							$("#input_pw").focus();
							
						}
					},
					error:function(){
						alert("System Error!!");
					}
					
				});
			});

	});
	
</script>
</head>
<body>
	<div id="body_div">
		<header>

			<div id="header_div">
				<a href="index.bizpoll"> <img alt="showoff logo" src="img/Slogo.png" id="join_logo">
				</a>
			</div>
			<h2 id="mm">회원탈퇴</h2>
			
		</header>
					
		<section>

				
				<div id="delete_warn_msg">
				<h3>회원 탈퇴시 아래의 조취가 취해집니다.</h3>
				<p class="desc_g">
				개인정보는 수집 및 이용목적이 달성되면 지체없이 파기하며, 절차 및 방법은 다음과 같습니다.
				전자적 파일 형태인 경우 복구 및 재생되지 않도록 안전하게 삭제하고, 그 밖에 기록물, 인쇄물, 서면 등의 경우 분쇄하거나 소각하여 파기합니다.
				<br>
				다만, 내부방침에 보관 후 파기하는 정보는 아래와 같습니다.
				<br>
				1) 아래 정보는 탈퇴일부터 최대 1년간 보관 후 파기합니다.
				<br>
				-. 안내메일 발송 및 CS문의 대응을 위해 SHOWOFF 계정과 탈퇴안내 이메일 주소를 암호화하여 보관
				<br>
				-. 서비스 부정이용 기록
				<br>
				2) 아래 정보는 프로젝트 모금함 최종 종료일부터 3년 경과 후 파기합니다.
				<br>
				(단, 미선정의 경우, 미선일로부터 90일 경과 후 파기)
				<br>
				-. SHOWOFF 같이가치 > 지원대상 선정 시 수집한 증빙서류
				<br>
				<br>
				또한, SHOWOFF는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관 또는 삭제하고 있으며,<br>
				분리 보관된 개인정보는 4년간 보관 후 지체없이 파기합니다.
				<br>
				이 외에 법령에 따라 일정기간 보관해야 하는 개인정보 및 해당 법령은 아래 표와 같습니다.
				<br>
				</p>
				
				</div>
				
				
				
				<!-- name값과 id값은 똑같이 해주는게 좋다  -->
				
				<div id="insert_id" class="insert_div">
					<label for="input_id" class="insert_label">
						ID
					</label>
					<input type="text" id="input_id" name="input_id" value="${sessionScope.loginUser.id }"  class="input_class" readonly="readonly">
					<span class="error" id="input_error">필수 정보입니다 </span>
				</div>
				
				
				
				<div id="insert_pw" class="insert_div">
					<label for="input_pw" class="insert_label" id="pw">
						현재 비밀번호 </label> 
						<input type="password" id="input_pw" name="input_pw" class="input_class ckeckpw"> 
						<span class="error">필수정보입니다 </span>
				</div>
					

				<div>
					<a href="#" id="btn_in" class="btn_agree delete_btn_group" data-toggle="modal" data-target="#exampleModalCenter" >회원 탈퇴</a>
					<a href="index.bizpoll" id="btn_out" class="delete_btn_group" >취 소</a>
				</div>

		</section>

	</div>

				<!-- Modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalCenterTitle">탈퇴동의</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        	정말로 탈퇴 할래?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				        <button type="button" id="delete_agr_btn" class="btn btn-primary">탈퇴</button>
				      </div>
				    </div>
				  </div>
				</div>



</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>