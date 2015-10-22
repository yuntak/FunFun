<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
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
				style="margin-left: 10%; border-top: 1px solid blue; width: 950px; height: 300px;">
				<div style="width: 900px; height: 100px; border-bottom:1px solid skyblue; background-color: #EFEFE7">
					<table style="margin-left: 2%;">
					<tr>
						<th style="font-size:20pt; width: 90px;">제목 /</th>
						<th style="font-size:13pt; color:#00007D">작성자</th>
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

							<p>어느 날 나는 끝내주게 잘생긴 약혼자를 가진 루덴바흐 황제의 딸 ‘레이디 에디타’가 돼 버렸다. 그러나
								손꼽아 기다리던 약혼자의 귀환 날 그의 비보가 전해진다! 슬퍼할 겨를도 없이 나를 냉랭하게 바라보던 브란트 공작이
								“전장에서 한 피의 맹세대로 제가 레이디 에디타를 거두겠습니다.”라며 나선다. 설상가상 이 남자, 단 둘만 남으면
								“넌 이제 나를 벗어날 수 없다”며 집착까지 하는데! 대체 이들 사이에 무슨 일이 있었던 거야?!</p>
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
					소설내용</div>

			</div>

		</div>
		<br>

		<form action="" class="form-inline">
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
		
	</div>

	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>