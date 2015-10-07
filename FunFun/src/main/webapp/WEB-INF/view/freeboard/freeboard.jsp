
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.FBoard"%>
<%@page import="funfun.jdbc.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

		<br>
		<p align="center">자유게시판</p>
		<br>
		<br>
		<div class="form-inline" align="right">
			<input type="text" class="form-control" placeholder="검색"> <a
				href=""><span class="btn btn-success">검색</span></a>
		</div>
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
					List list = new ArrayList();
					FBoard fb = new FBoard();
					fb.setFno(1);

					fb.setUserId("sss");
					fb.setTitle("title");
					list.add(fb);
					list.add(fb);
					list.add(fb);
					list.add(fb);
					list.add(fb);
				%>
				<%
					FBoard fdto = null;
					for (int i = 0; i < list.size(); i++) {
						fdto = (FBoard) list.get(i);
				%>
				<tr>
					<td><%=fdto.getFno()%></td>

					<td id="name" style="cursor: pointer" onclick=location.href="<%=request.getContextPath()%>/freeContents">
						<%=fdto.getTitle()%>
					</td>

					<td><%=fdto.getUserId()%></td>

					<td>aa</td>

					<td>aa</td>
				</tr>

				<%
					}
				%>

			</tbody>
		</table>
		<hr>
		<div align="right">
			<a href="<%=request.getContextPath()%>/freeWrite"
				class="btn btn-info">글쓰기</a>
		</div>

		<%
			final int ROWSIZE = 2; // 한페이지에 보일 게시물 수
			final int BLOCK = 2; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정

			int pg = 1; //기본 페이지값

			if (request.getParameter("pg") != null) { //받아온 pg값이 있을때, 다른페이지일때
				pg = Integer.parseInt(request.getParameter("pg")); // pg값을 저장
			}

			int start = (pg * ROWSIZE) - (ROWSIZE - 1); // 해당페이지에서 시작번호(step2)
			int end = (pg * ROWSIZE); // 해당페이지에서 끝번호(step2)

			int allPage = 0; // 전체 페이지수

			int startPage = ((pg - 1) / BLOCK * BLOCK) + 1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6)
			int endPage = ((pg - 1) / BLOCK * BLOCK) + BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)
		%>
		
		<tr>
			<td align="center">
				<%
					if (pg > BLOCK) {
				%> [<a href="freeboard.jsp?pg=1">◀◀</a>] [<a
				href="freeboard.jsp?pg=<%=startPage - 1%>">◀</a>] <%
					}
				%>
				<div align="center">
					<%
						for (int i = startPage; i <= endPage; i++) {
							if (i == pg) {
					%>
					<ul class="pagination ">
						<li class="active"><a href="freeboard.jsp?pg=<%=i%>"><%=i%></a></li>
					</ul>
					<%
						} else {
					%>
					<ul class="pagination">
						<li><a href="freeboard.jsp?pg=<%=i%>"><%=i%></a></li>
					</ul>
					<%
						}
						}
					%>
				</div> <%
 	if (endPage < allPage) {
 %> [<a href="freeboard.jsp?pg=<%=endPage + 1%>">▶</a>] [<a
				href="freeboard.jsp?pg=<%=allPage%>">▶▶</a>] <%
 	}
 %>
			</td>
		</tr>


	</div>



</body>
</html>