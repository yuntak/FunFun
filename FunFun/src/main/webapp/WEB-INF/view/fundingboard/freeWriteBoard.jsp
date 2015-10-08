<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.FBoard"%>
<%@page import="funfun.jdbc.dto.Board"%>
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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>


	<div class="panel panel-danger">
		<div class="row">
			<div class="col-lg-2" align="center">
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#">카테고리</a></li>
					<li><a href="#">만화</a></li>
					<li><a href="#">소설</a></li>
					<li><a href="#">영화</a></li>
					<li><a href="#">연극</a></li>
					<li><a href="#">드라마</a></li>
					<li><a href="#">게임</a></li>
				</ul>
			</div>



			<div class="col-lg-9">

				<h2 align="center">펀딩 게시글</h2>


				<table class="table table-bordered">
					<tbody>
						<tr>
							<td rowspan="3"><img
								src="<%=request.getContextPath()%>/img/redBalloon.png"
								class="img-thumbnail" alt="Cinque Terre" width="100"
								height="150"></td>
							<td>태그(카테고리)</td>
							<td style="width: 450px">제목</td>
							<td style="width: 100px">작성자</td>
							<td><button style="width: 80px" type="button"
									class="btn btn-xs">즐겨찾기</button></td>
						</tr>


						<tr>
							<td colspan="2" rowspan="2">작품소개</td>
							<td>
							
							<div class="col-lg-10" align="right">
							
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
				
				
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td rowspan="3"><img
								src="<%=request.getContextPath()%>/img/redBalloon.png"
								class="img-thumbnail" alt="Cinque Terre" width="100"
								height="150"></td>
							<td>태그(카테고리)</td>
							<td style="width: 450px">제목</td>
							<td style="width: 100px">작성자</td>
							<td><button style="width: 80px" type="button"
									class="btn btn-xs">즐겨찾기</button></td>
						</tr>


						<tr>
							<td colspan="2" rowspan="2">작품소개</td>
							<td>
							
							<div class="col-lg-10" align="right">
							
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
				
				
				
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td rowspan="3"><img
								src="<%=request.getContextPath()%>/img/redBalloon.png"
								class="img-thumbnail" alt="Cinque Terre" width="100"
								height="150"></td>
							<td>태그(카테고리)</td>
							<td style="width: 450px">제목</td>
							<td style="width: 100px">작성자</td>
							<td><button style="width: 80px" type="button"
									class="btn btn-xs">즐겨찾기</button></td>
						</tr>


						<tr>
							<td colspan="2" rowspan="2">작품소개</td>
							<td>
							
							<div class="col-lg-10" align="right">
							
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
				
				
				
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td rowspan="3"><img
								src="<%=request.getContextPath()%>/img/redBalloon.png"
								class="img-thumbnail" alt="Cinque Terre" width="100"
								height="150"></td>
							<td>태그(카테고리)</td>
							<td style="width: 450px">제목</td>
							<td style="width: 100px">작성자</td>
							<td><button style="width: 80px" type="button"
									class="btn btn-xs">즐겨찾기</button></td>
						</tr>


						<tr>
							<td colspan="2" rowspan="2">작품소개</td>
							<td>
							
							<div class="col-lg-10" align="right">
							
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
				
				
				
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td rowspan="3"><img
								src="<%=request.getContextPath()%>/img/redBalloon.png"
								class="img-thumbnail" alt="Cinque Terre" width="100"
								height="150"></td>
							<td>태그(카테고리)</td>
							<td style="width: 450px">제목</td>
							<td style="width: 100px">작성자</td>
							<td><button style="width: 80px" type="button"
									class="btn btn-xs">즐겨찾기</button></td>
						</tr>


						<tr>
							<td colspan="2" rowspan="2">작품소개</td>
							<td>
							
							<div class="col-lg-10" align="right">
							
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
				
				
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td rowspan="3"><img
								src="<%=request.getContextPath()%>/img/redBalloon.png"
								class="img-thumbnail" alt="Cinque Terre" width="100"
								height="150"></td>
							<td>태그(카테고리)</td>
							<td style="width: 450px">제목</td>
							<td style="width: 100px">작성자</td>
							<td><button style="width: 80px" type="button"
									class="btn btn-xs">즐겨찾기</button></td>
						</tr>


						<tr>
							<td colspan="2" rowspan="2">작품소개</td>
							<td>
							
							<div class="col-lg-10" align="right">
							
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
				
				
			






			</div>
		</div>
	</div>



	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>

</body>
</html>