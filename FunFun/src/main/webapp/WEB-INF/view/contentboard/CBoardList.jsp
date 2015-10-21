<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.FBoard"%>
<%@page import="funfun.jdbc.dto.Board"%>
<%@page import="funfun.jdbc.dto.CBoard"%>
<%@page import="funfun.jdbc.dto.CBoard_sub"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style type="text/css">
.category {
	width: 200px;
	float: left;
}

.freeWriteBoard-List {
	top: 180px;
	left: 250px;
}

.panel-body {
	margin-bottom: 23%;
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
</style>
</head>
<body>


	<div class="panel-body">
		<div class="row">
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" align="center">
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#"></a></li>
					<li><a href="#">만화</a></li>
					<li><a href="#">소설</a></li>
					<li><a href="#">영화</a></li>
					<li><a href="#">연극</a></li>
					<li><a href="#">드라마</a></li>
					<li><a href="#">게임</a></li>
				</ul>
			</div>



			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">

				<h2 align="center">자유 연재 게시판</h2>


				<table class="table table-bordered">
					<%
						Object ClistObj = request.getAttribute("CBoardList");
						List<CBoard> list = null;
						if (ClistObj != null && ClistObj instanceof List) {
							list = (List<CBoard>) ClistObj;
						}
					%>

					<%
						CBoard cdto = null;
						int csdto = 0;
						for (int i = 0; i < list.size(); i++) {
							cdto = (CBoard) list.get(i);
							Object CslistObj = request.getAttribute("CsBoardCount" + i);
							int cslist = 0;
							if (CslistObj != null && CslistObj instanceof Integer) {
								cslist = (int) CslistObj;
							}
							csdto = cslist;
					%>

					<tbody align="center">
						<tr>

							<td style="width: 200px; margin-left: auto; margin-right: auto;"
								rowspan="3"><a
								href="<%=request.getContextPath()%>/ContentBoard/MainView?Cno=<%=cdto.getCno()%>">
									<img src="<%=request.getContextPath()%><%=cdto.getImgData()%>"
									class="img-thumbnail" alt="Cinque Terre" width="150"
									height="150px">
							</a></td>


							<td>태그(카테고리)</td>

							<td colspan="2" id="name" style="width: 450px; cursor: pointer;"
								onclick="location.href='<%=request.getContextPath()%>/ '">
								<strong>제목 : <%=cdto.getTitle()%>
							</strong>
							</td>

							<td style="width: 100px" colspan="2">작성자 : <%=cdto.getUserId()%></td>
						</tr>


						<tr>
							<td rowspan="2"><%=cdto.getCategory()%></td>
							<td colspan="2" rowspan="2">작품소개 : <%=cdto.getContent()%></td>
							<td>

								<div align="right">

									<div class=form-horizontal>
										<div class="container" style="width: 100px">
											<select>
												<%
													for (int j = 1; j <= csdto; j++) {
												%>
												<option><%=j%>회
												</option>
												<%
													}
												%>

											</select>
										</div>
									</div>
								</div>
							</td>
							<td><button style="width: 80px" type="button"
									class="btn btn-xs">보기</button></td>
						</tr>

						<tr>
							<td>조회 <%=cdto.getCview()%></td>
							<td>추천 <%=cdto.getGood()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>

			</div>
		</div>



	</div>

	<hr>
	<div align="center">
		<table>


			<%
				final int ROWSIZE = 0; // 한페이지에 보일 게시물 수
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
			<tr>
				<th>
					<ul class="nav nav-justified pagination">


						<%
							if (pg > BLOCK) {
						%>

						<!-- <th> -->
						<!-- <ul class="pager"> -->
						<li><a
							href="<%=request.getContextPath()%>/ContentBoard/List?name=<%=request.getParameter("name")%>&keyword=<%=request.getAttribute("keyword")%>&page=1">◀◀</a></li>
						<li><a
							href="<%=request.getContextPath()%>/ContentBoard/List?name=<%=request.getParameter("name")%>&keyword=<%=request.getAttribute("keyword")%>&page=<%=startPage - 1%>">◀</a></li>
						<!-- </ul> -->
						<%
							}
						%>
						<!-- </th>
         <th > -->
						<%
							for (int i = startPage; i <= endPage; i++) {
								if (null != request.getParameter("page") && i == Integer.parseInt(request.getParameter("page"))) {
						%>
						<!-- <ul class="pagination "> -->
						<li class="active"><a
							href="<%=request.getContextPath()%>/ContentBoard/List?name=<%=request.getParameter("name")%>&keyword=<%=request.getAttribute("keyword")%>&page=<%=i%>"><%=i%></a></li>
						<!-- </ul> -->
						<%
							} else {
						%>
						<!-- <ul class="pagination"> -->
						<li><a
							href="<%=request.getContextPath()%>/ContentBoard/List?name=<%=request.getParameter("name")%>&keyword=<%=request.getAttribute("keyword")%>&page=<%=i%>"><%=i%></a></li>
						<!-- </ul> -->
						<%
							}
							}
						%>
						<!-- </th> -->

						<!-- <th>
          <ul class="pager"> -->

						<%
							if (endPage < allPage) {
						%>
						<li><a
							href="<%=request.getContextPath()%>/ContentBoard/List?name=<%=request.getParameter("name")%>&keyword=<%=request.getAttribute("keyword")%>&page=<%=endPage + 1%>">▶</a></li>
						<li><a
							href="<%=request.getContextPath()%>/ContentBoard/List?name=<%=request.getParameter("name")%>&keyword=<%=request.getAttribute("keyword")%>&page=<%=allPage%>">▶▶</a></li>

						<%
							}
						%>
						<!--          </ul> 
         </th> -->
						<!-- <th> -->



						<li><a href="<%=request.getContextPath()%>/ContentBoard/Write"
							class="bun btn-default" style="color: black;">글작성</a></li>

					</ul>
				</th>

			</tr>

		</table>
	</div>




</body>
<script type="text/javascript"></script>
</html>