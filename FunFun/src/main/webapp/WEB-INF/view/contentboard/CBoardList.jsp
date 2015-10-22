<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>

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

			<form action="<%=request.getContextPath()%>/ContentBoard/List">
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" align="center">
					<ul class="nav nav-pills nav-stacked">
						<li class="active"><a href="#"></a></li>
						<li><a 
							href="<%=request.getContextPath()%>/ContentBoard/List?category=webtoon&page=1">만화</a></li>
						<li><a href="<%=request.getContextPath()%>/ContentBoard/List?category=novel&page=1">소설</a></li>
						<li><a href="<%=request.getContextPath()%>/ContentBoard/List?category=movie&page=1">영화</a></li>
						<li><a href="<%=request.getContextPath()%>/ContentBoard/List?category=play&page=1">연극</a></li>
						<li><a href="<%=request.getContextPath()%>/ContentBoard/List?category=drama&page=1">드라마</a></li>
						<li><a href="<%=request.getContextPath()%>/ContentBoard/List?category=game&page=1">게임</a></li>
					</ul>
				</div>
			</form>


			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">

				<h2 align="center">자유 연재 게시판</h2>


				<table class="table table-bordered">

					<tbody align="center">
						<tr>
							<%
								List<CBoard_sub> mysublist = null;
								Object ClistObj = request.getAttribute("CBoardList");
								List<CBoard> list = null;
								if (ClistObj != null && ClistObj instanceof List) {
									list = (List<CBoard>) ClistObj;
								}
							%>

							<%
								CBoard cdto = null;
								int csdto = 0;
								int j;
								int k;
								int cslist = 0;
								List<CBoard_sub> cslist2 = null;
								//List<CBoard_sub> sublist = null;
								for (int i = 0; i < list.size(); i++) {
									cdto = (CBoard) list.get(i);
									cslist2 = cdto.getCboard_sub();
									Object CslistObj = request.getAttribute("CsBoardCount" + i);
									//Object CsListObj = request.getAttribute("sublist"+i);

									if (CslistObj != null && CslistObj instanceof Integer) {
										cslist = (int) CslistObj;
									}
									/* if(CsListObj !=null && CsListObj instanceof List){
										sublist=(List<CBoard_sub>) CsListObj;
									} */
									csdto = cslist;
									mysublist = cdto.getCboard_sub();
							%>
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
								<form action="<%=request.getContextPath()%>/ContentBoard/View"
									method="get">
									<input type="hidden" value="<%=cdto.getCno()%>" name="Cno">

									<div align="right">

										<div class=form-horizontal>
											<div class="container" style="width: 100px; padding-top: 20">
												<select id="sub" name="no" style="width: 80px">

													<%
														for (j = 0; j < cslist2.size(); j++) {
																CBoard_sub sub = cslist2.get(j);
													%>
													<option value="<%=sub.getNo()%>">
														<%=sub.getNo()%>회
													</option>
													<%
														}
													%>

												</select>
											</div>
										</div>
									</div>
									<input type="submit" value="보기">
								</form>
							</td>

							<td style="height: 50px">
								<%-- 	<%
								CBoard_sub sub = null;
								for (k = 0; k < sublist.size(); k++) {
									sub = (CBoard_sub) sublist.get(k);
						%>
							<%
								}
							%> --%> <!-- <input type="submit" value="보기"> -->
							</td>

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



						<li><a
							href="<%=request.getContextPath()%>/ContentBoard/Write"
							class="bun btn-default" style="color: black;">글작성</a></li>

					</ul>
				</th>

			</tr>

		</table>
	</div>




</body>
<script type="text/javascript">
	
</script>
</html>