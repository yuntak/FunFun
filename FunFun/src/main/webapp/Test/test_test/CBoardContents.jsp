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
				style="overflow:auto; margin-left: 10%; border-top: 1px solid blue; width: 900px; height: 300px;">
				<table style="" class="table">


					<tbody>
						<tr>

							<td align="center" style="overflow: hidden;" rowspan="3"><a
								href="<%=request.getContextPath()%>/FreeBoard/"> <img
									src="<%=request.getContextPath()%>/img/redBalloon.png"
									class="img-thumbnail" alt="Cinque Terre" width="100"
									height="150"></a></td>


							<td>태그(카테고리)</td>

							<td id="name" style="width: 450px; cursor: pointer;"
								onclick="location.href='/ '"><strong>제목</strong></td>

							<td style="width: 100px">작성자</td>
							<td><button style="width: 80px" type="button"
									class="btn btn-xs">즐겨찾기</button></td>
						</tr>


						<tr>
							<td colspan="2" rowspan="2"></td>
							<td>

								<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10"
									align="right">

									<div class="btn-group">
										<div class="row">

											<button type="button" class="btn btn-xs">회차</button>
											<button type="button" class="btn btn-xs dropdown-toggle"
												data-toggle="dropdown">
												<span class="caret"></span>
											</button>

											<ul class="dropdown-menu" role="menu">
												<li><a href="#">1회</a></li>
												<li><a href="#">2회</a></li>
												<li><a href="#">3회</a></li>
												<li><a href="#">4회</a></li>
												<li><a href="#">5회</a></li>
												<li><a href="#">6회</a></li>
												<li><a href="#">7회</a></li>
												<li><a href="#">8회</a></li>
												<li><a href="#">9회</a></li>
												<li><a href="#">10회</a></li>
											</ul>
										</div>
									</div>
								</div>
							</td>
							<td><button style="width: 80px" type="button"
									class="btn btn-xs">보기</button></td>
						</tr>

						<tr>
							<td>조회</td>
							<td>추천</td>
						</tr>

					</tbody>
				</table>

		
		<div align="center">
  
  <ul class="nav nav-tabs" style="width:; margin-left: 20%;" >
    <li class="active"><a data-toggle="tab" href="#home">작품공지</a></li>
    <li><a data-toggle="tab" href="#menu1">작품소개</a></li>
   
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      
      <p>등록된 공지사항이 없습니다.</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      
      <p>어느 날 나는 끝내주게 잘생긴 약혼자를 가진 루덴바흐 황제의 딸 ‘레이디 에디타’가 돼 버렸다. 그러나 손꼽아 기다리던 약혼자의 귀환 날 그의 비보가 전해진다! 슬퍼할 겨를도 없이 나를 냉랭하게 바라보던 브란트 공작이 “전장에서 한 피의 맹세대로 제가 레이디 에디타를 거두겠습니다.”라며 나선다. 설상가상 이 남자, 단 둘만 남으면 “넌 이제 나를 벗어날 수 없다”며 집착까지 하는데! 대체 이들 사이에 무슨 일이 있었던 거야?!</p>
    </div>
    
  </div>
</div>
	</div>
	</div>

	<div style="width: 900px; height:200px; border: ; margin-left: 27%;">
		<table class="table">
			<tr>
				<th>소제목</th>
				<th>회차</th>
				<th>날짜</th>
				<th>조회</th>
				<th>추천</th>
			</tr>
			<tr>
				<td>뒤바뀐운명</td>
				<td>1회</td>
				<td>날짜</td>
				<td>조회</td>
				<td>추천</td>
			</tr>
		</table>
	</div>
		
	</div>
	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>