
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.FBoard"%>
<%@page import="funfun.jdbc.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<style type="text/css">
p {
	font-size: 30px;
}

<
style>#name:link {
	color: #A8A88E;
	font-size: 10pt;
	text-decoration: none;
}

#name:visited {
	color: #B4FF6A;
	font-size: 10pt;
	text-decoration: none;
}

#name:active {
	color: #A8A88E;
	font-size: 10pt;
	text-decoration: none;
}

#name:hover {
	color: #A8A88E;
	font-size: 10pt;
	text-decoration: underline;
}

.title {
	width: 270px;
	height: 37px;
	text-align: center;
}

.ttr {
	width: 50px;
	height: 37px;
	text-align: center;
}

.table {
	text-align: center;
}
</style>
</head>

<body>


	<div class="container">
		<form action="freeBoardSearch.jsp">
		<br>
		<p align="center">자유게시판</p>
		<br> <br>
		<div class="form-inline" align="right">
			<select name="name">
				<option value="subject">제목</option>
				<option value="contents">내용</option>
				<option value="nickname">작성자</option>
			</select>
			<input name="keyword"  type="text" class="form-control" placeholder="검색">
			
			<input type="hidden" value="1" name="page">
			<input type="submit" value="검색" class="btn btn-success">
		</div>	
		</form>
		<br>
	
		<table class="table">
			<thead>
				<tr class="success">
					<th class="ttr">번호</th>
					<th class="title">제목</th>
					<th class="ttr">작성자</th>
					<th class="ttr">날짜</th>
					<th class="ttr">조회</th>
				</tr>
			</thead>
			<tbody>
				<%
					Object FlistObj = request.getAttribute("FBoardList");
					List<FBoard> list = null;
					if (FlistObj != null && FlistObj instanceof List) {
						list = (List<FBoard>) FlistObj;
					}
				%>
				<%
					FBoard fdto = null;
					for (int i = 0; i < list.size(); i++) {
						fdto = (FBoard) list.get(i);
				%>
				<tr>
					<td><%=fdto.getFno()%></td>

					<td id="name" style="cursor: pointer" onclick=location.href="<%=request.getContextPath()%>/FreeBoard/View?BoardNo=<%=fdto.getFno()%>">
						<%=fdto.getTitle()%>
					</td>

					<td><%=fdto.getUserId()%></td>

					<td><%=fdto.getFdate()%></td>

					<td><%=fdto.getFview()%></td>
				</tr>

				<%
					}
				%>

			</tbody>
		</table>
		<hr>
<div align="center">
		<table>
		

			<%
				final int ROWSIZE = 25; // 한페이지에 보일 게시물 수
				int BLOCK = 5; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정

				int pg = 1; //기본 페이지값

				if (request.getParameter("page") != null) { //받아온 pg값이 있을때, 다른페이지일때
					pg = Integer.parseInt(request.getParameter("page")); // pg값을 저장
				}

				int start = (pg * ROWSIZE) - (ROWSIZE - 1); // 해당페이지에서 시작번호(step2)
				int end = (pg * ROWSIZE); // 해당페이지에서 끝번호(step2)

				int allPage = (int) request.getAttribute("allPage"); // 전체 페이지수

				if (allPage < BLOCK) {
					BLOCK = allPage;
				}

				int startPage = ((pg - 1) / BLOCK * BLOCK) + 1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6)
				int endPage = ((pg - 1) / BLOCK * BLOCK) + BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)

				if (endPage > allPage) {
					endPage = allPage;
				}
			%>



			<%
				if (pg > BLOCK) {
			%>
			<tr>
			<th>
			<ul class="pager">
				<li><a
					href="<%=request.getContextPath()%>/FreeBoard/List?page=1">◀◀</a></li>
				<li><a
					href="<%=request.getContextPath()%>/FreeBoard/List?page=<%=startPage - 1%>">◀</a></li>
			</ul>
			<%
				}
			%>
			</th>
			<th align="">
			<%
				for (int i = startPage; i <= endPage; i++) {
					if (null != request.getParameter("page") && i == Integer.parseInt(request.getParameter("page"))) {
			%>
			<ul class="pagination ">
				<li class="active"><a
					href="<%=request.getContextPath()%>/FreeBoard/List?page=<%=i%>"><%=i%></a></li>
			</ul>
			<%
				} else {
			%>
			<ul class="pagination">
				<li><a
					href="<%=request.getContextPath()%>/FreeBoard/List?page=<%=i%>"><%=i%></a></li>
			</ul>
			<%
				}
				}
			%>
			</th>
			<%
				if (endPage < allPage) {
			%>
			<th>
			<ul class="pager">

				<%
					if (endPage < allPage) {
				%>
				<a
					href="<%=request.getContextPath()%>/FreeBoard/List?page=<%=endPage + 1%>">▶</a>
				<a
					href="<%=request.getContextPath()%>/FreeBoard/List?page=<%=allPage%>">▶▶</a>
				<%
					}
				%>

			</ul>
			</th>
			<th>
			<a href="<%=request.getContextPath()%>/FreeBoard/Write"
				class="btn btn-info">글쓰기</a>

			<%
				}
			%>
			</th>
			</tr>
			
	</table>
</div>



</body>
</html>