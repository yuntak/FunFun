<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.FBoard"%>
<%@page import="funfun.jdbc.dto.Board"%>
<%@page import="funfun.jdbc.dto.CBoard"%>
<%@page import="funfun.jdbc.dto.CBoard_sub"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
.panel-body {
	margin-bottom: 20%;
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
	<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>
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

			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9"
				style="overflow: auto; margin-left: 10%; border-top: 1px solid blue; width: 900px; height: 300px;">
				<table style="" class="table">


					<tbody>
						<tr>
							<%
								Object ClistObj = request.getAttribute("CBoard");
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

							<td align="center" style="overflow: hidden;" rowspan="3"><img
								src="<%=request.getContextPath()%><%=cdto.getImgData()%>"
								class="img-thumbnail" alt="Cinque Terre" width="100"
								height="150"></td>


							<td>태그(카테고리)<%=cdto.getCategory()%></td>

							<td id="name" colspan="2" style="width: 450px; cursor: pointer;"
								onclick="location.href='/ '"><strong>제목<%=cdto.getTitle()%></strong></td>

							<td style="width: 100px">작성자<%=cdto.getUserId()%></td>

						</tr>


						<tr>
							<td colspan="2" rowspan="2"></td>
							<td>

								<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10"
									align="right">

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


				<div align="center">

					<ul class="nav nav-tabs" style="width:; margin-left: 20%;">
						<li class="active"><a data-toggle="tab" href="#home">작품공지</a></li>
						<li><a data-toggle="tab" href="#menu1">작품소개</a></li>

					</ul>

					<div class="tab-content">
						<div id="home" class="tab-pane fade in active">

							<p>등록된 공지사항이 없습니다.</p>
						</div>
						<div id="menu1" class="tab-pane fade">

							<p>${CBoard.content }</p>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div style="width: 900px; height: 200px; border:; margin-left: 27%;">
			<table class="table">

				<tr>
					<th>소제목</th>
					<th>회차</th>
					<th>날짜</th>
					<th>조회</th>
					<th>추천</th>
				</tr>


				<tr>
					<td id="name" style="cursor: pointer">${CBoard_sub.subtitle }</td>
					<td id="name" style="cursor: pointer">${CBoard_sub.contentBoardCno }</td>
					<td>${CBoard.csDate }</td>
					
				</tr>
				
			</table>
			<br>
			<div align="center">
				<a href="<%=request.getContextPath()%>/ContentBoard"><button
						type="button" class="btn-lg btn-default">목록</button></a>
			</div>
		</div>

	</div>

	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>