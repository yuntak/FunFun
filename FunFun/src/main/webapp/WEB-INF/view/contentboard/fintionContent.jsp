<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="funfun.jdbc.dto.CBoard_sub"%>
<%@page import="funfun.jdbc.dto.CBoard"%>
<%@page import="java.util.List"%>

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
				<div style="width: 900px; height: 100px; border-bottom:1px solid skyblue; background-color: #EFEFE7">
					<table style="margin-left: 2%;">
					<%
									Object CslistObj = request.getAttribute("CBoard_sub");
									CBoard_sub csdto = (CBoard_sub) CslistObj;
									Object ClistObj = request.getAttribute("CBoard");
									CBoard cdto = (CBoard) ClistObj;
								%>
					<tr>
						<th style="font-size:20pt; width: 90px;"><%=csdto.getSubtitle() %></th>
						<th style="font-size:13pt; color:#00007D">${FunFunUser.nickname }</th><!-- ??????????????????? -->
					</tr>
					</table>
				</div>

				<div align="center">

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

							<p><%=cdto.getContent() %></p>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div
			style="width: 900px; height: 800px; background-color: skyblue; margin-left: 27%;">


			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"
					style="width: 850px; height: 800px; background-color: #E2FFD3; margin-left: 11mm;">
					<%=csdto.getContext() %></div>

			</div>

		</div>
		<br>

		<form action="">
		<div align="left" style="width: 900px; margin-left: 27%;">
			<select class="form-control" style="width: 100px;" id="num">

				<option>회차</option>
				<option value="">1회</option>
			</select>
		 <input type="submit" value="이동" class="btn btn-default">
		</div>
		
		</form>

		<div style="width: 900px; margin-left: 28%;" align="center">
			<button type="button" class="btn-lg btn-info" style="width: 80px;">목록</button>
		</div>





		<hr>
		<div class=" panel-default"
			style="margin-left: 27%; width: 900px; overflow: auto;">
			<div class="panel-heading">
				<strong>코멘트</strong>
			</div>


			<table id="comment" class="table">

				<thead>
					<tr>
						<th class="ttr"
							style="font-size: 11pt; color: #454581; border-width:; border-top:; border-bottom: none !important;">닉네임</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td
							style="font-size: 9pt; border-top: none !important; border-width: 0; border-bottom: none !important;">내용</td>
					</tr>

				</tbody>


			</table>
			<div style="width: 900px; border: 2px solid #F3F3ED"></div>
		</div>

		<div class=""
			style="margin-left: 27%; width: 900px; height: 110px; background-color: #EFEFE7">
			<div class="row">


				<div class="col-lg-2 col-sm-2 col-xs-2 col-md-2"
					style="margin-top: 10mm;">
					<label for="user">닉네임</label>
				</div>
				<div class="col-lg-7 col-sm-7 col-xs-7 col-md-7">
					<textarea id="FBreplyContent" rows="4" cols="85" id="user"
						style="border: 1px solid #BFBFFF; margin-top: 2mm; resize: none; height: 96px;"
						placeholder="내용"></textarea>
				</div>
				<div class="col-lg-3 col-sm-3 col-xs-3 col-md-3" align="right">
					<button id="FBreplyInsert"
						style="margin-top: 3mm; margin-right: 1mm; border: 1px solid #BFBFFF; background-color: #FBFBF9; font-size: 15pt; width: 90px; height: 90px;">등록</button>
				</div>


			</div>
		</div>
	</div>

</body>
</html>