<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>	
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_regist</title>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo:400');

* {
	font-family: 'Hanna', sans-serif;
	box-sizing: border-box;
}

body, ul{
	margin: 0;
	padding: 0;
}

#indexBody {
	padding-top: 200px;
	background-color: #F5F5F5;
}

.box-body{
width: 45%;
margin: 0 auto;
}

.readbtnGroup{
width:20%;
display:inline-block;
float: right;
}
.regist_btn_group{
margin-top: 30px;
}
</style>

<script type="text/javascript" src="<%=path%>/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body id = "indexBody">
	
 <form action="regist_contents.bizpoll" method="POST" name="frm_board" id="frm_board" enctype="multipart/form-data">
	<div class="box-body">
		<div class="readbtnGroup">
		<c:if test="${sessionScope.loginUser.id == boardview.writer}">
			<button id="Boarddeletehbtn"  class="btn btn-warning">삭제하기</button>
			<a href=""><button id="rewritebtn" class="btn btn-info">수정하기</button></a>
		</c:if>	
		</div>
	</div>
	
	<!-- /. box-body -->
	
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail">Title</label> <input type="text"
				name='title' class="form-control">
		</div>
		<div class="">
			<label for="exampleInputPassword">Content</label>
			<textarea class="text" id="content1" name="content1" cols="260px" rows="25px"></textarea>
		</div>
	
		<div class="form-group">
			<label for="exampleInputEmail">Writer</label> <input type="text"
				name='writer' class="form-control">
		</div>
		
		<div><input type="file" name="uploadfile" id="uploadfile"></div>
		
	</div><!--box body  -->
	
	<div class="box-body regist_btn_group">
		<a href="boardList.bizpoll"><button id="Boarddeletehbtn"  class="btn btn-warning">목록</button></a>
		<button id="rewritebtn" class="btn btn-info">등록하기</button>
	</div>
	
  </form>
  
  <%-- <script type="text/javascript">

		var oEditors = [];
		
		nhn.husky.EZCreator.createInIFrame({
		
		    oAppRef: oEditors,
		
		    elPlaceHolder: "content1",
		
		    sSkinURI: "<%=path%>/smarteditor/SmartEditor2Skin.html",
		
		    fCreator: "createSEditor2"
		
		});

	</script> --%>
</body>

<%@ include file="../include/footer.jsp"%>

<script type="text/javascript">

$(document).ready(function () {
	$("#rewritebtn").on("click" , function () {
		form.submit();
	});
});

</script>
</html>