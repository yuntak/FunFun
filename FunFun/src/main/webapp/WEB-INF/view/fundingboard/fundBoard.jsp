<%@page import="funfun.jdbc.dto.Users"%>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.Funding"%>
<%@page import="funfun.jdbc.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
							<%
								Object FlistObj = request.getAttribute("FundingBoard");
								Funding fdto = (Funding)FlistObj;
								
							%>
							<%
									double per = fdto.getMoney() / fdto.getGoal() * 100;
									int per1 = (int) per;
							%>
							<tr>
								<td><%=fdto.getContext()%></td>
							</tr>
							<%
								
							%>
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
									<%=(int) fdto.getMoney()%><small>원</small>
								</h2>
								<div class="progress" style="width: 300px;">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="<%=per1%>" aria-valuemin="0"
										aria-valuemax="100" style="width: 10%;"><%=per1%>%
										Complete
									</div>
								</div>
								<h4 align="right">
									목표금액 : <strong><%=fdto.getGoal()%></strong>원
								</h4>
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

								<button type="submit" class="btn btn-info"
									style="font-size: 30px;">
									프로젝트 후원하기 <span class="glyphicon glyphicon-heart-empty"
										style="font-size: 25px;"></span>
								</button>

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