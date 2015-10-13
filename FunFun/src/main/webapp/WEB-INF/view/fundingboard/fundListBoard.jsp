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
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.progress {
	margin-right: auto;
	margin-left: auto;
}

.btn {
	margin-right: auto;
	margin-left: auto;
	width: 300px;
	height: 60px;
}
</style>
</head>
<body>
	<%
		Users user = new Users();

		user.setRoll("REGULAR");
	%>
	<c:set value="<%=user%>" var="FunFunUser"></c:set>

	<table class="table" border="1">

		<tr>
			<td class="col-lg-1"></td>
			<td class="col-lg-2"><table class="table">
					<%
						Object FlistObj = request.getAttribute("FundingBoardList");
						List<Funding> list = null;
						if (FlistObj != null && FlistObj instanceof List) {
							list = (List<Funding>) FlistObj;
						}
					%>
					<%
						Funding fdto = null;
						for (int i = 0; i < list.size(); i++) {
							fdto = (Funding) list.get(i);
					%>

					<tr>
						<%-- <td align="center"><%=fdto.getTitle() %></td> --%>
					</tr>
					<tr>
						<td><a href="<%=request.getContextPath()%>/fundBoard"><img
								src="<%=request.getContextPath()%><%=fdto.getFContent() %>"
								class="img-thumbnail" alt="Cinque Terre"
								style="width: 200px; height: 250px"></a></td>
								
					</tr>
					<tr>
						<td><a href="<%=request.getContextPath()%>/fundBoard"><%=fdto.getTitle() %></a></td>
					</tr>
					<tr>
						<td><a href="<%=request.getContextPath()%>/fundBoard"><%=fdto.getFContext() %></a></td>
					</tr>
					<tr>
						<td><div class="progress" style="width: 200px;">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="10" aria-valuemin="0"
									aria-valuemax="100" style="width: 10%"><%=fdto.getMoney()/fdto.getGoal()*10 %>% Complete</div>
							</div>
							<table>
								<tr>
									<td class="col-lg-4">
										<h6 align="left">
											<strong><% fdto.getEndDate(); %>-<%fdto.getStartDate(); %></strong>일 남음
										</h6>
									</td>
									<td class="col-lg-1"></td>
									<td class="col-lg-4">
										<h6 align="right">
											<strong><%=fdto.getMoney() %></strong>원
										</h6>
									</td>
								</tr>
							</table></td>
					</tr>
				</table></td>
			<%
				}
			%>


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
						<td></td>
					</tr>
					<tr>
						<td class="col-lg-3"></td>
						<td class="col-lg-6">${FunFunUser.roll }<c:choose>
								<c:when test="${FunFunUser.roll=='BASIC' }">

									<button type="submit" class="btn btn-info"
										style="font-size: 30px;">
										<span class="glyphicon glyphicon-pencil"
											style="font-size: 25px;"></span> 펀딩 신청
									</button>
								</c:when>
								<c:when test="${FunFunUser.roll=='REGULAR' }">
									<button type="submit" class="btn btn-info"
										style="font-size: 30px;">
										펀딩 시작 <span class="glyphicon glyphicon-heart-empty"
											style="font-size: 25px;"></span>
									</button>



								</c:when>


							</c:choose>


						</td>
						<td class="col-lg-3"></td>
					</tr>
				</table>
			</td>
		</tr>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
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
			<td class="col-lg-3"></td>
		</tr>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
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
			<td class="col-lg-3"></td>
		</tr>
	</table>

</body>
</html>