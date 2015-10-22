<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.FBoard"%>
<%@page import="funfun.jdbc.dto.Board"%>
<%@page import="funfun.jdbc.dto.CBoard"%>
<%@page import="funfun.jdbc.dto.CBoard_sub"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@page import="org.springframework.ui.Model"%>

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
	margin-bottom: 5%;
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

			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9"
				style="margin-left: 10%; border-top: 1px solid blue; width: 950px; height: 300px;">
				<div
					style="width: 900px; height: 100px; border-bottom: 1px solid skyblue; background-color: #EFEFE7">
					<table style="margin-left: 2%;">

						<tr>
							<td align="center" style="font-size: 20pt; width: 750px;">${CBoard_sub.subtitle }</td>
							<td style="font-size: 13pt; width: 100px;">${CBoard.userId }</td>
							<!-- ??????????????????? -->
						</tr>
					</table>
				</div>

				<!-- 		<div align="center">

					<ul class="nav nav-tabs"
						style="width:; margin-top: 10%; margin-left: 20%;">
						<li class="active"><a data-toggle="tab" href="#home">작품공지</a></li>
						<li><a data-toggle="tab" href="#menu1">작품소개</a></li>

					</ul>

					<div class="tab-content">
						<div id="home" class="tab-pane fade in active">

							<p>등록된 공지사항이 없습니다.</p>
						</div>
						<div id="menu1" class="tab-pane fade">

							<p>내용</p>
						</div>

					</div>
				</div> -->
			</div>
		</div>
		<div
			style="width: 900px; height: 800px; background-color: skyblue; margin-left: 27%; margin-top: -250px;">


			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"
					style="width: 850px; height: 740px; background-color: #E2FFD3; margin-left: 11mm; margin-top: -100px;">
					${CBoard_sub.context }</div>

			</div>

		</div>
		<br>
		
		<form action="<%=request.getContextPath()%>/ContentBoard/View">
			<input type="hidden" name="Cno"
				value="<%=request.getParameter("Cno")%>">
			<div align="left" style="width: 900px; margin-left: 27%;">
				<table>
					<tr>

						<td><select class="form-control" style="width: 100px;"
							id="num" name="no">
								
								
									<c:forEach items="${sublist }" var="sub">

										<option id="sublabel" value="${sub.no }">${sub.no }
											회
										</option>

									</c:forEach>
								
								
						</select></td>
						<td><input type="submit" value="이동" class="btn btn-default">
						</td>
					</tr>
				</table>
			</div>

		</form>

		<div style="width: 900px; margin-left: 28%;" align="center">
			<a href="<%=request.getContextPath()%>/ContentBoard/List"><button
					type="button" class="btn-lg btn-info" style="width: 80px;">목록</button></a>
		</div>





		<hr>

	</div>
	${sublist }
</body>
<script>
	$(function() {
		console.log("jquery Start");
		var cboard = $
		{
			CBoard
		};
		console.log(cboard);
	});
</script>
</html>