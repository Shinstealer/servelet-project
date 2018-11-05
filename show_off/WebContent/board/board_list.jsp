<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<%@ include file="include/side_nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board list</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo:400');

* {
	font-family: 'Hanna', sans-serif;
	box-sizing: border-box;
}

body, url {
	margin: 0;
	padding: 0;
}

a {
	color: black !important;
}

#indexBody {
	padding-top: 200px;
	background-color: #F5F5F5;
}

.board_wrap {
width: 50%;
height: 800px;
margin: 0 auto;
box-shadow: 0px 4px 10px 0 rgba(0, 0, 0, 0.2), 0px 4px 10px 0 rgba(0, 0, 0, 0.10);
opacity: 0.9;
background-color: white !important;
}
.board_head{
width: 100%;
height: 40px;
margin-bottom: 20px;
}
.search-bar{
float: right !important;
margin: 10px 10px 0 5px;
}
.list-sort li{
list-style: none;
padding: 0;
margin: 10px 10px 0 5px;
float: left;
color: #555;
}
.list-sort li:hover{
text-decoration: underline;
}
.pull-left{
float: left !important;
}
#keywordInput{
border-radius: 4px;
height: 35px;
vertical-align: middle;
width: 200px;
}
.table-bordered th{
text-align: center;
}

</style>

</head>
<body id="indexBody">

	<div class="board_wrap">
	  <div class="board_head">
	  
		<!--sBoard List  -->
		<ul class="list-sort pull-left">
			<li><a href="#" class="category-sort-link active">최신순</a></li>
			<li><a href="#" class="category-sort-link ">추천순</a></li>
			<li><a href="#" class="category-sort-link ">댓글순</a></li>
			<li><a href="#" class="category-sort-link ">조회순</a></li>
		
		</ul>
		<div class='box-body search-bar '>
			<select name="searchType" class="custom-select" id="inputGroupSelect01" style="width: 100px;">
				<option value="n"
					<c:out value="${cri.searchType ==  null?'selected' :''}"/>>
					---</option>
				<option value="t"
					<c:out value="${cri.searchType eq 't'?'selected' :''}"/>>
					Title</option>
				<option value="c"
					<c:out value="${cri.searchType eq 'c'?'selected' :''}"/>>
					Content</option>
				<option value="w"
					<c:out value="${cri.searchType eq 'w'?'selected' :''}"/>>
					Writer</option>
				<option value="tc"
					<c:out value="${cri.searchType eq 'tc'?'selected' :''}"/>>
					Title or Content</option>
				<option value="cw"
					<c:out value="${cri.searchType eq 'cw'?'selected' :''}"/>>
					Content or Writer</option>
				<option value="tcw"
					<c:out value="${cri.searchType eq 'tcw'?'selected' :''}"/>>
					Title or Content or Writer</option>
			</select> 
			<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }" placeholder="검색어를 입력하세요">
			<button id="searchbtn"  class="btn btn-warning">Search</button>
			<button id="newbtn" class="btn btn-info">New Board</button>
		</div>
		
	 </div>
		<!-- 페이지 목록 -->
		<table class="table table-bordered">
			<tr>
				<th style="width: 5%;"><span class="badge badge-dark">번호</span></th>
				<th style="width: 20%;"><span class="badge badge-primary">TITLE <span class="badge badge-light">9</span></span></th>
				<th style="width: 10%;"><span class="badge badge-secondary">작성자</span></th>
				<th style="width: 15%;"><span class="badge badge-warning">등록날짜</span></th>
				<th style="width: 5%;"><span class="badge badge-success">VIEW</span></th>
				<th style="width: 5%;"><span class="badge badge-danger">LIKES</span></th>
				<th style="width: 5%;"><span class="badge badge-info">UPLOADS</span></th>
			</tr>
			<!--댓글 갯수를 보여주는 기능  -->

			<c:forEach items="${list}" var="boardVO">

				<tr>
					<td>${boardVO.bno}</td>
					<td><a
						href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }
				&bno=${boardVO.bno }'>
							${boardVO.title}<strong>[${boardVO.replycnt }]</strong>
					</a></td>
					<td>${boardVO.writer}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${boardVO.regdate}" /></td>
					<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- 페이징 처리 -->
		<nav aria-label="...">
			<ul class="pagination">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item active"><a class="page-link" href="#">2
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>

	</div>





</body>

<%@ include file="include/footer.jsp"%>
<script type="text/javascript"
	src="bootstrap-4.1.3-dist/js/bootstrap.js"></script>
<script>
	$(document).ready(
			function() {

				$('#searchbtn').on(
						"click",
						function(event) {
							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());
						});

				$('#newbtn').on("click", function(evt) {
					self.location = "register";
				});

			});
	
	
			var result = '${msg}';
			if (result == 'SUCCESS') {
				alert("처리가 완료되었습니다.");
			}

</script>
</html>