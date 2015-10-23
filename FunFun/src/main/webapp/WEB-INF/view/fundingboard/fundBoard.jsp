<%@page import="funfun.jdbc.dto.Users"%>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.Funding"%>
<%@page import="funfun.jdbc.dto.Funding_form"%>
<%@page import="funfun.jdbc.dto.Board"%>
<%@page import="java.util.Date"%>
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
	<div class="panel panel" style="height: 30px;"></div>

	<div class="panel panel-danger">
		<div class="row">
		<div class="col-lg-1"></div>
			<div class="col-lg-7">
				<div class="jumbotron" align="center">
					<div class="container">
						<table class="table">

							<tr style="width: 600px">
								<%
									Object FlistObj = request.getAttribute("FundingBoard");
									Funding fdto = (Funding) FlistObj;
								%>
								<%
									double per = 0.0;
									per = fdto.getMoney() / fdto.getGoal() * 100;
									int per1 = (int) per;
									long date1;
									long date3;
									Date date2 = new Date();
									date1 = fdto.getEndDate().getTime() - date2.getTime();
									date3 = date1 / (24 * 60 * 60 * 1000);
								%>
								<td style="width: 600px"><%=fdto.getContext()%></td>
							</tr>
							<tr>
								<td></td>
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
									현재금액 :
									<%=(int) fdto.getMoney()%><small>원</small>
								</h2>
								<div class="progress" style="width: 450px;">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="<%=per1%>" aria-valuemin="0"
										aria-valuemax="100"
										style="width: 10%; color: black; width: <%=per%>%">
										<strong><%=per1%>% Complete</strong>
									</div>
								</div>

								<table>
									<tr>
										<td class="col-lg-1"></td>
										<td class="col-lg-4">
											<h4 align="left">
												<strong> <%=date3%>
												</strong>일 남음
											</h4>
										</td>

										<td class="col-lg-5">
											<h4 align="right">
												목표금액 : <strong><%=(int) fdto.getGoal()%></strong>원
											</h4>
										</td>
									</tr>
								</table>




							</td>
						</tr>
						<!-- <tr>
							<td><select class="form-control" id="sel">
									<option>금액선택</option>
									<option>30,000원--치킨</option>
									<option>20,000원--짜장면</option>
									<option>10,000원--라면</option>
							</select></td>
						</tr> -->
						<tr>
							<td align="right">

								<button type="button" class="btn btn-info btn-lg"
									data-toggle="modal" data-target="#myModal" style="width: 300px">
									프로젝트 후원<span class="glyphicon glyphicon-heart-empty"
										style="font-size: 30px;"></span>
								</button>
								
								<div class="modal fade" id="myModal" >
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content">

											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"aria-label="Close"><span aria-lable="true">&times;</</span></button>
												<h2 class="modal-title" align="center">후원하기</h2>
											</div>

											<div class="modal-body" align="center">
												<table>
													<tr>
														<td style="width: 200px" align="center">


															<h4>금액별 상품</h4>
															<li><h5><%=fdto.getReceive()%></h5></li>

														</td>
													</tr>
													<tr>
														<td style="width: 450px">
															<form class="form-inline" role="form">
																<div class="form-group">
																	<label for="focusedInput" style="font-size: 20px;">후원금액:
																	</label> <input class="form-control" type="text"
																		style="width: 300px">
																</div>
															</form>

														</td>

													</tr>
												</table>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">확인</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">취소</button>
											</div>
										</div>
									</div>

								</div>

							</td>
						</tr>

					</table>

				</div>
			</div>
		</div>

	</div>
</body>
</html>