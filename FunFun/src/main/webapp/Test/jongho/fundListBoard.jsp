<%@page import="funfun.jdbc.dto.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.progress {
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
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>
	<%
		Users user = new Users();

		user.setRoll("REGULAR");
	%>
	<c:set value="<%=user %>" var="FunFunUser"></c:set>

	<table class="table" border="1">

		<tr>
			<td class="col-lg-1"></td>
			<td class="col-lg-2"><table class="table">
					<tr>
						<td align="center">만화</td>
					</tr>
					<tr>
						<td><a href=""><img
								src="<%=request.getContextPath()%>/img/Koala.jpg"
								class="img-thumbnail" alt="Cinque Terre"
								style="width: 200px; height: 250px"></a></td>
					</tr>
					<tr>
						<td><a href="">코알라의 일상</a></td>
					</tr>
					<tr>
						<td><a href="">코알라는 지금 배가 고프다코알라는 지금 배가 고프다코알라는 지금 배가
								고프다코알라는 지금 배가 고프다코알라는 지금 배가 고프다</a></td>
					</tr>
					<tr>
						<td><div class="progress" style="width: 200px;">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="10" aria-valuemin="0"
									aria-valuemax="100" style="width: 10%">10% Complete</div>
							</div>
							<table>
								<tr>
									<td class="col-lg-4">
										<h6 align="left">
											<strong>20</strong>일 남음
										</h6>
									</td>
									<td class="col-lg-1"></td>
									<td class="col-lg-4">
										<h6 align="right">
											<strong>20,000,000</strong>원
										</h6>
									</td>
								</tr>
							</table></td>
					</tr>
				</table></td>
			<td class="col-lg-1"></td>
			<td class="col-lg-2"><table class="table">
					<tr>
						<td align="center">영화</td>
					</tr>
					<tr>
						<td><a href=""><img
								src="<%=request.getContextPath()%>/img/Koala.jpg"
								class="img-thumbnail" alt="Cinque Terre"
								style="width: 200px; height: 250px"></a></td>
					</tr>
					<tr>
						<td><a href="">코알라의 일상</a></td>
					</tr>
					<tr>
						<td><a href="">코알라는 지금 배가 고프다코알라는 지금 배가 고프다코알라는 지금 배가
								고프다코알라는 지금 배가 고프다코알라는 지금 배가 고프다</a></td>
					</tr>
					<tr>
						<td><div class="progress" style="width: 200px;">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="10" aria-valuemin="0"
									aria-valuemax="100" style="width: 10%">10% Complete</div>
							</div>
							<table>
								<tr>
									<td class="col-lg-4">
										<h6 align="left">
											<strong>20</strong>일 남음
										</h6>
									</td>
									<td class="col-lg-1"></td>
									<td class="col-lg-4">
										<h6 align="right">
											<strong>20,000,000</strong>원
										</h6>
									</td>
								</tr>
							</table></td>
					</tr>
				</table></td>
			<td class="col-lg-1"></td>
			<td class="col-lg-2"><table class="table">
					<tr>
						<td align="center">연극</td>
					</tr>
					<tr>
						<td><a href=""><img
								src="<%=request.getContextPath()%>/img/Koala.jpg"
								class="img-thumbnail" alt="Cinque Terre"
								style="width: 200px; height: 250px"></a></td>
					</tr>
					<tr>
						<td><a href="">코알라의 일상</a></td>
					</tr>
					<tr>
						<td><a href="">코알라는 지금 배가 고프다코알라는 지금 배가 고프다코알라는 지금 배가
								고프다코알라는 지금 배가 고프다코알라는 지금 배가 고프다</a></td>
					</tr>
					<tr>
						<td><div class="progress" style="width: 200px;">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="10" aria-valuemin="0"
									aria-valuemax="100" style="width: 10%">10% Complete</div>
							</div>
							<table>
								<tr>
									<td class="col-lg-4">
										<h6 align="left">
											<strong>20</strong>일 남음
										</h6>
									</td>
									<td class="col-lg-1"></td>
									<td class="col-lg-4">
										<h6 align="right">
											<strong>20,000,000</strong>원
										</h6>
									</td>
								</tr>
							</table></td>
					</tr>
				</table></td>
			<td class="col-lg-3">
				<table>
					<tr>
						<td class="col-lg-3"></td>
						<td class="col-lg-6">${FunFunUser.roll }
						 <c:choose>
						 <c:when test="${FunFunUser.roll=='BASIC' }">
									<div id="img_container">
										<img style="background-color: #E69316;"
											src="<%=request.getContextPath()%>/img/button.png"
											class="img-rounded" alt="Cinque Terre" width="50" height="50">


										<button
											style="width: 200px; height: 50px; background-color: #E69316; color: white"
											type="button" class="btn">펀딩 신청</button>
									</div>
									</c:when>
									<c:when test="${FunFunUser.roll=='REGULAR' }">
									<button
											style="width: 200px; height: 50px; background-color: #E69316; color: white"
											type="button" class="btn">펀딩 시작</button>
									
									
									
									</c:when>
									
									
							</c:choose>


						</td>
						<td class="col-lg-3"></td>
					</tr>
				</table>
			</td>
		</tr>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->


		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	</table>

	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>