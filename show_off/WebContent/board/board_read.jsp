<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>	
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_read</title>

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
</style>

</head>
<body id = "indexBody">
	
	<div class="box-body">
		<div class="readbtnGroup">
		<c:if test="${sessionScope.loginUser.id == boardDetailView.writer}">
			<button id="Boarddeletehbtn"  class="btn btn-warning">삭제하기</button>
			<a href="#"><button id="rewritebtn" class="btn btn-info">수정하기</button></a>
		</c:if>	
		</div>
	</div>
	
	<!-- /. box-body -->
	
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail">Title</label> <input type="text"
				name='title' class="form-control" value="${boardDetailView.title }"
				readonly="readonly">
		</div>
		<div class="">
			<label for="exampleInputPassword">Content</label>
			<textarea class="text" id="contents" name="contents" cols="260px" rows="25px" readonly="readonly">${boardDetailView.content }</textarea>
		</div>
	
		<div class="form-group">
			<label for="exampleInputEmail">Writer</label> <input type="text"
				name='writer' class="form-control" value=${boardDetailView.writer }
				readonly="readonly">
		</div>
	</div><!--box body  -->
	
	<div class="box-body">
		<a href="boardList.bizpoll"><button id="Boarddeletehbtn"  class="btn btn-warning">목록</button></a>
	</div>


</body>

<%@ include file="../include/footer.jsp"%>

<script type="text/javascript">

</script>
</html>