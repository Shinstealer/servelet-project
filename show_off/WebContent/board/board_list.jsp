<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>	
<%@ include file="../include/header.jsp"%>
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

body, ul{
	margin: 0;
	padding: 0;
}

#indexBody {
	padding-top: 200px;
	background-color: #F5F5F5;
}

.board_wrap {
width: 50%;
height: 870px;
margin: 0 auto;
box-shadow: 0px 4px 10px 0 rgba(0, 0, 0, 0.2), 0px 4px 10px 0 rgba(0, 0, 0, 0.10);
opacity: 0.9;
background-color: white !important;
}
.board_head{
width: 100%;
height: 60px;
margin-bottom: 40px;
padding:20px 20px 0 20px;
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
color: #F6F6F6;
background-color: #747474;
border-radius: 4px;
border-bottom-style: none;
height: 30px;
width: 60px;
text-align: center;
}

.list-sort a{


font-size: 17px;
font-weight: bold;
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
.board_content{
text-align: center;
}
table tr:nth-child(even) {
    background: #e1eef6;
}

.blinking{
color:red;
-webkit-animation:blink 2.0s ease-in-out infinite alternate;
-moz-animation:blink 2.0s ease-in-out infinite alternate;
animation:blink 2.0s ease-in-out infinite alternate;
}
@-webkit-keyframes blink{
0% {opacity:0;}
100% {opacity:1;}
}
@-moz-keyframes blink{
0% {opacity:0;}
100% {opacity:1;}
}
@keyframes blink{
0% {opacity:0;}
100% {opacity:1;}
}

.pagination_nav{
width: 100%;
}
.pagination{
width: 80%;
margin: 0 auto;
}
.sr-only{
background-color: red;

}

td > .fas{
width: 20px;
height: 20px;
}

</style>

</head>
<body id="indexBody">

	<div class="board_wrap">
	  <div class="board_head">
	  
		<!--sBoard List  -->
		<ul class="list-sort pull-left">
			<li><a href="#" class="category-sort-link ">최신순</a></li>
			<li><a href="#" class="category-sort-link ">추천순</a></li>
			<li><a href="#" class="category-sort-link ">댓글순</a></li>
			<li><a href="#" class="category-sort-link ">조회순</a></li>
		
		</ul>
		<div class='box-body search-bar'>
			<select name="searchType" class="custom-select" id="inputGroupSelect01" style="width: 120px;">
				<option value="1">
					제목+내용</option>
				<option value="2">
					제목</option>
				<option value="3">
					내용</option>
				<option value="4">
					작성자</option>
				
			</select> 
			<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }" placeholder="검색어를 입력하세요">
			<button id="Boardsearchbtn"  class="btn btn-warning">검색</button>
			<a href="board_regist.bizpoll"><button id="newbtn" class="btn btn-info">질문하기</button></a>
		</div>
		
	 </div>
		<!-- 페이지 목록 -->
		<table class="table table-bordered">
			<tr>
				<th style="width: 5%;"><span class="badge badge-dark">번호</span></th>
				<th style="width: 25%;"><span class="badge badge-primary">TITLE </span></th>
				<th style="width: 10%;"><span class="badge badge-secondary">작성자</span></th>
				<th style="width: 10%;"><span class="badge badge-warning">등록날짜</span></th>
				<th style="width: 5%;"><span class="badge badge-success">VIEW</span></th>
				<th style="width: 5%;"><span class="badge badge-danger">LIKES</span></th>
				<th style="width: 5%;"><span class="badge badge-info">UPLOADS</span></th>
			</tr>
			<!--댓글 갯수를 보여주는 기능  -->

			<c:forEach items="${boardList}" var="boardList">
				<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var ="today2"/>
				<fmt:formatDate value="${boardList.regdate}" pattern="yyyy-MM-dd" var = "regdate2"/>
				<tr>
					<td class="board_content">${boardList.bno}</td>
					<td class="board_content">
						<c:if test="${today2 == regdate2}"><span class="blinking">NEW</span></c:if>
						<a href="boardviewcnt.bizpoll?bno=${boardList.bno}">${boardList.title}</a> 
						<span class="badge badge-light">9</span>
					
					
					</td>
					<td class="board_content">${boardList.writer}</td>
					<td class="board_content">
						
						<c:choose>
							<c:when test="${today2 == regdate2}">
								<fmt:formatDate pattern="HH:mm:ss" value="${boardList.regdate}"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${boardList.regdate}"/>
							</c:otherwise>
						</c:choose>
						
					</td>
					<td class="board_content"><span class="badge badge-success">${boardList.viewcnt}</span></td>
					<td class="board_content"><span class="badge badge-danger">${boardList.goodcnt}</span></td>
					<td class="board_content">
					    <c:if test="${boardList.filesize > 0}">
						 <i class="fas fa-file-upload"></i>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			
		</table>
		
		<!-- 페이징 처리 -->
		<nav class="pagination_nav" aria-label="...">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="page-item">
						<a class="page-link" href="boardList.bizpoll?page=${pageMaker.startPage-1}">previous</a>
					</li>
				</c:if>		
				
					<li>
						<a class="page-link" href="boardList.bizpoll?page=${pageMaker.firstPage}">${pageMaker.firstPage }</a>
					</li>
					<li><a class="page-link">....</a></li>	
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var = "idx">
					<li 
						<c:out value="${pageMaker.criDto.page == idx? 'class=sr-only':''}"/>>
						<a class="page-link" href="boardList.bizpoll?page=${idx}">${idx} </a>
					</li>	
				</c:forEach>
					
					<li><a class="page-link">....</a></li>				
					<li>
						<a class="page-link" href="boardList.bizpoll?page=${pageMaker.finalPage + 1 }">${pageMaker.finalPage}</a>
					</li>
					
				<c:if test="${pageMaker.next}">
					<li class="page-item">
						<a class="page-link" href="boardList.bizpoll?page=${pageMaker.endPage + 1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</nav>

	</div>





</body>

<%@ include file="../include/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function () {
	
	$("#Boardsearchbtn").on("click" , function () {
		var keyword = $("#keywordInput").val();
		var flag = $("#inputGroupSelect01").val();
		
		alert("클릭");
		alert(flag + "," + keyword);
		location.href="boardSearch.bizpoll?flag="+flag+"&keyword="+keyword;
		
	});
	
	
	
});

</script>


</html>