<%@page import="java.util.*"%>
<%@page import="javax.print.attribute.standard.DateTimeAtCompleted"%>
<%@page import="java.sql.Date"%>


<%@page import="funfun.jdbc.dto.Users"%>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="funfun.jdbc.dto.Funding"%>
<%@page import="funfun.jdbc.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.progress {
	margin-right: auto;
	margin-left: auto;
}

</style>
</head>
<body>
	<%-- <%
		Users user = new Users();

		user.setRoll("REGULAR");
	%>
	<c:set value="<%=user%>" var="FunFunUser"></c:set> --%>



	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-8">

				<%
					Object FlistObj = request.getAttribute("FundingBoardList");
					List<Funding> list = null;
					if (FlistObj != null && FlistObj instanceof List) {
						list = (List<Funding>) FlistObj;
					}
				%>
				<%
					Funding fdto = null;
					double per = 0.0;
					int per1 = 0;
					long date1;
					long date3;
					Calendar c = Calendar.getInstance();
					long date2 = c.getTimeInMillis();
					for (int i = 0; i < list.size(); i++) {
						fdto = (Funding) list.get(i);
						per = fdto.getMoney() / fdto.getGoal() * 100;
						per1 = (int) per;
						date1 = fdto.getEndDate().getTime() - date2;
						date3 = date1 / (24 * 60 * 60 * 1000);
				%>
				<div class="col-sm-4" style="background-color: lavenderblush;">
					<table>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/FundingBoard/view?FundingNo=<%=fdto.getFno()%>"><img
									src="<%=request.getContextPath()%><%=fdto.getFContent()%>"
									class="img-thumbnail" alt="Cinque Terre"
									style="width: 200px; height: 250px"></a></td>

						</tr>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/FundingBoard/view?FundingNo=<%=fdto.getFno()%>"><%=fdto.getTitle()%></a></td>
						</tr>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/FundingBoard/view?FundingNo=<%=fdto.getFno()%>"><%=fdto.getFContext()%></a></td>
						</tr>
						<tr>
							<td><div class="progress" style="width: 200px;">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="<%=per1%>" aria-valuemin="0"
										aria-valuemax="100" style="color: black; width: <%=per%>%">
										<strong><%=per1%>% Complete</strong>
									</div>
								</div>
								<table>
									<tr>
										<td class="col-lg-2"></td>
										<td class="col-lg-8">
											<h6 align="left">
												<strong> <%=date3%>
												</strong>일 남음
											</h6>
										</td>

										<td class="col-lg-4">
											<h6 align="right">
												<strong><%=(int) fdto.getMoney()%></strong>원
											</h6>
										</td>
									</tr>
								</table></td>
						</tr>
					</table>
				</div>
				<%
					}
				%>




			</div>
			<div class="col-sm-3">

				${FunFunUser.roll }
				<c:choose>
					<c:when test="${FunFunUser.roll=='BASIC' }">

						<button type="submit" class="btn btn-info"
							style="font-size: 30px; margin-right: auto;	margin-left: auto;	width: 300px;	height: 60px;">
							<span class="glyphicon glyphicon-pencil" style="font-size: 25px;"></span><a href="<%=request.getContextPath()%>/FundingBoard/Write">펀딩 신청</a>
							
						</button>
					</c:when>
					<c:when test="${FunFunUser.roll=='REGULAR' }">
						<button type="submit" class="btn btn-info"
							style="font-size: 30px; margin-right: auto;	margin-left: auto;	width: 300px;	height: 60px;">
							<span class="glyphicon glyphicon-heart-empty" style="font-size: 25px;"></span><a href="<%=request.getContextPath()%>/FundingBoard/WriteStart">펀딩 시작</a>
						</button>



					</c:when>


				</c:choose>

			</div>
		</div>
	</div>

	<div align="center">
		<table>


			<%
				final int ROWSIZE = 9; // 한페이지에 보일 게시물 수
				int BLOCK = 5; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정

				int pg = 1; //기본 페이지값

				if (request.getParameter("page") != null) { //받아온 pg값이 있을때, 다른페이지일때
					pg = Integer.parseInt(request.getParameter("page")); // pg값을 저장
				}

				int start = (pg * ROWSIZE) - (ROWSIZE - 1); // 해당페이지에서 시작번호(step2)
				int end = (pg * ROWSIZE); // 해당페이지에서 끝번호(step2)

				int allPage = (int) request.getAttribute("allPage"); // 전체 페이지수

				if (allPage < BLOCK) {
					BLOCK = allPage;
				}

				int startPage = ((pg - 1) / BLOCK * BLOCK) + 1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6)
				int endPage = ((pg - 1) / BLOCK * BLOCK) + BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)

				if (endPage > allPage) {
					endPage = allPage;
				}
			%>
			<tr>
				<th>
					<ul class="nav nav-justified pagination">


						<%
							if (pg > BLOCK) {
						%>

						<!-- <th> -->
						<!-- <ul class="pager"> -->
						<li><a
							href="<%=request.getContextPath()%>/FundingBoard/List?page=1">◀◀</a></li>
						<li><a
							href="<%=request.getContextPath()%>/FundingBoard/List?page=<%=startPage - 1%>">◀</a></li>
						<!-- </ul> -->
						<%
							}
						%>
						<!-- </th>
         <th > -->
						<%
							for (int i = startPage; i <= endPage; i++) {
								if (null != request.getParameter("page") && i == Integer.parseInt(request.getParameter("page"))) {
						%>
						<!-- <ul class="pagination "> -->
						<li class="active"><a
							href="<%=request.getContextPath()%>/FundingBoard/List?page=<%=i%>"><%=i%></a></li>
						<!-- </ul> -->
						<%
							} else {
						%>
						<!-- <ul class="pagination"> -->
						<li><a
							href="<%=request.getContextPath()%>/FundingBoard/List?page=<%=i%>"><%=i%></a></li>
						<!-- </ul> -->
						<%
							}
							}
						%>
						<!-- </th> -->
						<%
							if (endPage < allPage) {
						%>
						<li><a
							href="<%=request.getContextPath()%>/FundingBoard/List?page=<%=endPage + 1%>">▶</a></li>
						<li><a
							href="<%=request.getContextPath()%>/FundingBoard/List?page=<%=allPage%>">▶▶</a></li>

						<%
							}
						%>
						<!--          </ul> 
         </th> -->
						<!-- <th> -->




					</ul>
				</th>
			</tr>
		</table>
	</div>

</body>
</html>