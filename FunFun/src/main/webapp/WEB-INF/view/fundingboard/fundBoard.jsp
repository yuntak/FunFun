<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.progress {
	margin-right: auto;
	margin-left: auto;
}

.btn {
	margin-left: auto;
	margin-right: auto;
}

.container {
	margin-right: auto;
	margin-left: auto;
}

#img_container {
	position: relative;
	display: inline-block;
	text-align: center;
	background-color: #E69316;
	color: #E69316;
	border-style: outset;
}

.button {
	position: absolute;
	bottom: 10px;
	right: 10px;
	width: 100px;
	height: 30px;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>
	<div class="panel panel" style="height: 80px;"></div>



	<div class="panel panel-danger">
		<div class="row">
			<div class="col-lg-8">
				<div class="jumbotron" align="center">
					<div class="container">
						<table class="table">
							<tr>
								<td>
									
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div class="col-lg-4">
				<div class="jumbotron">


					<table class="table table-default">
						<tr>
							<td>
								<h2 align="center">
									10,000,000 <small>원</small>
								</h2>
								<div class="progress" style="width: 300px;">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="10" aria-valuemin="0"
										aria-valuemax="100" style="width: 10%;">10% Complete</div>
								</div>
								<h4 align="right">
									목표금액 : <strong>100,000,000</strong>원
								</h4>
							</td>
						</tr>
						<tr>
							<td>
								<h2>
									1<small>명 참여</small>
								</h2>
							</td>
						</tr>
						<tr>
							<td><select class="form-control" id="sel">
									<option>금액선택</option>
									<option>30,000원--치킨</option>
									<option>20,000원--짜장면</option>
									<option>10,000원--라면</option>
							</select></td>
						</tr>
						<tr align="right">
							<td>

								<div id="img_container">
									<img style="background-color: #E69316;"
										src="<%=request.getContextPath()%>/img/button.png"
										class="img-rounded" alt="Cinque Terre" width="50" height="50">
									<button
										style="width: 200px; height: 50px; background-color: #E69316; color: white"
										type="button" class="btn">프로젝트 후원하기</button>
								</div>
							</td>
						</tr>

					</table>





				</div>
			</div>
		</div>

	</div>
	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>