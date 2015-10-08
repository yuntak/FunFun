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
	margin-right: auto;
	margin-left: auto;
}

.container {
	margin-right: auto;
	margin-left: auto;
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
						<div class="embed-responsive embed-responsive-16by9">
							<iframe style="width: 850px; height: 400px"
								src="https://www.youtube.com/embed/4OrCA1OInoo" frameborder="0"></iframe>
						</div>
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
								<div class="progress" style="width: 400px;">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="10" aria-valuemin="0"
										aria-valuemax="100" style="width: 10%">10% Complete</div>
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
								<button type="button" class="btn btn-success" name="succes">프로젝트
									후원하기</button>
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